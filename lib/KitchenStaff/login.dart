import 'package:flutter/material.dart';
import 'dart:convert'; //to convert http response in json format
import 'package:http/http.dart' as http;
import 'order.dart'; //to handle http request
// import 'registration.dart';

class Model {
  String email;
  String password;

  Model({this.email, this.password});

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(email: json['email'], password: json['password']);
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["email"] = email;
    map["password"] = password;

    return map;
  }
  // Model.fromJson(Map<String, dynamic> json) {

  //   email = json['email'];
  //   password = json['password'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['password'] = this.password;
  //   data['email'] = this.email;

  //   return data;
  // }
}

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
              icon: Icon(Icons.group_add),
              iconSize: 30.0,
              onPressed: () {},
            ),
          ],
          backgroundColor: Colors.brown,
          title: Text('Login'),
          centerTitle: true,
        ),
        body: SnackBarPage(),
      ),
    );
  }
}

class SnackBarPage extends StatefulWidget {
  // const SnackBarPage({Key key}) : super(key: key);

  // Boolean variable for CircularProgressIndicator.
  static final url = 'http://192.168.254.2:8000/api/login/';

  @override
  _SnackBarPageState createState() => _SnackBarPageState();
}

class _SnackBarPageState extends State<SnackBarPage> {
  bool visible = false;

  Future<Model> userLogin(String url, {Map body}) async {
    // Showing CircularProgressIndicator using state.
    setState(() {
      visible = true;
    });

    return http.post(url, body: body).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode == 201) {
        setState(() {
          visible = false;
        });
        // throw new Exception("Error while fetching data");
      }

      return Model.fromJson(json.decode(response.body));
    });
  }

  final TextEditingController emailController = new TextEditingController();

  final TextEditingController passwordController = new TextEditingController();

  //  _formKey and _autoValidate
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.restaurant_menu,
                    color: Colors.brown[400],
                    size: 85,
                  ),
                  SizedBox(height:30),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: new Form(
                        key: _formKey,
                        autovalidate: _autoValidate,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.email, size: 25),
                                hintText: 'Email',
                                labelText: 'Email',
                              ),
                              validator: validateEmail,
                            ),
                            TextFormField(
                              controller: passwordController,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.lock, size: 25),
                                hintText: '**************',
                                labelText: 'Password',
                              ),
                              obscureText: true,
                              validator: validatePassword,
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
                                      onPressed: () async {
                                        // _validateInputs();
                                        Model newModel = new Model(
                                            email: emailController.text,
                                            password: passwordController.text);
                                        Model p = await userLogin(
                                            SnackBarPage.url,
                                            body: newModel.toMap());
                                        print(p.email);
                                        // Navigate to Profile Screen & Sending Email to Next Screen.
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Order()));

                                        final snackBar = SnackBar(
                                            content: Text(
                                                'Invalid login credential.'));

// Find the Scaffold in the widget tree and use it to show a SnackBar.
                                        Scaffold.of(context)
                                            .showSnackBar(snackBar);

                                        setState(() {
                                          visible = false;
                                        });
                                      },
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
                          ],
                        ),
                      )),
                  Visibility(
                      visible: visible,
                      child: Container(child: CircularProgressIndicator())),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value) || value.length == 0)
    return 'Enter valid email';
  else
    return null;
}

String validatePassword(String value) {
  if (value.length < 6 || value.length == 0)
    return 'Enter password with more than 5 character.';
  else
    return null;
}
