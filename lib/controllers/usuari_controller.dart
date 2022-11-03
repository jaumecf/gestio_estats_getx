import 'package:estados/models/usuario.dart';
import 'package:get/get.dart';

class UsuariController extends GetxController {
  var existeixuUsuari = false.obs;
  var usuari = new Usuario().obs;

  int get professionsCount {
    return this.usuari.value.profesiones.length;
  }

  void carregaUsuari(Usuario pUser) {
    this.usuari.value = pUser;
    this.existeixuUsuari.value = true;
  }

  void canviarEdat(int edat) {
    this.usuari.update((val) => val!.edad = edat);
  }

  void afegirProfessio(String professio) {
    this.usuari.update((val) {
      val!.profesiones = [...val.profesiones, professio];
    });
  }
}
