
import 'package:crud/model/user_model.dart';
import 'package:crud/service/api_service.dart';
import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {

  List<UserModel>? _userModels;

  List<UserModel>? get userModels => _userModels;

  Future<void> getAlluser() async {
    try{
      _userModels = await ApiService().getUser();
    }catch(e){
      print(e);
    }
    notifyListeners();
  }

  Future<bool?> deleteUser(String id) async {
    try{
      bool? response = await ApiService().deleteUser(id);
      if(response == true){
        return true;
      }else{
        return false;
      }
    }catch(e){
      return false;
    }
  }

  Future<bool?> addUser(
      String nama,
      String kelas,
      String jurusan,
      String telfon,
      String alamat
  ) async {
    try{
      bool? response = await ApiService().addUser(
          nama,
          kelas,
          jurusan,
          telfon,
          alamat
      );

      if(response == true){
        return true;
      }else{
        return false;
      }
    }catch(e){
      return false;
    }
  }

  Future<bool?> updateUser(
      String id,
      String nama,
      String kelas,
      String jurusan,
      String telfon,
      String alamat
      ) async {
    try{
      bool? response = await ApiService().updateUser(
          id,
          nama,
          kelas,
          jurusan,
          telfon,
          alamat
      );

      if(response == true){
        return true;
      }else{
        return false;
      }
    }catch(e){
      return false;
    }
  }
}