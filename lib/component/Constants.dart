import 'package:flutter/material.dart';
import 'package:shoe_store/model/Category.dart';
import 'package:shoe_store/model/Product.dart';
import 'package:shoe_store/model/User.dart';

// COLOR

const primaryColor = Color(0xFF40BFFF);
const titleColor = Color(0xFF223263);
const detailColor = Color(0xFF9098B1);
const backgroundColor = Colors.white;

// SIZE

// LIST

final List image = [
  {"id": 1, "image_path": "lib/assets/image/image1.png"},
  {"id": 2, "image_path": "lib/assets/image/image2.png"},
];

final List<Category> categories = [
  Category(1, "Man Shirt", "lib/assets/icon/icons8-shirt-50.png"),
  Category(2, "Dress", "lib/assets/icon/icons8-dress-50.png"),
  Category(3, "Man Work Equipment", "lib/assets/icon/icons8-bag-50.png"),
  Category(4, "Woman Bag", "lib/assets/icon/icons8-shopping-bag-50.png"),
  Category(5, "Shoe", "lib/assets/icon/icons8-sneaker-50.png"),
];

final List<Product> productList = [
  Product(1, "lib/assets/image/image3.png", "Nike Air Max 270 React ENG",
      299.43, 534.33, 24.0, 1),
  Product(2, "lib/assets/image/image4.png", "Nike Air Max 270 React ENG",
      299.43, 534.33, 24.0, 1),
  Product(3, "lib/assets/image/image5.png", "Nike Air Max 270 React ENG",
      299.43, 534.33, 24.0, 1),
  Product(4, "lib/assets/image/image6.png", "Nike Air Max 270 React ENG",
      299.43, 534.33, 24.0, 1),
  Product(5, "lib/assets/image/image7.png", "Nike Air Max 270 React ENG",
      299.43, 534.33, 24.0, 1),
  Product(6, "lib/assets/image/image8.png", "Nike Air Max 270 React ENG",
      299.43, 534.33, 24.0, 1),
];

final List<Product> cartList = [
  Product(1, "lib/assets/image/image3.png", "Nike Air Max 270 React ENG",
      299.43, 534.33, 24.0, 1),
  Product(2, "lib/assets/image/image4.png", "Nike Air Max 270 React ENG",
      299.43, 534.33, 24.0, 1),
  Product(3, "lib/assets/image/image5.png", "Nike Air Max 270 React ENG",
      299.43, 534.33, 24.0, 1),
];

// int _id;
// String _name;
// String _avatar;
// String _comment;
// String _datetime;
// int _rating;
// List<String> _photo;

final List<User> userComment = [
  User(
      1,
      "Aladdin",
      "https://thptphandinhphung.edu.vn/wp-content/uploads/2022/12/999-Anh-Gai-Xinh-Viet-Nam-Hot-Girl-Cute-De.jpg",
      "air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.",
      "11/06/2023",
      5,
      [
        "lib/assets/image/image5.png",
        "lib/assets/image/image4.png",
      ],
      ),

  User(
      2,
      "Chris Topher",
      "https://antimatter.vn/wp-content/uploads/2022/10/hinh-anh-gai-xinh-de-thuong.jpg",
      "air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.",
      "11/06/2023",
      4,
      [
        "lib/assets/image/image7.png",
        "lib/assets/image/image1.png",
      ],
      ),

  User(
      3,
      "Ruby",
      "https://i.pinimg.com/564x/47/37/38/473738c19fb5156de61aded58c54805b.jpg",
      "air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.",
      "11/06/2023",
      3,
      [
        "lib/assets/image/image8.png",
        "lib/assets/image/image2.png",
      ],
      ),
];
