// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shoe_store/component/Constants.dart';

class ItemComment extends StatelessWidget {
  final int id;
  final String name;
  final String avatar;
  final String comment;
  final String datetime;
  final int rating;
  final List<String> photo;
  const ItemComment({
    super.key,
    required this.id,
    required this.name,
    required this.avatar,
    required this.comment,
    required this.datetime,
    required this.rating,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        _avatar(avatar, name, rating),
        _textComment(comment),
        _imageComment(context, photo),
        _date(datetime)
      ]),
    );
  }

  Widget _avatar(String avatar, String name, int rating) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              avatar,
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
               Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: titleColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                  child: Row(
                children: List.generate(
                  5,
                  (index) {
                    if (index < rating) {
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
              ))
            ],
          )
        ],
      ),
    );
  }

  Widget _textComment(String comment) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child:  Text(
        comment,
        style: const TextStyle(
            fontSize: 14, color: detailColor, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _imageComment(BuildContext context, List<String> photo) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: double.infinity,
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: photo.length,
          itemBuilder: (context, index) {
            final item = photo[index];

            return Container(
              margin: const EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  item,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
    );
  }

  Widget _date(String datetime) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      alignment: Alignment.centerLeft,
      child:  Text(
        datetime,
        style: const TextStyle(
            fontSize: 14, color: detailColor, fontWeight: FontWeight.w500),
      ),
    );
  }
}
