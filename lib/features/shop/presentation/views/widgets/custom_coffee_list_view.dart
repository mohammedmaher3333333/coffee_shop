import 'package:coffee_shop/core/coffee_cubit/coffee_cubit.dart';
import 'package:coffee_shop/core/utils/app_router.dart';
import 'package:coffee_shop/features/shop/presentation/views/widgets/custom_coffee_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomCoffeeListView extends StatelessWidget {
  const CustomCoffeeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffeeCubit, CoffeeState>(
      builder: (context, state) {
        var coffeeCubit = BlocProvider.of<CoffeeCubit>(context);
        return Expanded(
          child: ListView.builder(
            itemCount: coffeeCubit.coffeeShop.length,
            itemBuilder: (context, index) {
              return CustomCoffeeListTile(
                coffeeCubit: coffeeCubit,
                iconData: Icons.arrow_forward_rounded,
                index: index,
                onPressed: () {
                  GoRouter.of(context).push(
                    AppRouter.kDrinkOrderSpecifications,
                    extra: index,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
