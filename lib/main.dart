import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:random_full_app/core/constants/app_constants.dart';
import 'package:random_full_app/core/lang/lang_manager.dart';
import 'package:random_full_app/core/theme/theme_notifier.dart';
import 'package:random_full_app/view/settings/view/settings_view.dart';

import 'view/home/game/view/game_view.dart';
import 'view/onboard/view/on_board_view.dart';

void main() => runApp(
      EasyLocalization(
        child: MyApp(),
        supportedLocales: LanguageManager.instance.supportedLocales,
        path: ApplicationConstants.LANG_ASSET_PATH,
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: SettingsView(),
      theme: ThemeData.light(),
    );
  }
}
