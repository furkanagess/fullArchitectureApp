import 'package:flutter/material.dart';

import '../../../../core/base/base_widget.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/images/image_constants.dart';
import '../../../../core/localization/app_strings.dart';
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
        appBar: AppBar(
          leading: Icon(Icons.rounded_corner),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.camera_enhance,
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
        ),
        body: DefaultTabController(
          length: value.gameTabItems.length,
          child: ListView.builder(
            itemCount: GameViewItems.values.length,
            itemBuilder: (context, index) {
              switch (GameViewItems.values[index]) {
                case GameViewItems.SEARCH_BAR:
                  return buildPaddingSearchBar(context);
                case GameViewItems.TABBAR:
                  return TabBar(
                    indicatorWeight: 3,
                    indicatorColor: context.colors.onPrimary,
                    isScrollable: true,
                    tabs: value.gameTabItems
                        .map((e) => Tab(
                              child: Padding(
                                padding: context.paddingLow,
                                child: Text(e),
                              ),
                            ))
                        .toList(),
                  );
                case GameViewItems.SLIDER:
                  return SizedBox(
                      height: context.dynamicHeight(0.3),
                      child: GameSlider(
                        imageUrl: [
                          ImageConstants.instance.cat,
                          ImageConstants.instance.cat,
                          ImageConstants.instance.cat,
                        ],
                      ));

                default:
                  return Text("data");
              }
            },
          ),
        ),
      ),
    );
  }

  Padding buildPaddingSearchBar(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
