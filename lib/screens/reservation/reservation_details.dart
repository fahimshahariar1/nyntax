import 'package:flutter/material.dart';
import 'package:nyntaxenvoicapp/util/colors.dart';
import 'package:nyntaxenvoicapp/util/dimensions.dart';
import 'package:nyntaxenvoicapp/util/styles.dart';

class Reservation extends StatefulWidget {
  const Reservation({super.key});

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(padding: EdgeInsets.only(top: Dimensions.paddingSizeLarge, left: Dimensions.paddingSizeDefault),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Reservation Details", style: poppinsSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),

            Container(height: 2, width: 350, color: AppColors.primaryColor),

            SizedBox(height: 20,),

            Container(height: 450, width: 350, decoration: BoxDecoration(border: Border.all(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(5),
            ),
              
              child: Padding(
                padding: const EdgeInsets.only(left: Dimensions.paddingSizeDefault, top: Dimensions.paddingSizeDefault),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Reservation ID", style: poppinsLight.copyWith(fontSize: Dimensions.fontSizeDefault)),
                    Padding(
                      padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
                      child: SizedBox(height: 40, width: 300,
                          child: TextField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),)),
                    )
                  ],
                ),
              ),
              
            ),

            
          ],
        ),
      ),
    );
  }
}
