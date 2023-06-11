import 'package:flutter/material.dart';
import 'package:shoe_store/component/Constants.dart';
import 'package:shoe_store/component/ItemCategory.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Padding(padding: const EdgeInsets.all(15), child: _page()),
        ));
  }

  Widget _page() {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_header(), _line(), _text("Man Fashion"), _listCategory(),_text("Women Fashion"), _listCategory()]),
    );
  }

  Widget _header() {
    return Container(
      child: Row(children: [
        _inputField(),
        Container(
            padding: const EdgeInsets.all(10),
            child: Image.asset('lib/assets/icon/icons8-heart-50.png',
                width: 25, height: 25)),
        Container(
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            'lib/assets/icon/icons8-notification-50.png',
            width: 25,
            height: 25,
          ),
        )
      ]),
    );
  }

  Widget _inputField() {
    var borderEnabled = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: detailColor));

    var focusedBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: primaryColor));

    var iconSearch = Image.asset(
      'lib/assets/icon/icons8-search-50.png',
      width: 25,
      height: 25,
    );

    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Product',
          hintStyle: const TextStyle(
              fontSize: 14, color: detailColor, fontWeight: FontWeight.w400),
          prefixIcon: Container(
            padding: const EdgeInsets.all(10),
            child: iconSearch,
          ),
          prefixIconConstraints:
              const BoxConstraints(minWidth: 25, minHeight: 25),
          enabledBorder: borderEnabled,
          focusedBorder: focusedBorder,
        ),
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

  Widget _text(String text) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: double.infinity,
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: const TextStyle(
          
            fontSize: 18, fontWeight: FontWeight.w700, color: titleColor),
      ),
    );
  }

  Widget _listCategory() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: double.infinity,
      child: Wrap(
        direction: Axis.horizontal,
        children: categories
            .map((item) => ItemCategory(name: item.name, image: item.image))
            .toList(),
      ),
    );
  }
}
