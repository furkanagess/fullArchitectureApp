import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:random_full_app/core/base/base_view_model.dart';
import 'package:random_full_app/core/images/image_path_svg.dart';
import 'package:random_full_app/view/onboard/model/on_board_model.dart';
part 'on_board_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context;
  List<OnBoardModel> onBoardItems = [];

  @observable
  int currentIndex = 0;
  @action
  void changeCurrentIndex(int value) {
    currentIndex = value;
  }

  void init() {
    onBoardItems.add(
      OnBoardModel(
        "Make It Good",
        "You are not alone. You have unique ability to go to another world.",
        SVGImagePaths.instance.catSVG,
      ),
    );
    onBoardItems.add(
      OnBoardModel(
        "Make ",
        "You are not alone. You have unique ability to go to another world.",
        SVGImagePaths.instance.dogSVG,
      ),
    );
    onBoardItems.add(
      OnBoardModel(
        "Make It Good",
        "You are not alone. You have unique ability to go to another world.",
        SVGImagePaths.instance.goodDogSVG,
      ),
    );
  }

  void completeToOnboard() {}
}
