import 'package:flutter/material.dart';
import '../ds_colors.dart';
import 'ds_tab_bar_delegate.dart';

class DSTabBarItem {
  final String label;
  final IconData icon;

  DSTabBarItem({
    required this.label,
    required this.icon,
  });
}

class DSTabBar extends StatefulWidget {
  final List<DSTabBarItem> items;
  final int initialIndex;
  final DSTabBarDelegate? delegate; 
  const DSTabBar({
    Key? key,
    required this.items,
    this.initialIndex = 0,
    this.delegate, 
  }) : super(key: key);

  @override
  State<DSTabBar> createState() => _DSTabBarState();
}

class _DSTabBarState extends State<DSTabBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  
    widget.delegate?.onTabSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: DSColors.lightGray, width: 1),
        ),
      ),
      child: Row(
        children: List.generate(widget.items.length, (index) {
          final item = widget.items[index];
          final isSelected = _selectedIndex == index;

          return Expanded(
            child: InkWell(
              onTap: () => _onTabTapped(index),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isSelected ? DSColors.primary : Colors.transparent,
                      width: 3,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      item.icon,
                      color: isSelected ? DSColors.primary : DSColors.gray,
                      size: 24,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.label,
                      style: TextStyle(
                        color: isSelected ? DSColors.primary : DSColors.gray,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}