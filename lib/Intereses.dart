import 'package:flutter/material.dart';
import 'fancy_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'PantallaEncuesta2.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: '',
  home: Intereses(),
));
class Intereses extends StatefulWidget {
  final heroTag;
  Intereses({this.heroTag});
  @override
  _InteresesState createState() => _InteresesState();
}
class _InteresesState extends State<Intereses> {
  @override
  Widget build(BuildContext context) {     
    return Scaffold(
      floatingActionButton: FancyButton(
        onPressed: () async
        {
          var datos = await FirebaseDatabase.instance.reference().child("plantilla").child("Construyo un proyecto de vida").once();
          List preguntas = datos.value as List;
          Navigator. of(context).push(
            MaterialPageRoute(builder: (_) => PantallaEncuesta(preguntas: preguntas, tema: 'Construyo un proyecto de vida',)
            ),
          );
          print(datos);
        },
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 20.0,
        title: Text('\nBACK                                       \n', 
        style: TextStyle(fontFamily: 'Armando',fontSize: 19.0, color: Colors.white)),
       centerTitle: true,
        ),
   body: ListView(
      children: <Widget>[          
        Container(
          child: Column(     
              children: <Widget>[ 
                Row(
                      crossAxisAlignment: CrossAxisAlignment.center,                    
                      children: [   
                        Expanded(
                        child: _buildSubSistemaItem('icons/ProyectoDeVida/Subtemas/Intereses2.jpg'),
                        ), 
                      ],
                    ) ,
              Text('         ',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'nombrefuente'),
                          ),
              Text(' INFORMACIÓN   ',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'nombrefuente',fontSize: 25),
                          ),
              ],
    ),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/intereses/img1.png"),
        ),
      ],),
    );
  }
  
Widget _buildSubSistemaItem(String imgPath2){
  return Padding(
    padding: EdgeInsets.only(left:0.0, right:0.0, top: 0.0),
    child: InkWell(
      onTap: () { 
        },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[          
        Container(
            child: Row(
              children: [
                Hero(
                  tag: imgPath2,
                  child: Image(                    
                    image:AssetImage(imgPath2),
                    fit: BoxFit.cover,
                    height: 200.0,
                    width: 360.0
                  )
                ),
              ]
            )
          ),
        ]
      ),
    ),
  );
}
}