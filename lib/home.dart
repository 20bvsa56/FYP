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
 final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _formKey,
        appBar: AppBar(
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.wc),
              iconSize: 25.0,
              onPressed: () {},
            ),
          ],
          backgroundColor: Colors.black,
          title: Text('Welcome to Tastyorama'),
          centerTitle: true,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/bg.jpeg'),
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
                    SizedBox(
                      height: 30,
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(100, 10, 100, 0),
                      child: TextFormField(
                        enabled: false,
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Table-1',
                          filled: true,
                          fillColor: Colors.grey,
                          contentPadding: const EdgeInsets.only(
                              left: 30.0, bottom: 6.0, top: 8.0),
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
                  padding: EdgeInsets.fromLTRB(95, 40, 90, 0),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    child: RaisedButton(
                      color: Colors.black,
                      onPressed: () {
                        // Navigate to the main view screen using a named route '/view'.
                          Navigator.pushNamed(context, '/view');
                        // Validate returns true if the form is valid, or false
                        // otherwise.
                        if (_formKey.currentState.validate()) {
                          // If the form is valid, display a Snackbar.
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Proceeding...')));
                        }
                      },
                      child: Text(
                        'Proceed',
                        style: TextStyle(color: Colors.white,fontSize: 22,fontFamily: 'Rancho-Regular',)
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.green)),
                    ),
                  )),

                   Padding(
                  padding: EdgeInsets.fromLTRB(105, 20, 90, 0),
                  child: Container(
                    height: 35,
                    width: 80,
                    child: RaisedButton(
                      color: Colors.black,
                      onPressed: () {
                        // Navigate to the main login screen using a named route '/login'.
                          Navigator.pushNamed(context, '/login');
                        // Validate returns true if the form is valid, or false
                        // otherwise.
                        if (_formKey.currentState.validate()) {
                          // If the form is valid, display a Snackbar.
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Proceeding...')));
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'Rancho-Regular',)
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.green)),
                    ),
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
