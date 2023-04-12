import 'package:conversor_moedas/app/components/currency_box.dart';
import 'package:conversor_moedas/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText  = TextEditingController();
  late HomeController homeController; 

  @override
  void initState() {
    //ele é chamado para iniciar o widget
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText, currencies: [],); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 100, left: 30, right: 30, bottom: 20),
              child: ListView(children: [
                Image.asset(
                  'assets/logo.png',
                  width: 150,
                  height: 150,
                ),
                SizedBox(
                  height: 50,
                ),
                CurrencyBox(
                  selectedItem: homeController 
                      .toCurrency!,  //item selecionado aparecerá na lista
                  controller: toText, //todos os itens dentro do controle
                  itens: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.toCurrency = model!;
                    });
                  },
                ), //adiciona toda a informação da linha, depois adiciona itens da currencies
                SizedBox(
                  height: 30,
                ),
                CurrencyBox(
                  selectedItem: homeController.fromCurrency!,
                  controller: fromText,
                  itens: homeController.currencies,
                  onChanged: (model) {
                    //adiciona mais uma linha abaixo
                    setState(() {
                      homeController.fromCurrency = model!;
                    });
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.amber),
                  onPressed: () {
                  homeController.convert();
                  },
                  child: Text('Converter'),
                )
              ]),
            )));
  }
}
