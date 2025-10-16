import 'package:flutter/material.dart';
import '../ds_colors.dart';

class DSSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final bool enabled;

  const DSSwitch({
    Key? key,
    required this.value,
    this.onChanged,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? () => onChanged?.call(!value) : null,
      child: Container(
        width: 44, 
        height: 24, 
        child: Stack(
          children: [
            
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 36, 
                height: 16, 
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: _getTrackColor(),
                ),
              ),
            ),
            
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              left: value ? 20 : 0,
              child: Container(
                width: 24, 
                height: 24,
                decoration: BoxDecoration(
                  color: _getThumbColor(),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getTrackColor() {
    if (!enabled) {
      return DSColors.gray.withOpacity(0.3);
    }
    return value 
        ? DSColors.primary.withOpacity(0.3) 
        : const Color.fromARGB(255, 114, 114, 114).withOpacity(0.5); 
  }

  Color _getThumbColor() {
    if (!enabled) {
      return const Color.fromARGB(255, 230, 230, 230);
    }
    return value 
        ? DSColors.primary 
        : const Color.fromARGB(255, 238, 238, 238); 
  }
}