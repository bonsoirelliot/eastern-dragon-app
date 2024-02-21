import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:eastern_dragon/core/common/presentation/widgets/buttons/round_close_icon_button.dart';
import 'package:eastern_dragon/core/const/static/static_data.dart';
import 'package:eastern_dragon/core/const/theme/app_colors.dart';
import 'package:eastern_dragon/core/const/theme/styles.dart';
import 'package:flutter/material.dart';

class BottomSheetShower {
  static showDefaultFlexibleBottomSheet(
    BuildContext context, {
    required Widget widget,
    Widget? bottomSheet,
  }) {
    showFlexibleBottomSheet(
      context: context,
      maxHeight: 1,
      initHeight: 1,
      isSafeArea: true,
      duration: const Duration(milliseconds: 200),
      anchors: [1],
      bottomSheetColor: AppColors.black,
      builder: (context, controller, f) => Stack(
        children: [
          CustomScrollView(
            controller: controller,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: StaticData.defaultSidePadding,
                ),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      widget,
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(
                StaticData.defaultSidePadding,
              ),
              child: RoundIconButton(
                onPressed: Navigator.of(context).pop,
              ),
            ),
          ),
          if (bottomSheet != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: bottomSheet,
            ),
        ],
      ),
    );
  }
}

class _BottomSheet extends StatelessWidget {
  const _BottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(StaticData.defaultCircularRadius),
          topRight: Radius.circular(StaticData.defaultCircularRadius),
        ),
        color: AppColors.gray,
      ),
      padding: const EdgeInsets.all(StaticData.defaultSidePadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Обед №1',
                style: AppStyles.body.copyWith(color: Colors.white),
              ),
              Text(
                '350 ₽',
                style: AppStyles.body.copyWith(color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '600 г',
            style: AppStyles.subtitle.copyWith(color: AppColors.lightGray),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              FilledButton(
                onPressed: () {},
                child: Text('data'),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FilledButton(
                  onPressed: () {},
                  child: Text('Выберите опции'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
