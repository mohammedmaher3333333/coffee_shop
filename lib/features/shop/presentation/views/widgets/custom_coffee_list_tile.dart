import 'package:coffee_shop/core/coffee_cubit/coffee_cubit.dart';
import 'package:flutter/material.dart';

class CustomCoffeeListTile extends StatelessWidget {
  const CustomCoffeeListTile({
    super.key,
    required this.coffeeCubit,
    required this.index,
    this.onPressed,
    required this.iconData,
  });

  final CoffeeCubit coffeeCubit;
  final int index;
  final void Function()? onPressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(
          coffeeCubit.coffeeShop[index].name,
        ),
        subtitle: Text(
          coffeeCubit.coffeeShop[index].price,
        ),
        leading: SizedBox(
          width: 50,
          child: Image(
            image: AssetImage(
              coffeeCubit.coffeeShop[index].imagePath,
            ),
          ),
        ),
        trailing: IconButton(
          onPressed: onPressed,
          icon: Icon(
            iconData,
          ),
        ),
      ),
    );
  }
}
