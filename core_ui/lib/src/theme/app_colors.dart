part of core_ui;

abstract class AppColors {
  factory AppColors.of(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    return brightness == Brightness.light
        ? const LightColors()
        : const DarkColors();
  }

  Color get primaryBg;

  Color get white;

  Color get red;

  Color get green;

  Color get darkGray;

  Color get lightGray;

  Color get lightGreen;

  Color get lightBlue;

  Color get black;

  Color get textDark;

  Color get antiqueBrass;

  Color get textGrey;

  Color get formsBackground;

  Color get splashBackground;

  Color get inputBorderColorUnActive;
}

class DarkColors extends LightColors {
  const DarkColors();
}

class LightColors implements AppColors {
  const LightColors();

  @override
  // RGBO(236, 239, 241, 1)
  Color get primaryBg => const Color(0xFFeceff1);

  @override
  Color get white => const Color.fromRGBO(255, 255, 255, 1);

  @override
  Color get textDark => const Color.fromRGBO(33, 33, 33, 1);

  @override
  Color get textGrey => const Color(0xFF9E9E9E);

  @override
  Color get inputBorderColorUnActive => const Color.fromRGBO(0, 0, 0, 0.23);

  @override
  Color get darkGray => const Color.fromRGBO(96, 125, 139, 1);

  @override
  Color get lightGray => const Color(0xFFb0bec5);

  @override
  Color get red => const Color.fromRGBO(217, 83, 79, 1);

  @override
  Color get green => const Color.fromRGBO(0, 137, 123, 1);

  @override
  Color get black => const Color.fromRGBO(0, 0, 0, 1);

  @override
  Color get lightGreen => const Color.fromRGBO(224, 242, 241, 1);

  @override
  Color get splashBackground => const Color.fromRGBO(213, 238, 236, 1);

  @override
  Color get lightBlue => const Color.fromRGBO(238, 246, 255, 1);

  @override
  Color get formsBackground => const Color.fromRGBO(247, 249, 252, 1);

  @override
  Color get antiqueBrass => const Color.fromRGBO(198, 156, 66, 1);
}
