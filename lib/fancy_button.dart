import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FancyButton extends StatelessWidget {

  FancyButton({@required this.onPressed});

 final GestureTapCallback onPressed;

 @override
  Widget build(BuildContext context){
   return new RawMaterialButton(
       fillColor: Colors.teal,
       splashColor: Colors.tealAccent,
       child: Padding(
         padding: const EdgeInsets.symmetric(
             vertical: 8.0,
             horizontal: 20.0,
         ),
         child: Text(
          "Encuesta",
         style: TextStyle(
           color: Colors.white
         ),
        ),
       ),
     onPressed: onPressed,
     shape: const StadiumBorder(),
       );
 }
}