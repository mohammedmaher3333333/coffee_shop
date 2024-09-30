import 'package:coffee_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/data/models/coffee_model.dart';

part 'coffee_state.dart';

class CoffeeCubit extends Cubit<CoffeeState> {
  CoffeeCubit() : super(CoffeeInitial());

  // Coffee shop list (available drinks)
  final List<CoffeeModel> _shop = [
    CoffeeModel(
      name: 'black Coffee',
      price: 10.0,
      imagePath: AssetsData.blackCoffee,
    ),
    CoffeeModel(
      name: 'cold Coffee',
      price: 8.0,
      imagePath: AssetsData.coldCoffee,
    ),
    CoffeeModel(
      name: 'latte',
      price: 15.0,
      imagePath: AssetsData.latte,
    ),
    CoffeeModel(
      name: 'iced latte',
      price: 20.0,
      imagePath: AssetsData.icedLatte,
    ),
    CoffeeModel(
      name: 'espresso',
      price: 30.0,
      imagePath: AssetsData.espresso,
    ),
    CoffeeModel(
      name: 'hot Chocolate',
      price: 70.0,
      imagePath: AssetsData.hotChocolate,
    ),
    CoffeeModel(
      name: 'orange coffee',
      price: 40.0,
      imagePath: AssetsData.orangeCoffee,
    ),
  ];

  // User's cart (items selected by the user)
  final List<CoffeeModel> _userCart = [];

  // Getter for coffee shop list (returns the available drinks)
  List<CoffeeModel> get coffeeShop => _shop;

  // Getter for user's cart (returns items added to cart)
  List<CoffeeModel> get userCurt => _userCart;

  // Add item to the user's cart
  void addItemToCart(CoffeeModel cartItem) {
    _userCart.add(cartItem); // Add the selected coffee to the cart
    calculateTotalPrice(); // Recalculate the total price after adding
    emit(CoffeeAddItem()); // Emit state to update UI
  }

  // Remove item from the user's cart
  void removeItemFromCart(CoffeeModel cartItem) {
    _userCart.remove(cartItem); // Remove the coffee from the cart
    calculateTotalPrice(); // Recalculate total price after removal
    emit(CoffeeRemoveItem()); // Emit state to update UI
  }

  // void refreshItemQuantity(CoffeeModel cartItem) {
  //   final index = _shop.indexOf(cartItem);
  //   _shop[index].quantity = 1;
  // }


  // Increase the quantity of an item in the user's cart
  void incrementItemQuantity(CoffeeModel cartItem) {
    final index = _shop.indexOf(cartItem);
    if (index != -1 && _shop[index].quantity < 10) { // Check if quantity is less than 10
      _shop[index].quantity += 1; // Increment quantity
      calculateTotalPrice(); // Recalculate total price
      emit(CoffeeIncrementCountDrinks()); // Emit state to update UI
    }
  }

  // Decrease the quantity of an item in the user's cart
  void decrementItemQuantity(CoffeeModel cartItem) {
    final index = _shop.indexOf(cartItem);
    if (index != -1 && _shop[index].quantity > 1) { // Check if quantity is more than 1
      _shop[index].quantity -= 1; // Decrease quantity
      calculateTotalPrice(); // Recalculate total price
      emit(CoffeeDecrementCountDrinks()); // Emit state to update UI
    }
  }

  // Change the size of the selected drink
  String selectedSize = 'M'; // Default size is Medium (M)

  void changeSelectedSize({required String newSelected}) {
    selectedSize = newSelected; // Update the selected size
    emit(CoffeeChangeSelectedSize()); // Emit state to update UI
  }

  // Calculate total price for items in the user's cart, considering size
  double totalPrice = 0.0;

  void calculateTotalPrice() {
    totalPrice = 0.0; // Reset total price
    for (var item in _userCart) {
      double itemPrice = item.price;

      // Adjust price based on the selected size
      if (item.size == 'S') {
        itemPrice *= 0.90; // 10% discount for small size
      } else if (item.size == 'L') {
        itemPrice *= 1.10; // 10% increase for large size
      }

      totalPrice += itemPrice * item.quantity; // Add item price multiplied by quantity to total
    }

    emit(CoffeeCalculateTotalSale()); // Emit state to update UI
  }

}
