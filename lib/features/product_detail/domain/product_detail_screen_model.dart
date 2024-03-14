import 'package:eastern_dragon/core/common/domain/services/request_helper.dart';
import 'package:elementary/elementary.dart';

class ProductDetailScreenModel extends ElementaryModel {
  ProductDetailScreenModel({
    required this.requestHelper,
  }) : super();

  final RequestHelper requestHelper;
}
