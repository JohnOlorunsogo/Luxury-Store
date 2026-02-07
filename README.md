# Luxury Store

A premium e-commerce Flutter app featuring modern UI design with glassmorphism effects, smooth animations, and responsive layouts.

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart)
![Riverpod](https://img.shields.io/badge/State-Riverpod-blue)
![License](https://img.shields.io/badge/License-MIT-green)

## ✨ Features

- **Modern UI/UX** - Glassmorphism effects, gradient accents, premium typography
- **Smooth Animations** - Scale effects, staggered lists, parallax scrolling
- **Responsive Design** - Adapts to phones, tablets, and desktops
- **State Management** - Riverpod 3.0 with clean architecture
- **Full Shopping Flow** - Browse, wishlist, cart, and checkout

## 📱 Screens

| Home | Product Detail | Cart |
|------|----------------|------|
| Browse products with category filters | View details, select variants | Manage items, swipe to delete |

- **Home** - Gradient background, glassmorphism search, animated product grid
- **Product Detail** - Parallax image, color/size selectors, quick add to cart
- **Cart** - Swipe-to-delete, quantity controls, checkout summary
- **Wishlist** - Save favorite items
- **Profile** - User settings and preferences
- **Search** - Find products easily

## 🛠️ Tech Stack

- **Framework:** Flutter 3.x
- **State Management:** Riverpod 3.0
- **Fonts:** Google Fonts (Outfit)
- **Animations:** flutter_staggered_animations

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.0+
- Dart 3.0+

### Installation

```bash
# Clone the repository
git clone https://github.com/JohnOlorunsogo/Luxury-Store.git

# Navigate to project
cd Luxury-Store

# Install dependencies
flutter pub get

# Run the app
flutter run
```

## 📂 Project Structure

```
lib/
├── core/
│   ├── providers.dart       # Riverpod providers
│   ├── theme/               # App theming
│   ├── utils/               # Responsive utilities
│   └── widgets/             # Reusable widgets
├── features/
│   ├── home/                # Home & product detail
│   ├── cart/                # Shopping cart
│   ├── checkout/            # Checkout flow
│   ├── wishlist/            # Favorites
│   ├── search/              # Search
│   ├── profile/             # User profile
│   └── shell/               # Bottom navigation
├── models/                  # Data models
└── main.dart
```

## 🎨 Design Highlights

- **Glassmorphism** - Frosted glass effects with BackdropFilter
- **Gradients** - Gold-to-amber primary, dark elegance theme
- **Micro-interactions** - Scale on tap, animated favorites
- **Premium Shadows** - Multi-layer soft shadows
- **Responsive Grid** - 2 cols (mobile) → 3 (tablet) → 4 (desktop)

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

Made with ❤️ and Flutter
