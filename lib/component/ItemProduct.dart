import 'package:flutter/material.dart';
import 'package:shoe_store/component/Constants.dart';

class ItemProduct extends StatelessWidget {
  final String image;
  final String name;
  final double newPrice;
  final double oldPrice;
  final double discount;
const ItemProduct({
  super.key,
  required this.image,
  required this.name,
  required this.newPrice,
  required this.oldPrice,
  required this.discount
});

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(right: 16, bottom: 10),
      child: _itemProduct(image, name, newPrice, oldPrice, discount),
    );
  }

  Widget _itemProduct(String image, String name, double newPrice,
      double oldPrice, double discount) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: detailColor),
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Container(
            child: Image.asset(
          image,
          width: 120,
          height: 120,
          fit: BoxFit.cover,
        )),
        Container(
          margin: const EdgeInsets.only(top: 8),
          width: 141,
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w700, color: titleColor),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 14),
          width: 141,
          child: Text(
            "\$"+newPrice.toString(),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(
                // Độ dày của chữ gạch
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: primaryColor),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$"+oldPrice.toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    decorationColor: detailColor, // Màu của chữ gạch
                    decorationThickness: 2.0, // Độ dày của chữ gạch
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: detailColor),
              ),
              Text(
                discount.toString()+"% Off",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                    // Độ dày của chữ gạch
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.red),
              ),
            ],
          ),
        )
      ]),
    );
  }
}