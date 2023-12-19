import 'package:flutter/material.dart';
import 'package:pia_disp_moviles/ui/ui_login.dart';
import 'package:pia_disp_moviles/ui/widgets/widgets_global.dart';

class SignUpUI extends StatefulWidget {
  const SignUpUI({super.key});

  @override
  State<SignUpUI> createState() => _SignUpUIState();
}

class _SignUpUIState extends State<SignUpUI> {

  final TextEditingController _user = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("BodyTracking")),
      ),
      body: SingleChildScrollView(
        child: MyContainer(
            child: Column(
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 200,
                  height: 150,
                ),
                const SizeEspacio(),
                MyTextInput(inputController: _email, label: "Ingrese su correo"),
                const SizeEspacio(),
                MyTextInput(inputController: _user, label: "Ingrese su nombre de usuario"),
                const SizeEspacio(),
                MyTextPassword(inputController: _password, label: "Contraseña"),
                const SizeEspacio(),
                MyButton(
                    lblText: const Text("Registrar"),
                    press: (){
                      Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => const LoginUI())
                      );
                    }
                )
              ],
            )
        ),
      ),
    );
  }
}
