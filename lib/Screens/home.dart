
import 'dart:convert';

import 'package:api_call/Model/User.dart';
import 'package:api_call/Services/UserApi.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<User> users=[];

  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        title: const Text("Rest API Call"),
      ),

      body: ListView.builder(
        itemCount: users.length,
          itemBuilder: (context,index){
            final user=users[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.white),
              title: Text(user.fullName, style: TextStyle(color: Colors.white),),
              subtitle: Text(user.phone, style: TextStyle(color: Colors.white),),
              trailing: Icon(Icons.arrow_forward, color: Colors.white),
            ),
          ),
        );
      }),
    );
  }

  Future<void> fetchUsers() async {
    final response=await UserApi.fetchUsers();
    setState(() {
      users=response;
    });
  }
}


