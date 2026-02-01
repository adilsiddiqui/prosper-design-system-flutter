/// Prosper Design System
/// 
/// A comprehensive design token system for Flutter, generated from Figma.
/// 
/// ## Quick Start
/// 
/// ```dart
/// import 'package:your_app/design_system/design_system.dart';
/// 
/// // Set up theme
/// MaterialApp(
///   theme: DS.theme.light,
///   darkTheme: DS.theme.dark,
///   themeMode: ThemeMode.system,
///   // ...
/// )
/// 
/// // Use tokens in widgets
/// Container(
///   color: context.ds.colors.bgPrimary,
///   padding: EdgeInsets.all(DS.space.md),
///   child: Text(
///     'Hello',
///     style: context.ds.typography.headingLarge,
///   ),
/// )
/// ```
/// 
/// ## Available Tokens
/// 
/// - **Colors**: `DS.colors(mode)` or `context.ds.colors`
/// - **Typography**: `DS.type.mobile/desktop/deck` or `context.ds.typography`
/// - **Spacing**: `DS.space.xs/sm/md/lg/xl/...`
/// - **Radius**: `DS.radius.xl/xl3/full`
/// - **Shadows**: `DS.shadows(mode)` or `context.ds.shadows`
/// - **Icons**: `DS.icons.check` or `DSIcon(DSIcons.check)`
library design_system;

// Colors
export 'colors/ds_colors.dart';
// Core exports
export 'ds.dart';
export 'icons/ds_icon_widget.dart';
// Icons
export 'icons/ds_icons.dart';
// Radius
export 'radius/ds_radius.dart';
// Shadows
export 'shadows/ds_shadows.dart';
// Spacing
export 'spacing/ds_spacing.dart';
// Theme
export 'theme/ds_theme.dart';
export 'theme/ds_theme_extension.dart';
// Token names (for Figma name reversibility)
export 'tokens/token_names.dart';
// Typography
export 'typography/ds_typography.dart';
