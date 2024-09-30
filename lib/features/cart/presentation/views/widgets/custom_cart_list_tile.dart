import 'package:coffee_shop/core/coffee_cubit/coffee_cubit.dart';
import 'package:coffee_shop/features/cart/presentation/views/widgets/custom_item_details.dart';
import 'package:flutter/material.dart';

class CustomCartListTile extends StatelessWidget {
  const CustomCartListTile({
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
      child: Column(
        children: [
          ListTile(
            title: Text(
              coffeeCubit.userCurt[index].name,
            ),
            subtitle: Text(
              coffeeCubit.userCurt[index].price.toString(),
            ),
            leading: SizedBox(
              width: 40,
              child: Image(
                image: AssetImage(
                  coffeeCubit.userCurt[index].imagePath,
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
          CustomItemDetails(
            coffeeCubit: coffeeCubit,
            index: index,
          ),
        ],
      ),
    );
  }
}
