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
      home:Scaffold(
       appBar: AppBar(
          leading: IconButton(
            icon:Icon(Icons.chevron_left),
            onPressed:() => Navigator.pop(context,false),
          ),
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.kitchen),
              iconSize:25.0,
              onPressed: () {},
            ),
           ],
          backgroundColor: Colors.black,
          title: Text('Login'),
          centerTitle: true,
       ),
       body: Stack(//stack puts widgets one upon other
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
            height: 460,
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
                          hintText: '**************',
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
                        const SizedBox(
                          height: 20,
                        ),
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
                        const SizedBox(
                          height: 12,
                        ),
                       Text(
                            "Not registered?",
                          style: TextStyle(
                              color: Colors.black,
                             
                              fontFamily: 'Rancho-Regular',
                              fontSize: 18.0,
                          ),
                          ),
                          const SizedBox(
                          height: 4,
                        ),
                        Container(
                            child: InkWell(
                              onTap: () {
                                //Navigate to the main view screen using a named route '/signup'.
                                Navigator.pushNamed(context, '/signup');
                              },
                                child: Text('Create an account',
                                  style:TextStyle(
                                  color: Colors.black,
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