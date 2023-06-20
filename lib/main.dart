import 'package:core/core.dart';
import 'package:core/localization/app_localization.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  dataDI.initDependencies();
  AppDI.initDependencies();
  runApp(
    EasyLocalization(
      supportedLocales: AppLocalization.supportedLocales,
      path: AppLocalization.langsFolderPath,
      fallbackLocale: AppLocalization.fallbackLocale,
      child: const App(),
    ),
  );
}
