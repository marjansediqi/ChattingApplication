import 'package:chatapp/service/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(child: Text(
          "Logout"
        ),
        onPressed: (){
          authService.signOut();
        },
        ),
      ),
    );
  }
}
