import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButtons extends StatelessWidget {
  //constructeur
  final String text; 
  final int backgroundcolor; 
  final int textcolor;
  final double textSize; 
  final Function callback; 
  final int containercolor;
  CalculatorButtons({
    Key key, 
    this.text, 
    this.backgroundcolor, 
    //si @required pas de valeurs de base
    this.textcolor = 0xFFFFFFFF,
    this.textSize, 
    this.callback, 
    this.containercolor, 
  }) : super(key: key); 
  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.all(10.0),
      child: SizedBox(
        height: 65, 
        width: 65, 
        child: Container(
          decoration: BoxDecoration(
            color:  containercolor != null ? Color(0xFFEAF2F8) : null, 
            shape: BoxShape.circle, 
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 21), 
                blurRadius: 30.0, 
                color: Colors.black.withOpacity(0.4), 
              ),
            ],
          ),
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), 
            ),
            onPressed: () {
              callback(text); 
            },
            //verification ajout (car initialisation val de départ sans @requiredd)
            //ajout int en parametre Color()
            color: backgroundcolor != null ? Color(backgroundcolor) : null, 
            child: Text(text, 
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: 23, 
                color: textcolor != null ? Color(textcolor) : null, 
              )
            ),), 
          ),
        ),
      ),
    );
  }
}

class OthermodelButton extends StatelessWidget {
   //le constructeur
  final String text; 
  final int backgroundcolor; 
  final int textcolor;
  final double textSize; 
  final Function callback; 
  OthermodelButton({
    Key key, 
    this.text, 
    this.backgroundcolor, 
    this.textcolor, 
    this.textSize, 
    this.callback, 
  }) : super(key: key); 
  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.all(15.0), 
       //ou passer par les paramètres width et height du Container
       child: SizedBox(height: 65, width: 145,
       child: Container(
         //shadow decoration
          decoration: BoxDecoration(
            shape: BoxShape.circle, 
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 21), 
                blurRadius: 30.0, 
                color: Colors.black.withOpacity(0.4), 
              ),
            ],
          ),
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), 
            ),
            onPressed: () {
              callback(text); 
            },
            //verification ajout (car initialisation val de départ sans @requiredd)
            //ajout int en parametre Color()
            color: backgroundcolor != null ? Color(backgroundcolor) : null, 
            child: Text(text, 
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: 23, 
                color: textcolor != null ? Color(textcolor) : null, 
              )
            ),), 
          ),
       ),), 
    );
  }
}