// Additional.dart

import 'package:flutter/material.dart';
import 'package:nyntaxenvoicapp/data/model/car_model.dart';
import 'package:nyntaxenvoicapp/screens/invoice/invoice.dart';
import 'package:nyntaxenvoicapp/util/colors.dart';
import 'package:nyntaxenvoicapp/util/dimensions.dart';
import 'package:nyntaxenvoicapp/util/images.dart';
import 'package:nyntaxenvoicapp/util/styles.dart';

class Additional extends StatefulWidget {
  final Data selectedVehicle;

  const Additional({Key? key, required this.selectedVehicle}) : super(key: key);

  @override
  State<Additional> createState() => _AdditionalState();
}

class _AdditionalState extends State<Additional> {
  bool? collisionDamageWaiver = false;
  bool? liabilityInsurance = false;
  bool? rentalTax = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Back", style: poppinsMedium),
      ),
      body: Container(
        padding: EdgeInsets.only(top: Dimensions.paddingSizeSmall, left: Dimensions.paddingSizeDefault),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Additional Charges", style: poppinsSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
            Container(height: 2, width: 350, color: AppColors.primaryColor),
            SizedBox(height: 20),
            Container(
              height: 450,
              width: 350,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.boxColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  CheckboxListTile(
                    contentPadding: EdgeInsets.only(right: 10),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: collisionDamageWaiver,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Collision Damage Waiver', style: poppinsMedium),
                        Text('\$9.00', style: poppinsMedium),
                      ],
                    ),
                    onChanged: (bool? value) {
                      setState(() {
                        collisionDamageWaiver = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.only(right: 10),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Liability Insurance', style: poppinsMedium),
                        Text('\$15.00', style: poppinsMedium),
                      ],
                    ),
                    value: liabilityInsurance,
                    onChanged: (bool? value) {
                      setState(() {
                        liabilityInsurance = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.only(right: 10),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Rental Tax', style: poppinsMedium),
                        Text('11.5%', style: poppinsMedium),
                      ],
                    ),
                    value: rentalTax,
                    onChanged: (bool? value) {
                      setState(() {
                        rentalTax = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Spacer(),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeLarge),
                child: MaterialButton(
                  onPressed: () {
                    // Navigate to the Invoice screen and pass selected vehicle data and additional charges
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Invoice(
                          selectedVehicle: widget.selectedVehicle,
                          collisionDamageWaiver: collisionDamageWaiver,
                          liabilityInsurance: liabilityInsurance,
                          rentalTax: rentalTax,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 48,
                    width: 175,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.primaryColor,
                    ),
                    child: Center(child: Text("Next", style: poppinsMedium.copyWith(color: Colors.white))),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
