import 'package:flutter/material.dart';

import '../../../../core/base/base_widget.dart';
import '../../../../core/extension/context_extension.dart';
import '../viewModel/social_view_model.dart';

class SocialView extends StatelessWidget {
  const SocialView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SocialViewModel>(
      viewModel: SocialViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, value) => Scaffold(
        appBar: buildAppbar(context),
        body: Padding(
          padding: context.paddingLow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Find Friends",
                style: context.textTheme.headline4?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colors.onSecondary,
                ),
              ),
              Spacer(flex: 2),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: context.colors.onSecondary,
                  ),
                ),
              ),
              Spacer(flex: 2),
              Expanded(
                flex: 90,
                child: ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(backgroundColor: context.colors.onPrimary),
                    title: Text("Eda Özdoğdu"),
                    subtitle: Text("2 Scottish"),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: context.colors.onPrimary,
                      ),
                      onPressed: () {},
                      child: Text("Follow"),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: TextButton(
        onPressed: () {},
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_outlined,
            size: 30,
            color: context.colors.onPrimary,
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            "Next",
            style: context.textTheme.headline6?.copyWith(
              color: context.colors.onPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
