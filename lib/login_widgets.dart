import 'package:flutter/material.dart';
import 'package:flutter_login/ClipCube.dart';

class LoginWidgets{

  Widget emailScreen(Function buttonClick, double angle) {
    return Container(
        color: Colors.blue,
        child:Padding(padding: EdgeInsets.all(20),
            child: Transform.rotate(
              angle: angle,
              alignment: Alignment.centerRight,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _textField("Email", inputType: TextInputType.emailAddress),
                  SizedBox(height: 20),
                  _button("Continuar", Colors.blue, buttonClick)
                ],
              )
            )
        )
    );
  }

  Widget passwordScreen({Function buttonClick, double angle, double width, double openedHeight, double opacity}) {
    return Stack(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ClipPath(
              clipper: ClipCube(fromLeft: false, height: openedHeight),
              child:Container(color: Colors.red, width: width)),
            ClipPath(
              clipper: ClipCube(fromLeft: true, height: openedHeight),
              child:Container(color: Colors.red, width: width)),
          ],
        ),
        Container(
          child: Padding(
          padding: EdgeInsets.all(20),
          child:  Transform.rotate(
            angle: angle,
            alignment: Alignment.centerLeft,
            child: Opacity(
                opacity: opacity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _textField("Senha", obscure: true),
                    SizedBox(height: 20),
                    _button("Entrar", Colors.red, buttonClick)
                  ],
                )
            )
          )
        )
    )]);
  }

  Widget successScreen(){
    return Material(
      elevation: 4.0,
      child: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Icon(Icons.check_circle, color: Colors.green, size: 80),
              SizedBox(height: 30),
              Text("Logado com Sucesso!", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
          ]
        ),
      ),
    );
  }
  
  Widget _textField(String label, { bool obscure = false, TextInputType inputType = TextInputType.text }){
    return TextField(
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      obscureText: obscure,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
  
  Widget _button(String label, Color textColor, Function action){
    return Container(
        width: double.infinity,
        height: 50,
        child: RaisedButton(
          child: Text(label),
          color: Colors.white,
          textColor: textColor,
          onPressed: action,
        )
    );
  }
}