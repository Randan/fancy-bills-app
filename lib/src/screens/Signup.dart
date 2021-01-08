import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import '../utils/constants.dart';
import '../utils/toast.dart';
import '../widgets/header.dart';
import '../widgets/drawer.dart';
import '../widgets/button_link.dart';

class SignUpScreen extends StatefulWidget {
  final String title;

  const SignUpScreen({Key key, this.title}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  String email;
  String password;
  String passwordConfirmation;
  bool isPasswordHidden = true;
  bool isPasswordConfirmationHidden = true;

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
                  passwordConfirmationField(),
                  SizedBox(height: kGap),
                  submitButton(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  ButtonLink(
                    title: 'Login',
                    screenName: 'back',
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

  Widget passwordConfirmationField() {
    return Stack(
      children: [
        Expanded(
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: 'Password Confirmation',
              contentPadding: EdgeInsets.only(
                right: 60.0,
              ),
            ),
            validator: (value) {
              if (value == password) return null;
              return 'Password Confirmation is not match to Password';
            },
            obscureText: isPasswordConfirmationHidden,
            onChanged: (value) => setState(() => passwordConfirmation = value),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: FlatButton(
            minWidth: 50.0,
            child: Icon(isPasswordConfirmationHidden
                ? Icons.visibility_off
                : Icons.visibility),
            onPressed: () => setState(() =>
                isPasswordConfirmationHidden = !isPasswordConfirmationHidden),
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

          showToast('Signed Up with $email $password', ToastType.SUCCESS);
          Navigator.of(context).pushNamedAndRemoveUntil(
              kLinkHome, (Route<dynamic> route) => false);
        } else {
          print('Sign Up form is not validated');
        }
      },
      child: Text('Sign Up'),
    );
  }
}
