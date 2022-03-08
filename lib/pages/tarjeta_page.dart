import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

import '../bloc/blocs.dart';
import '../widgets/widgets.dart';


class TarjetaPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final pagarBloc = BlocProvider.of<PagarBloc>(context);
    final tarjeta = pagarBloc.state.tarjeta;

    if (tarjeta == null) return CircularProgressIndicator();

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagar'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            pagarBloc.add(OnDesactivarTarjeta());
            Navigator.pop(context);
          },
        ),
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