import 'package:flutter/material.dart';

import '../../../../core/base/base_widget.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/localization/app_strings.dart';
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
              buildText(context),
              Spacer(flex: 2),
              buildTextField(context),
              Spacer(flex: 2),
              Expanded(
                flex: 90,
                child: buildListView(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Text buildText(BuildContext context) {
    return Text(
      AppStrings.instance.findFriends,
      style: context.textTheme.headline4?.copyWith(
        fontWeight: FontWeight.bold,
        color: context.colors.onSecondary,
      ),
    );
  }

  TextField buildTextField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        prefixIcon: Icon(
          Icons.search,
          color: context.colors.onSecondary,
        ),
      ),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: CircleAvatar(backgroundColor: context.colors.onPrimary),
        title: Text(AppStrings.instance.name),
        subtitle: Text(AppStrings.instance.pet),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: context.colors.onPrimary,
          ),
          onPressed: () {},
          child: Text(AppStrings.instance.follow),
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
            AppStrings.instance.next,
            style: context.textTheme.headline5?.copyWith(
              color: context.colors.onPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
