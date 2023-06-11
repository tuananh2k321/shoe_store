import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:shoe_store/component/Constants.dart';

class Offer extends StatefulWidget {
  const Offer({Key? key}) : super(key: key);

  @override
  _OfferState createState() => _OfferState();
}

class _OfferState extends State<Offer> {
  Timer? timer;
  Duration duration = const Duration();

  @override
  void initState() {
    super.initState();
    duration = Duration(hours: 2);
    startTimer();
  }

  void addTime() {
    final addSeconds = -1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(15), child: _page()),
    );
  }

  Widget _page() {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        _text1(),
        _line(),
        _discount1(),
        _discount2(),
        _discount3()
      ]),
    );
  }

  Widget _text1() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: double.infinity,
      child: const Text(
        "Offer",
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

  Widget _discount1() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.all(30),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryColor,
      ),
      child: const Text(
        'Use “MEGSL” Cupon For Get 90%off',
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
      ),
    );
  }

  Widget _discount2() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'lib/assets/image/image1.png',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 120,
            left: 20,
            child: buildTime(duration),
          ),
          const Positioned(
            top: 60,
            left: 20,
            child: Text(
              "Super Flash Sale 50% Off",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hour = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Row(
      children: [
        buildTimeCard(time: hour, header: 'HOURS'),
        const SizedBox(
          width: 4,
        ),
        const Text(
          ':',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        const SizedBox(
          width: 4,
        ),
        buildTimeCard(time: minutes, header: 'MINUTES'),
        const SizedBox(
          width: 8,
        ),
        const Text(
          ':',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        const SizedBox(
          width: 4,
        ),
        buildTimeCard(time: seconds, header: 'SECONDS'),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }

  Widget buildTimeCard({required String time, required String header}) {
    return Container(
      alignment: Alignment.center,
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Text(
        time,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          color: titleColor,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _discount3() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'lib/assets/image/image2.png',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const Positioned(
              top: 60,
              left: 20,
              child: Text(
                "90% Off Super Mega Sale",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              )),
          
          const Positioned(
              top: 120,
              left: 20,
              child: Text(
                "Special birthday Lafyuu",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ))
        ],
      ),
    );
  }
}
