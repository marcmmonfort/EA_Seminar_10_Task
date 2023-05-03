import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Algunos datos de ejemplo
  String _name = "SEMINARI 10-Flutter";
  String _email = "flutter@gmail.com";

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  Future getUserInfo() async {
    // Obtain the ID of the user from the local storage (shared preferences) ...
    SharedPreferences userInformation = await SharedPreferences.getInstance();
    String ?idUser = userInformation.getString('userId');
    String path = 'http://192:168:56:1:3002/user/$idUser';
    var response = await Dio().get(path);
    if (response.statusCode == 200) {
      setState(() {
        this._name = response.data['name'];
        this._email = response.data['email'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        shadowColor: Color.fromRGBO(0, 0, 128, 4),
        backgroundColor: Color.fromRGBO(0, 0, 128, 4),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 104, 96, 139),
            
            ),
            child: Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor:Color.fromRGBO(0, 0, 128, 4),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              _name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              _email,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
