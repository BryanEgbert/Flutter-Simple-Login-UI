import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.deepPurpleAccent,
            onPressed: () {
              Navigator.pop(context);
            }),
        elevation: 0.0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sign Up',
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurpleAccent)),
                SizedBox(height: 60.0),
                signupPage(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget signupPage(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * .7,
          child: Column(children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Full name',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).accentColor, width: 2.0),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Full name required!';
                } else if (value.length <= 1) {
                  return 'This is not a full name.';
                } else {
                  return null;
                }
              },
              obscureText: false,
            ),
            SizedBox(height: 25.0),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Email',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).accentColor, width: 2.0),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (!value.contains('@') || value.isEmpty) {
                  return 'Email required!';
                }
                return null;
              },
              obscureText: false,
            ),
            SizedBox(height: 25.0),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Username',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).accentColor, width: 2.0),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Username required!';
                }
                return null;
              },
              obscureText: false,
            ),
            SizedBox(height: 25.0),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Password',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).accentColor, width: 2.0),
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Password required!';
                }
                return null;
              },
              obscureText: true,
            ),
          ]),
        ),
        SizedBox(height: 80.0),
        Container(
          width: MediaQuery.of(context).size.width * .7,
          height: 50.0,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
            color: Theme.of(context).accentColor,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _scaffoldKey.currentState.showSnackBar(SnackBar(
                  content: Text('Processing Data'),
                ));
              }
            },
            child: Text(
              'Submit',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ),
      ]),
    );
  }
}
