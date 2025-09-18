import 'package:flutter/material.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 19, 23, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(19, 19, 23, 1),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
        ),
        title: const Text("Kinopoisk Clone", style: TextStyle(color: Colors.white)),
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
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Sign in',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Colors.white,
        height: 2,
      ),
    );
  }
}

class _FormAuthWidget extends StatelessWidget {
  const _FormAuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 15, color: Colors.white);
    const textFieldTextStyle = TextStyle(color: Colors.white, fontSize: 18);

    final textFieldDecoration = InputDecoration(
      border: OutlineInputBorder(
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
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      hintStyle: textStyle,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Введите Email или Username', style: textStyle),
        const SizedBox(height: 5),
        TextField(
          cursorColor: Colors.white,
          style: textFieldTextStyle,
          decoration: textFieldDecoration,
        ),
        const SizedBox(height: 20),
        const Text('Введите пароль', style: textStyle),
        const SizedBox(height: 5),
        TextField(
          cursorColor: Colors.white,
          style: textFieldTextStyle,
          obscureText: true,
          decoration: textFieldDecoration,
        ),
        const SizedBox(height: 30),
        const _ButtonsWidget(),
        const SizedBox(height: 30),
        Center(
          child: Text(
            'Kinopoisk Clone — смотри что нравится!',
            style: textStyle.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class _ButtonsWidget extends StatelessWidget {
  const _ButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final baseStyle = ButtonStyle(
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      textStyle: WidgetStateProperty.all(
        const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      foregroundColor: WidgetStateProperty.all(Colors.black),
      backgroundColor: WidgetStateProperty.all(Colors.white),
      side: WidgetStateProperty.all(const BorderSide(color: Colors.black)),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 50,
          child: TextButton(
            onPressed: () {},
            style: baseStyle,
            child: const Text('Войти'),
          ),
        ),
        const SizedBox(height: 50),
        SizedBox(
          height: 50,
          child: TextButton(
            onPressed: () {},
            style: baseStyle.copyWith(
              backgroundColor: WidgetStateProperty.all(Colors.black),
              foregroundColor: WidgetStateProperty.all(Colors.white),
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
          child: TextButton(
            onPressed: () {},
            style: baseStyle.copyWith(
              backgroundColor: WidgetStateProperty.all(
                const Color.fromRGBO(34, 36, 38, 1),
              ),
              foregroundColor: WidgetStateProperty.all(Colors.white),
              side: WidgetStateProperty.all(BorderSide.none),
            ),
            child: const Text('Еще'),
          ),
        ),
      ],
    );
  }
}

class _FooterWidget extends StatelessWidget {
  const _FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const small = TextStyle(color: Colors.white, fontSize: 13);

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