import 'package:flutter/material.dart';

class LoginDemo extends StatefulWidget {
  const LoginDemo({ Key? key }) : super(key: key);

  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
              Colors.blue,
              Colors.red
          ]
        )
      ),

      child:  Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return Center(
      child: Column(
        children: [
          _icon()
        ],
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        shape: BoxShape.circle
      ),
      child: const Icon(Icons.person, color:Colors.white, size: 120,)
    );
  }
}



