import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // var tables = ['Table No.','Table 1', 'Table 2', 'Table 3', 'Table 4', 'Table 5', 'Table 6'];
  // var currentTableSelected = 'Table No.';
  String dropdownValue = 'Table No.';

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    home:Scaffold(
      appBar: AppBar(
           actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.wc),
              iconSize:25.0,
              onPressed: () {},
            ),
           ],
          backgroundColor: Colors.black,
          title: Text('Welcome to Tastyorama'),
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
            bottom: 20.0,
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
                    DropdownButton<String>(
                        value: dropdownValue,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 30,
                        elevation: 16,
                        style: TextStyle(
                          color: Colors.black
                        ),
                        underline: Container(
                          height: 3,
                          color: Colors.black,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>['Table No.', 'Table 1', 'Table 2', 'Table 3','Table 4', 'Table 5']
                        //.map iterates through the list of dropdown menu
                          .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          })
                          .toList(),
                    ),
                    const SizedBox(height: 60),
                    Container(
                        height:35,
                        width:100,
                        child:Material(
                            borderRadius: BorderRadius.circular(20),
                            shadowColor: Colors.grey[900],
                            color: Colors.black,
                            elevation: 7,
                            child:GestureDetector(
                              onTap:(){
                                  // Navigate to the main view screen using a named route '/view'.
                                Navigator.pushNamed(context, '/view');
                              },
                              child:Center(
                                  child:Text('Proceed',
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
                    const SizedBox(height: 18),
                    Container(
                        height:35,
                        width:100,
                        child:Material(
                            borderRadius: BorderRadius.circular(20),
                            shadowColor: Colors.grey[900],
                            color: Colors.black,
                            elevation: 7,
                            child:GestureDetector(
                              onTap:(){
                                  // Navigate to the main view screen using a named route '/view'.
                                Navigator.pushNamed(context, '/login');
                              },
                              child:Center(
                                  child:Text('Login',
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