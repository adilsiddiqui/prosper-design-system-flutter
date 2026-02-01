#!/usr/bin/env python3
"""
Figma Icon Exporter for Prosper Design System

Automatically exports all icons from your Figma design system as SVG files.

Usage:
    python3 export_figma_icons.py --token YOUR_FIGMA_TOKEN

Get your token:
    1. Go to https://www.figma.com/settings
    2. Scroll to "Personal access tokens"
    3. Create a new token
    4. Copy and use it with this script
"""

import argparse
import json
import os
import sys
import time
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor, as_completed

try:
    import requests
except ImportError:
    print("Installing required dependency: requests")
    os.system(f"{sys.executable} -m pip install requests --quiet")
    import requests

# Configuration
FIGMA_FILE_KEY = "gwJu3hUXYU8iEDqJmuA1r4"
SCRIPT_DIR = Path(__file__).parent.absolute()
PROJECT_ROOT = SCRIPT_DIR.parent
ICONS_FILE = SCRIPT_DIR / "figma_icons.json"
LINE_DIR = PROJECT_ROOT / "assets" / "icons" / "generic" / "line"
SOLID_DIR = PROJECT_ROOT / "assets" / "icons" / "generic" / "solid"


class FigmaExporter:
    def __init__(self, token: str):
        self.token = token
        self.base_url = "https://api.figma.com/v1"
        self.session = requests.Session()
        self.session.headers["X-Figma-Token"] = token
    
    def export_nodes_as_svg(self, node_ids: list) -> dict:
        """Request SVG exports for given node IDs."""
        url = f"{self.base_url}/images/{FIGMA_FILE_KEY}"
        params = {
            "ids": ",".join(node_ids),
            "format": "svg",
            "svg_include_id": "false",
            "svg_simplify_stroke": "true",
        }
        
        response = self.session.get(url, params=params)
        
        if response.status_code == 403:
            print("\n❌ Authentication failed. Check your token.")
            print("   Get a new token from: https://www.figma.com/settings")
            sys.exit(1)
        
        response.raise_for_status()
        result = response.json()
        
        if result.get("err"):
            print(f"\n⚠️  Figma API error: {result['err']}")
            return {}
        
        return result.get("images", {})
    
    def download_svg(self, url: str) -> str:
        """Download SVG content from URL."""
        response = self.session.get(url, timeout=30)
        response.raise_for_status()
        return response.text


def load_icons():
    """Load icon definitions."""
    if not ICONS_FILE.exists():
        print(f"❌ Icons file not found: {ICONS_FILE}")
        sys.exit(1)
    
    with open(ICONS_FILE) as f:
        return json.load(f)


def export_icons(token: str):
    """Export all icons from Figma."""
    print("🎨 Figma Icon Exporter")
    print("=" * 50)
    
    # Setup
    exporter = FigmaExporter(token)
    icons = load_icons()
    
    # Create directories
    LINE_DIR.mkdir(parents=True, exist_ok=True)
    SOLID_DIR.mkdir(parents=True, exist_ok=True)
    
    # Remove old .gitkeep files if present
    for gk in [LINE_DIR / ".gitkeep", SOLID_DIR / ".gitkeep"]:
        if gk.exists():
            gk.unlink()
    
    # Collect node IDs
    line_icons = [(i["name"], i["line_id"]) for i in icons if i.get("line_id")]
    solid_icons = [(i["name"], i["solid_id"]) for i in icons if i.get("solid_id")]
    
    print(f"\n📊 Icons to export:")
    print(f"   Line (outline): {len(line_icons)}")
    print(f"   Solid (filled): {len(solid_icons)}")
    print(f"   Total: {len(line_icons) + len(solid_icons)}")
    
    # Export function
    def export_batch(items, output_dir, variant_name):
        """Export a batch of icons."""
        exported = 0
        failed = []
        batch_size = 50  # Figma API limit
        
        print(f"\n🔄 Exporting {variant_name} icons...")
        
        for i in range(0, len(items), batch_size):
            batch = items[i:i+batch_size]
            node_ids = [node_id for _, node_id in batch]
            
            batch_num = i // batch_size + 1
            total_batches = (len(items) + batch_size - 1) // batch_size
            print(f"   Batch {batch_num}/{total_batches} ({len(batch)} icons)...", end=" ", flush=True)
            
            try:
                urls = exporter.export_nodes_as_svg(node_ids)
                
                success_count = 0
                for name, node_id in batch:
                    if node_id in urls and urls[node_id]:
                        try:
                            svg_content = exporter.download_svg(urls[node_id])
                            svg_path = output_dir / f"{name}.svg"
                            svg_path.write_text(svg_content)
                            exported += 1
                            success_count += 1
                        except Exception as e:
                            failed.append((name, str(e)))
                    else:
                        failed.append((name, "No URL returned"))
                
                print(f"✓ {success_count} exported")
                
            except requests.exceptions.HTTPError as e:
                print(f"✗ Error: {e}")
                for name, _ in batch:
                    failed.append((name, str(e)))
            
            # Rate limiting
            time.sleep(0.3)
        
        return exported, failed
    
    # Export line icons
    line_exported, line_failed = export_batch(line_icons, LINE_DIR, "line")
    
    # Export solid icons
    solid_exported, solid_failed = export_batch(solid_icons, SOLID_DIR, "solid")
    
    # Summary
    print("\n" + "=" * 50)
    print("📋 EXPORT SUMMARY")
    print("=" * 50)
    print(f"✅ Line icons: {line_exported}/{len(line_icons)}")
    print(f"✅ Solid icons: {solid_exported}/{len(solid_icons)}")
    print(f"📁 Line folder: {LINE_DIR}")
    print(f"📁 Solid folder: {SOLID_DIR}")
    
    total_exported = line_exported + solid_exported
    total_expected = len(line_icons) + len(solid_icons)
    
    if total_exported == total_expected:
        print(f"\n🎉 All {total_exported} icons exported successfully!")
    else:
        print(f"\n⚠️  {total_expected - total_exported} icons failed to export")
        
        if line_failed:
            print("\nFailed line icons:")
            for name, error in line_failed[:10]:
                print(f"   - {name}: {error}")
            if len(line_failed) > 10:
                print(f"   ... and {len(line_failed) - 10} more")
        
        if solid_failed:
            print("\nFailed solid icons:")
            for name, error in solid_failed[:10]:
                print(f"   - {name}: {error}")
            if len(solid_failed) > 10:
                print(f"   ... and {len(solid_failed) - 10} more")
    
    print("\n💡 Next steps:")
    print("   1. Run: flutter clean && flutter pub get")
    print("   2. Run: flutter run -d chrome --web-port=8080")
    print("   3. Check the demo page to verify icons are displayed")
    
    return total_exported


def main():
    parser = argparse.ArgumentParser(description="Export icons from Figma")
    parser.add_argument("--token", required=True, help="Figma Personal Access Token")
    parser.add_argument("--list", action="store_true", help="List icons without exporting")
    args = parser.parse_args()
    
    if args.list:
        icons = load_icons()
        print(f"Total icons: {len(icons)}")
        print(f"Line variants: {sum(1 for i in icons if i.get('line_id'))}")
        print(f"Solid variants: {sum(1 for i in icons if i.get('solid_id'))}")
        print("\nIcons:")
        for icon in sorted(icons, key=lambda x: x["name"]):
            variants = []
            if icon.get("line_id"): variants.append("line")
            if icon.get("solid_id"): variants.append("solid")
            print(f"  {icon['name']}: {', '.join(variants)}")
    else:
        export_icons(args.token)


if __name__ == "__main__":
    main()
