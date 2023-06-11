import 'package:flutter/material.dart';
import 'package:shoe_store/component/Constants.dart';

class ItemCart extends StatelessWidget {
  final String image;
  final String name;
  final double newPrice;
  final int quantity;
  const ItemCart({
    super.key,
    required this.image,
    required this.name,
    required this.newPrice,
    required this.quantity
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: _itemCart(image, name, newPrice, quantity),
    );
  }

  Widget _itemCart(String image, String name, double newPrice, int quantity) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: detailColor
        ),
        borderRadius: BorderRadius.circular(5)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              width: 80,
              height: 80,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      SizedBox(
                        width: 170,
                        child: Text(
                          name,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: titleColor),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: Image.asset(
                              "lib/assets/icon/icons8-heart-50.png",
                              width: 25,
                              height: 25,
                            ),
                          ),
                          Image.asset(
                            "lib/assets/icon/icons8-trash-can-50.png",
                            width: 25,
                            height: 25,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        
                        child: Text(
                          "\$"+newPrice.toString(),
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: primaryColor),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            width: 32,
                            height: 24,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1, color: detailColor)),
                            child: Image.asset(
                              "lib/assets/icon/icons8-minus-50.png",
                              width: 25,
                              height: 25,
                            ),
                          ),
                          Container(
                              width: 40,
                              height: 24,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: detailColor)),
                              child:  Center(
                                child: Text(
                                  quantity.toString(),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: titleColor),
                                ),
                              )),
                          Container(
                            padding: const EdgeInsets.all(5),
                            width: 32,
                            height: 24,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1, color: detailColor)),
                            child: Image.asset(
                              "lib/assets/icon/icons8-plus-50.png",
                              width: 25,
                              height: 25,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
