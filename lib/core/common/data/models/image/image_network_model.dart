import 'package:eastern_dragon/core/common/data/exceptions/response_parse_exception.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_network_model.g.dart';

@JsonSerializable(createToJson: false)
class ImageNetworkModel {
  final String src;

  final double? width;

  final double? height;

  ImageNetworkModel({
    required this.src,
    this.height,
    this.width,
  });

  factory ImageNetworkModel.fromJson(Map<String, dynamic> json) {
    try {
      return _$ImageNetworkModelFromJson(json);
    } on Object catch (e) {
      throw ResponseParseException('ImageNetworkModel: $e');
    }
  }
}
