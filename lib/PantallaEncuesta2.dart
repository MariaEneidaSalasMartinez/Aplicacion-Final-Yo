import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class PantallaEncuesta extends StatelessWidget {

  final List preguntas;

  PantallaEncuesta(this.preguntas);

  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Encuesta')
        ),
        body: ListView.builder(
            itemCount: this.preguntas.length,
            itemBuilder: (_, index) {
              Map<String, dynamic> pregunta = Map.from(this.preguntas[index]);
              return ListTile(
                  title: Text(pregunta['pregunta']
              ));
            }
        )
    );
  }

}