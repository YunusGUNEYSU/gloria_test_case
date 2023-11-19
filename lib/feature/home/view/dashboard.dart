import 'package:flutter/material.dart';
import 'package:gloria_test_case/core/constants/index.dart';
import 'package:gloria_test_case/core/extension/index.dart';
import 'package:gloria_test_case/feature/home/model/place.dart';
import 'package:gloria_test_case/feature/home/provider/dashboard_provider.dart';
import 'package:gloria_test_case/feature/home/provider/home_provider.dart';
import 'package:gloria_test_case/feature/home/view/dashboard_mixin.dart';
import 'package:gloria_test_case/util/widget/date_card.dart';
import 'package:gloria_test_case/util/widget/drop_down_menu.dart';
import 'package:gloria_test_case/util/widget/graph_chart.dart';
import 'package:provider/provider.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({super.key});

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> with DashBoardMixin {
  @override
  Widget build(BuildContext context) {
    final homeProvider = context.read<HomeProvider>();
    return Consumer<DashBoardProvider>(
      builder: (context, value, child) {
        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      spacing: 15,
                      children: List.generate(value.dateFilter.length, (index) {
                        final selectDate = value.dateFilter[index];
                        return ChoiceChip(
                            label: Text(selectDate.dateName),
                            selected: value.selectedIndex == index,
                            onSelected: (val) async {
                              value.selectChip(val, index);
                              await value.selectedDate(selectDate);
                            });
                      }),
                    ),
                    SizedBox(
                      width: context.width * 0.03,
                    ),
                    Text(
                      'Or specific interval...',
                      style: context.textTheme.bodyLarge,
                    ),
                    SizedBox(
                      width: context.width * 0.03,
                    ),
                    IconButton.filledTonal(
                      onPressed: () async {
                        await value.showDateRange(context);
                      },
                      icon: const Icon(
                        Icons.calendar_month_outlined,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: context.width * 0.01,
                    ),
                    value.dateTimeRange != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              DateCard(dateTime: value.dateTimeRange?.start),
                              Padding(
                                padding: const AppPadding.allNormal(),
                                child: DateCard(dateTime: value.dateTimeRange?.end),
                              )
                            ],
                          )
                        : const SizedBox.shrink()
                  ],
                ),
                SizedBox(
                  height: context.height * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppDropDownMenu(
                        menuController: menuTextController,
                        labelText: 'Please select place...',
                        dropdownMenuEntries:
                            homeProvider.places!.map<DropdownMenuEntry<PlaceModel>>((val) {
                          return DropdownMenuEntry(
                            value: val,
                            label: val.placeName,
                          );
                        }).toList(),
                        onSelected: (val) {
                          if (val == null) return;

                          value.setPlaceName(val.placeId);
                        }),
                    Row(
                      children: [
                        Text(
                          'View Logs',
                          style: context.textTheme.bodyLarge,
                        ),
                        SizedBox(
                          width: context.width * 0.01,
                        ),
                        IconButton.filledTonal(
                          onPressed: () async {
                            if (menuTextController.text.isNotEmpty) {
                              await value.fetchDataControl();
                              value.changeGraphY();
                            }
                            value.checkSelect(menuTextController.text);
                          },
                          icon: const Icon(Icons.manage_search_outlined, size: 30),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: context.height * 0.1,
                ),
                value.peopleList.isNotEmpty
                    ? GraphChart(
                        counts: value.graphY,
                        peopleCounts: value.peopleList,
                      )
                    : Container(
                        height: context.height * .4,
                        width: context.width * .4,
                        decoration: BoxDecoration(
                            border: value.isNoSelect
                                ? Border.all(width: 3, color: context.colorSheme.error)
                                : null,
                            borderRadius: AppRadius.circular(),
                            color: context.colorSheme.secondary),
                        child: Center(
                          child: Text(
                            'Please select filters',
                            style: context.textTheme.headlineMedium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
              ],
            ),
          ),
        );
      },
    );
  }
}
