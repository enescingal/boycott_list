// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

class NormalInputField extends StatefulWidget {
  const NormalInputField({
    required this.hintText,
    required this.controller,
    super.key,
    this.label,
    this.labelStyle,
    this.onChanged,
    this.onTap,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.prefixIcon,
    this.suffixIcon,
    this.hintStyle,
    this.style,
    this.errorText,
    this.cursorColor,
    this.keyboardType,
    this.textInputFormatter,
    this.validator,
    this.maxLines,
    this.isPassword = false,
    this.isEnable = true,
    this.autoFocus = false,
    this.textInputAction,
    this.contentPadding,
    this.suffixIconPadding,
    this.textAlign = TextAlign.start,
    this.borderColor,
    this.fillColor,
    this.borderRadius,
    this.focusNode,
  });

  final String? label;
  final TextStyle? labelStyle;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final ValueChanged<String>? onFieldSubmitted;
  final VoidCallback? onEditingComplete;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final String? errorText;
  final Color? cursorColor;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final List<TextInputFormatter>? textInputFormatter;
  final FormFieldValidator<String>? validator;
  final int? maxLines;
  final bool isPassword;
  final bool isEnable;
  final bool autoFocus;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? suffixIconPadding;
  final TextAlign textAlign;
  final Color? borderColor;
  final Color? fillColor;
  final BorderRadius? borderRadius;
  final FocusNode? focusNode;

  @override
  _DefaultInputFieldState createState() => _DefaultInputFieldState();
}

class _DefaultInputFieldState extends State<NormalInputField> {
  bool isLock = true;

  void _toggle() {
    if (widget.isEnable) {
      setState(() {
        isLock = !isLock;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return TextFormField(
      onTap: () {
        widget.onTap?.call();
      },
      textAlign: widget.textAlign,
      controller: widget.controller,
      textInputAction: widget.textInputAction ?? TextInputAction.next,
      cursorColor: widget.cursorColor ?? ColorName.black,
      validator: widget.validator,
      onChanged: widget.onChanged,
      autovalidateMode: AutovalidateMode.always,
      inputFormatters: widget.textInputFormatter,
      onEditingComplete: () {
        widget.onEditingComplete?.call();
      },
      obscureText: widget.isPassword == true ? isLock : false,
      keyboardType: widget.keyboardType,
      autofocus: widget.autoFocus,
      enabled: widget.isEnable,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onFieldSubmitted ??
          (value) {
            node.unfocus();
          },
      maxLines: widget.maxLines ?? 1,
      style: widget.style ?? context.general.textTheme.bodyMedium,
      decoration: _buildDecoration(),
    );
  }

  InputDecoration _buildDecoration() {
    return InputDecoration(
      contentPadding: widget.contentPadding ?? (context.padding.low + context.padding.horizontalLow),
      prefixIcon: widget.prefixIcon,
      suffixIcon: widget.isPassword
          ? IconButton(
              onPressed: _toggle,
              icon: isLock
                  ? const Icon(
                      Icons.visibility_off,
                      color: ColorName.black,
                    )
                  : const Icon(
                      Icons.visibility,
                      color: ColorName.black,
                    ),
            )
          : widget.suffixIcon != null
              ? Padding(
                  padding: widget.suffixIconPadding ?? EdgeInsets.zero,
                  child: widget.suffixIcon,
                )
              : null,
      filled: true,
      fillColor: widget.fillColor ?? ColorName.white,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: widget.borderColor ?? ColorName.green),
        gapPadding: 8,
        borderRadius: widget.borderRadius ?? context.border.lowBorderRadius,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: widget.borderColor ?? ColorName.green),
        gapPadding: 8,
        borderRadius: widget.borderRadius ?? context.border.lowBorderRadius,
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: widget.borderColor ?? ColorName.green),
        gapPadding: 8,
        borderRadius: widget.borderRadius ?? context.border.lowBorderRadius,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorName.red),
        gapPadding: 8,
        borderRadius: widget.borderRadius ?? context.border.lowBorderRadius,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorName.red),
        gapPadding: 8,
        borderRadius: widget.borderRadius ?? context.border.lowBorderRadius,
      ),
      errorMaxLines: 1,
      hintText: widget.hintText,
      hintStyle: widget.hintStyle ??
          context.general.textTheme.bodyMedium?.copyWith(
            color: ColorName.black.withOpacity(.6),
          ),
      labelText: widget.label,
      alignLabelWithHint: false,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      errorText: widget.errorText,
      labelStyle: widget.labelStyle ?? context.general.textTheme.labelMedium,
    );
  }

  @override
  void dispose() {
    // widget.controller.dispose();
    super.dispose();
  }
}
