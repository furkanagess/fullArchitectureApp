import 'package:flutter/material.dart';

class GameSlider extends StatelessWidget {
  const GameSlider({super.key, required this.imageUrl});
  final List<String> imageUrl;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: PageController(viewportFraction: 0.9),
      itemCount: imageUrl.length,
      itemBuilder: (context, index) {
        return Card(
          child: Image.asset(imageUrl[index]),
        );
      },
    );
  }
}
