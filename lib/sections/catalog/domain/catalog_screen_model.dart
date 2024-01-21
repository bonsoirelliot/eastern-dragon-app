import 'package:eastern_dragon/common/domain/services/request_helper.dart';
import 'package:eastern_dragon/sections/catalog/data/catalog_section_model.dart';
import 'package:eastern_dragon/sections/catalog/domain/test_catalog_sections.dart';
import 'package:elementary/elementary.dart';

class CatalogScreenModel extends ElementaryModel {
  CatalogScreenModel({
    required this.requestHelper,
  }) : super();

  final RequestHelper requestHelper;

  Future<List<CatalogSectionModel>> loadCatalog() async {
    await Future.delayed(const Duration(milliseconds: 400));

    final data = TestCatalogSections.sections;

    // TODO(Nikita): url
    // final data = await requestHelper.getListOfObjects(
    //   '*',
    //   CatalogSectionModel.fromJson,
    // );

    return data;
  }
}
