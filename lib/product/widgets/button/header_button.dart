import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';
import '../../../core/localization/app_strings.dart';

class HeaderButton extends StatelessWidget {
  final String titleText;
  final VoidCallback onPressed;
  const HeaderButton({super.key, required this.titleText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLowHorizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildTitleText(context),
          buildRightButton(context),
        ],
      ),
    );
  }

  Text buildTitleText(BuildContext context) {
    return Text(
      titleText,
      style: context.textTheme.headline6?.copyWith(
        color: context.colors.onPrimary,
      ),
    );
  }

  ElevatedButton buildRightButton(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            AppStrings.instance.viewAll,
            style: context.textTheme.subtitle2?.copyWith(
              color: context.colors.onPrimary,
            ),
          ),
          Icon(
            Icons.arrow_right,
            color: context.colors.onPrimary,
          ),
        ],
      ),
    );
  }
}
