import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_kinopoisk_clone/Theme/app_button_style.dart';
import 'package:flutter_kinopoisk_clone/Theme/app_colors.dart';
import 'package:flutter_kinopoisk_clone/Theme/app_text_style.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColorBlack,
      appBar: AppBar(
        backgroundColor: AppColors.mainColorBlack,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.mainColorWhite,
            size: 30,
          ),
        ),
        title: const Text(
          "Kinopoisk Clone",
          style: TextStyle(color: AppColors.mainColorWhite),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      _HeaderWidget(),
                      SizedBox(height: 20),
                      _FormAuthWidget(),
                    ],
                  ),
                ),
              ),
              const _FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Вход',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: AppColors.mainColorWhite,
        height: 2,
      ),
    );
  }
}

class _FormAuthWidget extends StatefulWidget {
  const _FormAuthWidget();

  @override
  State<_FormAuthWidget> createState() => _FormAuthWidgetState();
}

class _FormAuthWidgetState extends State<_FormAuthWidget> {
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');
  String? errorText;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    final navigator = Navigator.of(context);

    if (login == 'admin' && password == 'admin') {
      errorText = null;
      navigator.pushReplacementNamed('/main_screen');
    } else {
      errorText = 'Не верный логин или пароль';
    }
    setState(() {});
  }

  void _register() {
    log('Register');
  }

  void _other() {
    log('Other');
  }

  @override
  Widget build(BuildContext context) {
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (errorText != null) ...[
          Text(errorText, style: TextStyle(color: Colors.red, fontSize: 17)),
          const SizedBox(height: 15),
        ],
        const SizedBox(height: 5),
        TextFieldEmail(loginTextController: _loginTextController),
        const SizedBox(height: 20),
        const SizedBox(height: 5),
        TextFieldPassword(passwordTextController: _passwordTextController),
        const SizedBox(height: 30),
        SizedBox(height: 50, child: buttonSignIn()),
        const SizedBox(height: 50),
        SizedBox(height: 50, child: buttonRegister()),
        const SizedBox(height: 10),
        SizedBox(height: 50, child: buttonOther()),
        const SizedBox(height: 30),
        Center(
          child: Text(
            'Kinopoisk Clone — смотри что нравится!',
            style: AppTextStyle.textStyleWhite.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  ElevatedButton buttonSignIn() {
    return ElevatedButton(
      onPressed: _auth,
      style: AppButtonStyle.baseStyle,
      child: const Text('Войти'),
    );
  }

  ElevatedButton buttonOther() {
    return ElevatedButton(
      onPressed: _other,
      style: AppButtonStyle.baseStyle.copyWith(
        backgroundColor: WidgetStateProperty.all(
          const Color.fromRGBO(34, 36, 38, 1),
        ),
        foregroundColor: WidgetStateProperty.all(AppColors.mainColorWhite),
        side: WidgetStateProperty.all(BorderSide.none),
      ),
      child: const Text('Еще'),
    );
  }

  ElevatedButton buttonRegister() {
    return ElevatedButton(
      onPressed: _register,
      style: AppButtonStyle.baseStyle.copyWith(
        backgroundColor: WidgetStateProperty.all(AppColors.mainColorBlack),
        foregroundColor: WidgetStateProperty.all(AppColors.mainColorWhite),
        side: WidgetStateProperty.all(
          const BorderSide(color: Color.fromARGB(255, 41, 43, 46)),
        ),
      ),
      child: const Text('Зарегистрироваться'),
    );
  }
}

class TextFieldPassword extends StatelessWidget {
  const TextFieldPassword({
    super.key,
    required TextEditingController passwordTextController,
  }) : _passwordTextController = passwordTextController;

  final TextEditingController _passwordTextController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _passwordTextController,
      cursorColor: AppColors.mainColorWhite,
      style: AppTextStyle.textFieldTextStyle,
      obscureText: true,
      decoration: AppTextStyle.textFieldDecoration.copyWith(
        labelText: 'Введите пароль',
      ),
    );
  }
}

class TextFieldEmail extends StatelessWidget {
  const TextFieldEmail({
    super.key,
    required TextEditingController loginTextController,
  }) : _loginTextController = loginTextController;

  final TextEditingController _loginTextController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _loginTextController,
      cursorColor: AppColors.mainColorWhite,
      style: AppTextStyle.textFieldTextStyle,
      decoration: AppTextStyle.textFieldDecoration.copyWith(
        labelText: 'Введите Email или UserName',
      ),
    );
  }
}

class _FooterWidget extends StatelessWidget {
  const _FooterWidget();

  @override
  Widget build(BuildContext context) {
    const small = TextStyle(color: AppColors.mainColorWhite, fontSize: 13);

    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('Ru', style: small),
          Text('Справка и поддержка', style: small),
          Text('©2004-2025', style: small),
        ],
      ),
    );
  }
}
