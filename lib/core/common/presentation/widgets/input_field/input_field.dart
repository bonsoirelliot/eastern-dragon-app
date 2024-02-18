import 'package:eastern_dragon/core/const/theme/app_colors.dart';
import 'package:eastern_dragon/core/const/theme/styles.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  const InputField({
    this.controller,
    this.hintText,
    this.keyboardType,
    this.focusNode,
    this.suffixIcon,
    super.key,
  });

  final TextEditingController? controller;

  final String? hintText;

  final TextInputType? keyboardType;

  final FocusNode? focusNode;

  final Widget? suffixIcon;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late final _focusNode = widget.focusNode ?? FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFieldTapRegion(
      onTapOutside: (_) => _focusNode.unfocus(),
      child: GestureDetector(
        onTap: () => _focusNode.requestFocus(),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.gray,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 11, 16, 13),
            child: TextFormField(
              focusNode: _focusNode,
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              style: AppStyles.body,
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                hintStyle: AppStyles.body.copyWith(
                  color: Colors.white.withOpacity(.5),
                ),
                hintText: widget.hintText,
                suffixIcon: widget.suffixIcon,
                suffixIconConstraints: const BoxConstraints(
                  maxHeight: 16,
                  minHeight: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
