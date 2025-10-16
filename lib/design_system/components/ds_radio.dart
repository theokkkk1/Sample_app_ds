import 'package:flutter/material.dart';
import '../ds_colors.dart';

class DSRadio<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T?>? onChanged;
  final bool enabled;

  const DSRadio({
    Key? key,
    required this.value,
    required this.groupValue,
    this.onChanged,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Radio<T>(
      value: value,
      groupValue: groupValue,
      onChanged: enabled ? onChanged : null,
      activeColor: DSColors.primary,
      fillColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.disabled)) {
          return DSColors.lightGray;
        }
        return DSColors.primary;
      }),
    );
  }
}