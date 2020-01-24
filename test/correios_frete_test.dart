  import 'package:correios_frete/correios_frete.dart';

void main() async {

    Result resultado = await CalcPriceTerm("0", "0", "04014", "69097374", "13480010", "1", "1", "20", "20", "20", "0", "N", "N", "N", "xml", "3");

    print(resultado);

  }