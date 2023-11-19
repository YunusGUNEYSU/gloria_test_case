import 'package:flutter/material.dart';
import 'package:gloria_test_case/core/extension/date.dart';
import 'package:gloria_test_case/core/extension/index.dart';
import 'package:gloria_test_case/feature/home/model/activity.dart';
import 'package:gloria_test_case/util/widget/card_template.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key, required this.activityModel});
  final ActivityModel activityModel;

  @override
  Widget build(BuildContext context) {
    return CardTemplate(
        child: SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                activityModel.activityName,
                style: context.textTheme.headlineSmall,
              ),
              Text(
                activityModel.placeName ?? '',
                style: context.textTheme.bodyLarge,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Capacity',
                    style: context.textTheme.titleMedium,
                  ),
                  Text(
                    activityModel.capacity.toString(),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Category',
                    style: context.textTheme.titleMedium,
                  ),
                  Text(
                    activityModel.acitivityType,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Event Date',
                    style: context.textTheme.titleMedium,
                  ),
                  Text(
                    activityModel.activityDate.convertYMD,
                  )
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
