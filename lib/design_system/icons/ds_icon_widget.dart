import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/ds_theme_extension.dart';
import 'ds_icons.dart';

/// Design System Icon Widget
/// 
/// A widget for rendering SVG icons from the design system.
/// Uses ONLY design system tokens - no fallbacks.
/// 
/// Usage:
/// ```dart
/// DSIcon(DSIcons.check)
/// DSIcon(DSIcons.bell, size: DSIconSize.large)
/// DSIcon(DSIcons.archive, stroke: DSIconStroke.solid)
/// DSIcon.byName('check')
/// ```
class DSIcon extends StatelessWidget {
  /// Creates a DSIcon from icon data.
  const DSIcon(
    this.icon, {
    super.key,
    this.size = DSIconSize.defaultSize,
    this.stroke = DSIconStroke.line,
    this.color,
    this.semanticLabel,
    this.fit = BoxFit.contain,
  }) : iconName = null;

  /// Creates a DSIcon from an icon name string.
  const DSIcon.byName(
    String this.iconName, {
    super.key,
    this.size = DSIconSize.defaultSize,
    this.stroke = DSIconStroke.line,
    this.color,
    this.semanticLabel,
    this.fit = BoxFit.contain,
  }) : icon = null;

  /// The icon data to render.
  final DSIconData? icon;

  /// The icon name to look up (used with DSIcon.byName).
  final String? iconName;

  /// The size of the icon.
  final DSIconSize size;

  /// The stroke style of the icon.
  final DSIconStroke stroke;

  /// The color to apply to the icon.
  /// If null, uses the theme's icon color from design system.
  final Color? color;

  /// Semantic label for accessibility.
  final String? semanticLabel;

  /// How the icon should be inscribed into the space.
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final resolvedIcon = icon ?? DSIcons.byName(iconName ?? '');

    if (resolvedIcon == null) {
      // Return empty container for missing icons - no fallback
      return SizedBox(
        width: size.size,
        height: size.size,
      );
    }

    // Determine the effective stroke
    final effectiveStroke = _getEffectiveStroke(resolvedIcon);

    final assetPath = resolvedIcon.assetPath(
      stroke: effectiveStroke,
    );

    // Get icon color from design system
    final iconColor = color ?? context.ds.colors.iconPrimary;

    // Use placeholderBuilder to handle missing assets gracefully
    return SvgPicture.asset(
      assetPath,
      width: size.size,
      height: size.size,
      fit: fit,
      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      semanticsLabel: semanticLabel ?? resolvedIcon.name,
      placeholderBuilder: (context) => SizedBox(
        width: size.size,
        height: size.size,
      ),
    );
  }

  /// Gets the effective stroke, falling back if the requested stroke is not available.
  DSIconStroke _getEffectiveStroke(DSIconData icon) {
    if (stroke == DSIconStroke.solid && icon.hasSolidVariant) {
      return DSIconStroke.solid;
    }
    if (stroke == DSIconStroke.line && icon.hasLineVariant) {
      return DSIconStroke.line;
    }
    // Fallback to whatever is available
    if (icon.hasLineVariant) return DSIconStroke.line;
    if (icon.hasSolidVariant) return DSIconStroke.solid;
    return stroke;
  }
}

/// Extension for creating DSIcon with fluent API.
extension DSIconDataExtension on DSIconData {
  /// Creates a DSIcon widget from this icon data.
  DSIcon toWidget({
    DSIconSize size = DSIconSize.defaultSize,
    DSIconStroke stroke = DSIconStroke.line,
    Color? color,
    String? semanticLabel,
  }) => DSIcon(
      this,
      size: size,
      stroke: stroke,
      color: color,
      semanticLabel: semanticLabel,
    );
}
