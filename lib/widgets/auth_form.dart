import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:maan_food/services/auth_services.dart';
import 'package:maan_food/GlobalComponents/button_global.dart';
import 'package:flutter/gestures.dart';
import 'package:maan_food/constant.dart';
import 'package:nb_utils/nb_utils.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogIn = false;
  var _userEmail = '';
  var _userPassword = '';
  var _userName = '';

  void authenticate(bool authType) {
    final isValid = _formKey.currentState == null
        ? false
        : _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      if (_isLogIn) {
        signInWithEmailAndPassword(_userEmail.trim(), _userPassword.trim(), context);
      } else {
        signUpWithEmailAndPassword(_userEmail.trim(), _userPassword.trim(), context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Form(
        key: _formKey,
        child: Container(
          width: context.width(),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: MultiValidator([
                        RequiredValidator(errorText: "* Required"),
                        EmailValidator(errorText: "Email not valid !"),
                      ]),
                      enabled: true,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'exemple@exemple.com',
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) {
                        _userEmail = value!;
                      },
                    ),
                  ),
                ),
                if (!_isLogIn)
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      validator: RequiredValidator(errorText: "* Required"),
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
                        hintText: 'Jhon Doe',
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) {
                        _userName = value!;
                      },
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    obscureText: true,
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                      MinLengthValidator(6,
                          errorText: "Password should be atleast 6 characters"),
                      MaxLengthValidator(15,
                          errorText:
                              "Password should not be greater than 15 characters")
                    ]),
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (value) {
                      _userPassword = value!;
                    },
                  ),
                ),
                ButtonGlobal(
                  buttontext: _isLogIn ? 'Log In' : 'Sign Up',
                  buttonDecoration:
                      kButtonDecoration.copyWith(color: kMainColor),
                  onPressed: () {
                    authenticate(_isLogIn);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'If you already have an account,  ',
                      style: kTextStyle.copyWith(color: kTitleColor),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Sign In',
                            style: kTextStyle.copyWith(
                                fontWeight: FontWeight.bold, color: kMainColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                setState(() {
                                  _isLogIn = true;
                                  _formKey.currentState!.reset();
                                });
                              }),
                        TextSpan(
                          text: '  If you do not have an account, ',
                          style: kTextStyle.copyWith(color: kTitleColor),
                        ),
                        TextSpan(
                            text: 'Sign Up',
                            style: kTextStyle.copyWith(
                                fontWeight: FontWeight.bold, color: kMainColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                setState(() {
                                  _isLogIn = false;
                                });
                                _formKey.currentState!.reset();
                              }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
