import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: '',
  home: PreferenciasDeEstudios(),
));
class PreferenciasDeEstudios extends StatefulWidget {
  final heroTag;
  PreferenciasDeEstudios({this.heroTag});
  @override
  _PreferenciasDeEstudiosState createState() => _PreferenciasDeEstudiosState();
}
class _PreferenciasDeEstudiosState extends State<PreferenciasDeEstudios> {
  @override
  Widget build(BuildContext context) {     
    return Scaffold(
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
                        child: _buildSubSistemaItem('icons/ProyectoDeVida/Subtemas/PreferenciasDeEstudio2.jpg'),
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
          child: Image.asset("assets/apreferenciasestudio/img1.png"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/preferenciasestudio/img2.png"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/preferenciasestudio/img3.png"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/preferenciasestudio/img4.png"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/preferenciasestudio/img5.png"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/preferenciasestudio/img6.png"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/preferenciasestudio/img7.png"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/preferenciasestudio/img8.png"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/preferenciasestudio/img9.png"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/preferenciasestudio/img10.png"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/preferenciasestudio/img11.png"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/preferenciasestudio/img12.png"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/preferenciasestudio/img13.png"),
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