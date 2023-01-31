import 'package:flutter/material.dart';
import 'package:random_full_app/core/extension/context_extension.dart';
import 'package:random_full_app/core/localization/app_strings.dart';

class SettingsDynamicView extends StatelessWidget {
  const SettingsDynamicView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            AppStrings.instance.contributors,
            style: context.textTheme.headline3,
          )
        ],
      ),
    );
  }
}
