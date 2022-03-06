import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';


class TarjetaPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    final tarjeta = TarjetaCredito(
      cardNumberHidden: '4242',
      cardNumber: '4242424242424242',
      brand: 'visa',
      cvv: '213',
      expiracyDate: '01/25',
      cardHolderName: 'Fernando Herrera'
    );


    return Scaffold(
      appBar: AppBar(
        title: Text('Pagar'),
      ),
      body: Stack(
        children: [

          Container(),

          Hero(
            tag: tarjeta.cardNumber,
            child: CreditCardWidget(
            cardNumber: tarjeta.cardNumber, 
            expiryDate: tarjeta.expiracyDate, 
            cardHolderName: tarjeta.cardHolderName, 
            cvvCode: tarjeta.cvv, 
            showBackView: false, 
            onCreditCardWidgetChange: (CreditCardBrand ) {  }, 
            
            ),
          ),

          Positioned(
            bottom: 0,
            child: TotalPayButton(),
          )
        ],
      )
   );
  }
}