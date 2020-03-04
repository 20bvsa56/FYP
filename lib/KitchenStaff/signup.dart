import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon:Icon(Icons.chevron_left),
            onPressed:() => Navigator.pop(context,false),
          ),
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.group_add),
              iconSize:30.0,
              onPressed: () {},
            ),
           ],
          backgroundColor: Colors.brown,
          title: Text('Register'),
          centerTitle: true,
        ),
        body: Stack(
          fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/signup.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            height: 400,
            bottom: 30.0,
            left: 40.0,
            right: 40.0,
            child: Card(
              elevation: 30.0,
              borderOnForeground: true,
              color: Colors.brown[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:40),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(
                          hintText: 'Full Name',
                          labelText: 'Full Name',
                        ),
                        onSaved: (String value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                        },
                        validator: (String value) {
                            return value.contains('@') ? 'Incorrect username. Try again' : null;
                        },
                        ),
                        SizedBox(height:15),
                        TextFormField(
                          decoration: const InputDecoration(
                          hintText: 'Username',
                          labelText: 'Username',                          
                        ),
                        onSaved: (String value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                        },
                        obscureText: true,
                        validator: (String value) {
                            return value.contains('@') ? 'Incorrect password. Try again' : null;
                        },
                        ),
                        SizedBox(height:15),
                        TextFormField(
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
                            return value.contains('@') ? 'Incorrect password. Try again' : null;
                        },
                        ),
                        SizedBox(height:15),
                        TextFormField(
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
                            return value.contains('@') ? 'Incorrect password. Try again' : null;
                        },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      Padding(
                                padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                                child: Container(
                                    height: 35,
                                    width: 100,
                                    child: RaisedButton(
                                      color: Colors.brown[500],
                                      onPressed: () {
                                        // // Navigate to the main login screen using a named route '/login'.
                                        // Navigator.pushNamed(context, '/login');
                                      },
                                      child: Text('Submit',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: 'Rancho-Regular',
                                          )),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.white70),
                                      ),
                                    ))),
                        const SizedBox(
                          height: 12,
                        ),
                      
                        Container(
                            child: InkWell(
                              onTap: () {
                                //Navigate to the main view screen using a named route '/login'.
                                Navigator.pushNamed(context, '/login');
                              },
                                child: Text('Login',
                                  style:TextStyle(
                                  color: Colors.grey[500],
                                  decoration: TextDecoration.underline,
                                   fontWeight: FontWeight.bold,
                                  fontFamily: 'Rancho-Regular',
                                  fontSize: 20.0,
                                ),
                                ),
                            ),
                        ), 
                     ],
                    )
                  ),
                ],
              ),
            ),
          ),
        ],
      ),  
        ),
    );
  }
}