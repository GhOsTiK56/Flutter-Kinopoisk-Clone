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
          icon: const Icon(Icons.arrow_back, color: AppColors.mainColorWhite, size: 30),
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
    print('Register');
  }

  void _other() {
    print('Other');
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
        //onst Text('Введите Email или Username', style: AppTextStyle.textStyleWhite),
        const SizedBox(height: 5),
        TextField(
          controller: _loginTextController,
          cursorColor: AppColors.mainColorWhite,
          style: AppTextStyle.textFieldTextStyle,
          decoration: AppTextStyle.textFieldDecoration.copyWith(labelText: 'Введите Email или UserName',),
        ),
        const SizedBox(height: 20),
       // const Text('Введите пароль', style: AppTextStyle.textStyleWhite),
        const SizedBox(height: 5),
        TextField(
          controller: _passwordTextController,
          cursorColor: AppColors.mainColorWhite,
          style: AppTextStyle.textFieldTextStyle,
          obscureText: true,
          decoration: AppTextStyle.textFieldDecoration.copyWith(labelText: 'Введите пароль',),
        ),
        const SizedBox(height: 30),
        SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: _auth,
            style: AppButtonStyle.baseStyle,
            child: const Text('Войти'),
          ),
        ),
        const SizedBox(height: 50),
        SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: _register,
            style: AppButtonStyle.baseStyle.copyWith(
              backgroundColor: WidgetStateProperty.all(AppColors.mainColorBlack),
              foregroundColor: WidgetStateProperty.all(AppColors.mainColorWhite),
              side: WidgetStateProperty.all(
                const BorderSide(color: Color.fromARGB(255, 41, 43, 46)),
              ),
            ),
            child: const Text('Зарегистрироваться'),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: _other,
            style: AppButtonStyle.baseStyle.copyWith(
              backgroundColor: WidgetStateProperty.all(
                const Color.fromRGBO(34, 36, 38, 1),
              ),
              foregroundColor: WidgetStateProperty.all(AppColors.mainColorWhite),
              side: WidgetStateProperty.all(BorderSide.none),
            ),
            child: const Text('Еще'),
          ),
        ),
        const SizedBox(height: 30),
        Center(
          child: Text(
            'Kinopoisk Clone — смотри что нравится!',
            style: AppTextStyle.textStyleWhite.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
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
