import 'package:crud/model/user_model.dart';
import 'package:crud/provider/user_provider.dart';
import 'package:crud/utils/notif_snackbar.dart';
import 'package:crud/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddUserScreen extends StatefulWidget {
  final UserModel? userModel;
  AddUserScreen({this.userModel});

  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  var _scaffoldKey =  GlobalKey<ScaffoldState>();
  TextEditingController namaController = TextEditingController();
  TextEditingController kelasController = TextEditingController();
  TextEditingController jurusanController = TextEditingController();
  TextEditingController telfonController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  bool? isEmpty = false;

  @override
  void initState() {
    super.initState();
    if(widget.userModel == null){
      setState(() {
        isEmpty = true;
      });
    }else{
      namaController.text = widget.userModel!.nama!;
      kelasController.text = widget.userModel!.kelas!;
      jurusanController.text = widget.userModel!.jurusan!;
      telfonController.text = widget.userModel!.telfon!;
      alamatController.text = widget.userModel!.alamat!;
    }

  }

  void addUserHandle() async {
    if(namaController.text.isEmpty
        || kelasController.text.isEmpty
        || jurusanController.text.isEmpty
        || telfonController.text.isEmpty
        || alamatController.text.isEmpty){
      NotificationSnackbar.showNotifSnackBar('Harap isi semua form', _scaffoldKey);
    }else{

      bool? response = await Provider.of<UserProvider>(context, listen: false).addUser(
          namaController.text,
          kelasController.text,
          jurusanController.text,
          telfonController.text,
          alamatController.text
      );
      if(response == true){
        NotificationSnackbar.showNotifSnackBar('Berhasil menambahkan data', _scaffoldKey);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=>HomeScreen()));
      }
    }

  }

  void updateUserHandle() async {
    if(namaController.text.isEmpty
        || kelasController.text.isEmpty
        || jurusanController.text.isEmpty
        || telfonController.text.isEmpty
        || alamatController.text.isEmpty){
      NotificationSnackbar.showNotifSnackBar('Harap isi semua form', _scaffoldKey);
    }else{

      bool? response = await Provider.of<UserProvider>(context, listen: false).updateUser(
          widget.userModel!.id.toString()
          namaController.text,
          kelasController.text,
          jurusanController.text,
          telfonController.text,
          alamatController.text
      );
      if(response == true){
        NotificationSnackbar.showNotifSnackBar('Berhasil menambahkan data', _scaffoldKey);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=>HomeScreen()));
      }
    }

  }

  @override
  Widget build(BuildContext context) {

    Widget _body(){
      return SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(30),
          color: Color(0xffF7F7F7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xff2B2937),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20
                ),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white
                  ),
                  controller: namaController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Masukkan Nama',
                    hintStyle: TextStyle(
                      color: Colors.white
                    )
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Kelas',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xff2B2937),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20
                ),
                child: TextFormField(
                  style: TextStyle(
                      color: Colors.white
                  ),
                  controller: kelasController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Masukkan Kelas',
                      hintStyle: TextStyle(
                          color: Colors.white
                      )
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Jurusan',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xff2B2937),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20
                ),
                child: TextFormField(
                  style: TextStyle(
                      color: Colors.white
                  ),
                  controller: jurusanController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Masukkan Jurusan',
                      hintStyle: TextStyle(
                          color: Colors.white
                      )
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Telfon',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xff2B2937),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20
                ),
                child: TextFormField(
                  style: TextStyle(
                      color: Colors.white
                  ),
                  controller: telfonController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Masukkan Telfon',
                      hintStyle: TextStyle(
                          color: Colors.white
                      )
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Alamat',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black
                ),
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xff2B2937),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20
                ),
                child: TextFormField(
                  style: TextStyle(
                      color: Colors.white
                  ),
                  controller: alamatController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Masukkan Alamat',
                      hintStyle: TextStyle(
                          color: Colors.white
                      )
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              //button
              Container(
                height: 50,
                width: double.infinity,
                child: TextButton(
                  onPressed:  (){
                    if(isEmpty == true){
                      addUserHandle();
                    }else{
                      updateUserHandle();
                    }
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xff03a5c1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                      )
                  ),
                  child: Text(
                    'Tambah',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Tambah Pengguna'
        ),
      ),
      body: _body(),
    );
  }
}
