import 'package:estados/controllers/usuari_controller.dart';
import 'package:estados/pages/pagina2_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuariCtrl = Get.put(UsuariController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
      body: Obx(
        () => usuariCtrl.existeixuUsuari.value
            ? InformacionUsuario(usuari: usuariCtrl.usuari.value)
            : NoInfo(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        //onPressed: () => Navigator.pushNamed(context, 'pagina2')
        //onPressed: () => Get.to(Pagina2Page()))
        onPressed: () => Get.toNamed('/pagina2'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuari;

  const InformacionUsuario({required this.usuari});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(title: Text('Nombre: ${this.usuari.nombre}')),
          ListTile(title: Text('Edad: ${this.usuari.edad}')),
          Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ...usuari.profesiones
              .map((professio) => ListTile(title: Text(professio))),
        ],
      ),
    );
  }
}

class NoInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('No hi ha cap usuari seleccionat'));
  }
}
