import 'package:flutter/material.dart';
import 'package:random_full_app/core/base/base_widget.dart';
import 'package:random_full_app/view/home/feed/viewModel/build_feed_view_model.dart';

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
                tabs: [
                  Tab(
                    text: "Home",
                  ),
                  Tab(
                    text: "",
                  ),
                  Tab(
                    text: "",
                  ),
                  Tab(
                    text: "",
                  ),
                ],
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
