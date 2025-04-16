import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(height: MediaQuery.of(context).size.height * 0.2),

                Icon(Icons.android , size: 80,),
                
              Text('Hello again!', style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),),
          
              SizedBox(height: 10,),
          
              Text('Welcome back, you\'ve been missed', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
          
                SizedBox(height: 20,),
          
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10 ,vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.deepPurple , width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
          
                    child: TextField( decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                      icon: Icon(Icons.person),
                    ), ),
                  ),
                ),
          
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10 ,vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.deepPurple, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
          
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      icon: Icon(Icons.lock),
                    ), ),
                  ),
                ),
          
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Center(
                      child: Text(
                        'SignIn', style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),),
                    ),
                  ),
                ),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member?'),
          
                    SizedBox(width: 10,),
          
                    Text('Register now', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),)
                  ],
                ),
          
          
            ],),
          ),
        ),
      )
    );
  }
}
