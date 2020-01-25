# correios_frete
[![Build Status](https://travis-ci.org/FelipeMourao/correios-frete.svg?branch=master)](https://travis-ci.org/FelipeMourao/correios-frete)
[![License: MIT](https://img.shields.io/badge/License-MIT-brightgreen.svg)](https://github.com/FelipeMourao/correios-frete/blob/master/LICENSE)
[![Codemagic build status](https://api.codemagic.io/apps/5e2af32b151bb60016f91e91/5e2af32b151bb60016f91e90/status_badge.svg)](https://codemagic.io/apps/5e2af32b151bb60016f91e91/5e2af32b151bb60016f91e90/latest_build)

Calcular o Preço e o Prazo da Entregas de encomendas. Este pacote utilizar API [http](https://pub.dev/packages/http) e [xml2json](https://pub.dev/packages/xml2json)

# Usage

{% highlight dart %}

dependencies:
     flutter:
        sdk: flutter
     correios_frete:

{% endhighlight %}


# Como calcular o valor do frete com Preço e Prazo

{% highlight dart %}

  // import 'package:correios_frete/correios_frete.dart';

  Result resultado = await CalcPriceTerm("0","0","04014","69097374","13480010","1","1","20","20","20",
      "0","N","N","N","xml","3");

    print("Valor do frete: ${resultado.valor}");
    print("Prazo de Entrega: ${resultado.prazo}");
    print("Valor da Mão Própria: ${resultado.vmp}");
    print("Valor do Aviso de Recebimento: ${resultado.valor}");
    print("Valor do Valor Declarado: ${resultado.vvd}");
    print("Possui Entrega Domiciliar (S - Sim , N - Não): ${resultado.entrDom}");
    print("Possui Entrega ao Sábados (S - Sim , N - Não): ${resultado.entrSa}");
    print("Valor sem Adicionais: ${resultado.vsa}");

{% endhighlight %}