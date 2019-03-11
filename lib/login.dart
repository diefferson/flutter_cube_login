
import 'package:flutter/material.dart';
import 'package:flutter_login/ClipCube.dart';
import 'package:flutter_login/login_widgets.dart';

class LoginPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => LoginPageState();

}

class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin, LoginWidgets{

  AnimationController _animationController;
  Animation<double> _animationEmailTransition;
  Animation<double> _animationPasswordTransition;
  Animation<double> _animationHeightFromLeft;
  Animation<double> _animationHeightFromRight;
  Animation<double> _animationFadeIn;
  Animation<double> _animationFadeOut;
  Animation<double> _animationAngleOut;
  Animation<double> _animationAngleIn;

  double screenWidth;

  void _animationEmail() {
    _animationController.forward();
  }

  void _reverseAnimation(){
    _animationController.reverse();
  }

  @override
  void initState() {
    super.initState();
    _animationController =  AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this)
      ..addListener(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    MediaQueryData mediaQueryData = MediaQuery.of(context);

    screenWidth = mediaQueryData.size.width;

    _animationEmailTransition = Tween(begin: 0.0, end: screenWidth*-1).animate(_animationController)
      ..addListener((){
      setState(() {});
    });

    _animationPasswordTransition = Tween(begin: screenWidth, end: 0.0).animate(_animationController);

    _animationHeightFromLeft = Tween(begin: 0.0, end: 150.0).animate(_animationController);

    _animationHeightFromRight = Tween(begin: 150.0, end:  0.0).animate(_animationController);

    _animationFadeIn = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut
    ));
    _animationFadeOut = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut
    ));

    _animationAngleOut = Tween( begin: 0.0, end:0.1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut
    ));
    _animationAngleIn = Tween( begin: -0.1, end:0.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut
    ));

  }

  @override
  Widget build(BuildContext context) {

    MediaQueryData mediaQueryData = MediaQuery.of(context);

    screenWidth = mediaQueryData.size.width;

    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            Opacity(
              opacity: 0.0,
                child:successScreen()),
            Opacity(
                opacity: _animationFadeIn.value,
                child: Transform.translate(
                    offset: Offset(_animationPasswordTransition.value, 0.0),
                    child: ClipPath(
                      clipper: ClipCube(fromLeft: false, height: _animationHeightFromRight.value),
                      child: passwordStep(_reverseAnimation,_animationAngleIn.value,screenWidth)
                    ),
                )
            ),
            Opacity(
                opacity: _animationFadeOut.value,
                child:Transform.translate(
                    offset: Offset(_animationEmailTransition.value, 0.0),
                    child:  ClipPath(
                        clipper: ClipCube(fromLeft: true, height: _animationHeightFromLeft.value),
                        child: emailStep(_animationEmail,_animationAngleOut.value)
                    ),
                )
            ),

          ],
        )
    );
  }


  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}


