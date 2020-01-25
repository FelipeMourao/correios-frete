import 'package:correios_frete/correios_frete.dart';
import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {

  Map<String, dynamic> informacoes;

  Resultado(this.informacoes);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text(
          "Resultado",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: FutureBuilder<Result>(
          future: CalcPriceTerm(
              informacoes["nCdEmpresa"],
              informacoes["sDsSenha"],
              informacoes["nCdServico"],
              informacoes["sCepOrigem"],
              informacoes["sCepDestino"],
              informacoes["nVlPeso"],
              informacoes["nCdFormato"],
              informacoes["nVlComprimento"],
              informacoes["nVlAltura"],
              informacoes["nVlLargura"],
              informacoes["nVlDiametro"],
              informacoes["sCdMaoPropria"],
              informacoes["nVlValorDeclarado"],
              informacoes["sCdAvisoRecebimento"],
              informacoes["StrRetorno"],
              informacoes["nIndicaCalculo"]),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Container(
                  height: 200,
                  width: 200,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 5,
                  ),
                );
              default:
                if (snapshot.hasError)
                  return Container();
                else if (snapshot.data.error == "0") {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text("Valor do Frete: R\$ ${snapshot.data.valor}",
                            style: TextStyle(color: Colors.white, fontSize: 25)),
                        Text("Prazo para Entrega: ${snapshot.data.prazo} dias",
                            style: TextStyle(color: Colors.white, fontSize: 25)),
                        Text(
                            "Preço Adicional do Serviço Mão Própria: R\$ ${snapshot.data.vmp}",
                            style: TextStyle(color: Colors.white, fontSize: 25)),
                        Text(
                            "Preço Adicional do Serviço Aviso de Recebimento: R\$ ${snapshot.data.vRec}",
                            style: TextStyle(color: Colors.white, fontSize: 25)),
                        Text(
                            "Preço Adicional do Serviço Valor Declarado: R\$ ${snapshot.data.vvd}",
                            style: TextStyle(color: Colors.white, fontSize: 25)),
                        Text(
                            "Possui Entrega Domiciliária?: ${snapshot.data.entrDom == "S" ? "Sim" : "Não"}",
                            style: TextStyle(color: Colors.white, fontSize: 25)),
                        Text(
                            "Possui Entrega aos Sábados?: ${snapshot.data.entrSa == "S" ? "Sim" : "Não"}",
                            style: TextStyle(color: Colors.white, fontSize: 25)),
                        Text("Valor Sem Adicionais: R\$ ${snapshot.data.vsa}",
                            style: TextStyle(color: Colors.white, fontSize: 25)),
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                            snapshot.data.error,
                            style: TextStyle(color: Colors.red, fontSize: 25)),
                        Text(snapshot.data.msgErro,
                            style: TextStyle(color: Colors.red, fontSize: 25)),
                      ],
                    ),
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
