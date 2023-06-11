import 'package:flutter/material.dart';
import 'package:shoe_store/component/Constants.dart';
import 'package:shoe_store/component/ItemComment.dart';

class Review extends StatefulWidget {
  const Review({Key? key}) : super(key: key);

  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(15),
        child: _page(context),
      )),
    );
  }

  Widget _page(BuildContext context) {
    return Center(
        child: Column(
      children: [
        _header(context),
        const SizedBox(
          height: 15,
        ),
        _line(),
        const SizedBox(
          height: 15,
        ),
        _selection(),
        const SizedBox(
          height: 15,
        ),
        _listComment(context),
        _btnWriteCmt(context)
      ],
    ));
  }

  Widget _header(BuildContext context) {
    return Row(
      children:  [
        InkWell(
          onTap: () => {
            Navigator.pop(context)
          },

          child: Icon(
            Icons.arrow_back_ios,
            color: detailColor,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          (userComment.length).toString(),
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: titleColor),
        ),

        SizedBox(
          width: 6,
        ),
        Text(
          'Review',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: titleColor),
        )
      ],
    );
  }

  Widget _line() {
    return const Divider(
      thickness: 1,
      color: detailColor,
    );
  }

  Widget _selection() {
    return Row(
      children: [
        Container(
          color: primaryColor,
          width: 100,
          height: 50,
          alignment: Alignment.center,
          child: const Text(
            'All Review',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(child: _selectedList())
      ],
    );
  }

  Widget _selectedList() {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: detailColor),
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.only(right: 8),
              width: 80,
              height: 50,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    (index + 1).toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: titleColor),
                  ),
                ],
              ));
        },
      ),
    );
  }

  Widget _listComment(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double otherWidgetHeight = 310;

    double remainingHeight = screenHeight - otherWidgetHeight;

    return Container(
      height: remainingHeight,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: userComment.length,
        itemBuilder: (context, index) {
          final item = userComment[index];

          return ItemComment(
            avatar: item.avatar,
            comment: item.comment,
            datetime: item.datetime,
            name: item.name,
            photo: item.photo,
            rating: item.rating,
            id: item.id,
          );
        },
      ),
    );
  }

  Widget _btnWriteCmt(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: ElevatedButton(
          onPressed: () => {
            
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              // side: const BorderSide(
              //   color: detailColor,
              //   width: 2
              // )
            ),
            backgroundColor: primaryColor,
          ),
          child: const SizedBox(
              width: double.infinity,
              height: 50,
              child: Center(
                child: Text(
                  "Write",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              )),
        ));
  }
}
