import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';

class GameSlider extends StatefulWidget {
  const GameSlider({super.key, required this.imageUrl});
  final List<String> imageUrl;

  @override
  State<GameSlider> createState() => _GameSliderState();
}

class _GameSliderState extends State<GameSlider> {
  int _selectedValueIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: buildPageView(),
        ),
        Expanded(
          child: listViewCircleIndicator(),
        )
      ],
    );
  }

  PageView buildPageView() {
    return PageView.builder(
      onPageChanged: _changeValue,
      controller: PageController(viewportFraction: 0.9),
      itemCount: widget.imageUrl.length,
      itemBuilder: (context, index) {
        return buildCardImage(index);
      },
    );
  }

  void _changeValue(int index) {
    _selectedValueIndex = index;
    setState(
      () {},
    );
  }

  Card buildCardImage(int index) {
    return Card(
      child: Image.asset(widget.imageUrl[index]),
    );
  }

  ListView listViewCircleIndicator() {
    return ListView.builder(
      itemCount: widget.imageUrl.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.all(
          context.dynamicWidth(0.01),
        ),
        child: CircleAvatar(
          backgroundColor: _selectedValueIndex == index ? context.colors.onPrimary : context.colors.error,
          radius: 10,
        ),
      ),
    );
  }
}
