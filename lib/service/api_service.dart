import 'dart:convert';
import 'dart:io';

import 'package:crud/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;



class ApiService {
  String baseUrl = "http://10.20.234.203:8000/api/";

  Future<List<UserModel>> getUser() async {
    Uri urlUri = Uri.parse(baseUrl + 'getAllUser');
    var response = await http.get(urlUri);

    if(response.statusCode == 200){
      List getJson = jsonDecode(response.body);
      List<UserModel> userModels = [];
      for(var item in getJson){
        userModels.add(UserModel.fromJson(item));
      }
      return userModels;
    }else{
      throw Exception('pesan : gagal mendapatkan data user');
    }
  }

  Future<bool?> deleteUser(String id) async {
    Uri urlUri = Uri.parse(baseUrl + 'deleteUser');
    var headers = {'Content-Type':'application/json'};
    var body = jsonEncode({
      'id' : id,
    });

    var response = await http.post(
      urlUri,
      headers : headers,
      body: body
    );
    print('pesan ${response.statusCode}');
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  Future<bool?> addUser(
      String nama,
      String kelas,
      String jurusan,
      String telfon,
      String alamat
  ) async{
    Uri uriUrl = Uri.parse(baseUrl+'addUser');
    var headers = {'Content-Type':'application/json'};
    var body = jsonEncode({
      'nama' : nama,
      'kelas' : kelas,
      'jurusan' : jurusan,
      'telfon' : telfon,
      'alamat' : alamat
    });

    final response = await http.post(
      uriUrl,
      headers: headers,
      body: body
    );

    if(response.statusCode == 200){

      return true;
    }else{
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
      ) async{
    Uri uriUrl = Uri.parse(baseUrl+'editUser');
    var headers = {'Content-Type':'application/json'};
    var body = jsonEncode({
      'id' : id,
      'nama' : nama,
      'kelas' : kelas,
      'jurusan' : jurusan,
      'telfon' : telfon,
      'alamat' : alamat
    });

    final response = await http.post(
        uriUrl,
        headers: headers,
        body: body
    );

    if(response.statusCode == 200){

      return true;
    }else{
      return false;
    }
  }
}