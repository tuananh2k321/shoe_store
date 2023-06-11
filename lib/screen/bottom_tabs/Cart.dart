import 'package:flutter/material.dart';
import 'package:shoe_store/component/Constants.dart';
import 'package:shoe_store/component/ItemCart.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(15),
        child: _page(),
      )),
    );
  }

  Widget _page() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_text1(), _line(), _listCart(), _inputField(), _total(), _checkOutButton()]),
      ),
    );
  }

  Widget _text1() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: double.infinity,
      child: const Text(
        "Your Cart",
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w700, color: titleColor),
      ),
    );
  }

  Widget _line() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: const Divider(
        color: detailColor,
        thickness: 1,
      ),
    );
  }

  Widget _listCart() {
    return Container(
      child: Column(
        children: 
          cartList.map((item) => 
          ItemCart(image: item.image, name: item.name, newPrice: item.newPrice, quantity: item.quantity))
          .toList()
      ),
    );
  }

  Widget _inputField() {
    var borderEnabled = const OutlineInputBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
        borderSide:  BorderSide(color: detailColor));

    var focusedBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: primaryColor));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            height: 80,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter Cupon Code",
                hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: detailColor
                ),
                enabledBorder: borderEnabled,
                focusedBorder: focusedBorder
              ),
                  ),
          )),
    
        SizedBox(
          height: 60,
          child: ElevatedButton(onPressed: () => {}, 
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10))
            ),
            backgroundColor: primaryColor
          ),
          child: const Text(
            "Apply",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white
            ),
          )),
        )
    
      ],
    );
  }


  Widget _total() {
    double total1 = cartList.map((item) => item.newPrice*item.quantity).reduce((value, element) => value + element);
    double shipping = 25.0;
    double total2 = total1 + shipping;
    return Container(
      padding: EdgeInsets.all(15),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: detailColor
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text(
              "item (${cartList.length})",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: detailColor
              )
            ),
            Text(
              "${total1}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: detailColor
              ),
            )
            ]
          ),
        ),

         Container(
            margin: const EdgeInsets.only(bottom: 10),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              const Text(
              "Shipping",
              style:  TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: detailColor
              )
            ),
             Text(
              shipping.toString(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: detailColor
              ),
            )
            ]
                 ),
         ),

        
        const Divider(
          color: detailColor,
          thickness: 1,
        ),

         Container(
            margin: const EdgeInsets.only(top: 10),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              const Text(
              "Total",
              style:  TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: titleColor
              )
            ),
             Text(
              total2.toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: primaryColor
              ),
            )
            ]
                 ),
         ),

      ]),
    );
  }

  Widget _checkOutButton() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      width: double.infinity,
      height: 60,
      child: ElevatedButton(onPressed: () => {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          backgroundColor: primaryColor
        ),
        child: const Text(
          "Check Out",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
