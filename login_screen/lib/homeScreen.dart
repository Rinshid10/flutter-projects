import 'package:flutter/material.dart';
import 'package:login_screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        leading: Icon(
          Icons.home,
          size: 35,
          color: Colors.white,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  logout(context);
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                )),
          )
        ],
        title: Text(
          'HOME SCREEN',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (ctx, index) {
          return Text('rinshid $index'.toUpperCase());
        },
        itemCount: 30,
      ),
    );
  }

  Future logout(BuildContext context) async {
    final _sharedpref = await SharedPreferences.getInstance();
    _sharedpref.clear();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctx) => LoginScreen()));
  }
}
