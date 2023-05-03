import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application/infrastructure/models/subject.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(InfoScreen());
}

class InfoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 233, 233),
      appBar: AppBar(
          title: Text('FLUTTER EXERCISE'),
          shadowColor: Color.fromRGBO(0, 0, 128, 4),
          backgroundColor: Color.fromRGBO(0, 0, 128, 4)),
      body: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              'Obtain the ID of the logged user and show the basic information of this user in the ‘Profile’ section. :)',
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.normal,
                fontFamily: 'Pacifico',
                shadows: [
                  Shadow(
                    blurRadius: 5.0,
                    color: Colors.grey,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
            ),
          ),
        ),
    );}
  }