import 'dart:io';

import 'package:chat_bot/widget/image_pickrer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _firebase = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  var _enterEmail = "";
  var _enterPass = "";
  var _userName = "";
  File? _selectedImage;
  var _isAuthenticating = false;
  var __loginWithPhn = false;

  _submit() async {
    final isValid = _formKey.currentState!.validate();
    print(' $isValid and $_isLogin and $_selectedImage');
    if (__loginWithPhn && !isValid) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter phone number'),
        ),
      );
      return;
    } else if (!isValid || (!_isLogin && _selectedImage == null)) {
      print("INside IF block");
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please add image'),
        ),
      );
      return;
    }

    _formKey.currentState!.save();

    try {
      setState(() {
        _isAuthenticating = true;
      });
      if (__loginWithPhn) {
        _verifyPhoneNumber();
        setState(() {
          _isAuthenticating = false;
        });
      } else if (_isLogin) {
        final userCredential = await _firebase.signInWithEmailAndPassword(
            email: _enterEmail, password: _enterPass);
        print('$_isLogin login  $userCredential');
      } else {
        final userCredential = await _firebase.createUserWithEmailAndPassword(
            email: _enterEmail, password: _enterPass);

        final refStorage = FirebaseStorage.instance
            .ref()
            .child('user_images')
            .child('${userCredential.user!.uid}.jpg');

        await refStorage.putFile(_selectedImage!);
        final imageUrl = await refStorage.getDownloadURL();

        FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'username': _userName,
          'emailaddress': _enterEmail,
          'imageUrl': imageUrl
        });
        print('Image URL $imageUrl');

        // print(userCredential);
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {}
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Authentication Failed.'),
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
    }

    print(_enterEmail);
    print(_enterPass);
  }

  var _phoneNumber = "";
  String _verificationId = "";
  String otp = "", authStatus = "";

  Future<void> _verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: _phoneNumber,
      timeout: const Duration(seconds: 30),
      verificationCompleted: (AuthCredential authCredential) {
        setState(() {
          _snackBar("Your account is successfully verified");
          print("Your account is successfully verified");
        });
      },
      verificationFailed: (Exception authException) {
        setState(() {
          print("Authentication failed");
          _snackBar("Authentication failed");
          print('Failed${authException.toString()}');
        });
      },
      // codeSent: (String verId, int forceCodeResent) {
      //   verificationId = verId;
      //   setState(() {
      //     authStatus = "OTP has been successfully send";
      //   });
      //   otpDialogBox(context).then((value) {});
      // },
      codeSent: (varId, forceCodeResent) {
        setState(() {
          _verificationId = varId;
          _snackBar("OTP has been successfully send $_verificationId");
        });
        otpDialogBox(context, _verificationId);
      },
      codeAutoRetrievalTimeout: (String verId) {
        _verificationId = verId;
        setState(() {
          authStatus = "TIMEOUT";
        });
      },
    );
  }

  Future<void> _signIn(String otp, String varId) async {
    print(
        " OTP ***************************** $otp and $_verificationId  and $varId");
    final credential = await FirebaseAuth.instance
        .signInWithCredential(PhoneAuthProvider.credential(
      verificationId: varId,
      smsCode: otp,
    ));
    FirebaseFirestore.instance
        .collection('users')
        .doc(credential.user!.uid)
        .set({
      'username': 'Phone User',
      'emailaddress': null,
    });
    print(credential.user);
  }

  _snackBar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  var _isLogin = true;
  @override
  Widget build(BuildContext context) {
    Widget content = TextButton(
      onPressed: () {
        setState(() {
          _isLogin = !_isLogin;
        });
      },
      child: Text(_isLogin
          ? "Create an Account"
          : " I already have an account. Login."),
    );
    if (__loginWithPhn) {
      content = Expanded(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer),
              child: const Text('Login'),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    __loginWithPhn = false;
                  });
                },
                child: const Text('Back'))
          ],
        ),
      );
    } else {
      content = TextButton(
        onPressed: () {
          setState(() {
            _isLogin = !_isLogin;
          });
        },
        child: Text(_isLogin
            ? "Create an Account"
            : " I already have an account. Login."),
      );
    }
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                    left: 50, right: 50, top: 10, bottom: 20),
                child: Image.asset('assets/images/chat.png'),
              ),
              Card(
                elevation: 0.5,
                margin: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (!_isLogin)
                            UserImagerPicker(
                              onPickedImage: (image) {
                                _selectedImage = image;
                              },
                            ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            decoration: const InputDecoration(
                                labelText: 'Email Address'),
                            onSaved: (val) {
                              _enterEmail = val!;
                            },
                            validator: (value) {
                              if (__loginWithPhn) {
                                return null;
                              }
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains("@")) {
                                return "Please enter a valid email address";
                              }
                              return null;
                            },
                          ),
                          if (!_isLogin)
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              textCapitalization: TextCapitalization.none,
                              decoration:
                                  const InputDecoration(labelText: 'User Name'),
                              onSaved: (val) {
                                _userName = val!;
                              },
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty ||
                                    value.trim().length < 4) {
                                  return "Please enter a valid User Name";
                                }
                                return null;
                              },
                            ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            onSaved: (val) {
                              _enterPass = val!;
                            },
                            decoration:
                                const InputDecoration(labelText: 'Password'),
                            validator: (value) {
                              if (__loginWithPhn) {
                                return null;
                              }
                              if (value == null ||
                                  value.trim().length < 6 ||
                                  !value.contains("@")) {
                                return '''Password must be follow these condition: 1.Capital letter 2. small letter 3.
                                 special character 4.Number 5.greater 6 character ''';
                              }
                              return null;
                            },
                            autocorrect: false,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          if (_isAuthenticating)
                            const CircularProgressIndicator(),
                          if (!_isAuthenticating)
                            ElevatedButton(
                              onPressed: _submit,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer),
                              child: Text(_isLogin ? "Login" : "Signup"),
                            ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextButton.icon(
                            onPressed: () {
                              setState(() {
                                __loginWithPhn = !__loginWithPhn;
                              });
                            },
                            icon: const Icon(Icons.phone),
                            label: const Text("Login With Phone"),
                          ),
                          if (__loginWithPhn)
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              autocorrect: false,
                              textCapitalization: TextCapitalization.none,
                              decoration: const InputDecoration(
                                  labelText: 'Phone Number'),
                              onSaved: (val) {
                                _phoneNumber = val!;
                              },
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty ||
                                    value.trim().length < 10) {
                                  return "Please enter a Valid phone with country code ";
                                }
                                return null;
                              },
                            ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (!_isAuthenticating) content
                              // TextButton(
                              //     onPressed: () {
                              //       setState(() {
                              //         _isLogin = !_isLogin;
                              //       });
                              //     },
                              //     child: content
                              //Text(_isLogin
                              //     ? "Create an Account"
                              //     : " I already have an account. Login."),
                              // ),

                              // Expanded(
                              //   child: TextButton.icon(
                              //       onPressed: () {
                              //         Navigator.of(context).push(
                              //             MaterialPageRoute(
                              //                 builder: (ctx) =>
                              //                     const PhoneLoginDummy()));
                              //       },
                              //       icon:
                              //           const Icon(Icons.phone_android_rounded),
                              //       label: const Text("Login with Phone")),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

otpDialogBox(BuildContext context, String varId) {
  String otp = "";
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter your OTP'),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              onChanged: (value) {
                otp = value;
              },
            ),
          ),
          contentPadding: const EdgeInsets.all(10.0),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();

                _AuthScreenState()._signIn(otp, varId);
                print(" OTP %%%%%%%%$otp");
              },
              child: const Text(
                'Submit',
              ),
            ),
          ],
        );
      });
}
