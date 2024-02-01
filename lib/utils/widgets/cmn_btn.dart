import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../style/app_colors.dart';

class CmnTextBtn extends StatelessWidget {
  CmnTextBtn(
      {super.key,
        required this.onPressed,
        required this.label,
        this.backgroundColor,
        this.labelStyle,
        this.height,
        this.borderRadius,
        this.borderSide,
        this.textAlign,
        this.width,
        this.padding});

  EdgeInsetsGeometry? padding;
  void Function() onPressed;
  Color? backgroundColor;
  String label;
  TextStyle? labelStyle;
  BorderRadiusGeometry? borderRadius;
  BorderSide? borderSide;
  double? height;
  double? width;
  TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 35,
      width: width ?? null,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
              backgroundColor ?? AppColors.transparent),
          padding: MaterialStatePropertyAll(padding),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(8),
              side: borderSide ??
                  const BorderSide(width: 2, color: AppColors.transparent),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          textAlign: textAlign,
          style: labelStyle ?? context.textTheme.labelSmall?.copyWith(fontSize: 14,fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

class AppElivatedButton extends StatelessWidget {
  const AppElivatedButton({
    Key? key,
    required this.onPressed,
    this.height,
    this.border,
    this.title = "",
    this.style,
    required this.color,
    this.loaderColor,
    this.borderRadius,
    this.elevation,
    this.padding,
    this.TextColor,
    this.width,
    this.isLoading = false,
  }) : super(key: key);
  final void Function() onPressed;
  final String title;
  final Color color;
  final Color? loaderColor;
  final Color? TextColor;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final double? elevation;
  final BorderSide? border;
  final BorderRadius? borderRadius;
  final TextStyle? style;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          padding: padding ??
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          shape: RoundedRectangleBorder(
            side:
            border ?? const BorderSide(width: 0, color: Colors.transparent),
            borderRadius: borderRadius ?? BorderRadius.circular(15),
          ),
          backgroundColor: color,
          fixedSize: Size(width ?? double.infinity, height ?? 55),
        ),
        child: isLoading
            ? CupertinoActivityIndicator(
          animating: true,
          radius: 11,
          color: loaderColor ?? AppColors.primary,
        )
            : Text(
          title,
          style: style ??
              Get.textTheme.titleLarge
                  ?.copyWith(color: TextColor ?? AppColors.white),
        ),
      ),
    );
  }
}

class AppRoundButton extends StatelessWidget {
  AppRoundButton(
      {super.key,
        required this.onPressed,
        this.shape,
        this.backgroundColor,
        this.style,
        this.child,
        this.Iconsize,
        this.color,
        this.width,
        this.height,
        this.icon,
        this.padding});

  final void Function() onPressed;
  OutlinedBorder? shape;
  EdgeInsetsGeometry? padding;
  Color? backgroundColor;
  ButtonStyle? style;
  String? icon;
  Widget? child;
  double? Iconsize;
  double? height;
  double? width;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? 50,
      child: IconButton(
        style: style ??
            ElevatedButton.styleFrom(
              elevation: 0,
              padding: padding ?? const EdgeInsets.all(12),
              shape: shape ??
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
              backgroundColor:
              backgroundColor ?? AppColors.white.withOpacity(0.1),
            ),
        onPressed: onPressed,
        icon: child ?? Image.asset(icon!, scale: Iconsize??1.5),
      ),
    );
  }
}