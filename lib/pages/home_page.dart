import 'package:flutter/material.dart';
import '../design_system/ds_colors.dart';
import 'colors_page.dart';
import 'buttons_page.dart';
import 'selection_controls_page.dart';
import 'text_fields_page.dart';
import 'tabs_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DSColors.white,
      appBar: AppBar(
        title: const Text('Design System'),
        backgroundColor: DSColors.primary,
        foregroundColor: DSColors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Componentes do Design System',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: DSColors.primary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Selecione um componente para visualizar',
              style: TextStyle(
                fontSize: 16,
                color: DSColors.gray,
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView(
                children: [
                  _buildMenuItem(
                    context,
                    icon: Icons.palette,
                    title: 'Colors',
                    subtitle: 'Paleta de cores do sistema',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ColorsPage()),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildMenuItem(
                    context,
                    icon: Icons.smart_button,
                    title: 'Buttons',
                    subtitle: 'Botões primários, outlined e text',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ButtonsPage()),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildMenuItem(
                    context,
                    icon: Icons.check_box,
                    title: 'Selection Controls',
                    subtitle: 'Checkbox, Radio e Switch',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SelectionControlsPage()),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildMenuItem(
                    context,
                    icon: Icons.text_fields,
                    title: 'Text Fields',
                    subtitle: 'Campos de entrada de texto',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TextFieldsPage()),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildMenuItem(
                    context,
                    icon: Icons.tab,
                    title: 'Tabs',
                    subtitle: 'Tab Bar com padrão Delegate',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TabsPage()),
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

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: DSColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: DSColors.lightGray),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: DSColors.secondary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: DSColors.primary,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: DSColors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      color: DSColors.gray,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: DSColors.gray,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}