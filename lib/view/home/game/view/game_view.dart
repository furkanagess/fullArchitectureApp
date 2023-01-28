import 'package:flutter/material.dart';

import '../../../../core/base/base_widget.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/images/image_constants.dart';
import '../../../../core/localization/app_strings.dart';
import '../../../../product/widgets/button/header_button.dart';
import '../../../../product/widgets/slider/game_slider.dart';
import '../model/game_view_models.dart';
import '../viewModel/game_view_model.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: GameViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, GameViewModel value) => Scaffold(
        appBar: buildAppBar(context),
        body: DefaultTabController(
          length: value.gameTabItems.length,
          child: ListView.builder(
            itemCount: GameViewItems.values.length,
            itemBuilder: (context, index) {
              switch (GameViewItems.values[index]) {
                case GameViewItems.SEARCH_BAR:
                  return buildPaddingSearchBar(context);
                case GameViewItems.TABBAR:
                  return buildTabBar(context, value);
                case GameViewItems.SLIDER:
                  return buildSlider(context);
                case GameViewItems.NEW_UPDATE_GAMES_CARD:
                  return Column(
                    children: [
                      HeaderButton(
                        titleText: AppStrings.instance.topDownloads,
                        onPressed: () {},
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        children: [
                          Container(
                            height: 300,
                            child: Card(
                              child: Padding(
                                padding: context.paddingLow,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: Image.asset(
                                          ImageConstants.instance.cat,
                                        ),
                                      ),
                                    ),
                                    Text("Title"),
                                    Text("\$10.00"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                default:
                  return Text("data");
              }
            },
          ),
        ),
      ),
    );
  }

  TabBar buildTabBar(BuildContext context, GameViewModel value) {
    return TabBar(
      labelColor: context.colors.onPrimary,
      indicatorWeight: 2,
      indicatorColor: context.colors.onPrimary,
      isScrollable: true,
      tabs: value.gameTabItems
          .map((e) => Tab(
                child: Padding(
                  padding: context.paddingLow,
                  child: Text(
                    e,
                    style: context.textTheme.headline6?.copyWith(
                      color: context.colors.onPrimary,
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }

  SizedBox buildSlider(BuildContext context) {
    return SizedBox(
        height: context.dynamicHeight(0.3),
        child: GameSlider(
          imageUrl: [
            ImageConstants.instance.cat,
            ImageConstants.instance.cat,
            ImageConstants.instance.cat,
          ],
        ));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      leading: Icon(
        Icons.rounded_corner,
        color: context.colors.onPrimary,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.camera_enhance,
            color: context.colors.onPrimary,
          ),
        ),
      ],
      title: Text(
        AppStrings.instance.gameUnity,
        style: context.textTheme.headline5?.copyWith(
          color: context.colors.onPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Padding buildPaddingSearchBar(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.colors.onPrimary,
            ),
          ),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
