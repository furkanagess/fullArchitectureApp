import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';
import '../../../view/home/game/model/game_model.dart';

class GameCard extends StatelessWidget {
  const GameCard({super.key, required this.model, required this.onPressed});
  final GameModel model;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: context.paddingLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  model.image,
                ),
              ),
            ),
            Text(model.name),
            Text('\$ ${model.money}'),
          ],
        ),
      ),
    );
  }
}
