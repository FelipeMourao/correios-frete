import 'package:correios_frete/correios_frete.dart';

void main() async {
  Result resultado = await CalcPriceTerm(
      "0",
      "0",
      "04014",
      "69097374",
      "13480010",
      "1",
      "1",
      "20",
      "20",
      "20",
      "0",
      "N",
      "N",
      "N",
      "xml",
      "3");

  print("Valor do frete: ${resultado.valor}");
  print("Prazo de Entrega: ${resultado.prazo}");
  print("Valor da Mão Própria: ${resultado.vmp}");
  print("Valor do Aviso de Recebimento: ${resultado.valor}");
  print("Valor do Valor Declarado: ${resultado.vvd}");
  print("Possui Entrega Domiciliar (S - Sim , N - Não): ${resultado.entrDom}");
  print("Possui Entrega ao Sábados (S - Sim , N - Não): ${resultado.entrSa}");
  print("Valor sem Adicionais: ${resultado.vsa}");

}