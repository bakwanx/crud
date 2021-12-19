import 'package:crud/provider/user_provider.dart';
import 'package:crud/utils/notif_snackbar.dart';
import 'package:crud/views/add_user_screen.dart';
import 'package:crud/widgets/list_user_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var _scaffoldKey =  GlobalKey<ScaffoldState>();
  bool _isLoading = false;

  getUser() async {
    setState(() {
      _isLoading = true;
    });
    await Provider.of<UserProvider>(context, listen: false).getAlluser();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    UserProvider userProvider = Provider.of<UserProvider>(context);

    Widget _body(){
      return _isLoading == false ? Container(
        color: Color(0xffF7F7F7),
        child: Container(
          margin: EdgeInsets.only(
              top: 10
          ),
          child: ListView.builder(
            itemCount: userProvider.userModels?.length,
            itemBuilder: (context, index){
              return UserTile(userProvider.userModels![index], index, _scaffoldKey);
            },
          ),
        ),
      ) : Center(child: CircularProgressIndicator(),);
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("CRUD"),
        automaticallyImplyLeading: false,
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddUserScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
