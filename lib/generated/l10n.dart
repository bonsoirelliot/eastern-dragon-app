// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Восточная столовая`
  String get app_name {
    return Intl.message(
      'Восточная столовая',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Авторизация`
  String get authorization {
    return Intl.message(
      'Авторизация',
      name: 'authorization',
      desc: '',
      args: [],
    );
  }

  /// `Имя`
  String get name {
    return Intl.message(
      'Имя',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Как к Вам обращаться?`
  String get nameTitle {
    return Intl.message(
      'Как к Вам обращаться?',
      name: 'nameTitle',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get email {
    return Intl.message(
      'E-mail',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Верификация аккаунта`
  String get account_verification {
    return Intl.message(
      'Верификация аккаунта',
      name: 'account_verification',
      desc: '',
      args: [],
    );
  }

  /// `Введите 6-значный код из письма которое пришло вам на почту`
  String get enter_email_code_title {
    return Intl.message(
      'Введите 6-значный код из письма которое пришло вам на почту',
      name: 'enter_email_code_title',
      desc: '',
      args: [],
    );
  }

  /// `Продолжить`
  String get continue_title {
    return Intl.message(
      'Продолжить',
      name: 'continue_title',
      desc: '',
      args: [],
    );
  }

  /// `Заказы`
  String get orders {
    return Intl.message(
      'Заказы',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `Профиль`
  String get profile {
    return Intl.message(
      'Профиль',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Уведомления`
  String get notifications {
    return Intl.message(
      'Уведомления',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `О приложении`
  String get about {
    return Intl.message(
      'О приложении',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Выйти`
  String get exit {
    return Intl.message(
      'Выйти',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `Выберите опции`
  String get choose_options {
    return Intl.message(
      'Выберите опции',
      name: 'choose_options',
      desc: '',
      args: [],
    );
  }

  /// `Добавить`
  String get add_to_cart {
    return Intl.message(
      'Добавить',
      name: 'add_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `В корзину`
  String get to_cart {
    return Intl.message(
      'В корзину',
      name: 'to_cart',
      desc: '',
      args: [],
    );
  }

  /// `Корзина`
  String get cart {
    return Intl.message(
      'Корзина',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Перейти к оплате`
  String get go_to_payment {
    return Intl.message(
      'Перейти к оплате',
      name: 'go_to_payment',
      desc: '',
      args: [],
    );
  }

  /// `Обновить`
  String get reload {
    return Intl.message(
      'Обновить',
      name: 'reload',
      desc: '',
      args: [],
    );
  }

  /// `На вынос`
  String get to_go {
    return Intl.message(
      'На вынос',
      name: 'to_go',
      desc: '',
      args: [],
    );
  }

  /// `Куда`
  String get where {
    return Intl.message(
      'Куда',
      name: 'where',
      desc: '',
      args: [],
    );
  }

  /// `payment`
  String get payment {
    return Intl.message(
      'payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
