import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobigic/module/gridview_scr/gridview_scr_ctrl.dart';
import 'package:mobigic/routes/app_routes.dart';
import 'package:mobigic/style/app_colors.dart';
import 'package:mobigic/utils/widgets/cmn_btn.dart';

class GridViewScreen extends StatelessWidget {
  GridViewScreen({Key? key}) : super(key: key);

  final GridViewScrCtrl c = Get.put(GridViewScrCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios,size: 24.0,color: AppColors.white,)),
        backgroundColor: context.theme.primaryColor,
        title: Text(
          "Simple GridView and Steps",
          style: context.textTheme.labelMedium?.copyWith(
            color: AppColors.white,
            fontSize: 20.0,
          ),
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => c.isLoad()
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: CmnTextBtn(
                            onPressed: () {
                              Get.toNamed(Routes.STEP5_SCREEN);
                            },
                            label: "Step 5",
                            labelStyle: context.theme.textTheme.labelSmall
                                ?.copyWith(
                                    color: AppColors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600),
                            height: 54.0,
                            borderRadius: BorderRadius.circular(6.0),
                            backgroundColor:
                                context.theme.primaryColor.withOpacity(0.8),
                          ),
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Expanded(
                          child: CmnTextBtn(
                            onPressed: () {
                              Get.toNamed(Routes.STEP6_SCREEN);
                            },
                            label: "Step 6",
                            labelStyle: context.theme.textTheme.labelSmall
                                ?.copyWith(
                                    color: AppColors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600),
                            height: 54.0,
                            borderRadius: BorderRadius.circular(6.0),
                            backgroundColor:
                                context.theme.primaryColor.withOpacity(0.8),
                          ),
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Expanded(
                          child: CmnTextBtn(
                            onPressed: () {
                              Get.toNamed(Routes.STEP7_SCREEN);
                            },
                            label: "Step 7",
                            labelStyle: context.theme.textTheme.labelSmall
                                ?.copyWith(
                                    color: AppColors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600),
                            height: 54.0,
                            borderRadius: BorderRadius.circular(6.0),
                            backgroundColor:
                                context.theme.primaryColor.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: c.numberModel.value!.n,crossAxisSpacing: 10.0,mainAxisSpacing: 10.0),
                        itemCount: c.charModel.length,
                        itemBuilder: (context, index) {
                          return ColoredBox(
                            color: AppColors.greyClr.withOpacity(
                              0.2,
                            ),
                            child: Center(
                              child: Text(
                                c.charModel[index].character,
                                style: context.textTheme.labelMedium,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ).paddingAll(20.0),
        ),
      ),
    );
  }
}
