import 'package:eastern_dragon/core/common/domain/services/request_helper.dart';
import 'package:eastern_dragon/core/const/static/rest_constants.dart';
import 'package:eastern_dragon/features/catalog/data/catalog_item_model.dart';
import 'package:eastern_dragon/features/lunch_detail/data/lunch_detail_model.dart';
import 'package:elementary/elementary.dart';

class CatalogElementModel extends ElementaryModel {
  CatalogElementModel({required this.requestHelper}) : super();

  final RequestHelper requestHelper;

  Future<LunchDetailModel> loadLunch(int id) async {
    final data = await requestHelper.getObject(
      '${RestConstants.lunchDetail}$id',
      fromJson: LunchDetailModel.fromJson,
    );

    return data;
  }

  Future<CatalogItemModel> loadProduct(int id) async {
    final data = await requestHelper.getObject(
      '${RestConstants.productDetail}$id',
      fromJson: CatalogItemModel.fromJson,
    );

    return data;
  }
}
