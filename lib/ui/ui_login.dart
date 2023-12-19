import 'package:flutter/material.dart';
import 'package:pia_disp_moviles/ui/ui_principal.dart';
import 'package:pia_disp_moviles/ui/ui_signup.dart';
import 'package:pia_disp_moviles/ui/widgets/widgets_global.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({super.key});

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {

  final TextEditingController _user = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String user = "Abdiel", password = "prueba123";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("BodyTracking")),
        automaticallyImplyLeading: false,
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
                MyTextInput(inputController: _user, label: "Correo o nombre de usuario"),
                MyTextPassword(inputController: _password, label: "Contraseña"),
                const SizeEspacio(),
                MyButton(
                    lblText: const Text("Iniciar Sesion"),
                    press: (){
                      if(_user.text == user && _password.text == password){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PrincipalUI())
                        );
                      }else{
                        showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                scrollable: true,
                                content: const Padding(
                                    padding: EdgeInsets.all(8),
                                  child: Text("Usuario o Contraseña incorrecto"),
                                ),
                                actions: [
                                  ElevatedButton(
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                      }, 
                                      child: const Text("Aceptar"))
                                ],
                              );
                            }
                        );
                      }
                    }
                ),
                const SizeEspacio(),
                const Text("O"),
                const SizeEspacio(),
                MyButton(
                    lblText: const Text("Registrarse"),
                    press: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpUI())
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
