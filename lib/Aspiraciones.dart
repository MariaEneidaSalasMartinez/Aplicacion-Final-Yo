import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: '',
  home: Aspiraciones(),
));
class Aspiraciones extends StatefulWidget {
  final heroTag;
  Aspiraciones({this.heroTag});
  @override
  _AspiracionesState createState() => _AspiracionesState();
}
class _AspiracionesState extends State<Aspiraciones> {
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
                        child: _buildSubSistemaItem('icons/ProyectoDeVida/Subtemas/Aspiraciones2.jpg'),
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
          child: Image.asset("assets/aspiraciones/infografiaaspiraciones.jpg"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/aspiraciones/img1.png"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/aspiraciones/img2.png"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/aspiraciones/img3.png"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/aspiraciones/img4.png"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/aspiraciones/img5.png"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/aspiraciones/img6.png"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/aspiraciones/img7.png"),
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