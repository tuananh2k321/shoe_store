import 'package:flutter/material.dart';
import 'package:shoe_store/component/Constants.dart';

class ItemCategory extends StatelessWidget {
  final String image;
  final String name;

  const ItemCategory({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: _itemCategories(name, image),
    );
  }

  Widget _itemCategories(String name, String image) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: detailColor),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Image.asset(
              image,
              color: primaryColor,
            ),
          ),
        ),
        SizedBox(
          width: 80, // Kích thước giới hạn cho text
          child: Text(
            name,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2, // Số dòng tối đa
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: detailColor,
            ),
          ),
        ),
      ],
    );
  }
}
