import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_bottom_nav_bar.dart';
import '../../../cart/presentation/views/cart_view.dart';
import '../../../shop/presentation/views/widgets/shop_view.dart';
import '../manager/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavBarCubit, int>(
        builder: (context, currentIndex) {
          // عرض الصفحة المناسبة بناءً على العنصر المختار
          return IndexedStack(
            index: currentIndex,
            children: const [
              ShopView(),
              CartView(),
            ],
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
