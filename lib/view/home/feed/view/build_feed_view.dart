import 'package:flutter/material.dart';
import 'package:random_full_app/core/base/base_widget.dart';
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
                    text: "Latest",
                  ),
                  Tab(
                    text: "Home",
                  ),
                  Tab(
                    text: "Music",
                  ),
                  Tab(
                    text: "Style",
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
              Text(
                "Recommended",
                style: context.textTheme.headline5
                    ?.copyWith(color: context.colors.primary),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) => SizedBox(
                  height: context.dynamicHeight(0.2),
                  child: Card(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            color: Colors.red,
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: buildColumnUserCard(context),
                        ),
                      ],
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

  Widget buildStack(BuildContext context) {
    return Padding(
      padding: context.paddingLowHorizontal,
      child: Stack(
        children: [
          Positioned.fill(
            bottom: 100,
            child: Container(
              color: context.colors.error,
            ),
          ),
          Positioned(
            top: 150,
            left: 10,
            right: 10,
            child: Container(
              color: context.colors.onPrimary,
              child: Padding(
                padding: context.paddingLow,
                child: buildColumnUserCard(context),
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
          leading: CircleAvatar(),
          title: Text("Bilmem ne"),
          subtitle: Text("Description"),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              color: context.colors.onPrimary,
            ),
          ),
        ),
        Text(
          "Awesome" * 2,
          style: context.textTheme.headline5
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text("Description" * 2),
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
