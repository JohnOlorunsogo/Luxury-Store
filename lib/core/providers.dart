import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/mock_data.dart';
import '../models/product.dart';
import '../models/cart_item.dart';

// Products filter provider
class CategoryFilter extends Notifier<ProductCategory?> {
  @override
  ProductCategory? build() => null;

  @override
  set state(ProductCategory? value) => super.state = value;
}

final categoryFilterProvider =
    NotifierProvider<CategoryFilter, ProductCategory?>(CategoryFilter.new);

// All products provider
final productsProvider = Provider<List<Product>>((ref) {
  final category = ref.watch(categoryFilterProvider);
  if (category == null) {
    return MockData.products;
  }
  return MockData.products.where((p) => p.category == category).toList();
});

// Search providers
class SearchQueryNotifier extends Notifier<String> {
  @override
  String build() => '';

  void setQuery(String query) => state = query;
}

final searchQueryProvider = NotifierProvider<SearchQueryNotifier, String>(
  SearchQueryNotifier.new,
);

final searchResultsProvider = Provider<List<Product>>((ref) {
  final query = ref.watch(searchQueryProvider).toLowerCase().trim();
  if (query.isEmpty) {
    return [];
  }
  return MockData.products.where((product) {
    return product.name.toLowerCase().contains(query) ||
        product.category.name.toLowerCase().contains(query) ||
        product.description.toLowerCase().contains(query);
  }).toList();
});

// Wishlist provider
class WishlistNotifier extends Notifier<List<Product>> {
  @override
  List<Product> build() => [];

  void toggleWishlist(Product product) {
    final isInWishlist = state.any((p) => p.id == product.id);
    if (isInWishlist) {
      state = state.where((p) => p.id != product.id).toList();
    } else {
      state = [...state, product];
    }
  }

  bool isInWishlist(String productId) {
    return state.any((p) => p.id == productId);
  }

  void removeFromWishlist(String id) {
    state = state.where((p) => p.id != id).toList();
  }
}

final wishlistProvider = NotifierProvider<WishlistNotifier, List<Product>>(
  WishlistNotifier.new,
);

// Cart provider with quantity support
class CartNotifier extends Notifier<Map<String, CartItem>> {
  @override
  Map<String, CartItem> build() => {};

  void addToCart(Product product, {String? selectedSize, int? selectedColor}) {
    final existingItem = state[product.id];
    if (existingItem != null) {
      // Increase quantity if already in cart
      state = {
        ...state,
        product.id: existingItem.copyWith(quantity: existingItem.quantity + 1),
      };
    } else {
      // Add new item
      state = {
        ...state,
        product.id: CartItem(
          product: product,
          selectedSize: selectedSize,
          selectedColor: selectedColor,
        ),
      };
    }
  }

  void removeFromCart(String id) {
    final newState = Map<String, CartItem>.from(state);
    newState.remove(id);
    state = newState;
  }

  void updateQuantity(String id, int quantity) {
    if (quantity <= 0) {
      removeFromCart(id);
      return;
    }
    final item = state[id];
    if (item != null) {
      state = {...state, id: item.copyWith(quantity: quantity)};
    }
  }

  void incrementQuantity(String id) {
    final item = state[id];
    if (item != null) {
      updateQuantity(id, item.quantity + 1);
    }
  }

  void decrementQuantity(String id) {
    final item = state[id];
    if (item != null) {
      updateQuantity(id, item.quantity - 1);
    }
  }

  void clearCart() {
    state = {};
  }

  double get totalPrice {
    return state.values.fold(0, (sum, item) => sum + item.totalPrice);
  }

  int get totalItems {
    return state.values.fold(0, (sum, item) => sum + item.quantity);
  }

  List<CartItem> get items => state.values.toList();
}

final cartProvider = NotifierProvider<CartNotifier, Map<String, CartItem>>(
  CartNotifier.new,
);

// Legacy cart provider for backwards compatibility (returns list of products)
final cartItemsProvider = Provider<List<Product>>((ref) {
  final cart = ref.watch(cartProvider);
  return cart.values.map((item) => item.product).toList();
});
