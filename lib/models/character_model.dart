import 'package:get/get.dart';

class CharacterModel{
  String character;
  RxBool isSearch = false.obs;

  CharacterModel({required this.character});

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
    character: json["char"],
  );

  Map<String, dynamic> toJson() => {
    "char":character,
  };

}