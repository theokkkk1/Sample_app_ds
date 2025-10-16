import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../design_system/ds_colors.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Colors'),
        backgroundColor: DSColors.primary,
        foregroundColor: DSColors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _buildSection('Primary', [
            _ColorItem(
                'Primary', DSColors.primary, '#6041B0'),
            _ColorItem('Primary Hover', DSColors.primaryHover, '#2D1881'),
            _ColorItem(
                'Primary Disabled', DSColors.primaryDisabled, '#D6D6D6'),
          ]),
          const SizedBox(height: 32),
          _buildSection('Secondary', [
            _ColorItem('Secondary', DSColors.secondary, '#BEE9F1'),
          ]),
          const SizedBox(height: 32),
          _buildSection('System', [
            _ColorItem('Black', DSColors.black, '#000000'),
            _ColorItem('White', DSColors.white, '#FFFFFF'),
            _ColorItem('Gray', DSColors.gray, '#808080'),
            _ColorItem('Light Gray', DSColors.lightGray, '#D6D6D6'),
          ]),
          const SizedBox(height: 32),
          _buildSection('Accents', [
            _ColorItem('Red', DSColors.red, '#FF0000'),
            _ColorItem('Green', DSColors.green, '#00FF00'),
            _ColorItem('Yellow', DSColors.yellow, '#FFFF00'),
            _ColorItem('Orange', DSColors.orange, '#FFA500'),
            _ColorItem('Blue', DSColors.blue, '#0000FF'),
            _ColorItem('Cyan', DSColors.cyan, '#00FFFF'),
          ]),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> colors) {
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
          spacing: 16,
          runSpacing: 16,
          children: colors,
        ),
      ],
    );
  }
}

class _ColorItem extends StatelessWidget {
  final String name;
  final Color color;
  final String hex;

  const _ColorItem(this.name, this.color, this.hex);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Clipboard.setData(ClipboardData(text: hex));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$hex copiado!'),
            duration: const Duration(seconds: 1),
          ),
        );
      },
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          border: Border.all(color: DSColors.lightGray),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: color,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    hex,
                    style: const TextStyle(
                      color: DSColors.gray,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}