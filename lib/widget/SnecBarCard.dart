import 'package:flutter/material.dart';

class SnackBarCard extends StatelessWidget {
  String message;
  SnackBarCard(this.message);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(message),
    );
  }
}
