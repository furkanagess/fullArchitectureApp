import 'package:flutter/material.dart';

import '../../../../core/base/base_widget.dart';
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
      onPageBuilder: (BuildContext context, GameViewModel value) => Scaffold(),
    );
  }
}
