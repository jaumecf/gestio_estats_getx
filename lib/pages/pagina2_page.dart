import 'package:estados/controllers/usuari_controller.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuariCtrl = Get.find<UsuariController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              child: Text('Establecer Usuario',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuariCtrl.carregaUsuari(
                  Usuario(
                      nombre: 'Jaume Camps',
                      edad: 30,
                      profesiones: ['FrontEnd', 'BackEnd']),
                );
                Get.snackbar(
                  'Usuari afegit',
                  'Usuari afegit correctament',
                  backgroundColor: Colors.white,
                  boxShadows: [
                    BoxShadow(color: Colors.black38, blurRadius: 10),
                  ],
                );
              }),
          MaterialButton(
              child:
                  Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuariCtrl.canviarEdat(35);
              }),
          MaterialButton(
              child: Text('Añadir Profesion',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuariCtrl.afegirProfessio(
                    'Professió #${usuariCtrl.professionsCount + 1}');
              }),
          MaterialButton(
              child:
                  Text('Canviar Tema', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                Get.changeTheme(
                    Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              }),
        ],
      )),
    );
  }
}
