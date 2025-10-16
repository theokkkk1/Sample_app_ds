import 'package:flutter/material.dart';
import '../ds_colors.dart';

enum DSButtonType { primary, outlined, text }

class DSButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final DSButtonType type;
  final bool enabled;

  const DSButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.type = DSButtonType.primary,
    this.enabled = true,
  }) : super(key: key);

  @override
  State<DSButton> createState() => _DSButtonState();
}

class _DSButtonState extends State<DSButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 120, 
          minHeight: 45, 
        ),
        child: _buildButton(),
      ),
    );
  }

  Widget _buildButton() {
    final buttonStyle = _getButtonStyle();
    
    switch (widget.type) {
      case DSButtonType.primary:
        return ElevatedButton(
          onPressed: widget.enabled ? widget.onPressed : null,
          style: buttonStyle as ButtonStyle?,
          child: _buildButtonContent(),
        );
      case DSButtonType.outlined:
        return OutlinedButton(
          onPressed: widget.enabled ? widget.onPressed : null,
          style: buttonStyle as ButtonStyle?,
          child: _buildButtonContent(),
        );
      case DSButtonType.text:
        return TextButton(
          onPressed: widget.enabled ? widget.onPressed : null,
          style: buttonStyle as ButtonStyle?,
          child: _buildButtonContent(),
        );
    }
  }

  Widget _buildButtonContent() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.circle_outlined,
          size: 16,
          color: _getIconColor(),
        ),
        const SizedBox(width: 8),
        Text(widget.text),
      ],
    );
  }

  dynamic _getButtonStyle() {
    const commonPadding = EdgeInsets.symmetric(horizontal: 24, vertical: 16);
    const commonTextStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w500);

    switch (widget.type) {
      case DSButtonType.primary:
        return _getPrimaryStyle(commonPadding, commonTextStyle);
      case DSButtonType.outlined:
        return _getOutlinedStyle(commonPadding, commonTextStyle);
      case DSButtonType.text:
        return _getTextStyle(commonPadding, commonTextStyle);
    }
  }

  ButtonStyle _getPrimaryStyle(EdgeInsetsGeometry padding, TextStyle textStyle) {
    if (!widget.enabled) {
      return ElevatedButton.styleFrom(
        backgroundColor: DSColors.primaryDisabled,
        foregroundColor: DSColors.white,
        elevation: 0,
        padding: padding,
        textStyle: textStyle,
        shape: RoundedRectangleBorder( 
        borderRadius: BorderRadius.circular(8), 
      )
      );
    }

    return ElevatedButton.styleFrom(
      backgroundColor: _isHovered ? DSColors.primaryHover : DSColors.primary,
      foregroundColor: DSColors.white,
      elevation: 0,
      padding: padding,
      textStyle: textStyle,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), 
    ),
    );
  }

  ButtonStyle _getOutlinedStyle(EdgeInsetsGeometry padding, TextStyle textStyle) {
    if (!widget.enabled) {
      return OutlinedButton.styleFrom(
        foregroundColor: DSColors.primaryDisabled,
        side: const BorderSide(color: DSColors.primaryDisabled),
        elevation: 0,
        padding: padding,
        textStyle: textStyle,
        shape: RoundedRectangleBorder( 
      borderRadius: BorderRadius.circular(8), 
    ),
      );
    }

    return OutlinedButton.styleFrom(
      backgroundColor: _isHovered ? DSColors.secondary : Colors.transparent,
      foregroundColor: DSColors.primary,
      side: const BorderSide(color: Color.fromARGB(255, 196, 196, 196), width: 2),
      elevation: 0,
      padding: padding,
      textStyle: textStyle,
      shape: RoundedRectangleBorder( 
      borderRadius: BorderRadius.circular(8), 
    ),
    );
  }

  ButtonStyle _getTextStyle(EdgeInsetsGeometry padding, TextStyle textStyle) {
    if (!widget.enabled) {
      return TextButton.styleFrom(
        foregroundColor: DSColors.primaryDisabled,
        elevation: 0,
        padding: padding,
        textStyle: textStyle,
        shape: RoundedRectangleBorder( 
      borderRadius: BorderRadius.circular(4), 
    ),
      );
    }

    return TextButton.styleFrom(
      backgroundColor: _isHovered ? DSColors.secondary : Colors.transparent,
      foregroundColor: DSColors.primary,
      elevation: 0,
      padding: padding,
      textStyle: textStyle,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4), 
    ),
    );
  }

  Color _getIconColor() {
    if (!widget.enabled) {
      return widget.type == DSButtonType.primary
          ? DSColors.white
          : DSColors.primaryDisabled;
    }

    if (widget.type == DSButtonType.primary) {
      return DSColors.white;
    }
    return DSColors.primary;
  }
}