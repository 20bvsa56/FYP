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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () => Navigator.pop(context, false),
          ),
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.kitchen),
              iconSize: 25.0,
              onPressed: () {},
            ),
          ],
          backgroundColor: Colors.brown,
          title: Text('Login'),
          centerTitle: true,
        ),
        body: Stack(
          //stack puts widgets one upon other
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/login.jpeg'),
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
                    Icon(
                      Icons.restaurant_menu,
                      color: Colors.brown[400],
                      size: 85,
                    ),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: const InputDecoration(
                                icon: Icon(Icons.perm_identity, size: 25),
                                hintText: 'Enter username',
                                labelText: 'Username',
                              ),
                              onSaved: (String value) {
                                // This optional block of code can be used to run
                                // code when the user saves the form.
                              },
                              validator: (String value) {
                                return value.contains('@')
                                    ? 'Incorrect username. Try again'
                                    : null;
                              },
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                icon: Icon(Icons.lock_outline, size: 22),
                                hintText: '**************',
                                labelText: 'Password',
                              ),
                              onSaved: (String value) {
                                // This optional block of code can be used to run
                                // code when the user saves the form.
                              },
                              obscureText: true,
                              validator: (String value) {
                                return value.contains('@')
                                    ? 'Incorrect password. Try again'
                                    : null;
                              },
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(50, 0, 40, 0),
                                child: Container(
                                    height: 35,
                                    width: 100,
                                    child: RaisedButton(
                                      color: Colors.brown[500],
                                      onPressed: () {
                                        // Navigate to the main login screen using a named route '/login'.
                                        // Navigator.pushNamed(context, '/login');
                                      },
                                      child: Text('Login',
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
                              height: 30,
                            ),
                            Text(
                              "Not registered?",
                              style: TextStyle(
                                color: Colors.brown,
                                fontFamily: 'Rancho-Regular',
                                fontSize: 20.0,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Container(
                              child: InkWell(
                                onTap: () {
                                  //Navigate to the main view screen using a named route '/signup'.
                                  Navigator.pushNamed(context, '/register');
                                },
                                child: Text(
                                  'Create an account',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Rancho-Regular',
                                    fontSize: 22.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
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
