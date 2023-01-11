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
        appBar: _buildAppBar(),
        body: DefaultTabController(
          length: 4,
          child: ListView(
            children: [
              TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: context.colors.onPrimary,
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
              Container(
                height: 300,
                child: Stack(
                  children: [
                    Positioned.fill(
                      bottom: 100,
                      child: Container(
                        color: context.colors.error,
                      ),
                    ),
                    Positioned.fill(
                      top: 150,
                      left: 10,
                      right: 10,
                      child: Column(
                        children: [
                          ListTile(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.menu),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        ),
      ],
    );
  }
}
