import 'package:core/core.dart';
import 'package:core/localization/app_localization.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:navigation/di/navigation_di.dart';

import '../app.dart';

Future<void> mainCommon({required Flavor flavor}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  _setupDI(flavor);

  runApp(
    EasyLocalization(
      supportedLocales: AppLocalization.supportedLocales,
      path: AppLocalization.langsFolderPath,
      fallbackLocale: AppLocalization.fallbackLocale,
      useFallbackTranslations: true,
      useOnlyLangCode: true,
      saveLocale: false,
      child: const App(),
    ),
  );
}

void _setupDI(Flavor _) {
  appLocator.pushNewScope(
    scopeName: unauthScope,
    init: (_) {
      dataDI.initDependencies();
      setupNavigationDependencies();
    },
  );
}
