import 'package:eastern_dragon/common/presentation/widgets/custom_text_field/custom_text_field.dart';
import 'package:eastern_dragon/common/presentation/widgets/custom_text_field/validators.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';

abstract class ICustomTextFieldWM implements IWidgetModel {
  TextEditingController get controller;
  FocusNode get focusNode;

  /// Фокус
  ListenableState<bool> get hasFocusListenable;

  /// Текст ошибки
  ListenableState<String?> get errorTextListenable;
}

class CustomTextFieldWM
    extends WidgetModel<CustomTextField, _CustomTextFieldModel>
    implements ICustomTextFieldWM {
  CustomTextFieldWM({
    TextEditingController? controller,
    FocusNode? focusNode,
    IValidator? validator,
  }) : super(_CustomTextFieldModel()) {
    _controller = controller;
    _focusNode = focusNode;
    _validator = validator;
  }

  /// Валидатор для поля
  IValidator? _validator;

  /// Контроллер поля
  TextEditingController? _controller;

  /// Фокус поля
  FocusNode? _focusNode;

  /// Фокус
  final _hasFocusState = StateNotifier<bool>(initValue: false);
  @override
  ListenableState<bool> get hasFocusListenable => _hasFocusState;

  /// Текст ошибки
  final _errorTextState = StateNotifier<String?>();
  @override
  ListenableState<String?> get errorTextListenable => _errorTextState;

  @override
  TextEditingController get controller => _controller!;
  @override
  FocusNode get focusNode => _focusNode!;

  bool get hasFocus => _hasFocusState.value!;
  String get text => _controller!.text;

  @override
  void didUpdateWidget(CustomTextField oldWidget) {
    if (oldWidget.errorText != widget.errorText) {
      _errorTextState.accept(widget.errorText);
    }
    super.didUpdateWidget(oldWidget);
  }

  String oldText = '';

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _controller ??= widget.controller ?? TextEditingController();
    _focusNode ??= widget.focusNode ?? FocusNode();
    _validator ??= widget.validator ?? const NoneValidator();

    _controller!.addListener(_controllerListener);
    _focusNode!.addListener(_focusNodeListener);
  }

  void _controllerListener() {
    if (!(oldText.isNotEmpty && text.isEmpty) && (oldText != text)) {
      if (_errorTextState.value != null) {
        _errorTextState.accept(null);
      }
    }

    oldText = text;
  }

  void _focusNodeListener() {
    // if (focusNode.hasFocus && !hasFocus) {
    //   _hasFocusState.accept(true);
    // }
    // if (!focusNode.hasFocus && hasFocus) {
    //   _hasFocusState.accept(false);
    // }
  }

  /// Метод, который надо вызывать при валидации извне
  bool validate({bool withUpdateErrorText = false}) {
    final errorText = _validator?.validate(controller.text);

    if (withUpdateErrorText) {
      _errorTextState.accept(errorText);
    }

    return errorText == null;
  }

  @override
  void dispose() {
    _controller?.removeListener(_controllerListener);
    _focusNode?.removeListener(_focusNodeListener);

    super.dispose();
  }
}

class _CustomTextFieldModel extends ElementaryModel {
  _CustomTextFieldModel() : super();
}
