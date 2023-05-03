import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application/infrastructure/models/subject.dart';

class ListScreen extends StatefulWidget {
  //late String idUser;
  const ListScreen({super.key});
  
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  Subject? subject;
  List<Subject> subjectList = <Subject>[];

  @override
  void initState() {
    super.initState();
    getSubjects();
  }

  Future getSubjects() async {
    //http://IP_PC:3000/subject/all
    String path = 'http://192.168.0.115:3002/subject/all';
    var response = await Dio().get(path);
    var registros = response.data as List;
    for (var sub in registros) {
      subjectList.add(Subject.fromJson(sub));
    }
    setState(() {
      subjectList = subjectList;
    });
  }

  Future deleteSubject(String idSubject) async {
    //http://IP_PC:3000/subject/all
    String path = 'http://http://192.168.0.115:3002/subject/$idSubject';
    var response = await Dio().delete(path);
    if (response.statusCode == 200) {
      print('Subject deleted');
    } else {
      print('Ha habido un error con la eliminación del Subject');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              DrawerHeader(child: Column(children: [Expanded(child: Image.network("https://cdn-icons-png.flaticon.com/512/6522/6522516.png")),Text("EA") ,SizedBox(height: 10,width: 100)],)),
                ListTile(
                
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                  onTap: (){
                    Navigator.pushNamed(context, '/profile_screen');

                  }
                ),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text('Information of the app'),
                  onTap: (){
                    Navigator.pushNamed(context, '/info_screen');
                  }
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Log out'),
                  onTap: (){
                    Navigator.pushNamed(context, '/');
                  }
                ),
                ],
              )
        ),
      ),
      appBar: AppBar(
        title: Text('Subjects'),
        shadowColor: Color.fromRGBO(0, 0, 128, 4),
        backgroundColor: Color.fromRGBO(0, 0, 128, 4),
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
              itemCount: subjectList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Color.fromARGB(255, 197, 162, 226),
                  child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: ListTile(
                        title: Text(subjectList[index].name,
                            style: const TextStyle(fontSize: 30.0)),
                        subtitle: Text(subjectList[index].difficulty,
                            style: const TextStyle(fontSize: 20.0)),
                        trailing: Container(
                          width: 70,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      deleteSubject(subjectList[index].id);
                                      subjectList.removeAt(index);
                                    });
                                  },
                                  icon: const Icon(Icons.delete))
                            ],
                          ),
                        ),
                      )),
                );
              }),
        )
      ]),
    );
  }
}
