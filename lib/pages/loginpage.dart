import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../functions/auth_function.dart';

class LOgInPage extends StatefulWidget {
  const LOgInPage({super.key});

  @override
  State<LOgInPage> createState() => _LOgInPageState();
}

class _LOgInPageState extends State<LOgInPage> {
  final _formkey = GlobalKey<FormState>();
  bool isLogin = false;
  String email = '';
  String password = '';
  String username = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.leave_bags_at_home),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 9, 74, 105),
      ),
      body: Form(
        key: _formkey,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              !isLogin
                  ? TextFormField(
                    key: ValueKey('username'),
                    decoration: InputDecoration(hintText: "Enter Username"),
                    validator: (value) {
                      if (value.toString().length < 3) {
                        return 'Username is so small';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        username = value!;
                      });
                    },
                  )
                  : Container(),
              TextFormField(
                key: ValueKey('email'),
                decoration: InputDecoration(hintText: "Enter Email"),
                validator: (value) {
                  if (!(value.toString().contains('@'))) {
                    return 'Invalid Email';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    email = value!;
                  });
                },
              ),
              TextFormField(
                obscureText: true,
                key: ValueKey('password'),
                decoration: InputDecoration(hintText: "Enter Password"),
                validator: (value) {
                  if (value.toString().length < 6) {
                    return 'Password is so small';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    password = value!;
                  });
                },
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      isLogin
                          ? signin(email, password)
                          : signup(email, password);
                    }
                  },
                  child: isLogin ? Text('Login') : Text('Signup'),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
                child:
                    isLogin
                        ? Text("Don't have an account? Signup")
                        : Text('Already Signed Up? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
