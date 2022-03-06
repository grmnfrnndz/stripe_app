import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'package:stripe_app/data/tarjetas.dart';
import 'package:stripe_app/widgets/widgets.dart';

import '../helpers/helpers.dart';
import 'pages.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Pagar')),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              
              // mostrarLoading(context);
              // await Future.delayed(Duration(seconds: 1));
              // Navigator.pop(context);

              mostrarAlerta(context, 'titulo', 'mensaje');

            },
          )
        ],
      ),
      body: Stack(
        children: [

          Positioned(
            width: size.width,
            height: size.height,
            top: 300,
            child: PageView.builder(
              controller: PageController(
                viewportFraction: 0.9
              ),
              physics: BouncingScrollPhysics(),
              itemCount: tarjetas.length,
              itemBuilder: (context, index) {
          
              final tarjeta = tarjetas[index];
          
              return GestureDetector(
                onTap: () {
                  print(tarjeta.cardHolderName);

                  Navigator.push(context, navegarFadeIn(context, TarjetaPage()));


                },
                child: Hero(
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
              );
            }),
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