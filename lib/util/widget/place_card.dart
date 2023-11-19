import 'package:flutter/material.dart';
import 'package:gloria_test_case/core/extension/index.dart';
import 'package:gloria_test_case/feature/home/model/place.dart';
import 'package:gloria_test_case/util/widget/card_template.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.placeModel,
    required this.onTap,
  });
  final PlaceModel placeModel;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return CardTemplate(
        child: SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                placeModel.placeName,
                style: context.textTheme.headlineSmall,
              ),
              IconButton.filledTonal(
                  color: context.colorSheme.inversePrimary,
                  onPressed: onTap,
                  icon: const Row(
                    children: [
                      Text('See events'),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ))
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
                    placeModel.capacity.toString(),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Place',
                    style: context.textTheme.titleMedium,
                  ),
                  Text(
                    placeModel.placeType,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Work Hours',
                    style: context.textTheme.titleMedium,
                  ),
                  Text(
                    placeModel.workHours,
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
