
import 'package:flutter/material.dart';
import 'package:shoe_store/component/Constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shoe_store/component/ItemProduct.dart';
import 'package:shoe_store/screen/bottom_tabs/Review.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({Key? key}) : super(key: key);

  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  int selectedPositionSize = -1;
  int selectedPositionColor = -1;
  List size = ['6', '6.5', '7', '7.5', '8', '8.5'];
  List colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.black,
    Colors.amber,
    Colors.pink
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Stack(
            children: [
              _page(context),
              Align(
                alignment: Alignment.bottomLeft,
                child: _btnAdd(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _page(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Center(
        child: Column(children: [
          _iconLeft(),
          _slider(),
          _name(),
          _star(),
          _price(),
          _textTitle('Select Size'),
          _listSize(context),
          _textTitle('Select Colors'),
          _listColor(context),
          _textTitle('Specification'),
          _textDetail(),
          _textReview(),
          _rating(),
          _avatar(),
          _textComment(),
          _imageComment(context),
          _date(),
          _textTitle('You Might Also Like'),
          _listProduct(context),
        ]),
      ),
    );
  }

  Widget _iconLeft() {
    return Container(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () => {
          Navigator.pop(context)
        },
        child: const Icon(
          Icons.arrow_back,
          color: detailColor,
        ),
      ),
    );
  }

  Widget _slider() {
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            item['image_path'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
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

  Widget _name() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Expanded(
            flex: 1,
            child: Text(
              'Nike Air Zoom Pegasus 36 Miami ',
              style: TextStyle(
                  fontSize: 20, color: titleColor, fontWeight: FontWeight.bold),
            ),
          ),
          Icon(
            Icons.favorite_border,
          ),
        ],
      ),
    );
  }

  Widget _star() {
    return Container(
        child: Row(
      children: List.generate(
        5,
        (index) {
          if (index < 4) {
            return const Icon(
              Icons.star,
              color: Colors.yellow,
            );
          } else {
            return const Icon(
              Icons.star,
              color: detailColor,
            );
          }
        },
      ),
    ));
  }

  Widget _price() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      alignment: Alignment.centerLeft,
      child: const Text(
        '\$299,43',
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),
      ),
    );
  }

  Widget _textTitle(String text) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: titleColor),
      ),
    );
  }

  Widget _listSize(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: double.infinity,
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: size.length,
          itemBuilder: (context, index) {
            final item = size[index];
            final isSelected = index == selectedPositionSize;

            return GestureDetector(
              onTap: () => {
                setState(() {
                  selectedPositionSize = index;
                  print(selectedPositionSize);
                  print(index);
                  print(isSelected);
                })
              },
              child: Container(
                margin: const EdgeInsets.only(right: 15),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                        width: 1,
                        color: isSelected ? primaryColor : detailColor)),
                child: Center(
                  child: Text(
                    item,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? primaryColor : detailColor),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget _listColor(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: double.infinity,
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (context, index) {
            final item = colors[index];
            final isSelected = index == selectedPositionColor;

            return GestureDetector(
              onTap: () => {
                setState(() {
                  selectedPositionColor = index;
                  print(selectedPositionColor);
                  print(index);
                  print(isSelected);
                })
              },
              child: Container(
                margin: const EdgeInsets.only(right: 15),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                      width: 1, color: isSelected ? primaryColor : detailColor),
                  color: item,
                ),
                child: Center(
                    child: isSelected
                        ? Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          )
                        : null),
              ),
            );
          }),
    );
  }

  Widget _textDetail() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: const Text(
        'The Nike Air Max 270 React ENG combines a full-length React foam midsole with a 270 Max Air unit for unrivaled comfort and a striking visual experience.',
        style: TextStyle(
            fontSize: 14, color: detailColor, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _textReview() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          Text(
            'Review Product',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: titleColor),
          ),
          InkWell(
            onTap: () => {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Review(),
                      ),
                    )
            },
            child: Text(
              'See more',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor),
            ),
          )
        ],
      ),
    );
  }

  Widget _rating() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          _star(),
          const SizedBox(width: 5),
          const Text(
            '4.5',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: detailColor,
            ),
          ),
          const SizedBox(width: 5),
          const Text(
            '(5 Review)',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: detailColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _avatar() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              'https://antimatter.vn/wp-content/uploads/2022/10/hinh-anh-gai-xinh-de-thuong.jpg',
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              const Text(
                'James Lawson',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: titleColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              _star()
            ],
          )
        ],
      ),
    );
  }

  Widget _textComment() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: const Text(
        'air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.',
        style: TextStyle(
            fontSize: 14, color: detailColor, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _imageComment(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: double.infinity,
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: image.length,
          itemBuilder: (context, index) {
            final item = image[index];

            return Container(
              margin: const EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  item['image_path'],
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
    );
  }

  Widget _date() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      alignment: Alignment.centerLeft,
      child: const Text(
        'December 10, 2016',
        style: TextStyle(
            fontSize: 14, color: detailColor, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _listProduct(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 50),
      height: 280,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productList.length,
          itemBuilder: (context, index) {
            final item = productList[index];
            return ItemProduct(
                image: item.image,
                name: item.name,
                newPrice: item.newPrice,
                oldPrice: item.oldPrice,
                discount: item.discount);
          }),
    );
  }

  Widget _btnAdd() {
    return ElevatedButton(
      onPressed: () => {},
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: primaryColor),
      child: const SizedBox(
        width: double.infinity,
        height: 50,
        child: Center(
          child: Text(
            'Add to Cart',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
