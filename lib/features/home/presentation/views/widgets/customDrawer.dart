
import 'package:coffee_shop/core/utils/app_router.dart';
import 'package:coffee_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constant.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kSecondaryColor,
      child: Column(
        children: [
          const SizedBox(height: 60,),

          // رأس القائمة الجانبية (يمكن تخصيصه)
          const DrawerHeader(
            child: Image(
              image: AssetImage(
                AssetsData.espresso,
              ),
            ),
          ),
          const SizedBox(height: 20,),
          // عناصر القائمة الجانبية الأخرى
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              GoRouter.of(context).push(AppRouter.kHomeView);
              Navigator.pop(context); // إغلاق القائمة الجانبية
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
          // يفصل العناصر العلوية عن السفلية ويدفع "Logout" للأسفل
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
