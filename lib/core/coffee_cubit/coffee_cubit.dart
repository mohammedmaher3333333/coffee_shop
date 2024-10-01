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
    CoffeeModel newCartItem = CoffeeModel(
      name: cartItem.name,
      price: cartItem.price,
      imagePath: cartItem.imagePath,
      size: selectedSize,
      quantity: quantity,
    );

    _userCart.add(newCartItem);
    calculateTotalPrice();
    refreshDetails();
    emit(CoffeeAddItem());
  }

  // Remove item from the user's cart
  void removeItemFromCart(CoffeeModel cartItem) {
    _userCart.remove(cartItem);
    calculateTotalPrice();
    emit(CoffeeRemoveItem());
  }

  int quantity = 1;

  // Increment item quantity in the cart
  void incrementItemQuantity() {
    if (quantity < 10) {
      quantity += 1;
      emit(CoffeeIncrementCountDrinks());
    }
  }

  // Decrement item quantity in the cart
  void decrementItemQuantity() {
    if (quantity > 1) {
      quantity -= 1;
      emit(CoffeeDecrementCountDrinks());
    }
  }

  // Change the size of the selected drink
  String selectedSize = 'M'; // Default size is Medium (M)

  void changeSelectedSize({required String newSelected}) {
    selectedSize = newSelected;
    emit(CoffeeChangeSelectedSize());
  }

  // Refresh drink details
  void refreshDetails() {
    selectedSize = 'M';
    quantity = 1;
    emit(CoffeeRefreshDetailsDrink());
  }

  // Calculate total price for items in the user's cart, considering size
  double totalPrice = 0.0;

  void calculateTotalPrice() {
    totalPrice = 0.0;
    for (var item in _userCart) {
      double itemPrice = item.price;

      if (item.size == 'S') {
        itemPrice *= 0.80; // 20% discount for small size
      } else if (item.size == 'L') {
        itemPrice *= 1.20; // 20% increase for large size
      }

      totalPrice += itemPrice * item.quantity;
    }
    emit(CoffeeCalculateTotalSale());
  }
}
