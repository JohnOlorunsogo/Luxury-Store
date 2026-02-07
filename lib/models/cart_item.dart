import 'package:luxury_store/models/product.dart';

class CartItem {
  final Product product;
  final int quantity;
  final String? selectedSize;
  final int? selectedColor;

  CartItem({
    required this.product,
    this.quantity = 1,
    this.selectedSize,
    this.selectedColor,
  });

  CartItem copyWith({
    Product? product,
    int? quantity,
    String? selectedSize,
    int? selectedColor,
  }) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      selectedSize: selectedSize ?? this.selectedSize,
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }

  double get totalPrice => product.price * quantity;
}
