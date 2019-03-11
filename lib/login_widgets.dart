import 'package:flutter/material.dart';

class LoginWidgets{

  Widget emailStep(Function buttonClick, double angle) {
    return Container(
        color: Colors.blue,
        child:Padding(padding: EdgeInsets.all(20),
            child:  Transform.rotate(
            angle: angle,
            alignment: Alignment.centerRight,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                    width: double.infinity,
                    height: 50,
                    child:  RaisedButton(
                      child: const Text('Continuar'),
                      color: Colors.white,
                      textColor: Colors.blue,
                      onPressed: buttonClick,
                    )
                )
              ],
            )
            )
        )
    );
  }

  Widget passwordStep(Function buttonClick, double angle, double screenWidth) {
    return Stack(children: <Widget>[
        Row(
          children: <Widget>[
            Container(
                color: Colors.red,
                width: screenWidth/2
            ),
            Container(
                color: Colors.blue,
                width: screenWidth/2
            ),
          ],
        ),
        Container(
        child: Padding(
            padding: EdgeInsets.all(20),
            child:  Transform.rotate(
                angle: angle,
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                        width: double.infinity,
                        height: 50,
                        child: RaisedButton(
                          child: const Text('Entrar'),
                          color: Colors.white,
                          textColor: Colors.red,
                          onPressed: buttonClick,
                        )
                    )
                  ],
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
}