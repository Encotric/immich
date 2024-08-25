import 'package:flutter/material.dart';
import 'package:immich_mobile/presentation/modules/theme/models/app_colors.model.dart';
import 'package:immich_mobile/utils/extensions/material_state.extension.dart';

enum AppTheme {
  blue(AppColors.blueLight, AppColors.blueDark),
  // Fallback color for dynamic theme for non-supported platforms
  dynamic(AppColors.blueLight, AppColors.blueDark);

  final ColorScheme lightSchema;
  final ColorScheme darkSchema;

  const AppTheme(this.lightSchema, this.darkSchema);

  static ThemeData generateThemeData(ColorScheme color) {
    return ThemeData(
      colorScheme: color,
      primaryColor: color.primary,
      iconTheme: const IconThemeData(weight: 500, opticalSize: 24),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: color.surface,
        indicatorColor: color.primary,
        iconTheme: WidgetStateProperty.resolveWith(
          (Set<WidgetState> states) {
            if (states.isSelected) {
              return IconThemeData(color: color.onPrimary);
            }
            return IconThemeData(color: color.onSurface.withAlpha(175));
          },
        ),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: color.surface,
        elevation: 3,
        indicatorColor: color.primary,
        selectedIconTheme:
            IconThemeData(weight: 500, opticalSize: 24, color: color.onPrimary),
        unselectedIconTheme: IconThemeData(
          weight: 500,
          opticalSize: 24,
          color: color.onSurface.withAlpha(175),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
      sliderTheme: SliderThemeData(
        valueIndicatorColor:
            Color.alphaBlend(color.primary.withAlpha(80), color.onSurface)
                .withAlpha(240),
      ),
      snackBarTheme: SnackBarThemeData(
        elevation: 4,
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        insetPadding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 25.0),
        backgroundColor:
            Color.alphaBlend(color.primary.withAlpha(80), color.onSurface)
                .withAlpha(240),
        actionTextColor: color.inversePrimary,
        contentTextStyle: TextStyle(color: color.onInverseSurface),
        closeIconColor: color.onInverseSurface,
      ),
    );
  }
}
