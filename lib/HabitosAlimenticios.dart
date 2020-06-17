import 'package:flutter/material.dart';
import 'fancy_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'PantallaEncuesta2.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: '',
  home: HabitosAlimenticios(),
));
class HabitosAlimenticios extends StatefulWidget {
  final heroTag;
  HabitosAlimenticios({this.heroTag});
  @override
  _HabitosAlimenticiosState createState() => _HabitosAlimenticiosState();
}
class _HabitosAlimenticiosState extends State<HabitosAlimenticios> {
  @override
  Widget build(BuildContext context) {     
    return Scaffold(
      floatingActionButton: FancyButton(
        onPressed: () async
        {
          var datos =
          await FirebaseDatabase.instance.reference().child("plantilla").child("Habitos alimenticios").once();
          List preguntas = datos.value as List;
          Navigator. of(context).push(
            MaterialPageRoute(builder: (_) => PantallaEncuesta(preguntas: preguntas, tema: 'Habitos alimenticios',)
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
   body: SingleChildScrollView(
    child: Column(
      children: <Widget>[          
        Container(
          child: Column(     
              children: <Widget>[ 
                Row(
                      crossAxisAlignment: CrossAxisAlignment.center,                    
                      children: [   
                        Expanded(
                        child: _buildSubSistemaItem('icons/VidaSalu/Subtemas/HabitosAlimenticios2.jpg'),
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
          child: Image.asset("assets/habitoalimenticio/una.jpeg"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/habitoalimenticio/dos.jpeg"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/habitoalimenticio/tres.jpeg"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/habitoalimenticio/cuatro.jpeg"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/habitoalimenticio/cinco.jpeg"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/habitoalimenticio/seis.jpeg"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/habitoalimenticio/siete.jpeg"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/habitoalimenticio/ocho.jpeg"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/habitoalimenticio/nueve.jpeg"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/habitoalimenticio/diez.jpeg"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/habitoalimenticio/tema1.png"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/habitoalimenticio/tema1a.png"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/habitoalimenticio/tema1b.png"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/habitoalimenticio/tema1c.png"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/habitoalimenticio/tema1d.png"),
        ),
      ],),
    ),
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