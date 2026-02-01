# Export Icons from Figma

This document explains how to export SVG icons from your Figma design system.

## Quick Start (Recommended)

Use the Python export script for automated batch export:

```bash
# Install requests if needed
pip install requests

# Export all icons
cd scripts
python3 export_figma_icons.py --token YOUR_FIGMA_TOKEN
```

### Getting Your Figma Token

1. Go to [Figma Settings](https://www.figma.com/settings)
2. Scroll to "Personal access tokens"
3. Click "Create new token"
4. Give it a name and copy the token
5. Use it with the export script

### Script Options

```bash
# Export all icons to default location
python3 export_figma_icons.py --token YOUR_TOKEN

# List all icons without exporting
python3 export_figma_icons.py --token YOUR_TOKEN --list-only

# Export to custom directory
python3 export_figma_icons.py --token YOUR_TOKEN --output /path/to/output
```

## Manual Export (Alternative)

If you prefer to export manually from Figma:

### Step 1: Open the Figma File

Open the Prosper Foundations file:
https://www.figma.com/design/gwJu3hUXYU8iEDqJmuA1r4

### Step 2: Navigate to Icon Frames

There are two icon frames:

1. **Generic Icons** (Frame ID: 469:11637)
   - Contains 269 general-purpose icons
   - Most have both line and solid variants

2. **Dezerv Icons** (Frame ID: 469:15505)
   - Contains 23 brand-specific icons
   - Portfolio, investment product icons

### Step 3: Export Individual Icons

For each icon you want to export:

1. Select the icon at `size=default` (24x24px)
2. In the right panel, scroll to "Export"
3. Click "+" to add an export setting
4. Choose "SVG" format
5. Click "Export"
6. Save to the appropriate folder:
   - Line/outline variants → `assets/icons/generic/line/`
   - Solid/filled variants → `assets/icons/generic/solid/`

### Step 4: Naming Convention

Icons should be named in kebab-case matching their Figma layer names:
- `arrow-right.svg`
- `check-circle.svg`
- `bell.svg`

## Icon Summary

| Category | Total Icons | Line Variants | Solid Variants |
|----------|-------------|---------------|----------------|
| Generic  | 269         | 269           | 181            |
| Dezerv   | 23          | 23            | 2              |
| **Total**| **292**     | **292**       | **183**        |

## File Structure

After export, your assets folder should look like:

```
assets/
└── icons/
    └── generic/
        ├── line/
        │   ├── adjust-circle.svg
        │   ├── analysis.svg
        │   ├── analytics.svg
        │   └── ... (292 SVG files)
        └── solid/
            ├── adjust-circle.svg
            ├── archive.svg
            └── ... (183 SVG files)
```

## Verifying the Export

After exporting, run the Flutter app to verify:

```bash
flutter run -d chrome
```

The design system demo page should now display all icons properly.

## Troubleshooting

### "Unable to load asset" errors
- Ensure SVG files are named correctly (kebab-case, lowercase)
- Check that files are in the correct directory
- Run `flutter clean && flutter pub get` to refresh assets

### Missing icons
- Some icons may only have line OR solid variant (not both)
- Check `figma_icons.json` for the complete icon list

### Export script fails
- Verify your Figma token has read access to the file
- Check network connectivity
- The Figma API has rate limits - wait a few minutes and retry

## Icons List Reference

See `figma_icons.json` for the complete list of icons with their Figma node IDs.
