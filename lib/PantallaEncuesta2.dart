import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class PantallaEncuesta extends StatefulWidget {
  final List preguntas;
  final String tema;

  PantallaEncuesta({this.preguntas, this.tema});

  @override
  _PantallaEncuestaState createState() => _PantallaEncuestaState();
}

class _PantallaEncuestaState extends State<PantallaEncuesta> {
  final GlobalKey<FormState> mKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget build(context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Encuesta')
      ),
      body: Form(
        key: mKey,
        child: ListView.builder(
          itemCount: this.widget.preguntas.length + 1,
          itemBuilder: (_, index) {
            if (index == this.widget.preguntas.length) {
              return RaisedButton(
                child: Text('Enviar'),
                onPressed: () {
                  if (mKey.currentState.validate()) {
                    FirebaseDatabase.instance.reference().child('respuestas').child('').child(widget.tema).set(widget.preguntas);
                  }
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text('Encuesta Guardada'),
                      duration: Duration(milliseconds: 3000),
                      backgroundColor: Colors.purple//Color(0xffee6179),
                  ));
                },
              );
            }
            Map<String, dynamic> pregunta = Map.from(this.widget.preguntas[index]);
            if (pregunta['tipoPregunta'] == 'booleana') {
              return PreguntaBooleanaWidget(enunciado: pregunta['pregunta'], indicePregunta: index, preguntas: widget.preguntas,);
            }
            if (pregunta['tipoPregunta'] == 'opcion multiple') {
              return PreguntaOpcionesWidget(enunciado: pregunta['pregunta'], preguntas: widget.preguntas, indicePregunta: index,);
            }
            if (pregunta['tipoPregunta'] == 'libre') {
              return PreguntaLibreWidget(enunciado: pregunta['pregunta'], preguntas: widget.preguntas, indicePregunta: index,);
            }
            return ListTile(
              title: Text(pregunta['pregunta'],),
              subtitle: Text(pregunta.toString()),
            );
          }
        ),
      ),
    );
  }
}

class PreguntaBooleanaWidget extends StatefulWidget {

  final String enunciado;
  final int indicePregunta;
  final List preguntas;

  const PreguntaBooleanaWidget({Key key, this.enunciado, this.indicePregunta, this.preguntas}) : super(key: key);

  @override
  _PreguntaBooleanaWidgetState createState() => _PreguntaBooleanaWidgetState();
}

class _PreguntaBooleanaWidgetState extends State<PreguntaBooleanaWidget> {
  @override
  Widget build(BuildContext context) {
    return FormField<BooleanAnswer>(
      initialValue: BooleanAnswer(widget.preguntas[widget.indicePregunta]['valor-respuesta']),
      enabled: true,
      validator: (val) {
        if (widget.preguntas[widget.indicePregunta]['valor-respuesta'] == null) {
          return 'Contesta';
        }
        return null;
      },
      builder: (FormFieldState<BooleanAnswer> state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(widget.enunciado),
            Row(
              children: <Widget>[
                Expanded(
                  child: CheckboxListTile(
                    onChanged: (val) {
                      if (val != null) {
                        setState(() {
                          widget.preguntas[widget.indicePregunta]['valor-respuesta'] = val;
                          state.setValue(BooleanAnswer(val));
                        });
                      }
                    },
                    value: state.value != null && state.value.answer != null && state.value.answer,
                    title: Text('Si'),
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    onChanged: (val) {
                      setState(() {
                        widget.preguntas[widget.indicePregunta]['valor-respuesta'] = !val;
                        state.setValue(BooleanAnswer(!val));
                      });
                    },
                    value: state.value != null && state.value.answer != null && !state.value.answer,
                    title: Text('No'),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class PreguntaOpcionesWidget extends StatefulWidget {

  final String enunciado;
  final int indicePregunta;
  final List preguntas;

  const PreguntaOpcionesWidget({Key key, this.enunciado, this.indicePregunta, this.preguntas}) : super(key: key);

  @override
  _PreguntaOpcionesWidgetState createState() => _PreguntaOpcionesWidgetState();
}

class _PreguntaOpcionesWidgetState extends State<PreguntaOpcionesWidget> {
  @override
  Widget build(BuildContext context) {
    print('############## ${widget.preguntas[widget.indicePregunta]['valor-respuesta']}');
    return FormField<OptionAnswer>(
      initialValue: OptionAnswer(widget.preguntas[widget.indicePregunta]['valor-respuesta'] == null ? null : widget.preguntas[widget.indicePregunta]['valor-respuesta']['index']),
      enabled: true,
      validator: (val) {
        if (widget.preguntas[widget.indicePregunta]['valor-respuesta'] == null) {
          return 'Contesta';
        }
        return null;
      },
      builder: (FormFieldState<OptionAnswer> state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(widget.enunciado),
            Wrap(
              children: List.generate(widget.preguntas[widget.indicePregunta]['respuestas'].length, (index) => CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (val) {
                    setState(() {
                      widget.preguntas[widget.indicePregunta]['valor-respuesta'] = {
                        'index': index,
                        'valor-respuesta': widget.preguntas[widget.indicePregunta]['respuestas'][index]
                      };
                      state.setValue(OptionAnswer(index));
                    });
                  },
                  value: index == state.value.answer,
                  title: Text(widget.preguntas[widget.indicePregunta]['respuestas'][index]),
                ),
              )
            ),
          ],
        );
      },
    );
  }
}

class PreguntaLibreWidget extends StatefulWidget {

  final String enunciado;
  final int indicePregunta;
  final List preguntas;

  const PreguntaLibreWidget({Key key, this.enunciado, this.indicePregunta, this.preguntas}) : super(key: key);

  @override
  _PreguntaLibreWidgetState createState() => _PreguntaLibreWidgetState();
}

class _PreguntaLibreWidgetState extends State<PreguntaLibreWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(widget.enunciado),
        TextFormField(
          onChanged: (val) {
            if (val.isNotEmpty) widget.preguntas[widget.indicePregunta]['valor-respuesta'] = val;
          },
        )
      ],
    );
  }
}

class Answer {}

class BooleanAnswer extends Answer {
  bool answer;

  BooleanAnswer(this.answer);
}

class OptionAnswer extends Answer {
  int answer;

  OptionAnswer(this.answer);
}

class OpenAnswer extends Answer {
  String answer;

  OpenAnswer(this.answer);
}

