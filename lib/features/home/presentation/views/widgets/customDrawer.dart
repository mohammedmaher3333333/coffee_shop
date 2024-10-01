import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffee_shop/core/utils/assets.dart';

import '../../../../../constant.dart';
import '../../manager/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kSecondaryColor,
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          const DrawerHeader(
            child: Image(
              image: AssetImage(
                AssetsData.espresso,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              BlocProvider.of<BottomNavBarCubit>(context).updateIndex(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.error),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
