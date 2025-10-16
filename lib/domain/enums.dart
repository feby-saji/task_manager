import 'package:flutter/material.dart';

enum Priority {
  low('Low', Colors.green),
  medium('Medium', Colors.orange),
  high('High', Colors.red);

  final String label;
  final Color color;

  const Priority(this.label, this.color);
}
