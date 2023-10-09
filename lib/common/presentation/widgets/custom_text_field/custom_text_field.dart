// ignore_for_file: unused_local_variable, prefer_function_declarations_over_variables

import 'dart:io';

import 'package:eastern_dragon/common/presentation/widgets/custom_text_field/custom_text_field_wm.dart';
import 'package:eastern_dragon/common/presentation/widgets/custom_text_field/validators.dart';
import 'package:eastern_dragon/const/theme/app_colors.dart';
import 'package:eastern_dragon/const/theme/styles.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends ElementaryWidget<ICustomTextFieldWM> {
  CustomTextField({
    this.controller,
    this.label,
    this.hintText,
    this.suffixText,
    this.textInputAction = TextInputAction.next,
    this.keyboardType,
    this.onFieldSubmitted,
    this.onFieldChanged,
    this.enableInteractiveSelection,
    this.maxLines = 1,
    this.height = 46,
    this.maxLength,
    this.backgroundColor = AppColors.gray,
    this.hintTextStyle,
    this.labelTextStyle,
    this.prefixWidget,
    this.isRequired = false,
    this.focusNode,
    this.inputFormatters,
    this.wm,
    this.alertWidth,
    this.errorText,
    this.validator,
    this.textCapitalization = TextCapitalization.sentences,
    this.enabled = true,
    this.suffix,
    this.autofocus = false,
    this.readOnly = false,
    this.obscureText = false,
    this.onTap,
    this.onTapOutside,
    Key? key,
  }) : super(
          (context) {
            return wm ??
                CustomTextFieldWM(
                  controller: controller,
                  focusNode: focusNode,
                  validator: validator,
                );
          },
          key: key,
        );

  /// Контроллер поля
  final TextEditingController? controller;

  /// Текст над полем
  final String? label;

  /// Стиль текста над поленм
  final TextStyle? labelTextStyle;

  /// Текст плейсхолдера
  final String? hintText;
  final String? suffixText;
  final Widget? suffix;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onFieldChanged;
  final bool? enableInteractiveSelection;
  final int maxLines;
  final int? maxLength;
  final double? alertWidth;

  final String? errorText;

  /// Стандартная высота инпута
  final double? height;

  /// Цвет бэкграунда
  final Color backgroundColor;

  /// Стиль текста для плейсхолдера
  final TextStyle? hintTextStyle;

  /// Виджет перед TextField
  final Widget? prefixWidget;

  /// Обязательное (нужен для отображения звездочки рядом с [label])
  final bool isRequired;

  /// Фокус
  final FocusNode? focusNode;

  /// Список форматеров
  final List<TextInputFormatter>? inputFormatters;

  final TextCapitalization textCapitalization;

  ///
  final CustomTextFieldWM? wm;

  final bool enabled;

  final bool autofocus;
  final bool obscureText;

  final bool readOnly;
  final VoidCallback? onTap;

  final void Function(PointerDownEvent event)? onTapOutside;

  /// Отвечает за валидацию
  ///
  /// errorText внутри него должен быть
  ///
  /// Либо реализуешь IValidator, либо используешь готовые
  final IValidator? validator;

  @override
  Widget build(ICustomTextFieldWM wm) {
    return DoubleSourceBuilder<bool, String?>(
      firstSource: wm.hasFocusListenable,
      secondSource: wm.errorTextListenable,
      builder: (context, hasFocusNullable, errorText) {
        // final hasFocus = hasFocusNullable!;
        final hasError = errorText?.isNotEmpty ?? false;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (label?.isNotEmpty ?? false)
              Padding(
                padding: const EdgeInsets.only(bottom: 4, left: 10, right: 10),
                child: Row(
                  children: [
                    Text(
                      label!,
                      style: AppStyles.caption.copyWith(
                          color: hasError ? AppColors.red : AppColors.gray),
                    ),
                    if (isRequired)
                      const Text(
                        ' *',
                        style: AppStyles.caption,
                      ),
                  ],
                ),
              ),
            GestureDetector(
              onTap: () {
                wm.focusNode.requestFocus();
                onTap?.call();
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: SizedBox(
                  height: height,
                  width: alertWidth,
                  child: LayoutBuilder(builder: (_, c) {
                    return SizedBox(
                      height: height,
                      width: c.maxWidth,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (prefixWidget != null) prefixWidget!,
                          Expanded(
                            child: Platform.isIOS
                                ? enabled
                                    ? CupertinoTextField.borderless(
                                        onTapOutside: (event) {
                                          if (onTapOutside == null) {
                                            _defaultTapOutSide(
                                              event,
                                              context,
                                            );
                                          } else {
                                            onTapOutside!(event);
                                          }
                                        },
                                        inputFormatters: inputFormatters,
                                        cursorRadius: Radius.zero,
                                        cursorWidth: 1,
                                        suffix: suffix,
                                        readOnly: readOnly,
                                        autofocus: autofocus,
                                        controller: controller,
                                        // decoration: const BoxDecoration(
                                        //   color: Colors.black,

                                        // ),
                                        maxLines: maxLines,
                                        keyboardType: keyboardType,
                                        textInputAction: textInputAction,
                                        style: AppStyles.body,
                                        cursorColor: Colors.black,
                                        onSubmitted: onFieldSubmitted,
                                        focusNode: focusNode,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 16,
                                        ),
                                        obscureText: obscureText,
                                        placeholder: hintText,
                                        enabled: true,
                                        textCapitalization: textCapitalization,
                                      )
                                    : IgnorePointer(
                                        ignoring: true,
                                        child: CupertinoTextField.borderless(
                                          onTapOutside: (event) {
                                            if (onTapOutside == null) {
                                              _defaultTapOutSide(
                                                  event, context);
                                            } else {
                                              onTapOutside!(event);
                                            }
                                          },
                                          inputFormatters: inputFormatters,
                                          cursorRadius: Radius.zero,
                                          cursorWidth: 1,
                                          suffix: suffix,
                                          readOnly: readOnly,
                                          controller: controller,
                                          decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          maxLines: maxLines,
                                          keyboardType: keyboardType,
                                          textInputAction: textInputAction,
                                          style: AppStyles.caption,
                                          cursorColor: Colors.black,
                                          onSubmitted: onFieldSubmitted,
                                          focusNode: focusNode,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 16,
                                          ),
                                          obscureText: obscureText,
                                          placeholder: hintText,
                                          enabled: true,
                                          textCapitalization:
                                              textCapitalization,
                                        ),
                                      )
                                : TextFormField(
                                    onTapOutside: (event) {
                                      if (onTapOutside == null) {
                                        _defaultTapOutSide(
                                          event,
                                          context,
                                        );
                                      } else {
                                        onTapOutside!(event);
                                      }
                                    },
                                    onTap: onTap,
                                    autofocus: autofocus,
                                    obscureText: obscureText,
                                    enabled: enabled,
                                    inputFormatters: inputFormatters,
                                    focusNode: wm.focusNode,
                                    controller: wm.controller,
                                    textInputAction: textInputAction,
                                    keyboardType: keyboardType,
                                    style: AppStyles.body,
                                    enableInteractiveSelection:
                                        enableInteractiveSelection,
                                    onFieldSubmitted: onFieldSubmitted,
                                    onChanged: onFieldChanged,
                                    obscuringCharacter: '•',
                                    maxLines: maxLines,
                                    maxLength: maxLength,
                                    textCapitalization: textCapitalization,
                                    readOnly: readOnly,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                    autocorrect: false,
                                    smartQuotesType: SmartQuotesType.disabled,
                                    smartDashesType: SmartDashesType.disabled,
                                    enableIMEPersonalizedLearning: false,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    decoration: InputDecoration(
                                      suffix: suffix,
                                      suffixText: suffixText,
                                      hintText: hintText,
                                      hintStyle: hintTextStyle ??
                                          AppStyles.body.copyWith(
                                            color: Colors.white,
                                          ),
                                      isDense: true,
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.zero,
                                      counterText: '',
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
            if (hasError)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  errorText!,
                  style: AppStyles.caption.copyWith(
                    color: AppColors.red,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

final _defaultTapOutSide = (PointerDownEvent event, BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
};
