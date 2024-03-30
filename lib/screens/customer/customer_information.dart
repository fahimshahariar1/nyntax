import 'package:flutter/material.dart';
import 'package:nyntaxenvoicapp/screens/vehicle/vehicle_information.dart';
import 'package:nyntaxenvoicapp/util/colors.dart';
import 'package:nyntaxenvoicapp/util/dimensions.dart';
import 'package:nyntaxenvoicapp/util/images.dart';
import 'package:nyntaxenvoicapp/util/styles.dart';

class Customer extends StatefulWidget {
  const Customer({Key? key}) : super(key: key);

  @override
  State<Customer> createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool isNextButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    firstNameController.addListener(validateFields);
    lastNameController.addListener(validateFields);
    emailController.addListener(validateFields);
    phoneController.addListener(validateFields);
  }

  void validateFields() {
    setState(() {
      isNextButtonEnabled =
          firstNameController.text.isNotEmpty &&
              lastNameController.text.isNotEmpty &&
              emailController.text.isNotEmpty &&
              phoneController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Dismiss keyboard when tapping outside text fields
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Back", style: poppinsMedium,),
        ),
        body: Container(padding: EdgeInsets.only(left: Dimensions.paddingSizeDefault),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Customer Information", style: poppinsSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),

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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("First Name", style: poppinsLight.copyWith(fontSize: Dimensions.fontSizeDefault)),
                                Image.asset(Images.required, height: 25,)
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
                              child: SizedBox(height: 40, width: 300,
                                child: TextFormField(
                                  controller: firstNameController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.boxColor)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Last Name", style: poppinsLight.copyWith(fontSize: Dimensions.fontSizeDefault)),
                                Image.asset(Images.required, height: 25,)
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
                              child: SizedBox(height: 40, width: 300,
                                child: TextFormField(
                                  controller: lastNameController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.boxColor)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Email", style: poppinsLight.copyWith(fontSize: Dimensions.fontSizeDefault)),
                                Image.asset(Images.required, height: 25,)
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
                              child: SizedBox(height: 40, width: 300,
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.boxColor)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Phone", style: poppinsLight.copyWith(fontSize: Dimensions.fontSizeDefault)),
                                Image.asset(Images.required, height: 25,)
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
                              child: SizedBox(height: 40, width: 300,
                                child: TextFormField(
                                  controller: phoneController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.boxColor)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                ),
                Spacer(),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeLarge),
                    child: MaterialButton(
                      onPressed: isNextButtonEnabled
                          ? () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Vehicle()));
                      }
                          : null,
                      child: Container(height: 48, width: 175,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: isNextButtonEnabled ? AppColors.primaryColor : Colors.grey,),
                          child: Center(child: Text("Next", style: poppinsMedium.copyWith(color: Colors.white),))),
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
