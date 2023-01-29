import 'package:flutter/material.dart';
import 'package:random_full_app/core/base/base_widget.dart';
import 'package:random_full_app/core/extension/widget_extension.dart';
import 'package:random_full_app/core/localization/app_strings.dart';
import 'package:random_full_app/view/settings/viewModel/settings_view_model.dart';
import '../../../core/extension/context_extension.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel>(
      viewModel: SettingsViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SettingsViewModel viewModel) => Scaffold(
        body: Padding(
          padding: context.paddingLow,
          child: CustomScrollView(
            slivers: [
              buildSliverAppBar(context),
              buildCardUser(context, viewModel).toSliver,
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About Project",
                      style: context.textTheme.headline5,
                    ),
                    const Divider(),
                    ListTile(
                      onTap: () {
                        viewModel.navigateToContribution(context);
                      },
                      leading: Icon(Icons.favorite),
                      title: Text("Project Contributors"),
                      trailing: Icon(Icons.arrow_right_outlined),
                    ),
                    ListTile(
                      onTap: () {
                        viewModel.navigateToContribution(context);
                      },
                      leading: Icon(Icons.home),
                      title: Text("Home Page"),
                      trailing: Icon(Icons.arrow_right_outlined),
                    ),
                  ],
                ),
              ).toSliver,
            ],
          ),
        ),
      ),
    );
  }

  Card buildCardUser(BuildContext context, SettingsViewModel viewModel) {
    return Card(
      child: Padding(
        padding: context.paddingLow,
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              child: Text(viewModel.userModel.shortName),
            ),
            Spacer(),
            Text(viewModel.userModel.fullName),
            Spacer(flex: 5),
          ],
        ),
      ),
    );
  }

  NestedScrollView buildNestedScrollView() {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          buildSliverAppBar(context),
        ];
      },
      body: Text("data"),
    );
  }

  SliverAppBar buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 100,
      pinned: true,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: Text(
          AppStrings.instance.settings,
          style: context.textTheme.headline5,
        ),
      ),
    );
  }
}
