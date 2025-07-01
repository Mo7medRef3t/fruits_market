# 🍉 Fruit Market

**Fruit Market** is a modern mobile e-commerce app built with Flutter, designed to let users browse, explore, and buy fresh fruits, vegetables, and nuts. It features category-driven navigation, detailed product views, local wishlist and cart management, plus secure authentication via Firebase with both Email & Google sign-in.

---

## 🚀 Features

- **Dynamic Catalog & Categories**  
  Fetches main and sub categories along with products directly from a backend API for a fully dynamic experience.

- **Smart Search & Product Favorites**  
  Users can mark favorite products, stored locally using GetStorage under dedicated keys.

- **Product Ratings**  
  Enables new users to submit their own ratings, making the platform interactive and user-driven.

- **Local Cart with Quick Checkout**  
  A simple local cart system (also via GetStorage), with the ability to view, update, and trigger checkout — either via SnackBar confirmations or moving to a mock checkout screen.

- **Secure Authentication**  
  Powered by Firebase, allowing sign up and login with Email & Google accounts.

- **Clean Architecture & State Management**  
  Built with GetX for streamlined state handling, routing, and controller separation.

---

## 🛠 Tech Stack

- **Flutter**: For crafting high-performance, cross-platform mobile UIs.
- **GetX**: Managing state, dependency injection, and navigation.
- **Firebase Auth**: Securing user authentication (Email & Google).
- **Firebase Storage**: Serving product images.
- **REST API**: Dynamically fetching products and categories.
- **GetStorage**: Persisting wishlist & cart items locally.

---

## 💡 Why This App?

Fruit Market showcases a modular Flutter project structure with clear separation of screens, widgets, and services. It highlights:
- Real-time data-driven UI from APIs.
- Local key-based storage for wishlist & cart.
- Integration with Firebase Auth & Storage.
- A foundation that's easy to expand into full-fledged e-commerce with remote cart sync and payment integration.

---

## 🚀 Getting Started

```bash
git clone https://github.com/Mo7medRef3t/fruits_market.git
cd fruits_market
flutter pub get
flutter run
