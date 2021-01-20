import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import '../utils/constants.dart';
import '../utils/toast.dart';
import '../widgets/header.dart';
import '../widgets/drawer.dart';
import '../widgets/button_link.dart';

class LoginScreen extends StatefulWidget {
  final String title;

  const LoginScreen({Key key, this.title}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String email;
  String password;
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: widget.title),
      drawer: AppDrawer(),
      body: Container(
        padding: EdgeInsets.all(kGap),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  emailField(),
                  passwordField(),
                  SizedBox(height: kGap),
                  submitButton(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Have no account yet?'),
                  ButtonLink(
                    title: 'Sign Up',
                    screenName: kLinkSignup,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'E-mail',
      ),
      validator: (value) {
        if (EmailValidator.validate(value)) return null;
        return 'Enter valid email';
      },
      onChanged: (value) => setState(() => email = value),
    );
  }

  Widget passwordField() {
    return Stack(
      children: [
        Expanded(
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              hintText: 'Password',
              contentPadding: EdgeInsets.only(
                right: 60.0,
              ),
            ),
            validator: (value) {
              if (value.length >= 8) return null;
              return 'Password must not be less than 8 characters';
            },
            obscureText: isPasswordHidden,
            onChanged: (value) => setState(() => password = value),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: FlatButton(
            minWidth: 50.0,
            child: Icon(
                isPasswordHidden ? Icons.visibility_off : Icons.visibility),
            onPressed: () =>
                setState(() => isPasswordHidden = !isPasswordHidden),
          ),
        ),
      ],
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          FocusScope.of(context).unfocus();

          showToast('Signed In with $email $password', ToastType.SUCCESS);
          Navigator.of(context).pushNamedAndRemoveUntil(
              kLinkHome, (Route<dynamic> route) => false);
        } else {
          print('Login form is not validated');
        }
      },
      child: Text('Login'),
    );
  }
}
