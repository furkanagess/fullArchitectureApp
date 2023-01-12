import 'package:flutter/material.dart';
import 'package:random_full_app/core/base/base_widget.dart';
import 'package:random_full_app/core/images/image_constants.dart';
import 'package:random_full_app/core/localization/app_strings.dart';
import 'package:random_full_app/view/home/feed/viewModel/build_feed_view_model.dart';
import 'package:random_full_app/core/extension/context_extension.dart';

class BuildFeedView extends StatelessWidget {
  const BuildFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<BuildFeedViewModel>(
      viewModel: BuildFeedViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, value) => Scaffold(
        appBar: _buildAppBar(context),
        body: DefaultTabController(
          length: 4,
          child: ListView(
            children: [
              TabBar(
                indicatorColor: context.colors.onPrimary,
                labelStyle: context.textTheme.bodyLarge,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: context.colors.primary,
                tabs: [
                  Tab(
                    text: AppStrings.instance.latest,
                  ),
                  Tab(
                    text: AppStrings.instance.dogs,
                  ),
                  Tab(
                    text: AppStrings.instance.cats,
                  ),
                  Tab(
                    text: AppStrings.instance.others,
                  ),
                ],
              ),
              SizedBox(
                height: 300,
                child: PageView.builder(
                  controller: PageController(viewportFraction: 0.9),
                  itemCount: 4,
                  itemBuilder: (context, index) => buildStack(context),
                ),
              ),
              Padding(
                padding: context.paddingNormalHorizontal,
                child: Text(
                  AppStrings.instance.recommended,
                  style: context.textTheme.headline5?.copyWith(
                    color: context.colors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) => SizedBox(
                  height: context.dynamicHeight(0.21),
                  child: Padding(
                    padding: context.paddingLow,
                    child: Card(
                      shadowColor: context.colors.onPrimary,
                      elevation: 7,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.asset(ImageConstants.instance.cat),
                          ),
                          Expanded(
                            flex: 8,
                            child: Padding(
                              padding: context.paddingLow,
                              child: buildColumnUserCard(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStack(BuildContext context) {
    return Padding(
      padding: context.paddingLowHorizontal,
      child: Stack(
        children: [
          Positioned.fill(
            bottom: 100,
            child: Image.asset(ImageConstants.instance.cat),
          ),
          Positioned(
            top: 150,
            left: 10,
            right: 10,
            child: Container(
              color: context.colors.onPrimary,
              child: Padding(
                padding: context.paddingLow,
                child: Card(
                  shadowColor: context.colors.onPrimary,
                  elevation: 7,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Image.asset(ImageConstants.instance.cat),
                      ),
                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding: context.paddingLow,
                          child: buildColumnUserCard(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column buildColumnUserCard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundColor: context.colors.onPrimary,
          ),
          title: Text(AppStrings.instance.name),
          subtitle: Text(AppStrings.instance.pet),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              color: context.colors.onPrimary,
            ),
          ),
        ),
        Text(
          AppStrings.instance.desc,
          style: context.textTheme.bodyMedium,
        ),
      ],
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
          color: context.colors.primary,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: context.colors.primary,
          ),
        ),
      ],
    );
  }
}
