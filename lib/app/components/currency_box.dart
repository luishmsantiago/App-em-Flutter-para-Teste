import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel> itens;
  final CurrencyModel selectedItem; //selecionar o item para que ele apareça após ser clicado
  final TextEditingController controller;
  final void Function(CurrencyModel ? model)? onChanged;

  const CurrencyBox({Key? key, required this.itens, required this.controller, required this.onChanged, required this.selectedItem}) : super(key: key);

  @override
  Widget build(BuildContext) {
    return Row(
      //é preciso fazer uma row para colocar os dropdownbutton
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex:
                1, //flex serve para mostrar que a linha será dividida 50% para cada
            child: SizedBox(
              height: 56,
              child: DropdownButton<CurrencyModel>(
                  iconEnabledColor: Colors.amber,
                  isExpanded: true, //deixar icone do botão no canto direito
                  value: selectedItem, //item selecionado aparecerá
                  underline: Container(
                      height: 1,
                      color: Colors.amber), //deixar base do botão com cor amber
                  items: itens
                      .map((e) => DropdownMenuItem<CurrencyModel>(
                          value:
                              e, //damos valor a cada item, para quando for selecionado, saber o que se está selecionando
                          child: Text(e.name),
                          ))
                      .toList(), //instanciando os itens e precisa ser dinamic
                  onChanged: onChanged), //quando for selecionado, será um currencymodel
              )
            ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller, //colocamos o controller que estava lá em cima aqui dentro
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)), //ativar borda
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        (BorderSide(color: Colors.amber))) //borda não ativa
                ),
          ),
        )
      ],
    );
  }
}

// [
//                     DropdownMenuItem(child: Text('Real'), value: 'Real'),
//                     DropdownMenuItem(child: Text('Dolar'), value: 'Dolar'),
//                     DropdownMenuItem(child: Text('Euro'), value: 'Euro'),
//                     DropdownMenuItem(child: Text('Bitcoin'), value: 'Bitcoin'),
//                   ]