import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoe_store/component/Constants.dart';
import 'package:shoe_store/component/ItemCategory.dart';
import 'package:shoe_store/component/ItemProduct.dart';
import 'package:shoe_store/model/Category.dart';
import 'package:shoe_store/model/Product.dart';
import 'package:shoe_store/routes/app_route_constants.dart';
import 'package:shoe_store/screen/SignIn.dart';
import 'package:shoe_store/screen/bottom_tabs/DetailProduct.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: _page(context),
      )),
    );
  }

  Widget _page(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          _header(),
          _sliderImage(),
          _doubleText("Category", "More Category"),
          _listCategory(context),
          _doubleText("Flash Sale", "See More"),
          _listFlashsale(),
          _recommended(),
          _gridProduct()
        ]),
      ),
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

  Widget _sliderImage() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(children: [
        Stack(
          children: [
            InkWell(
              onTap: () {
                print(currentIndex);
              },
              child: CarouselSlider(
                items: image
                    .map(
                      (item) => Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset(
                            item['image_path'],
                            fit: BoxFit.fill,
                            width: 250,
                          )),
                    )
                    .toList(),
                carouselController: carouselController,
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: image.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => carouselController.animateToPage(entry.key),
                    child: Container(
                      width: currentIndex == entry.key ? 10 : 10,
                      height: 10,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 3.0,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentIndex == entry.key
                              ? primaryColor
                              : detailColor),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ]),
    );
  }

  Widget _doubleText(String leftText, String rightText) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            textAlign: TextAlign.left,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700, color: titleColor),
          ),
          Text(
            rightText,
            textAlign: TextAlign.right,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700, color: primaryColor),
          )
        ],
      ),
    );
  }

  Widget _listCategory(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      height: 125,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final item = categories[index];

          return InkWell(
              // onTap: () => {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => SignIn(),
              //         ),
              //       )
              //     },
              child: ItemCategory(image: item.image, name: item.name));
        },
      ),
    );
  }

  Widget _listFlashsale() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: double.infinity,
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final item = productList[index];
          return InkWell(
            onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailProduct(),
                      ),
                    )
                  },
            child: ItemProduct(
                image: item.image,
                name: item.name,
                newPrice: item.newPrice,
                oldPrice: item.oldPrice,
                discount: item.discount),
          );
        },
      ),
    );
  }

  Widget _recommended() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "lib/assets/image/image2.png",
              width: double.infinity,
              height: 200,
              fit: BoxFit.fill,
            ),
          ),
          const Positioned(
            top: 50,
            left: 20,
            child: SizedBox(
              width: 200,
              child: Text(
                "Recomended Product",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Positioned(
            top: 130,
            left: 20,
            child: Text(
              "We recommend the best for you",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _gridProduct() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      height: 500,
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        children: productList.map((item) {
          return ItemProduct(
              image: item.image,
              name: item.name,
              newPrice: item.newPrice,
              oldPrice: item.oldPrice,
              discount: item.discount);
        }).toList(),
      ),
    );
  }
}
