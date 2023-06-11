import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoe_store/component/constants.dart';
import 'package:shoe_store/routes/app_route_constants.dart';

class SignIn extends StatefulWidget {
  // final String email;
  // final String name;

  // const SignIn({super.key, required this.email, required this.name});

  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formfield = GlobalKey<FormState>();
  bool passToggle = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: _page(context),
          ),
        ));
  }

  Widget _page(BuildContext context) {

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _icon(),
            _text1(),
            _text2(),
            // _inputField("Your Email", usernameController, letterIcon),
            // _inputField("Your Password", passwordController, lockIcon,
            //     isPassword: true),
            Form(
              key: _formfield,
              child: Column(children: [
                 _textFormFieldEmail(),
                 const SizedBox(height: 20,),
                 _textFormFieldPassword(),
                 
              ],)
            ),
            const SizedBox(height: 40,),
            _loginButton(context),
            _pageOr(),
            _loginGGButton(),
            _loginFBButton(),
            _text3(),
            _text4()
          ],
        ),
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: primaryColor),
      width: 80,
      height: 80,
      child: Image.asset(
        'lib/assets/icon/icon1.png',
        width: 32,
        height: 32,
        color: Colors.white,
      ),
    );
  }

  Widget _text1() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: const Text(
        "Welcome to Lafyuu",
        style: TextStyle(
          fontSize: 20,
          color: titleColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _text2() {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 30),
      child: const Text(
        "Sign in to continue",
        style: TextStyle(
          fontSize: 16,
          color: detailColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  // Widget _inputField(
  //     String hintText, TextEditingController controller, Image icon,
  //     {isPassword = false}) {
  //   var enableBorder = OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(10),
  //       borderSide: const BorderSide(color: detailColor));

  //   var focusedBorder = OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(10),
  //       borderSide: const BorderSide(color: primaryColor));

  //   var errorIcon = IconButton(
  //     icon: Image.asset('lib/assets/icon/icons8-letter-50.png'),
  //     onPressed: () {
  //       // function
  //     },
  //   );

  //   return Container(
  //     margin: const EdgeInsets.symmetric(vertical: 10),
  //     child: TextField(
  //       controller: controller,
  //       decoration: InputDecoration(
  //         hintText: hintText,
  //         hintStyle: const TextStyle(
  //             color: detailColor, fontWeight: FontWeight.w700, fontSize: 14),
  //         enabledBorder: enableBorder,
  //         focusedBorder: focusedBorder,
  //         prefixIcon: Container(
  //           padding: const EdgeInsets.all(10),
  //           child: icon,
  //         ),

  //         prefixIconConstraints: const BoxConstraints(
  //           minWidth: 25,
  //           minHeight: 25,
  //         ),
  //         //suffixIcon: errorIcon (icon ben phai)
  //       ),
  //       obscureText: isPassword,
  //     ),
  //   );
  // }

  Widget _textFormFieldEmail() {
    var enableBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: detailColor, width: 1));

    var focusedBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: primaryColor, width: 2));
    
    var errorBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 2));

    return TextFormField(
        controller: usernameController,
        decoration: InputDecoration(
          hintText: "Your Email",
          hintStyle: const TextStyle(
              color: detailColor, fontWeight: FontWeight.w700, fontSize: 14),
          
          prefixIcon: Container(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              'lib/assets/icon/icons8-letter-50.png',
              width: 25,
              height: 25,
              color: detailColor,
            ),
          ),

          prefixIconConstraints: const BoxConstraints(
            minWidth: 25,
            minHeight: 25,
          ),
          enabledBorder: enableBorder,
          focusedBorder: focusedBorder,
          focusedErrorBorder: errorBorder,
          errorBorder: errorBorder,
          errorStyle: const TextStyle(
            fontSize: 13
          )
          //suffixIcon: errorIcon (icon ben phai)
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
    var enableBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: detailColor, width: 1));

    var focusedBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: primaryColor, width: 2));
    
    var errorBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 2));

    return TextFormField(
        controller: passwordController,
        decoration: InputDecoration(
          hintText: "Your Password",
          hintStyle: const TextStyle(
              color: detailColor, fontWeight: FontWeight.w700, fontSize: 14),
          
          prefixIcon: Container(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              'lib/assets/icon/icons8-lock-50.png',
              width: 25,
              height: 25,
              color: detailColor,
            ),
          ),

          prefixIconConstraints: const BoxConstraints(
            minWidth: 25,
            minHeight: 25,
          ),
          suffixIcon: InkWell(
            onTap: () => {
              setState(() => {
                passToggle = !passToggle
              })
            },
          child: Icon(passToggle ? Icons.visibility : Icons.visibility_off)),
          enabledBorder: enableBorder,
          focusedBorder: focusedBorder,
          focusedErrorBorder: errorBorder,
          errorBorder: errorBorder,
          errorStyle: const TextStyle(
            fontSize: 13
          )
          //suffixIcon: errorIcon (icon ben phai)
        ),
        obscureText: passToggle,
        validator: (value) {
          if (value!.isEmpty) {
            return "Enter Password";
          }
        },
      );
  }

  Widget _pageOr() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Row(
        children: const [
          Expanded(
              child: Divider(
            color: detailColor,
            thickness: 1,
          )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'OR',
              style: TextStyle(
                  fontSize: 14,
                  color: detailColor,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(
              child: Divider(
            color: detailColor,
            thickness: 1,
          )),
        ],
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: ElevatedButton(
          onPressed: () => {
            if (_formfield.currentState!.validate()) {
              print("Success!"),
              GoRouter.of(context).pushNamed(MyAppRouteConstants.bottomRouteName)
            },
            
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
                  "Sign In",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              )),
        ));
  }

  Widget _loginGGButton() {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        onPressed: () => {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Image.asset(
                "lib/assets/icon/icons8-google-48.png",
                width: 25,
                height: 25,
              ),
            ),
            const Center(
              child: Text(
                "Login with Google",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: titleColor),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _loginFBButton() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () => {},
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.white),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              top: 0,
              child: Image.asset(
                "lib/assets/icon/icons8-facebook-48.png",
                width: 25,
                height: 25,
              ),
            ),
            const Center(
              child: Text(
                "Login with Facebook",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: titleColor),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _text3() {
    return Container(
        margin: const EdgeInsets.only(top: 15),
        child: const Center(
            child: Text(
          "Forgot Password?",
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w700, color: primaryColor),
        )));
  }

  Widget _text4() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          "Don’t have a account? ",
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w700, color: detailColor),
        ),
        InkWell(
          onTap: () => {
            GoRouter.of(context).pushNamed(MyAppRouteConstants.signUpRouteName)
          },
          child: const Text(
            "Register",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w700, color: primaryColor),
          ),
        )
      ]),
    );
  }
}
