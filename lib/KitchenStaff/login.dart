import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
       appBar: AppBar(
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.kitchen),
              onPressed: () {},
            ),
           ],
          backgroundColor: Colors.black,
          title: Text('Login to Tastyorama Cookery'),
          centerTitle: true,
       ),
       body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bg.jpeg'),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            height: 400,
            bottom: 60.0,
            left: 40.0,
            right: 40.0,
            child: Card(
              elevation: 30.0,
              borderOnForeground: true,
              color: Colors.grey[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.restaurant_menu,
                    color: Colors.black,
                    size: 70,
                  ),
                  Text(
                      "Tastyorama",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Pacifico-Regular',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Digitalized Menu, Smart Service",
                      style: TextStyle(
                        fontFamily: 'Rancho-Regular',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    

                  Padding(
                    padding: EdgeInsets.symmetric(vertical:20,horizontal:50),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(
                          icon: Icon(Icons.perm_identity, size: 25),
                          hintText: 'Enter your username',
                          labelText: 'username',
                        ),
                        onSaved: (String value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                        },
                        validator: (String value) {
                            return value.contains('@') ? 'Incorrect username. Try again' : null;
                        },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                          icon: Icon(Icons.lock_outline, size: 22),
                          hintText: 'Enter your password',
                          labelText: 'password',                          
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
                     ],
                    )
                  ),
                    const SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      onPressed: () {
                        // Navigate to the kitchen staff login screen using a named route '/login'.
                        //  Navigator.pushNamed(context, '/login');
                    },
                      textColor: Colors.black,
                      // padding: const EdgeInsets.all(0.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color.fromARGB(20,18,65,100),
                              Color.fromARGB(94,94,103,100),
                              Color.fromARGB(14,52,60,100),
                            ],
                            
                          ),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontFamily: 'Rancho-Regular',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
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