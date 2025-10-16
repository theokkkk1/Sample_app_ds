import 'package:flutter/material.dart';
import '../design_system/ds_colors.dart';
import '../design_system/components/ds_button.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({Key? key}) : super(key: key);

  void _handleButtonPress() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Buttons'),
        backgroundColor: DSColors.primary,
        foregroundColor: DSColors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _buildSection(
            'Primary Buttons',
            [
              _buildButtonGroup(
                'Default/Hover',
                DSButton(
                  text: 'Button',
                  type: DSButtonType.primary,
                  onPressed: _handleButtonPress,
                ),
                showHoverText: true,
              ),
              _buildButtonGroup(
                'Disabled',
                const DSButton(
                  text: 'Button',
                  type: DSButtonType.primary,
                  enabled: false,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          _buildSection(
            'Outlined Buttons',
            [
              _buildButtonGroup(
                'Default/Hover',
                DSButton(
                  text: 'Button',
                  type: DSButtonType.outlined,
                  onPressed: _handleButtonPress,
                ),
                showHoverText: true,
              ),
              _buildButtonGroup(
                'Disabled',
                const DSButton(
                  text: 'Button',
                  type: DSButtonType.outlined,
                  enabled: false,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          _buildSection(
            'Text Buttons',
            [
              _buildButtonGroup(
                'Default/Hover',
                DSButton(
                  text: 'Button',
                  type: DSButtonType.text,
                  onPressed: _handleButtonPress,
                ),
                showHoverText: true,
              ),
              _buildButtonGroup(
                'Disabled',
                const DSButton(
                  text: 'Button',
                  type: DSButtonType.text,
                  enabled: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: DSColors.black,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 32,
          runSpacing: 24,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: children,
        ),
      ],
    );
  }

  Widget _buildButtonGroup(String title, Widget button, {bool showHoverText = false}) {
    return SizedBox(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          if (showHoverText) ...[
            const SizedBox(height: 8),
          ],
          button,
        ],
      ),
    );
  }
}