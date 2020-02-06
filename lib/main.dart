import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  TextEditingController txtAlcool = new TextEditingController();
  TextEditingController txtGasolina = new TextEditingController();

  String res = ' ';

  void calcular() {
    setState(() {
      double alcool = double.parse(txtAlcool.text);
      double gasolina = double.parse(txtGasolina.text);
      double resultado = alcool / gasolina;
      if (resultado < 0.7) {
        res = 'Abasteça com Álcool';
      } else {
        res = 'Abasteça com Gasolina';
      }
    });
  }

  void reset() {
    setState(() {
      txtAlcool.text = '';
      txtGasolina.text = '';
      res = '';
      formKey = new GlobalKey<FormState>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Combustível'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: reset)
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.directions_car,
                size: 150,
                color: Colors.green,
              ),
              TextFormField(
                controller: txtAlcool,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Informe o preço do Álcool',
                    labelStyle: TextStyle(color: Colors.green, fontSize: 25)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
                validator: (value){
                  if(value.isEmpty){
                    return 'Preencha o valor do Álcool';
                  }
                },
              ),
              TextFormField(
                controller: txtGasolina,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Informe o preço da Gasolina',
                    labelStyle: TextStyle(color: Colors.green, fontSize: 25)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
                validator: (value){
                  if(value.isEmpty){
                    return 'Preencha o valor da Gasolina';
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                      child: Text(
                        'Calcular',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      color: Colors.green,
                      onPressed: (){
                        if(formKey.currentState.validate()){
                          calcular();
                        }
                      }),
                ),
              ),
              Text(
                res,
                style: TextStyle(color: Colors.green, fontSize: 25),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
