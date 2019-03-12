
import 'package:flutter/material.dart';
import 'package:flutter_login/ClipCube.dart';
import 'package:flutter_login/login_widgets.dart';

class LoginPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => LoginPageState();

}

class LoginPageState extends State<LoginPage> with TickerProviderStateMixin, LoginWidgets{

  AnimationController _animationControllerEmail;
  Animation<double> _animationEmailTransition;
  Animation<double> _animationPasswordTransition;
  Animation<double> _animationHeightFromLeft;
  Animation<double> _animationHeightFromRight;
  Animation<double> _animationFadeIn;
  Animation<double> _animationFadeOut;
  Animation<double> _animationAngleOut;
  Animation<double> _animationAngleIn;

  AnimationController _animationControllerPassword;
  Animation<double> _animationOpenedHeight;
  Animation<double> _animationOpenedWidth;
  Animation<double> _animationPasswordOpacity;
  Animation<double> _animationSuccessScreenOpacity;
  Animation<double> _animationSuccessScreenScale;

  double screenWidth;

  void _animationEmail() {
    _animationControllerEmail.forward();
  }

  void _passwordAnimation(){
    _animationControllerPassword.forward();
  }

  @override
  void initState() {
    super.initState();
    _animationControllerEmail =  AnimationController(duration: const Duration(milliseconds: 700), vsync: this);
    _animationControllerPassword =  AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    MediaQueryData mediaQueryData = MediaQuery.of(context);

    screenWidth = mediaQueryData.size.width;

    _animationEmailTransition = Tween(begin: 0.0, end: screenWidth*-1).animate(_animationControllerEmail)
      ..addListener((){
      setState((){});
    });

    _animationPasswordTransition = Tween(begin: screenWidth, end: 0.0).animate(_animationControllerEmail);

    _animationHeightFromLeft = Tween(begin: 0.0, end: 150.0).animate(_animationControllerEmail);

    _animationHeightFromRight = Tween(begin: 150.0, end:  0.0).animate(_animationControllerEmail);

    _animationFadeIn = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationControllerEmail,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut
    ));
    
    _animationFadeOut = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationControllerEmail,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut
    ));
    

    _animationAngleOut = Tween( begin: 0.0, end:0.1).animate(CurvedAnimation(
        parent: _animationControllerEmail,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut
    ));
    _animationAngleIn = Tween( begin: -0.1, end:0.0).animate(CurvedAnimation(
        parent: _animationControllerEmail,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut
    ));
    
    //Password Screen Animations
    _animationSuccessScreenOpacity = Tween(begin: 0.0, end:1.0).animate(CurvedAnimation(
        parent: _animationControllerPassword,
        curve: Interval(0.0, 0.1)
    ))..addListener((){
      setState(() {});
    });

    _animationPasswordOpacity = Tween(begin: 1.0, end:0.0).animate(CurvedAnimation(
        parent: _animationControllerPassword,
        curve: Interval(0.0, 0.3, curve: Curves.easeIn)
    ))..addListener((){
      setState(() {});
    });

    _animationOpenedHeight = Tween(begin: 0.0, end: 50.0).animate(CurvedAnimation(
        parent: _animationControllerPassword,
        curve: Interval(0.3, 0.6)
    ))..addListener((){
      setState(() {});
    });

    _animationOpenedWidth = Tween(begin: screenWidth/2, end: 0.0).animate(CurvedAnimation(
        parent: _animationControllerPassword,
        curve: Interval(0.3, 0.6, curve: Curves.easeOut)
    ))..addListener((){
      setState(() {});
    });



    _animationSuccessScreenScale = Tween(begin:0.5, end:1.0).animate(CurvedAnimation(
        parent: _animationControllerPassword,
        curve: Interval(0.6, 1, curve: Curves.elasticOut)
    ))..addListener((){
      setState(() {});
    });
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
                opacity: _animationSuccessScreenOpacity.value,
                child: Transform.scale(scale: _animationSuccessScreenScale.value, child: successScreen())
            ),
            Opacity(
                opacity: _animationFadeIn.value,
                child: Transform.translate(
                    offset: Offset(_animationPasswordTransition.value, 0.0),
                    child: ClipPath(
                      clipper: ClipCube(fromLeft: false, height: _animationHeightFromRight.value),
                      child: passwordScreen(
                          buttonClick:_passwordAnimation,
                          angle :_animationAngleIn.value,
                          width: _animationOpenedWidth.value,
                          openedHeight: _animationOpenedHeight.value,
                          opacity: _animationPasswordOpacity.value
                      )
                    ),
                )
            ),
            Opacity(
                opacity: _animationFadeOut.value,
                child:Transform.translate(
                    offset: Offset(_animationEmailTransition.value, 0.0),
                    child:  ClipPath(
                        clipper: ClipCube(fromLeft: true, height: _animationHeightFromLeft.value),
                        child: emailScreen(_animationEmail,_animationAngleOut.value)
                    ),
                )
            ),

          ],
        )
    );
  }


  @override
  void dispose() {
    _animationControllerEmail.dispose();
    _animationControllerPassword.dispose();
    super.dispose();
  }
}


