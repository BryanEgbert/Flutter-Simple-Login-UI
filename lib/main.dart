import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import './signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login UI',
      theme: ThemeData(
          primaryColor: Colors.white, accentColor: Colors.deepPurpleAccent),
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
        '/signup': (context) => SignUp(),
      },
    );
  }
}

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'MyApp',
          style: TextStyle(
              fontSize: 20.0,
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        elevation: 0.0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 150.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Login',
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurpleAccent)),
                SizedBox(height: 60.0),
                loginPage(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginPage(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .7,
              child: Column(
                children: [
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
                  SizedBox(height: 30.0),
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
                            content: Text('Welcome'),
                          ));
                        }
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Forgot Password?',
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 17.0),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        children: <TextSpan>[
                          TextSpan(text: '\n'),
                          TextSpan(text: '\n'),
                          TextSpan(
                            text: 'Don\'t have an account?',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 17.0),
                          ),
                          TextSpan(
                              text: ' Sign Up',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 16.0,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, '/signup');
                                })
                        ],
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
