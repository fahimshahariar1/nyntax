import 'package:flutter/material.dart';
import 'package:nyntaxenvoicapp/util/colors.dart';
import 'package:nyntaxenvoicapp/util/dimensions.dart';
import 'package:nyntaxenvoicapp/util/images.dart';
import 'package:nyntaxenvoicapp/util/styles.dart';

class Vehicle extends StatefulWidget {
  const Vehicle({super.key});

  @override
  State<Vehicle> createState() => _VehicleState();
}

class _VehicleState extends State<Vehicle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(padding: EdgeInsets.only(top: Dimensions.paddingSizeLarge, left: Dimensions.paddingSizeDefault),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Vehicle Information", style: poppinsSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),

            Container(height: 2, width: 350, color: AppColors.primaryColor),

            SizedBox(height: 20,),

            Container(height: 450, width: 350, decoration: BoxDecoration(border: Border.all(color: AppColors.boxColor),
              borderRadius: BorderRadius.circular(5),
            ),

              child: Padding(
                padding: const EdgeInsets.only(left: Dimensions.paddingSizeDefault, top: Dimensions.paddingSizeDefault),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Vehicle Type", style: poppinsLight.copyWith(fontSize: Dimensions.fontSizeDefault)),
                        Image.asset(Images.required, height: 25,)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
                      child: SizedBox(height: 40, width: 300,
                        child:
                      ),
                    )
                  ],
                ),
              ),

            ),
            Spacer(),

            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeLarge),
                child: MaterialButton(onPressed: (){

                },
                  child: Container(height: 48, width: 175,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppColors.primaryColor,),
                      child: Center(child: Text("Next", style: poppinsMedium.copyWith(color: Colors.white),))),),
              ),
            )

          ],
        ),
      ),
    );
  }
}


// TextField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.boxColor))),),