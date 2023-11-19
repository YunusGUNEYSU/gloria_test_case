import 'package:flutter/material.dart';
import 'package:gloria_test_case/core/constants/index.dart';
import 'package:gloria_test_case/core/extension/index.dart';
import 'package:gloria_test_case/core/routes/route.dart';
import 'package:gloria_test_case/feature/auth/provider/provider.dart';
import 'package:gloria_test_case/util/widget/drawer_list_tile.dart';
import 'package:provider/provider.dart';

final class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.colorSheme.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.account_balance_outlined,
                  size: context.height * 0.07,
                  color: context.colorSheme.inversePrimary,
                ),
              ),
              DrawerListTile(
                icon: Icons.supervisor_account_rounded,
                title: 'E V E N T S',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, RoutePath.activity.path);
                },
              ),
            ],
          ),
          Padding(
            padding: const AppPadding.bottomHigh(),
            child: DrawerListTile(
              icon: Icons.exit_to_app_outlined,
              title: 'E X I T',
              onTap: () async {
                Navigator.pop(context);
                await context.read<AuthProvider>().logOut();
              },
            ),
          )
        ],
      ),
    );
  }
}
