class CurrencyModel {
  //aqui dentro ficarão as propriedades desse model
  final String name; //aqui poderemos dizer se é um real, dollar, etc
  final double real; //poderemos trabalhar com real, double por poder vir cortado
  final double dollar;
  final double euro;
  final double bitcoin;

  CurrencyModel({required this.name, required this.real, required this.dollar, required this.euro, required this.bitcoin}); //está nomeado entre {}

    static List <CurrencyModel> GetCurrencies () {
      return <CurrencyModel>[ //forma um array das opções
        CurrencyModel(
          name: 'Real', real: 1.0, dollar: 0.18, euro: 0.16, bitcoin: 0.00000352),
        CurrencyModel(
          name: 'Dollar', real: 5.53, dollar:1.0, euro: 0.88, bitcoin: 0.0000200),
        CurrencyModel(
          name: 'Euro', real: 6.28, dollar:1.13, euro: 1.0, bitcoin: 0.000024),
        CurrencyModel(
          name: 'Bitcoin', real: 281036.97, dollar: 50768.10, euro: 44764.87, bitcoin: 1.0),
      ];
    }

}
