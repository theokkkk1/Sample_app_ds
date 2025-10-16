import 'package:flutter/material.dart';
import '../design_system/ds_colors.dart';
import '../design_system/components/ds_tab_bar.dart';
import '../design_system/components/ds_tab_bar_delegate.dart';


class TabsPage extends StatefulWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  State<TabsPage> createState() => _TabsPageState();
}


class _TabsPageState extends State<TabsPage> implements DSTabBarDelegate {
  int _currentTabIndex = 0;
  String _selectedTabMessage = 'Nenhuma tab selecionada ainda';

  
  @override
  void onTabSelected(int index) {
    setState(() {
      _currentTabIndex = index;
      _selectedTabMessage = 'Tab ${_getTabName(index)} foi selecionada!';
    });
    
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Você selecionou: ${_getTabName(index)}'),
        duration: const Duration(seconds: 1),
        backgroundColor: DSColors.primary,
      ),
    );
  }

  String _getTabName(int index) {
    switch (index) {
      case 0:
        return 'Heart';
      case 1:
        return 'Circle';
      case 2:
        return 'Square';
      case 3:
        return 'Triangle';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Tabs'),
        backgroundColor: DSColors.primary,
        foregroundColor: DSColors.white,
      ),
      body: Column(
        children: [
          
          DSTabBar(
            delegate: this, 
            items: [
              DSTabBarItem(label: 'Heart', icon: Icons.favorite),
              DSTabBarItem(label: 'Circle', icon: Icons.circle),
              DSTabBarItem(label: 'Square', icon: Icons.square),
              DSTabBarItem(label: 'Triangle', icon: Icons.details),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Tab Bar',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: DSColors.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: DSColors.secondary.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: DSColors.primary, width: 2),
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.info_outline,
                          size: 48,
                          color: DSColors.primary,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _selectedTabMessage,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: DSColors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Índice atual: $_currentTabIndex',
                          style: const TextStyle(
                            fontSize: 16,
                            color: DSColors.gray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}