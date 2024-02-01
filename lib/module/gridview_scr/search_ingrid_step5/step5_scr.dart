import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobigic/module/gridview_scr/gridview_scr_ctrl.dart';
import 'package:mobigic/style/app_colors.dart';
import 'package:mobigic/utils/widgets/cmn_txtfield.dart';

class SearchInGridView extends StatelessWidget {
  SearchInGridView({Key? key}) : super(key: key);

  final GridViewScrCtrl c = Get.find<GridViewScrCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: InkWell(
            onTap: () {
              c.resetFunction();
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 24.0,
              color: AppColors.white,
            )),
        backgroundColor: context.theme.primaryColor,
        title: Text(
          "Search Only In GridView",
          style: context.textTheme.labelMedium?.copyWith(
            color: AppColors.white,
            fontSize: 20.0,
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CmnTextField(
            controller: c.searchTextCtrl,
            fillColor: context.theme.primaryColor.withOpacity(0.08),
            radius: 8.0,
            onChanged: (searchValue) {
              c.searchValue(searchValue);
            },
            suffixIcon: InkWell(
                onTap: () {
                  if (c.searchTextCtrl.text.isNotEmpty) {
                    c.searchTextCtrl.clear();
                    c.searchValue('');
                  }
                },
                child: Obx(
                    () => Icon(
                    c.isSearch() ? Icons.clear : Icons.search,
                    color: context.theme.primaryColor,
                  ),
                )),
            textInputAction: TextInputAction.next,
            hint: "Search",
            keyboardType: TextInputType.text,
            hintStyle: context.theme.textTheme.labelSmall?.copyWith(
                color: AppColors.greyClr.withOpacity(0.8),
                fontSize: 16.0,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Expanded(
            child: Obx(
              () => GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: c.numberModel.value!.n,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0),
                itemCount: c.seCharModel.length,
                itemBuilder: (context, index) {
                  return ColoredBox(
                    color: AppColors.greyClr.withOpacity(
                      0.2,
                    ),
                    child: Center(
                      child: Text(
                        c.seCharModel[index].character,
                        style: context.textTheme.labelMedium,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ).paddingAll(20.0),
    );
  }
}
