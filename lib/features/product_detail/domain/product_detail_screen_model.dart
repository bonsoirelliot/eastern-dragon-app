import 'package:eastern_dragon/core/common/domain/services/request_helper.dart';
import 'package:eastern_dragon/features/catalog/data/catalog_item_model.dart';
import 'package:elementary/elementary.dart';

class ProductDetailScreenModel extends ElementaryModel {
  ProductDetailScreenModel({
    required this.requestHelper,
  }) : super();

  final RequestHelper requestHelper;

  Future<CatalogItemModel> loadData(int id) async {
    final data = await requestHelper.getObject(
      '/catalog/$id',
      CatalogItemModel.fromJson,
    );

    return data;
  }
}
