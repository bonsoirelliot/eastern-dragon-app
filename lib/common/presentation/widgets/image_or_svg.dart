import 'package:cached_network_image/cached_network_image.dart';
import 'package:eastern_dragon/const/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';


// TODO(nikita): добавить заглушку
class ImageOrSvg extends StatelessWidget {
  const ImageOrSvg(
    this.image, {
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.placeholderHeight = 32,
    // this.placeholder = PlaceholderType.wideContainer,
    super.key,
  });

  final String? image;
  final BoxFit fit;

  final double? height;
  final double? width;

  final double placeholderHeight;

  final Alignment alignment;
  // final PlaceholderType placeholder;

  @override
  Widget build(BuildContext context) {
    return (image?.isNotEmpty ?? false)
        ? image!.endsWith('svg')
            ? SvgPicture.network(
                image!,
                height: height,
                width: width,
                fit: fit,
              )
            : CachedNetworkImage(
                imageUrl: image!,
                height: height,
                width: width,
                fit: fit,
                fadeInDuration: const Duration(milliseconds: 100),
                errorWidget: (_, __, ___) => Container(
                  height: height,
                  width: width,
                  color: AppColors.lightGray,
                ),
                placeholder: (_, __) => Shimmer.fromColors(
                  baseColor: AppColors.lightGray,
                  highlightColor: Colors.white,
                  child: const ColoredBox(
                    color: Colors.white,
                  ),
                ),
                alignment: alignment,
              )
        : Container(
            height: height,
            width: width,
            color: AppColors.lightGray,
          );
  }
}
