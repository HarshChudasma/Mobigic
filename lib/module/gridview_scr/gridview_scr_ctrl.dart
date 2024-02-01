import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobigic/models/character_model.dart';
import 'package:mobigic/models/number_model.dart';

class GridViewScrCtrl extends GetxController {
  final TextEditingController searchTextCtrl = TextEditingController();

  Rxn<NumberModel> numberModel = Rxn<NumberModel>();
  RxList<CharacterModel> charModel = RxList<CharacterModel>();
  RxList<CharacterModel> seCharModel = RxList<CharacterModel>();

  RxBool isLoad = false.obs;
  RxBool isSearch = false.obs;
  RxString lastChar = ''.obs;

  RxMap<String, int> duplicateCount = RxMap<String, int>();

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() {
    isLoad(true);
    var arguments = Get.arguments as Map<String, dynamic>;
    numberModel.value = NumberModel.fromJson(arguments);
    List<String> list = numberModel.value!.alphabet.split("");
    for (var char in list) {
      CharacterModel characterModel = CharacterModel(character: char);
      charModel.add(characterModel);
      seCharModel.add(characterModel);
      for(int i =0;i<numberModel.value!.m;i++){
        for(int j=0;j<numberModel.value!.n;j++){

        }
      }
    }
    isLoad(false);
  }

  // only search value in gridview flutter (step 5)
  searchValue(String searchValue) {
    if (searchValue.isEmpty) {
      isSearch(false);
      seCharModel.value = charModel();
    } else {
      List<String> searchText = searchValue.split("");
      isSearch(true);
      seCharModel.value = charModel.where((element) {
        return searchText.any((char) => element.character.contains(char));
      }).toList();
    }
  }

  // SearchValue and Duplicate Value Count (step 7)
  searchDuplicateValue(String searchValue) {
    String currentText = searchValue;
    if (searchValue.isEmpty) {
      isSearch(false);
      for (var char in seCharModel) {
        if ((char.character == lastChar.value.split("").last)) {
          char.isSearch.value = false;
        }
      }
      duplicateCount.clear();
      seCharModel.value = charModel();
    } else {
      isSearch(true);
      List<String> searchText = searchValue.split("");
      if (currentText.length < lastChar.value.length) {
        for (var char in seCharModel) {
          if ((char.character == lastChar.value.split("").last)) {
            char.isSearch.value = false;
            duplicateCount.remove(lastChar.value.split("").last);
          }
        }
      } else {
        for (var char in seCharModel) {
          if ((char.character == searchText[searchText.length - 1])) {
            char.isSearch.value = true;
            duplicateCount[searchText[searchText.length - 1]] =
                (duplicateCount[searchText[searchText.length - 1]] ?? 0) + 1;
          }
        }
      }
    }
    lastChar.value = currentText;
  }

  resetFunction() {
    for (var char in charModel) {
      char.isSearch.value = false;
    }
    seCharModel.value = charModel();
    isLoad(false);
    isSearch(false);
    lastChar('');
    searchTextCtrl.clear();
    duplicateCount.clear();
  }
}
