import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeController {
  List<CurrencyModel> currencies;

  final TextEditingController toText  ; //aba de escrita
  final TextEditingController fromText;

  CurrencyModel? toCurrency; //primeiro selecionado, de
  CurrencyModel? fromCurrency; //segundo selecionado, para

  HomeController({ required this.toText,  required this.fromText, required this.currencies, this.fromCurrency,  this.toCurrency}) {
    currencies = CurrencyModel.GetCurrencies(); //se torna um array
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }
  //regra de negócio abaixo
  void convert() {
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ??
        1.0; //quando for introduzido '','' mudar para ''.'' para não dar erro
    //se der erro volta a algo padrão = retornar 1
    double returnValue = 0;

    if (fromCurrency!.name == 'Real') {
      returnValue = value * toCurrency!.real;
    } else if (fromCurrency!.name == 'Dollar') {
      returnValue = value * toCurrency!.dollar;
    } else if (fromCurrency!.name == 'Euro') {
      returnValue = value * toCurrency!.euro;
    } else if (fromCurrency!.name == 'Bitcoin') {
      returnValue = value * toCurrency!.bitcoin;
    }

    fromText.text = returnValue.toStringAsFixed(2);
  }
}
