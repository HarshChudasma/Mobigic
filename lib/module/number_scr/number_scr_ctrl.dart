import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NumberScreenCtrl extends GetxController {

  final TextEditingController mtextCtrl = TextEditingController();
  final TextEditingController ntextCtrl = TextEditingController();
  final TextEditingController alphabatCtrl = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxInt maxNumValue = 0.obs;

  // Alphabet maxValue and MinValue
  countValidation(){
    int m = mtextCtrl.text.isEmpty ? 0 : int.parse(mtextCtrl.text);
    int n = ntextCtrl.text.isEmpty ? 0 : int.parse(ntextCtrl.text);
    maxNumValue.value = m * n;
  }

  // reset value of textfield
  reset(){
    mtextCtrl.clear();
    ntextCtrl.clear();
    alphabatCtrl.clear();
  }


}