import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../style/app_colors.dart';

class CmnTextField extends StatelessWidget {
  CmnTextField({
    Key? key,
    this.hint = "",
    this.prefixIcon,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.minLines,
    this.contentPadding,
    this.style,
    this.validator,
    this.keyboardType,
    this.hintStyle,
    this.suffixText,
    this.maxLines,
    this.radius,
    this.textInputAction,
    this.fillColor,
    this.borderSide,
    this.underLineBorder,
    this.autovalidateMode,
    this.onTap,
    this.maxNumber,
    this.onChanged,
    this.constraints,
    this.textInputFormater,
    this.readOnly = false,
    required this.controller,
    this.obscureText = false,
    this.autofocus = false,
    FocusNode? focusNode,
    this.cursorColor,
  }) : super(key: key);
  final String hint;
  final bool autofocus;
  FocusNode? focusNode;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final void Function(String)? onFieldSubmitted;
  final Widget? suffixIcon;
  bool readOnly;
  TextInputType? keyboardType;
  TextStyle? style;
  AutovalidateMode? autovalidateMode;
  Color? fillColor,cursorColor;
  String? suffixText;
  TextStyle? hintStyle;
  TextInputAction? textInputAction;
  String? Function(String?)? validator;
  void Function()? onTap;
  void Function(String)? onChanged;
  BoxConstraints? constraints;
  int? maxNumber;
  List<TextInputFormatter>? textInputFormater;

  // final TextAlign Alignment;
  final bool obscureText;
  int? minLines;
  int? maxLines = 1;
  EdgeInsetsGeometry? contentPadding;

  BorderSide? borderSide;
  UnderlineInputBorder? underLineBorder;
  double? radius;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      style: style,
      controller: controller,
      validator: validator,
      inputFormatters: textInputFormater,
      maxLength: maxNumber,
      obscureText: obscureText,
      minLines: minLines,
      maxLines: maxLines ?? 1,
      autofocus: autofocus,
      focusNode: focusNode,
      readOnly: readOnly ?? false,
      onFieldSubmitted: onFieldSubmitted,
      autovalidateMode:
      autovalidateMode ?? AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      cursorColor: cursorColor ?? context.theme.primaryColor,
      decoration: InputDecoration(
        constraints: constraints,
        disabledBorder:underLineBorder?? border,
        errorBorder:underLineBorder?? border,
        focusedErrorBorder: underLineBorder??border,
        enabledBorder:underLineBorder?? border,
        suffixText: suffixText,
        focusedBorder: underLineBorder??border,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        border: border,
        fillColor: fillColor ?? AppColors.white,
        filled: true,
        hintText: hint ?? "",
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorStyle: context.theme.textTheme.labelSmall?.copyWith(
          color: AppColors.redClr,
          fontSize: 14.0,
          fontWeight: FontWeight.w400
        ),
        hintStyle: hintStyle ??
            context.theme.textTheme.titleSmall?.copyWith(color: AppColors.greyClr),
      ),
      textAlign: TextAlign.start,
    );
  }

  OutlineInputBorder get border {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(radius ?? 15),
      ),
      borderSide:
      borderSide ?? BorderSide(color: AppColors.transparent, width: 0.0),
    );
  }



}