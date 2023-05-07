import 'package:flutter/material.dart';

class PaymentContainer extends StatefulWidget {
  const PaymentContainer({super.key});

  @override
  _PaymentContainerState createState() => _PaymentContainerState();
}

class _PaymentContainerState extends State<PaymentContainer> {
  bool _isPaid = false;

  void _togglePaymentStatus() {
    setState(() {
      _isPaid = !_isPaid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePaymentStatus,
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            _isPaid ? 'Paid' : 'Unpaid',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: _isPaid ? Colors.green : Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
