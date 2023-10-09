import 'package:eastern_dragon/common/domain/help/help_functions.dart';

class MinimumValidator implements IValidator {
  final int minimum;
  const MinimumValidator({this.minimum = 2});

  @override
  String? validate(String value) {
    return value.isEmpty
        ? 'Это поле должно быть заполнено'
        : value.length < minimum
            ? 'Это поле должно содержать минимум $minimum ${HelpFunctions.wordByCount(
                minimum,
                [
                  'символов',
                  'символ',
                  'символа',
                ],
              )}'
            : null;
  }
}

/// Валидатор для телефона (проверяет просто по длине)
class PhoneValidator implements IValidator {
  const PhoneValidator();

  @override
  String? validate(String value) {
    final errorText = LengthValidator(
      (length) => length == 18,
    ).validate(value);

    return value.isEmpty
        ? 'Это поле должно быть заполнено'
        : errorText == null
            ? null
            : 'Неверный формат номера';
  }
}

/// Валидатор для телефона (проверяет просто по длине)
class PhoneValidatorOptional implements IValidator {
  const PhoneValidatorOptional();

  @override
  String? validate(String value) {
    final errorText =
        !(value.length > 4 && value.length < 18) ? null : 'Неверная длинна';

    return errorText == null ? null : 'Неверный формат номера';
  }
}

/// Валидатор для дня рождения  (проверяет просто по длине)
class BirthdayValidator implements IValidator {
  const BirthdayValidator();

  @override
  String? validate(String value) {
    final errorText = LengthValidator(
      (length) => length == 10,
    ).validate(value);

    return value.isEmpty
        ? 'Это поле должно быть заполнено'
        : errorText == null
            ? null
            : 'Неверный формат даты';
  }
}

/// Валидатор длины
class LengthValidator implements IValidator {
  final bool Function(int length) predicate;
  const LengthValidator(
    this.predicate,
  );

  @override
  String? validate(String value) {
    final valid = predicate(value.length);

    return value.isEmpty
        ? 'Это поле должно быть заполнено'
        : valid
            ? null
            : 'Неверная длина';
  }
}

/// Валидатор с предикатом
class PredicateValidator implements IValidator {
  final String? Function(String value) predicate;
  final String errorText;
  const PredicateValidator(
    this.predicate, {
    this.errorText = 'Неверная длина',
  });

  @override
  String? validate(String value) {
    final errorText = predicate(value);

    return value.isEmpty ? 'Это поле должно быть заполнено' : errorText;
  }
}

/// Валидатор для емейла
class EmailValidator implements IValidator {
  const EmailValidator();

  @override
  String? validate(String value) {
    final errorText = RegexValidator(
      regexp: RegExp(r'\S+@\S+\.\S+'),
    ).validate(value);

    return value.isEmpty
        ? 'Это поле должно быть заполнено'
        : errorText != null
            ? 'Неверный формат e-mail'
            : null;
  }
}

/// Валидатор для емейла
class EmailValidatorOptional implements IValidator {
  const EmailValidatorOptional();

  @override
  String? validate(String value) {
    final isValid =
        value.isEmpty ? true : RegExp(r'\S+@\S+\.\S+').hasMatch(value);

    return isValid == false ? 'Неверный формат e-mail' : null;
  }
}

/// Валидатор, который проверяет по регулярному выражению
class RegexValidator implements IValidator {
  final RegExp regexp;
  const RegexValidator({
    required this.regexp,
  });

  @override
  String? validate(String value) {
    final valid = regexp.hasMatch(value);

    return value.isEmpty
        ? 'Это поле должно быть заполнено'
        : valid
            ? null
            : 'Некорректные данные';
  }
}

/// Пустой валидатор
class NoneValidator implements IValidator {
  const NoneValidator();

  @override
  String? validate(String value) {
    return null;
  }
}

/// Интерфейс валидатора
// ignore: one_member_abstracts
abstract class IValidator {
  String? validate(String value);
}
