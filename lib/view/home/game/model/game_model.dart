import 'package:json_annotation/json_annotation.dart';

part 'game_model.g.dart';

@JsonSerializable()
class GameModel {
  @JsonKey(name: "_id")
  String? sId;
  String image;
  String name;
  int money;
  int category;

  GameModel({
    this.sId,
    required this.image,
    required this.name,
    required this.money,
    required this.category,
  });
}
