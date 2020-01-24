import 'package:example/screen/result.dart';
import 'package:flutter/material.dart';

class TesteFrete extends StatefulWidget {
  @override
  _TesteFreteState createState() => _TesteFreteState();
}

class _TesteFreteState extends State<TesteFrete> {
  Map<String, dynamic> parametros = Map();
  bool _valueMaePropria = false;
  bool _valueAvisoRecebimento = false;
  var _currencies = ['SEDEX', 'PAC', 'SEDEX 10', 'SEDEX 12', 'SEDEX Hoje'];

  @override
  void initState() {
    super.initState();
    parametros["nCdServico"] = "04014";
  }
  var _currenciesInitial = "SEDEX";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text(
          "Teste Frete",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 40),
              TextField(
                decoration: InputDecoration(
                    labelText: "CÓDIGO ADMINISTRATIVO",
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder()),
                style: TextStyle(color: Colors.white, fontSize: 25),
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  parametros["nCdEmpresa"] = text;
                },
              ),
              Divider(),
              TextField(
                decoration: InputDecoration(
                    labelText: "SENHA DE ACESSO",
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder()),
                style: TextStyle(color: Colors.white, fontSize: 25),
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  parametros["sDsSenha"] = text;
                },
              ),
              Divider(),
              TextField(
                decoration: InputDecoration(
                    labelText: "CEP DE ORIGEM SEM HÍFEN",
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder()),
                style: TextStyle(color: Colors.white, fontSize: 25),
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  parametros["sCepOrigem"] = text;
                },
              ),
              Divider(),
              TextField(
                decoration: InputDecoration(
                    labelText: "CEP DO DESTINO SEM HÍFEN",
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder()),
                style: TextStyle(color: Colors.white, fontSize: 25),
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  parametros["sCepDestino"] = text;
                },
              ),
              Divider(),
              Row(
                children: <Widget>[
                  RaisedButton(
                    color: parametros["nCdFormato"] == "1"
                        ? Colors.blue[700]
                        : Colors.blueAccent,
                    child: Text("Caixa/Pacote",
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      setState(() {
                        parametros["nCdFormato"] = "1";
                      });
                    },
                  ),
                  SizedBox(width: 30),
                  RaisedButton(
                    color: parametros["nCdFormato"] == "2"
                        ? Colors.blue[700]
                        : Colors.blueAccent,
                    child: Text("Rolo/Prisma",
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      setState(() {
                        parametros["nCdFormato"] = "2";
                      });
                    },
                  ),
                  SizedBox(width: 30),
                  RaisedButton(
                    color: parametros["nCdFormato"] == "3"
                        ? Colors.blue[700]
                        : Colors.blueAccent,
                    child:
                        Text("Envelope", style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      setState(() {
                        parametros["nCdFormato"] = "3";
                      });
                    },
                  )
                ],
              ),
              Divider(),
              DropdownButton<String>(
                items: _currencies.map((String codigo) {
                  return DropdownMenuItem<String>(
                    value: codigo,
                    child: Text(codigo),
                  );
                }).toList(),
                onChanged: (value) {
                  codigoServico(value);
                  print(parametros["nCdServico"]);
                },
                value: _currenciesInitial,
              ),
              Divider(),
              TextField(
                decoration: InputDecoration(
                    labelText: "PESO",
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder()),
                style: TextStyle(color: Colors.white, fontSize: 25),
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  parametros["nVlPeso"] = text;
                },
              ),
              Divider(),
              TextField(
                decoration: InputDecoration(
                    labelText: "COMPRIMENTO",
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder()),
                style: TextStyle(color: Colors.white, fontSize: 25),
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  parametros["nVlComprimento"] = text;
                },
              ),
              Divider(),
              TextField(
                decoration: InputDecoration(
                    labelText: "ALTURA",
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder()),
                style: TextStyle(color: Colors.white, fontSize: 25),
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  parametros["nVlAltura"] = text;
                },
              ),
              Divider(),
              TextField(
                decoration: InputDecoration(
                    labelText: "LARGURA",
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder()),
                style: TextStyle(color: Colors.white, fontSize: 25),
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  parametros["nVlLargura"] = text;
                },
              ),
              Divider(),
              TextField(
                decoration: InputDecoration(
                    labelText: "DIÂMETRO",
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder()),
                style: TextStyle(color: Colors.white, fontSize: 25),
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  parametros["nVlDiametro"] = text;
                },
              ),
              Divider(),
              TextField(
                decoration: InputDecoration(
                    labelText: "VALOR DECLARADO",
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder()),
                style: TextStyle(color: Colors.white, fontSize: 25),
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  parametros["nVlValorDeclarado"] = text;
                },
              ),
              Divider(),
              SwitchListTile(
                title:
                    Text("Mão Própria?", style: TextStyle(color: Colors.white)),
                activeColor: Colors.green,
                value: _valueMaePropria,
                onChanged: (value) {
                  value == true
                      ? parametros["nVlValorDeclarado"] = "S"
                      : parametros["nVlValorDeclarado"] = "N";
                },
              ),
              Divider(),
              SwitchListTile(
                title: Text("Aviso de Recebimento?",
                    style: TextStyle(color: Colors.white)),
                activeColor: Colors.green,
                value: _valueAvisoRecebimento,
                onChanged: (value) {
                  value == true
                      ? parametros["sCdAvisoRecebimento"] = "S"
                      : parametros["sCdAvisoRecebimento"] = "N";
                },
              ),
              Divider(),
              RaisedButton(
                color: Colors.blueAccent,
                child: Text("Buscar", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Resultado(parametros)));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void codigoServico(String codigo) {
    switch (codigo) {
      case "SEDEX":
        setState(() {
          this._currenciesInitial = codigo;
          parametros["nCdServico"] = "04014";
        });
        break;
      case "PAC":
        setState(() {
          this._currenciesInitial = codigo;
          parametros["nCdServico"] = "04510";
        });
        break;
      case "SEDEX 10":
        setState(() {
          this._currenciesInitial = codigo;
          parametros["nCdServico"] = "04782";
        });
        break;
      case "SEDEX 12":
        setState(() {
          this._currenciesInitial = codigo;
          parametros["nCdServico"] = "04790";
        });
        break;
      case "SEDEX Hoje":
        setState(() {
          this._currenciesInitial = codigo;
          parametros["nCdServico"] = "04804";
        });
        break;
    }
  }
}
