import 'package:flutter/material.dart';

void ShowAlert(BuildContext context, String Message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Alert"),
        content: Text(Message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      );
    },
  );
}
