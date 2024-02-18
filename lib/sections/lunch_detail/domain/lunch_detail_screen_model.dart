import 'package:eastern_dragon/common/domain/services/request_helper.dart';
import 'package:eastern_dragon/sections/lunch_detail/data/lunch_detail_model.dart';
import 'package:elementary/elementary.dart';

class LunchDetailScreenModel extends ElementaryModel {
  LunchDetailScreenModel({required this.requestHelper}) : super();

  final RequestHelper requestHelper;

  Future<LunchDetailModel> loadData(int id) async {
    final data = await requestHelper.getObject(
      '/catalog/dinner/$id',
      LunchDetailModel.fromJson,
    );

    return data;
  }
}
