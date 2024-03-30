import 'package:flutter/material.dart';

class Invoice extends StatefulWidget {
  const Invoice({Key? key});

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                readOnly: false,
                decoration: InputDecoration(
                  labelText: 'Tap here to open keyboard',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
