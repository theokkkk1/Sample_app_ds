import 'package:flutter/material.dart';
import '../ds_colors.dart';

class DSCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final bool enabled;

  const DSCheckbox({
    Key? key,
    required this.value,
    this.onChanged,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: enabled ? onChanged : null,
      activeColor: DSColors.primary,
      checkColor: DSColors.white,
      side: BorderSide(
        color: enabled ? DSColors.primary : DSColors.lightGray,
        width: 2,
      ),
    );
  }
}