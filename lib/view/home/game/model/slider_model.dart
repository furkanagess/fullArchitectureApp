import 'package:json_annotation/json_annotation.dart';

part 'slider_model.g.dart';

@JsonSerializable()
class SliderModel {
  final String image;
  final String text;
  final String detailId;

  SliderModel({required this.image, required this.text, required this.detailId});
}
