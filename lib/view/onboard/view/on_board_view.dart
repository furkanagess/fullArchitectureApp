import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/base/base_widget.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/images/image_path_svg.dart';
import '../../../product/widgets/avatar/on_board_circle.dart';
import '../model/on_board_model.dart';
import '../viewModel/on_board_view_model.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnBoardViewModel viewModel) {
        return Scaffold(
          body: Padding(
            padding: context.paddingNormalHorizontal,
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: buildPageView(viewModel),
                ),
                Expanded(
                  flex: 2,
                  child: buildRowFouter(viewModel, context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  PageView buildPageView(OnBoardViewModel viewModel) {
    return PageView.builder(
      onPageChanged: (value) => viewModel.changeCurrentIndex(value),
      itemCount: viewModel.onBoardItems.length,
      itemBuilder: (context, index) => buildColumnBody(
        context,
        viewModel.onBoardItems[index],
      ),
    );
  }

  Row buildRowFouter(OnBoardViewModel viewModel, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: buildListViewAvatar(viewModel),
        ),
        const Spacer(),
        buildSkipFAB(context)
      ],
    );
  }

  ListView buildListViewAvatar(OnBoardViewModel viewModel) {
    return ListView.builder(
      itemCount: 3,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Observer(
        builder: (_) {
          return OnBoardCircle(isSelected: viewModel.currentIndex == index);
        },
      ),
    );
  }

  FloatingActionButton buildSkipFAB(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: context.colors.onPrimary,
      child: Icon(
        Icons.double_arrow_outlined,
        color: context.colors.background,
      ),
      onPressed: () {},
    );
  }

  Column buildColumnBody(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: buildSVG(model.imagePath),
        ),
        buildColumnDescription(context, model),
      ],
    );
  }

  Column buildColumnDescription(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        AutoSizeText(
          model.title,
          style: context.textTheme.headline3?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colors.primary,
          ),
        ),
        Padding(
          padding: context.paddingMediumHorizontal,
          child: AutoSizeText(
            model.description,
            style: context.textTheme.subtitle1?.copyWith(
              fontWeight: FontWeight.w400,
              color: context.colors.primary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  SvgPicture buildSVG(String path) => SvgPicture.asset(SVGImagePaths.instance.catSVG);
}
