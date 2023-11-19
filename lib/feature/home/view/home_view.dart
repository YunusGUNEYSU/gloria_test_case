import 'package:flutter/material.dart';
import 'package:gloria_test_case/core/constants/index.dart';
import 'package:gloria_test_case/core/extension/index.dart';

import 'package:gloria_test_case/feature/home/provider/home_provider.dart';
import 'package:gloria_test_case/feature/home/view/dashboard.dart';

import 'package:gloria_test_case/feature/home/view/home_detail.dart';

import 'package:gloria_test_case/util/widget/drawer.dart';
import 'package:gloria_test_case/util/widget/place_card.dart';
import 'package:gloria_test_case/util/widget/search_bar.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().fetchPlace();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'W E L C O M E',
          style: context.textTheme.bodyLarge,
        ),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, value, child) {
          return value.isLoading
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
                  if (constraints.maxWidth > 1100) {
                    return const DashBoardView();
                  }
                  return Column(
                    children: [
                      Padding(
                        padding: const AppPadding.allHigh(),
                        child: AppSearchBar(
                            hintText: 'Search Places', onChanged: (val) => value.searchPlaces(val)),
                      ),
                      SizedBox(
                        height: context.height * 0.05,
                      ),
                      Expanded(
                          child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          height: context.height * 0.02,
                        ),
                        padding: const AppPadding.allHigh(),
                        itemCount: value.filterPlace?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          final place = value.filterPlace?[index];
                          if (place == null) return const SizedBox.shrink();
                          final activityList = place.activities;

                          return InfoCard(
                            placeModel: place,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeDetail(
                                        title: place.placeName, activityList: activityList),
                                  ));
                            },
                          );
                        },
                      )),
                    ],
                  );
                });
        },
      ),
      drawer: const AppDrawer(),
    );
  }
}
