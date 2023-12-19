import 'package:flutter/material.dart';
import 'package:pia_disp_moviles/ui/carousel_page.dart';
import 'package:pia_disp_moviles/ui/ui_login.dart';
import 'package:pia_disp_moviles/ui/ui_principal.dart';

class MenuLateral extends StatelessWidget{
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("Abdiel"),
            accountEmail: Text("abdiel@prueba.com"),
          ),
          Ink(
            color: Colors.indigo,
            child: ListTile(
              title: const Text("Inicio", style: TextStyle(color: Colors.white),),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PrincipalUI()));
              },
            ),
          ),
          ListTile(
            title: const Text("Carrusel"),
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Carousel())
              );
            },
          ),
          ListTile(
            title: const Text("Cerrar Sesión"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginUI()));
            },
          )

        ],
      ) ,
    );
  }
}