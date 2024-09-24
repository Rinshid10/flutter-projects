import 'package:flutter/material.dart';
import 'package:login_screen/homeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var inputcntrol = TextEditingController();
    var passcntrol = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        leading: const Icon(
          Icons.person,
          color: Colors.white,
          size: 30,
        ),
        title: const Text(
          'LOGIN PAGE ',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(30),
          padding: const EdgeInsets.all(10),
          width: 350,
          height: 400,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFF0D47A1),
              width: 2,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.person,
                size: 100,
                color: Color(0xFF0D47A1),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: inputcntrol,
                  decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.person,
                        size: 20,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "enter your name"),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: passcntrol,
                    // obscureText: true,       . .....
                    maxLength: 8,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.lock,
                          size: 20,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "password"),
                  ),
                ),
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      named(context);
                      
                      // if (inputcntrol.text == 'rinshid' &&
                      //     passcntrol.text == 'password') {
                      //   Navigator.pushReplacement(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (ctx) => const HomeScreen()));
                      // } else {
                      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //       backgroundColor: Colors.blue[900],
                      //       padding: const EdgeInsets.all(20),
                      //       content:
                      //           const Text('invalid password or user name')));
                      //   // showDialog(
                      //   //     context: context,
                      //   //     builder: (ctx) {
                      //   //       return AlertDialog(
                      //   //         title: Text('dfdsf'),
                      //   //         content: Text('dfdfsdfoi'),
                      //   //         actions: [
                      //   //           TextButton(
                      //   //               onPressed: () {
                      //   //                 Navigator.of(context).pop();
                      //   //               },
                      //   //               child: Text('ok')),
                      //   //         ],
                      //   //       );
                      //   //     });
                      // }
                    },
                    child: const Text('Login')),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future named(BuildContext context) async {
    final username1 = TextEditingController();
    final password = TextEditingController();
    if (username1.text == password.text) {
      final addShare = await SharedPreferences.getInstance();
      await addShare.setBool('username', true);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => HomeScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.blue[900],
          padding: const EdgeInsets.all(20),
          content: const Text('invalid password or user name')));
      print('wrongg');
    }
  }
}
