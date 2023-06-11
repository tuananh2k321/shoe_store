import 'package:flutter/material.dart';
import 'package:shoe_store/component/Constants.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body:
          SafeArea(child: Padding(padding: EdgeInsets.all(15), child: _page())),
    );
  }

  Widget _page() {
    var iconProfile = 'lib/assets/icon/icons8-person-50.png';
    var iconOrder = 'lib/assets/icon/icons8-order-50.png';
    var iconAddress = 'lib/assets/icon/icons8-address-50.png';
    var iconPayment = 'lib/assets/icon/icons8-card-50.png';
    return Center(
        child: Column(children: [
      _text1(),
      _line(),
      _option("Profile", iconProfile),
      _option("Order", iconOrder),
      _option("Address", iconAddress),
      _option("Payment", iconPayment),
    ]));
  }

  Widget _text1() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: double.infinity,
      child: const Text(
        "Account",
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

  Widget _option(String name, String icon) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            icon,
            width: 30,
            height: 30,
            color: primaryColor,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            name,
            style: const TextStyle(
                fontWeight: FontWeight.w700, color: titleColor, fontSize: 16),
          )
        ],
      ),
    );
  }
}
