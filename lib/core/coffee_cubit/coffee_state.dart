part of 'coffee_cubit.dart';

@immutable
sealed class CoffeeState {}

final class CoffeeInitial extends CoffeeState {}

final class CoffeeAddItem extends CoffeeState {}

final class CoffeeRemoveItem extends CoffeeState {}

// count Request drinks

final class CoffeeIncrementCountDrinks extends CoffeeState {}

final class CoffeeDecrementCountDrinks extends CoffeeState {}

final class CoffeeGetCountDrinks extends CoffeeState {}

// size Request drinks

final class CoffeeChangeSelectedSize extends CoffeeState {}
// refresh details drinks

final class CoffeeRefreshDetailsDrink extends CoffeeState {}

// calculate total sale

final class CoffeeCalculateTotalSale extends CoffeeState {}
