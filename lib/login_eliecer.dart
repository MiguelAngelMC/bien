import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LoginEjemplo extends StatefulWidget {
  static String id = 'login_page';

  @override
  _LoginEjemploState createState() => _LoginEjemploState();
}

class _LoginEjemploState extends State<LoginEjemplo> {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Lista en tiempo real"),
        ),
        body:
            //Center(
            //child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //children: [
            StreamBuilder(
          stream: Firestore.instance.collection('usuarios').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            List<DocumentSnapshot> docs = snapshot.data.documents;
            return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> data = docs[index].data;
                  return ListTile(
                    leading: Checkbox(
                      value: data['admin'],
                      onChanged: (bool value) {},
                    ),
                    title: Text(data['nombre']),
                  );
                });
          },
        ),
        /*Flexible(
                child: Image.asset(
                  'images/logo.png',
                  height: 120,
                  width: 120,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              _userTextField(),
              SizedBox(
                height: 15,
              ),
              _passwordTextField(),
              SizedBox(
                height: 15,
              ),
              _buttonLogin(),
              SizedBox(
                height: 5,
              ),
              _buttonRegister(),
              SizedBox(
                height: 15,
              ),
              _forgotPassButton(),*/
        //],
      ),
    );
  }

  Widget _userTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 36),
          child: TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'ejemplo@correo.com',
              labelText: 'Correo electrónico',
            ),
            onChanged: (value) {},
            keyboardType: TextInputType.emailAddress,
          ),
        );
      },
    );
  }

  Widget _passwordTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 36),
          child: TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.lock_rounded),
              hintText: 'contraseña',
              labelText: 'Contraseña',
            ),
            onChanged: (value) {},
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
          ),
        );
      },
    );
  }

  Widget _forgotPassButton() {
    return Container(
      child: InkWell(
        child: Text(
          '¿Olvidaste tu contraseña?',
          style: TextStyle(
            fontSize: 15,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontFamily: 'Monserrat',
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  Widget _buttonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
        onPressed: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 75, vertical: 15),
          child: Text(
            'Iniciar Sesión',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        color: Colors.blueAccent,
      );
    });
  }

  Widget _buttonRegister() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
        onPressed: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 11),
          child: Text(
            'Crear cuenta nueva',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.green,
      );
    });
  }
}
