
import 'package:encrypt/encrypt.dart';

class Encrypt{


  String  encrypt(String value){
     final plainText = value;
     final key = Key.fromLength(32);
     final iv = IV.fromLength(8);
     final encrypter = Encrypter(Salsa20(key));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    //final decrypted = encrypter.decrypt(encrypted, iv: iv);

   // print(decrypted);
    print(encrypted.base64);


    return encrypted.base64;
  }
}