import 'package:flutter/material.dart';
import 'package:gloria_test_case/core/extension/index.dart';
import 'package:gloria_test_case/feature/home/provider/activity_provider.dart';
import 'package:gloria_test_case/util/widget/search_bar.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/index.dart';
import '../../../util/widget/activity_card.dart';

class ActivityView extends StatefulWidget {
  const ActivityView({super.key});

  @override
  State<ActivityView> createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView> {
  @override
  void initState() {
    super.initState();
    context.read<ActivityProvider>().fetchAllActivity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'E V E N T S',
            style: context.textTheme.bodyLarge,
          ),
          centerTitle: true,
        ),
        body: Consumer<ActivityProvider>(
          builder: (context, value, child) {
            return Column(
              children: [
                Padding(
                  padding: const AppPadding.allHigh(),
                  child: AppSearchBar(
                    hintText: 'Search Events',
                    onChanged: (val) => value.searchEvents(val),
                  ),
                ),
                value.isLoading
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : Expanded(
                        child: ListView.separated(
                          padding: const AppPadding.allHigh(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => SizedBox(
                            height: context.height * 0.02,
                          ),
                          itemCount: value.filterEvents.length,
                          itemBuilder: (BuildContext context, int index) {
                            final activity = value.filterEvents[index];
                            return ActivityCard(activityModel: activity);
                          },
                        ),
                      )
              ],
            );
          },
        ));
  }
}
