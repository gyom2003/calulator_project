import 'package:flutter/material.dart';
import 'package:calculator_project/Calculator_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:io';
import 'package:calculator_project/lesclippers.dart';
import 'package:clip_shadow/clip_shadow.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  //construteur
  MyApp({
    Key key
    }) : super(key : key); 

  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //variable du widget
  String _historique  = ""; 
  String _resultat = "";

  void calculatorClick(String text) {
    setState(() {
      _resultat += text;
    });
  }

  void calculatorClean(String text) {
  setState(() {
    _resultat = "";
  });
}
void calculatorCleanTout(String text) {
  setState(() {
    _resultat = "";
    _historique = "";
  });
}


void testcalcul(String text) {
  //a revoire
  Parser p = Parser(); 
  Expression expression = p.parse(_resultat); 
  ContextModel contextModel = ContextModel();
  double evaluationcalcul = expression.evaluate(
    EvaluationType.REAL, contextModel); 
  String evalutionfinal = evaluationcalcul.toString();
  setState(() {
    _historique = _resultat; 
    _resultat = evalutionfinal;
  });
}
  @override
  Widget build(BuildContext context) {
    //variable du builder
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget> [
              UserAccountsDrawerHeader(
                accountName: Text("Guillaume Le Formal"),
                accountEmail: Text("guillaume1.leformal@gmail.com"),
                currentAccountPicture: GestureDetector(
                  onDoubleTap: () {
                    print("c'est l'image de ton compte"); 
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage("https://cdn.dribbble.com/users/17559/screenshots/6664357/figma.png"),
                  )
                ),
                otherAccountsPictures: <Widget> [
                  GestureDetector(
                    onTap: () {
                      //TODO: pouvoir changer l'image de votre compte
                      print("changer l'image du compte ?"); 
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("https://i.pinimg.com/originals/1c/54/f7/1c54f7b06d7723c21afc5035bf88a5ef.png"),
                      //onBackgroundImageError: ,
                    ), 
                  )
                ],
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:  NetworkImage("https://previews.123rf.com/images/ahulilabutin/ahulilabutin1601/ahulilabutin160100120/50322467-calcul-manuscrite-de-math%C3%A9matiques-sup%C3%A9rieures-comme-fond.jpg"), 
                    fit: BoxFit.fill, 
                    scale: 1.0, 
                  )
                )
              ), 
              //rajout des listtiles
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  //TODO: page des paramètres a rajouter
                  onTap: () {

                  },
                  title: Text("Aller dans le paramètres", 
                  style: TextStyle(
                    color: Colors.black45, 
                    fontWeight: FontWeight.w500, 
                    fontSize: 17, 
                  ))
                ),
              ), 
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 10.0),
                 child: ListTile(
                   //TODO: Mode de calculatrice avancée
                   onTap: () {

                   },
                   title: Text("Switcher mode calculatrice avancée", 
                   style: TextStyle(
                      color: Colors.black45, 
                      fontWeight: FontWeight.w500, 
                      fontSize: 17, 
                   ))

              ),
               ), 
              Divider(), 
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 10.0),
                 child: ListTile(
                  onTap: () {
                     Future.delayed(Duration(milliseconds: 1000), () {
                    exit(0); 
                  });
                  },
                   title: (Text("fermer l'application", 
                   style: TextStyle(
                      color: Colors.black45, 
                      fontWeight: FontWeight.w500, 
                      fontSize: 17, 
                   )))
              ),
               ), 
            ],
          ),
        ), 
        appBar : PreferredSize(preferredSize: Size.fromHeight(150), 
        //CircularClipper
        child: CustomClipShadow(
          clipper: CircularClipper(), 
          shadow: Shadow(
            blurRadius: 50, 
            offset: Offset(0, 10)),
        child: Stack(
          children: <Widget> [
            Image.asset("assets/images/math.jpg", 
              fit: BoxFit.fill),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50), 
            ),
            //ou Spacer(flex: ) , 
             IconButton(
              color: Colors.white,
              icon: Icon(Icons.exit_to_app), 
              onPressed: () {
                print("tu as quitter l'application"); 
                Future.delayed(Duration(milliseconds: 1000), () {
                  exit(0); 
                }); 
              },
            ), 
          ],
        ) 
            
           

          
        )),
          body: Column(
                //colonne contient plusieurs row de CalculatorButtons
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget> [
                  //séparer résultat avec Container les 2 textes
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.0), 
                    child: Text(_historique, 
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 25, 
                      ), 
                      color: Colors.grey, 
                    ),
                    ), 
                    //au lieu de Amignement.bottomRight
                    alignment: Alignment(1, 1),
                  ),
                  //espacer les deux résultats
                  SizedBox(height: 15), 
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 35.0), 
                    child: Text(_resultat, 
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 45, 
                      ), 
                      color: Colors.black54, 
                    ),
                    ), 
                    //au lieu de Amignement.bottomRight
                    alignment: Alignment(1, 1),
                  ),
                  //espace en général
                  SizedBox(height: 30),   
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget> [
                        CalculatorButtons( 
                          text: 'AC', 
                          backgroundcolor: 0xFFF5B7B1, 
                          textSize: 26.0,
                          textcolor:  0xffC0392B,
                          callback: calculatorCleanTout,
                        ),
                        CalculatorButtons( 
                          text: '(', 
                          backgroundcolor: 0xFFFFFFFF,
                          textSize: 26.0,
                          textcolor:  0xFFCCD1D1,
                          callback: calculatorClick,
                        ),
                        CalculatorButtons( 
                          text: ')', 
                          backgroundcolor: 0xFFFFFFFF,
                          textSize: 26.0,
                          textcolor:  0xFFCCD1D1,
                          callback: calculatorClick,
                        ),
                        CalculatorButtons( 
                          text: '/', 
                          backgroundcolor: 0xFFF39C12,
                          textSize: 26.0,
                          textcolor:  0xFFFFFFFF,
                          callback: calculatorClick,
                        ),
                      ],
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget> [
                      CalculatorButtons( 
                        text: '7', 
                        backgroundcolor: 0xFFFFFFFF,
                        textSize: 26.0,
                        textcolor:  0xFF000000,
                        callback: calculatorClick,
                      ),
                      CalculatorButtons( 
                        text: '8', 
                        backgroundcolor: 0xFFFFFFFF,
                        textSize: 26.0,
                        textcolor:  0xFF000000,
                        callback: calculatorClick,
                      ),
                      CalculatorButtons( 
                        text: '9', 
                        backgroundcolor: 0xFFFFFFFF,
                        textSize: 26.0,
                        textcolor:  0xFF000000,
                        callback: calculatorClick,
                      ),
                      CalculatorButtons( 
                        text: '*', 
                        containercolor: 0xFFEAF2F8,
                        backgroundcolor: 0xFFF39C12,
                        textSize: 26.0,
                        textcolor:  0xFFFFFFFF,
                        callback: calculatorClick,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget> [
                      CalculatorButtons( 
                        text: '4', 
                        backgroundcolor: 0xFFFFFFFF,
                        textSize: 26.0,
                        textcolor:  0xFF000000,
                        callback: calculatorClick,
                      ),
                      CalculatorButtons( 
                        text: '5', 
                        backgroundcolor: 0xFFFFFFFF,
                        textSize: 26.0,
                        textcolor:  0xFF000000,
                        callback: calculatorClick,
                      ),
                      CalculatorButtons( 
                        text: '6', 
                        backgroundcolor: 0xFFFFFFFF,
                        textSize: 26.0,
                        textcolor:  0xFF000000,
                        callback: calculatorClick,
                      ),
                      CalculatorButtons( 
                        text: '+', 
                        containercolor: 0xFFEAF2F8, //
                        backgroundcolor: 0xFFF39C12,
                        textSize: 26.0,
                        textcolor:  0xFFFFFFFF,
                        callback: calculatorClick,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget> [
                     CalculatorButtons( 
                        text: '1', 
                        backgroundcolor: 0xFFFFFFFF,
                        textSize: 26.0,
                        textcolor:  0xFF000000,
                        callback: calculatorClick,
                      ),
                      CalculatorButtons( 
                        text: '2', 
                        backgroundcolor: 0xFFFFFFFF,
                        textSize: 26.0,
                        textcolor:  0xFF000000,
                        callback: calculatorClick,
                      ),
                      CalculatorButtons( 
                        text: '3', 
                        backgroundcolor: 0xFFFFFFFF,
                        textSize: 26.0,
                        textcolor:  0xFF000000,
                        callback: calculatorClick,
                      ),
                      CalculatorButtons( 
                        text: '-', 
                        containercolor: 0xFFEAF2F8,
                        backgroundcolor: 0xFFF39C12,
                        textSize: 26.0,
                        textcolor:  0xFFFFFFFF,
                        callback: calculatorClick,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget> [
                      OthermodelButton( 
                        text: '0', 
                        backgroundcolor: 0xFFFFFFFF,
                        textSize: 26.0,
                        textcolor:  0xFF000000,
                        callback: calculatorClick,
                      ),
                      CalculatorButtons( 
                        text: '.', 
                        backgroundcolor: 0xFFFFFFFF,
                        textSize: 26.0,
                        textcolor:  0xFF000000,
                        callback: calculatorClick,
                      ),
                      CalculatorButtons( 
                        text: '=', 
                        containercolor: 0xFFEAF2F8,
                        backgroundcolor: 0xFF58D68D ,
                        textSize: 26.0,
                        textcolor:  0xFFFFFFFF,
                        callback: testcalcul
                      ),
                    ],
                  ),
                ],
              ),
          
          
        ),
      
       
    );
  }
  
  bool iscalculbool(String text) { 
  if (text == '/' || text == '*' || text == '+' || text == '-' || text == '=') {
    return true;
  } else {
    return false; 
  }
}
}
