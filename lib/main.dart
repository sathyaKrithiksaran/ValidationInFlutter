import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home : Scaffold(
       appBar: AppBar(
         title: Text("Login Form Validation"),
       ),
       body: LoginForm(),

     ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _Loginformkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _myformlkey = GlobalKey<FormState>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: _myformlkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter Email Address',
                  border: OutlineInputBorder()

                ),
                validator: (value){
                  if(value==null||value.isEmpty){
                    return 'Please Provider Email Address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                  border: OutlineInputBorder()
                ),
                validator: (value){
                  if(value.length<6){
                    return 'Please previder min 6 character';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: (){
                if(_myformlkey.currentState.validate()){
                  return 'ok';
                }

              },

                  child: Text('Login'))
            ],
          ),
        ),
      ),

    );
  }
}



