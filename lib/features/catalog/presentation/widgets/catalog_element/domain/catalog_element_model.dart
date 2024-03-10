import 'package:eastern_dragon/core/common/domain/services/request_helper.dart';
import 'package:eastern_dragon/features/catalog/data/catalog_item_model.dart';
import 'package:eastern_dragon/features/lunch_detail/data/lunch_detail_model.dart';
import 'package:elementary/elementary.dart';

class CatalogElementModel extends ElementaryModel {
  CatalogElementModel({required this.requestHelper}) : super();

  final RequestHelper requestHelper;

  Future<LunchDetailModel> loadLunch(int id) async {
    final data = await requestHelper.getObject(
      '/catalog/dinner/$id',
      LunchDetailModel.fromJson,
    );

    return data;
  }

  Future<CatalogItemModel> loadProduct(int id) async {
    final data = await requestHelper.getObject(
      '/catalog/$id',
      CatalogItemModel.fromJson,
    );

    return data;
  }
}
