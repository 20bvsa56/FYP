import 'package:flutter/material.dart';
import 'dart:convert'; //to convert http response in json format
import 'package:http/http.dart' as http;
import 'order.dart'; //to handle http request
import 'registration.dart';

class Model {
  int id;
  String username;
  String password;

  Model({this.id, this.username, this.password});

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
        id: json['id'], username: json['username'], password: json['password']);
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = username;
    map["password"] = password;

    return map;
  }
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
              icon: Icon(Icons.kitchen),
              iconSize: 25.0,
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
  const SnackBarPage({Key key}) : super(key: key);

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

  final TextEditingController usernameController = new TextEditingController();

  final TextEditingController passwordController = new TextEditingController();

  //  _formKey and _autoValidate
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
          height: 420,
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
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                      child: Form(
                        key: _formKey,
                        autovalidate: _autoValidate,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: usernameController,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.perm_identity, size: 25),
                                hintText: 'Enter username',
                                labelText: 'Username',
                              ),
                            ),
                            TextFormField(
                              controller: passwordController,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.lock_outline, size: 22),
                                hintText: '**************',
                                labelText: 'Password',
                              ),
                              obscureText: true,
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
                                      onPressed: () async {
                                        Model newModel = new Model(
                                            username: usernameController.text,
                                            password: passwordController.text);
                                        Model p = await userLogin(
                                            SnackBarPage.url,
                                            body: newModel.toMap());
                                        print(p.username);

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Order()));
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
                                   Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Registration()),
  );
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

// String validateUsername(String value) {
//   if (username == usernameController)
//     return 'Enter username with more than 3 character.';
//   else
//     return null;
// }
