import 'package:eastern_dragon/core/common/domain/services/request_helper.dart';
import 'package:eastern_dragon/core/const/static/rest_constants.dart';
import 'package:eastern_dragon/features/catalog/data/catalog_section_model.dart';
import 'package:elementary/elementary.dart';

class CatalogScreenModel extends ElementaryModel {
  CatalogScreenModel({
    required this.requestHelper,
  }) : super();

  final RequestHelper requestHelper;

  Future<List<CatalogSectionModel>> loadCatalog() async {
    await Future.delayed(const Duration(milliseconds: 400));

    final data = await requestHelper.getListOfObjects(
      RestConstants.catalog,
      fromJson: CatalogSectionModel.fromJson,
    );

    return data;
  }
}
