import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // Boolean variable for CircularProgressIndicator.
  bool visible = false;

  // Getting entered value from TextField widget.
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

//creating a async function
  Future userRegistration() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String username = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    //server api url
    var url = 'http://192.168.254.1:8000/api/add_registry';
    

    // Store all data with Param Name.
    var data = {'username': username, 'email': email, 'password': password};

    // Starting  API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }

      // Showing Alert Dialog with Response JSON Message.
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
  }

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
              icon: Icon(Icons.group_add),
              iconSize: 30.0,
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
              height: 450,
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
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: usernameController,
                              decoration: const InputDecoration(
                                hintText: 'Username',
                                labelText: 'Username',
                              ),
                              onSaved: (String value) {
                                // This optional block of code can be used to run
                                // code when the user saves the form.
                              },
                              obscureText: false,
                              validator: (String value) {
                                return value.contains('@')
                                    ? 'Incorrect password. Try again'
                                    : null;
                              },
                            ),
                            TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                labelText: 'Email',
                              ),
                              onSaved: (String value) {
                                // This optional block of code can be used to run
                                // code when the user saves the form.
                              },
                              obscureText: false,
                              validator: (String value) {
                                return value.contains('@')
                                    ? 'Incorrect password. Try again'
                                    : null;
                              },
                            ),
                            TextFormField(
                              controller: passwordController,
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
                                return value.contains('@')
                                    ? 'Incorrect password. Try again'
                                    : null;
                              },
                            ),
                            SizedBox(height: 15),
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
                                      onPressed: userRegistration,
                                      child: Text('Create',
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
                                child: Text(
                                  'Login',
                                  style: TextStyle(
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
                        )),
                    Visibility(
                        visible: visible,
                        child: Container(
                            child: CircularProgressIndicator())),
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
