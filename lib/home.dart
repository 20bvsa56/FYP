import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // var tables = ['Table No.','Table 1', 'Table 2', 'Table 3', 'Table 4', 'Table 5', 'Table 6'];
  // var currentTableSelected = 'Table No.';
  // String dropdownValue = 'Table No.';
  bool _isLoading = false;
  var tableController = TextEditingController(text: 'Table-1');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/waiter.jpeg'),
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
                elevation: 200.0,
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
                    Text(
                      "Tastyorama",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Pacifico-Regular',
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    Text(
                      "Digitalized Menu, Smart Service",
                      style: TextStyle(
                        fontFamily: 'Rancho-Regular',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black26,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(100, 10, 100, 0),
                      child: TextFormField(
                        controller: tableController,
                        enabled: false,
                        style: TextStyle(fontSize: 15, color: Colors.black),
                        decoration: InputDecoration(
                          
                          border: OutlineInputBorder(),
                          
                          filled: true,
                          fillColor: Colors.white60,
                          contentPadding: const EdgeInsets.only(
                              left: 13.0, bottom: 6.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(80, 30, 80, 0),
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          child: RaisedButton(
                            color: Colors.brown[500],
                            onPressed: () {
                              // Navigate to the main view screen using a named route '/view'.
                             Navigator.pushNamed(context, '/view');
                                                                                    
                            },
                            child: Text(_isLoading ? 'Proceeding..' : 'Proceed',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontFamily: 'Rancho-Regular',
                                )),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.white70)),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(75, 10, 70, 0),
                        child: Container(
                            height: 35,
                            width: 80,
                            child: RaisedButton(
                              color: Colors.brown[500],
                              onPressed: () {
                                // Navigate to the main login screen using a named route '/login'.
                                Navigator.pushNamed(context, '/login');
                              },
                              child: Text('Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Rancho-Regular',
                                  )),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.white70),
                              ),
                            ))),
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
