import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
       appBar: AppBar(
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.group_add),
              iconSize:30.0,
              onPressed: () {},
            ),
           ],
          backgroundColor: Colors.black,
          title: Text('Register'),
          centerTitle: true,
       ),
       body:Column(
         children:<Widget>[ 
           Container(
             padding:EdgeInsets.only(left:60, right:60, top:40),
             child: TextFormField(
                decoration: const InputDecoration(
                hintText: 'Enter your full name',
                labelText: 'Full Name',                          
                ),
                onSaved: (String value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
                },
                validator: (String value) {
                return value.contains('@') ? 'Incorrect password. Try again' : null;          },
            ),
          ),
          const SizedBox(height: 15),
          Container(
              padding:EdgeInsets.only(left:60, right:60),
              child: TextFormField(
                  decoration: const InputDecoration(
                  hintText: 'Enter new username',
                  labelText: 'Username',                          
                  ),
                  onSaved: (String value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                  },
                  validator: (String value) {
                  return value.contains('@') ? 'Incorrect password. Try again' : null;          },
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding:EdgeInsets.only(left:60, right:60),
              child: TextFormField(
                  decoration: const InputDecoration(
                  hintText: '**************',
                  labelText: 'Password',                          
                  ),
                  onSaved: (String value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                  },
                  obscureText: true,
                  validator: (String value) {
                  return value.contains('@') ? 'Incorrect password. Try again' : null;          },
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding:EdgeInsets.only(left:60, right:60),
              child: TextFormField(
                  decoration: const InputDecoration(
                  hintText: '**************',
                  labelText: 'Confirm Password',                          
                  ),
                  onSaved: (String value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                  },
                  obscureText: true,
                  validator: (String value) {
                  return value.contains('@') ? 'Incorrect password. Try again' : null;          },
              ),
            ),
            const SizedBox(height: 40),
            Container(
                  height:45,
                  width:130,
                    child:Material(
                      borderRadius: BorderRadius.circular(20),
                        shadowColor: Colors.grey[900],
                        color: Colors.black,
                        elevation: 7,
                          child:GestureDetector(
                           onTap:(){
                            // // Navigate to the main view screen using a named route '/view'.
                            // Navigator.pushNamed(context, '/login');
                           },
                           child:Center(
                              child:Text('Sign Up',
                              style: TextStyle(
                              color:Colors.white,
                              fontFamily: 'Rancho-Regular',
                              // fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                             ),
                          ),
                          ),
                          ),
                      ),
                    ),
              const SizedBox(height:15),
              Container(
                    child: InkWell(
                    onTap: () {
                     //Navigate to the main view screen using a named route '/view'.
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text('Login',
                        style:TextStyle(
                        color: Colors.teal,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Rancho-Regular',
                        fontSize: 17.0,
                        ),
                    ),
                    ),
              ),
            
         ],
       ),
      ),
    );
  }
}