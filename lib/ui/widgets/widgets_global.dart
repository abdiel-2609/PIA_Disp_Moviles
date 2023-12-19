import 'package:flutter/material.dart';

class MyTextInput extends StatelessWidget {
  const MyTextInput({super.key, required this.inputController, required this.label});


  final TextEditingController inputController;
  final String label;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: TextFormField(
            controller: inputController,
            decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                prefixIcon:  const Icon(Icons.person),
                labelStyle: const TextStyle(color: Colors.black38),
                labelText: label
            ),
          ),
        ),
      );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 950,
      margin: const EdgeInsets.only(top: 0),
      padding: const EdgeInsets.only(top: 100),
      decoration: const BoxDecoration(color: Colors.white),
      child: child
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.lblText, required this.press});

  final Text lblText;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 12),
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500
          )
        ),
        child: lblText
    );
  }
}

class SizeEspacio extends StatelessWidget {
  const SizeEspacio({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 30,);
  }
}

class MyTextPassword extends StatelessWidget {
  const MyTextPassword({super.key, required this.label, required this.inputController});

  final TextEditingController inputController;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: TextFormField(
          controller: inputController,
          decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              prefixIcon:  const Icon(Icons.lock_outlined),
              labelStyle: const TextStyle(color: Colors.black38),
              labelText: label
          ),
          obscureText: true,
        ),
      ),
    );
  }
}
