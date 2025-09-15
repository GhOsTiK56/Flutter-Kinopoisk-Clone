import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 19, 23, 1),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          iconSize: 30,
        ),
        title: Text("Kinopoisk Clone", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: ListView(children: [_HeaderWidget()]),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sign in',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
              height: 2,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 20),
          _FormAuthWidget(),
        ],
      ),
    );
  }
}

class _FormAuthWidget extends StatefulWidget {
  const _FormAuthWidget({super.key});

  @override
  State<_FormAuthWidget> createState() => __FormAuthWidgetState();
}

class __FormAuthWidgetState extends State<_FormAuthWidget> {
  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(fontSize: 15, color: Colors.white);
    final textFieldInputDecoration = InputDecoration(
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color.fromARGB(255, 54, 54, 54)),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: EdgeInsetsGeometry.symmetric(horizontal: 10),
      hintStyle: textStyle,
    );
    final textFieldTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 18,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Enter Your Email or Username', style: textStyle),
        SizedBox(height: 5),
        TextField(
          cursorColor: Colors.white,
          style: textFieldTextStyle,
          decoration: textFieldInputDecoration,
        ),
        SizedBox(height: 20),
        Text('Enter Your Password', style: textStyle),
        SizedBox(height: 5),
        TextField(
          cursorColor: Colors.white,
          style: textFieldTextStyle,
          decoration: textFieldInputDecoration,
          obscureText: true,
        ),
        SizedBox(height: 30),
        Center(
          child: Column(children: [
            SizedBox(
              width: double.infinity,
              height: 50,
              child: TextButton(onPressed: () {}, style: ButtonStyle(
                shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20))),
                backgroundColor: WidgetStateProperty.all(Colors.white),
              ), child: Text('Войти'),),
            ),
            TextButton(onPressed: () {}, style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.white),
            ), child: Text('Зарегистрироваться')),
            TextButton(onPressed: () {}, style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.white),
            ), child: Text('Еще')),
          ],),
        )
      ],
    );
  }
}
