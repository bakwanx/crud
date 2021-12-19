import 'package:crud/model/user_model.dart';
import 'package:crud/provider/user_provider.dart';
import 'package:crud/utils/notif_snackbar.dart';
import 'package:crud/views/add_user_screen.dart';
import 'package:crud/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserTile extends StatefulWidget {
  final UserModel userModel;
  final int index;
  final GlobalKey<ScaffoldState> scaffoldKey ;
  UserTile(this.userModel, this.index, this.scaffoldKey);

  @override
  State<UserTile> createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  @override
  Widget build(BuildContext context) {

    UserProvider userProvider = Provider.of<UserProvider>(context);

    void deleteHandler() async {
      bool? response = await userProvider.deleteUser(widget.userModel.id.toString());
      if(response == true){
        await Provider.of<UserProvider>(context, listen: false).getAlluser();
        NotificationSnackbar.showNotifSnackBar('Berhasil Menghapus', widget.scaffoldKey);
      }else{
        await Provider.of<UserProvider>(context, listen: false).getAlluser();
        NotificationSnackbar.showNotifSnackBar('Gagal Menghapus', widget.scaffoldKey);
      }
    }

    return GestureDetector(
      onTap: (){

      },
      child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 5
          ),
          padding: EdgeInsets.symmetric(
              vertical: 22,
              horizontal: 18
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16)
          ),
          child: Row(
            children: [
              Text(
                '${widget.index + 1} .',
                style: TextStyle(
                  fontWeight: FontWeight.w700
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.userModel.nama}',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${widget.userModel.alamat}',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddUserScreen(userModel: widget.userModel,)));
                },
                child: Icon(
                  Icons.edit,
                  color: Colors.green,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              GestureDetector(
                onTap: (){
                  deleteHandler();
                },
                child: Icon(
                  Icons.delete_rounded,
                  color: Colors.red,
                ),
              )
            ],
          ),
        )
    );
  }
}
