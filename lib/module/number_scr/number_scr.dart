import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobigic/models/number_model.dart';
import 'package:mobigic/module/number_scr/number_scr_ctrl.dart';
import 'package:mobigic/routes/app_routes.dart';
import 'package:mobigic/style/app_colors.dart';
import 'package:mobigic/utils/widgets/cmn_btn.dart';
import 'package:mobigic/utils/widgets/cmn_txtfield.dart';

class NumberScreen extends StatelessWidget {
  NumberScreen({Key? key}) : super(key: key);

  final NumberScreenCtrl c = Get.put(NumberScreenCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.primaryColor,
        title: Text(
          "Number Screen",
          style: context.textTheme.labelMedium?.copyWith(
            color: AppColors.white,
            fontSize: 20.0,
          ),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: c.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CmnTextField(
                controller: c.mtextCtrl,
                fillColor: context.theme.primaryColor.withOpacity(0.08),
                radius: 8.0,
                onChanged: (p0) {
                  c.countValidation();
                },
                validator: (value) {
                  if (value == null || value!.isEmpty) {
                    return "Please enter the m value";
                  }
                },
                textInputAction: TextInputAction.next,
                hint: "M Value",
                keyboardType: TextInputType.number,
                hintStyle: context.theme.textTheme.labelSmall?.copyWith(
                    color: AppColors.greyClr.withOpacity(0.8),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 16.0,
              ),
              CmnTextField(
                controller: c.ntextCtrl,
                fillColor: context.theme.primaryColor.withOpacity(0.08),
                radius: 8.0,
                keyboardType: TextInputType.number,
                hint: "N Value",
                onChanged: (p0) {
                  c.countValidation();
                },
                validator: (value) {
                  if (value == null || value!.isEmpty) {
                    return "Please enter the n value";
                  }
                },
                textInputAction: TextInputAction.next,
                hintStyle: context.theme.textTheme.labelSmall?.copyWith(
                    color: AppColors.greyClr.withOpacity(0.8),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 16,
              ),
              Obx(
                () => Visibility(
                  visible: c.maxNumValue.value != 0 ? true : false,
                  child: CmnTextField(
                    controller: c.alphabatCtrl,
                    fillColor: context.theme.primaryColor.withOpacity(0.08),
                    radius: 8.0,
                    textInputFormater: [
                      FilteringTextInputFormatter.deny(RegExp(r"\s")),
                    ],
                    hint: "Alphabet",
                    maxNumber: c.maxNumValue.value,
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter the alphabet value";
                      } else if (value.length != c.maxNumValue.value) {
                        return "Please enter maximum alphabet value";
                      }
                    },
                    hintStyle: context.theme.textTheme.labelSmall?.copyWith(
                        color: AppColors.greyClr.withOpacity(0.8),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(
                height: 36.0,
              ),
              CmnTextBtn(
                onPressed: () {
                  if (c.formKey.currentState!.validate()) {
                    c.formKey.currentState!.save();
                    FocusScope.of(context).unfocus();
                    NumberModel numberModel = NumberModel(
                      m: int.parse(c.mtextCtrl.text),
                      n: int.parse(c.ntextCtrl.text),
                      alphabet: c.alphabatCtrl.text,
                    );
                    Get.toNamed(Routes.GRID_SCREEN,
                        arguments: numberModel.toJson());
                  }
                },
                label: "Next",
                labelStyle: context.theme.textTheme.labelSmall?.copyWith(
                    color: AppColors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600),
                height: 54.0,
                borderRadius: BorderRadius.circular(6.0),
                backgroundColor: context.theme.primaryColor.withOpacity(0.8),
              ),
            ],
          ).paddingAll(20.0),
        ),
      ),
    );
  }
}
