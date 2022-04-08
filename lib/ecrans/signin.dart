import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_chaty/common/construct.dart';
import 'package:get_chaty/services/auth.dart';
import '../common/chargement.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final Authentification _auth = Authentification();
  final _formKey = GlobalKey<FormState>();
  String err = '';
  bool chargement = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isConnected = true;

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void toggleView() {
    _formKey.currentState?.reset();
    err = '';
    setState(() {
      emailController.text = '';
      passwordController.text = '';
      isConnected = !isConnected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return chargement ? Chargement() : Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: Text(isConnected ? 'Veuillez vous connecter' : 'Veuillez vous inscrire!'),
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(CupertinoIcons.person, color: Colors.white,),
            label: Text(isConnected ? 'Connexion' : 'Inscription',
              style: TextStyle(color: Colors.white),),
            onPressed: () => toggleView(),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 33),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: textInputDecoration.copyWith(hintText: 'Veuillez entrer votre addresse Email'),
                validator: (value) => value!.isEmpty ? 'Veuillez entrer une addresse Mail' : null,
              ),
              SizedBox(height: 20),
          TextFormField(
            controller: passwordController,
            decoration: textInputDecoration.copyWith(hintText: 'Veuillez entrer votre Mot de passe'),
            validator: (value) => value!.length < 6 ? 'Veuillez entrer un Mot de passe avec plus de 6 caracteres ' : null,
          ),
              SizedBox(height: 30),
            ElevatedButton(
              child: Text(
                isConnected ? 'Se Connecter' :  "S'inscrire",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onPressed: () async {
                if(_formKey.currentState!.validate()) {
                  setState(() => chargement = true);
                  var password = passwordController.value.text;
                  var email = emailController.value.text;

                  //TODO call firebase auth
                  dynamic result = isConnected
                      ? await _auth.signInWithEmailAndPassword(email, password)
                      : await _auth.signUpWithEmailAndPassword(email, password);
                  if (result == null) {
                    setState(() {
                      chargement = false;
                      err = 'Veuillez entrer une addresse Mail valide!!';
                    });
                  }
                }
              },
            ),
              SizedBox(height: 10,),
              Text(
                err,
                style: TextStyle(color: Colors.blueGrey, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
