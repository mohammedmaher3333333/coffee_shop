import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../features/home/presentation/manager/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: GNav(
        onTabChange: (value) {
          // استخدم Cubit لتحديث حالة العنصر المختار
          BlocProvider.of<BottomNavBarCubit>(context).updateIndex(value);
        },
        color: Colors.grey.shade400,
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.grey.shade700,
        tabBackgroundColor: Colors.grey.shade300,
        tabActiveBorder: Border.all(color: Colors.white),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.shopping_cart_outlined,
            text: 'Cart',
          ),
        ],
      ),
    );
  }
}
