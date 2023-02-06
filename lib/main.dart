import 'package:flutter/material.dart';
import 'package:random_full_app/core/theme/theme_notifier.dart';
import 'package:random_full_app/view/settings/view/settings_view.dart';

import 'view/home/game/view/game_view.dart';
import 'view/onboard/view/on_board_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: OnBoardView(),
      theme: ThemeData.light(),
    );
  }
}
