import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:go_router/go_router.dart';
import 'package:shoe_store/component/Constants.dart';
import 'package:shoe_store/routes/app_route_constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formfield = GlobalKey<FormState>();
  bool passToggle = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: Padding(padding: EdgeInsets.all(15), child: _page(context))));
  }

  Widget _page(BuildContext context) {

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          _logo(),
          _text1(),
          _text2(),
          Form (
            key: _formfield,
            child: Column(children: [
              _textFormFieldName(),
              SizedBox(height: 20,),
              _textFormFieldEmail(),
              SizedBox(height: 20,),
              _textFormFieldPassword(),
              SizedBox(height: 20,),
              _textFormFieldRePassword(),
              SizedBox(height: 20,),
            ]),
          ),
          _registerButton(context),
          _text3()
        ]),
      ),
    );
  }

  Widget _logo() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryColor
      ),
      child: Image.asset("lib/assets/icon/icon1.png", width: 25, height: 25, color: Colors.white,),
    );
  }

  Widget _text1() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: const Text(
        "Let’s Get Started",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: titleColor
        ),
      ),
    );
  }

  Widget _text2() {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 30),
      child: const Text(
        "Create an new account",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: detailColor
        ),
      ),
    );
  }

  // Widget _inputField(TextEditingController controller, Image icon, String hintText, {isPassword = false}) {
  //   var enabledBorder = OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(10),
  //     borderSide: const BorderSide(
  //       width: 1,
  //       color: detailColor
  //     )
  //   );

  //   var focusBorder = OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(10),
  //     borderSide: const BorderSide(
  //       width: 1,
  //       color: primaryColor
  //     )
  //   );

    
  //   return Container(
  //     margin: const EdgeInsets.symmetric(vertical: 10),
  //     child: TextField(
  //       controller: controller,
  //       decoration: InputDecoration(
  //         hintText: hintText,
  //         hintStyle: const TextStyle(
  //           fontSize: 14,
  //           fontWeight: FontWeight.w700,
  //           color: detailColor
  //         ),
  //         prefixIcon: Container(
  //           padding: const EdgeInsets.all(10),
  //           child: icon,
  //         ),
  //         prefixIconConstraints: const BoxConstraints(
  //           minHeight: 25,
  //           minWidth: 25
  //         ),
  //         enabledBorder: enabledBorder,
  //         focusedBorder: focusBorder
  //       ),
  //       obscureText: isPassword,
  //     ),
  //   );
  // }

   Widget _textFormFieldName() {
    var enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 1,
        color: detailColor
      )
    );

    var focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 2,
        color: primaryColor
      )
    );

    var errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 2,
        color: Colors.red
      )
    );
    
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: nameController,
      decoration: InputDecoration(
        hintText: 'Your Name',
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: detailColor
          ),
          prefixIcon: Container(
            padding: const EdgeInsets.all(10),
            child: Image.asset("lib/assets/icon/icons8-person-50.png", width: 25, height: 25,),
          ),
          prefixIconConstraints: const BoxConstraints(
            minHeight: 25,
            minWidth: 25
          ),
      
          enabledBorder: enabledBorder,
          focusedBorder: focusBorder,
          focusedErrorBorder: errorBorder,
          errorBorder: errorBorder,
          errorStyle: const TextStyle(
            fontSize: 13
          )
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Enter Name";
          }
        },
      );
  }

  Widget _textFormFieldEmail() {
    var enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 1,
        color: detailColor
      )
    );

    var focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 2,
        color: primaryColor
      )
    );

    var errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 2,
        color: Colors.red
      )
    );
    
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      decoration: InputDecoration(
        hintText: 'Your Email',
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: detailColor
          ),
          prefixIcon: Container(
            padding: const EdgeInsets.all(10),
            child: Image.asset("lib/assets/icon/icons8-letter-50.png", width: 25, height: 25,),
          ),
          prefixIconConstraints: const BoxConstraints(
            minHeight: 25,
            minWidth: 25
          ),
          
          enabledBorder: enabledBorder,
          focusedBorder: focusBorder,
          focusedErrorBorder: errorBorder,
          errorBorder: errorBorder,
          errorStyle: const TextStyle(
            fontSize: 13
          )
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Enter Email";
          }

          bool emailValid = RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$')
            .hasMatch(value);

          if (!emailValid) {
            return "Enter Valid Email";
          }
        },
      );
  }

  Widget _textFormFieldPassword() {
    var enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 1,
        color: detailColor
      )
    );

    var focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 2,
        color: primaryColor
      )
    );

    var errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 2,
        color: Colors.red
      )
    );
    
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: passwordController,
      decoration: InputDecoration(
        hintText: 'Your Password',
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: detailColor
          ),
          prefixIcon: Container(
            padding: const EdgeInsets.all(10),
            child: Image.asset("lib/assets/icon/icons8-lock-50.png", width: 25, height: 25,),
          ),
          prefixIconConstraints: const BoxConstraints(
            minHeight: 25,
            minWidth: 25
          ),
          suffixIcon: InkWell(
            onTap: () => {
              setState(() => {
                passToggle = !passToggle
              })
            },
            child: Icon(passToggle ? Icons.visibility : Icons.visibility_off),
          ),
          enabledBorder: enabledBorder,
          focusedBorder: focusBorder,
          focusedErrorBorder: errorBorder,
          errorBorder: errorBorder,
          errorMaxLines: 2,
          
          errorStyle: const TextStyle(
            fontSize: 13
          )
        ),
        obscureText: passToggle,
        validator: (value) {
          if (value!.isEmpty) {
            return "Enter Password";
          }

          bool emailValid = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$',)
            .hasMatch(value);

          if (!emailValid) {
            return "At least 8 characters long, one uppercase, one lowercase, one digit, one special character";
          }
        },
      );
  }

  Widget _textFormFieldRePassword() {
    var enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 1,
        color: detailColor
      )
    );

    var focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 2,
        color: primaryColor
      )
    );

    var errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 2,
        color: Colors.red
      )
    );
    
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: rePasswordController,
      decoration: InputDecoration(
        hintText: 'Re-Password',
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: detailColor
          ),
          prefixIcon: Container(
            padding: const EdgeInsets.all(10),
            child: Image.asset("lib/assets/icon/icons8-lock-50.png", width: 25, height: 25,),
          ),
          prefixIconConstraints: const BoxConstraints(
            minHeight: 25,
            minWidth: 25
          ),
          suffixIcon: InkWell(
            onTap: () => {
              setState(() => {
                passToggle = !passToggle
              })
            },
            child: Icon(passToggle ? Icons.visibility : Icons.visibility_off),
          ),
          enabledBorder: enabledBorder,
          focusedBorder: focusBorder,
          focusedErrorBorder: errorBorder,
          errorBorder: errorBorder,
          errorStyle: const TextStyle(
            fontSize: 13
          )
        ),
        obscureText: passToggle,
        validator: (value) {
          if (value!.isEmpty) {
            return "Enter Re-Password";
          }

          // ignore: unrelated_type_equality_checks
          if (rePasswordController.text != passwordController.text) {
            return "No password match";
          }
        },
      );
  }

  Widget _registerButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        onPressed: () => {
          
          debugPrint("name: ${nameController.text}"),
          debugPrint("mail: ${emailController.text}"),
          debugPrint("password: ${passwordController.text}"),
          debugPrint("re-password: ${rePasswordController.text}"),

          if (_formfield.currentState!.validate()) {
            print ('success')
          }
          // GoRouter.of(context).pushNamed(MyAppRouteConstants.signInRouteName, queryParameters: {
          //   'name': 'abc',
          //   'email': 'bcd'
          // })

          //GoRouter.of(context).pushNamed(MyAppRouteConstants.signInRouteName)
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: primaryColor
        ),
        child: const Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white
          ),
        ),
      ),
    );
  }

  Widget _text3() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "have a account? ",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: detailColor
            ),
          ),

          InkWell(
            onTap: () => {
              GoRouter.of(context).pushNamed(MyAppRouteConstants.signInRouteName)
            },
            child: const Text(
              "Sign In",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: primaryColor
              ),
            ),
          )
        ],
      ),
    );
  }
}
