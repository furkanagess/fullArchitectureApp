import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:random_full_app/core/base/base_view_model.dart';
part 'build_feed_view_model.g.dart';

class BuildFeedViewModel = _BuildFeedViewModelBase with _$BuildFeedViewModel;

abstract class _BuildFeedViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context;
  void init() {}
}
