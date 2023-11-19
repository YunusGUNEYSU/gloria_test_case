import 'package:flutter/material.dart';
import 'package:gloria_test_case/core/constants/index.dart';
import 'package:gloria_test_case/core/extension/index.dart';
import 'package:gloria_test_case/feature/home/model/activity.dart';
import 'package:gloria_test_case/util/widget/activity_card.dart';

final class HomeDetail extends StatelessWidget {
  const HomeDetail({super.key, required this.title, required this.activityList});
  final String title;
  final List<ActivityModel> activityList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title.split('').join(' ').toUpperCase(),
          style: context.textTheme.bodyLarge,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: context.height * 0.05,
          ),
          Expanded(
            child: ListView.separated(
              padding: const AppPadding.allHigh(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => SizedBox(
                height: context.height * 0.02,
              ),
              itemCount: activityList.length,
              itemBuilder: (BuildContext context, int index) {
                final activity = activityList[index];
                return ActivityCard(activityModel: activity);
              },
            ),
          )
        ],
      ),
    );
  }
}
