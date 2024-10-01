import 'package:coffee_shop/constant.dart';
import 'package:coffee_shop/features/home/presentation/views/widgets/customDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_bottom_nav_bar.dart';
import '../../../cart/presentation/views/cart_view.dart';
import '../../../shop/presentation/views/shop_view.dart';
import '../manager/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, int>(
      builder: (context, currentIndex) {
        print('Current Index: $currentIndex'); // للتحقق
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: kPrimaryColor,
          ),
          drawer: const CustomDrawer(),
          body: IndexedStack(
            index: currentIndex,
            children: const [
              ShopView(),
              CartView(),
            ],
          ),
          bottomNavigationBar: const CustomBottomNavBar(),
        );
      },
    );
  }
}
