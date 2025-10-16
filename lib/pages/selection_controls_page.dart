import 'package:flutter/material.dart';
import '../design_system/ds_colors.dart';
import '../design_system/components/ds_checkbox.dart';
import '../design_system/components/ds_radio.dart';
import '../design_system/components/ds_switch.dart';

class SelectionControlsPage extends StatefulWidget {
  const SelectionControlsPage({Key? key}) : super(key: key);

  @override
  State<SelectionControlsPage> createState() => _SelectionControlsPageState();
}

class _SelectionControlsPageState extends State<SelectionControlsPage> {
  bool _checkbox1 = false;
  bool _checkbox2 = true;
  bool _checkbox3 = false;

  int _radioValue = 1;
  int _radioValue2 = 2;

  bool _switch1 = false;
  bool _switch2 = true;
  bool _switch3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Selection Controls'),
        backgroundColor: DSColors.primary,
        foregroundColor: DSColors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _buildSection(
            'Checkbox',
            Column(
              children: [
                _buildControlRow(
                  'Checkbox',
                  DSCheckbox(
                    value: _checkbox1,
                    onChanged: (value) => setState(() => _checkbox1 = value!),
                  ),
                ),
                _buildControlRow(
                  'Checkbox Checked',
                  DSCheckbox(
                    value: _checkbox2,
                    onChanged: (value) => setState(() => _checkbox2 = value!),
                  ),
                ),
                _buildControlRow(
                  'Checkbox Disabled',
                  DSCheckbox(
                    value: _checkbox3,
                    onChanged: null,
                    enabled: false,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          _buildSection(
            'Radio Button',
            Column(
              children: [
                _buildControlRow(
                  'Option 1',
                  DSRadio<int>(
                    value: 1,
                    groupValue: _radioValue,
                    onChanged: (value) => setState(() => _radioValue = value!),
                  ),
                ),
                _buildControlRow(
                  'Option 2',
                  DSRadio<int>(
                    value: 2,
                    groupValue: _radioValue,
                    onChanged: (value) => setState(() => _radioValue = value!),
                  ),
                ),
                _buildControlRow(
                  'Option 3',
                  DSRadio<int>(
                    value: 3,
                    groupValue: _radioValue,
                    onChanged: (value) => setState(() => _radioValue = value!),
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 16),
                _buildControlRow(
                  'Disabled Option 1',
                  DSRadio<int>(
                    value: 1,
                    groupValue: _radioValue2,
                    onChanged: null,
                    enabled: false,
                  ),
                ),
                _buildControlRow(
                  'Disabled Option 2',
                  DSRadio<int>(
                    value: 2,
                    groupValue: _radioValue2,
                    onChanged: null,
                    enabled: false,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          _buildSection(
            'Switch',
            Column(
              children: [
                _buildControlRow(
                  'Switch Off',
                  DSSwitch(
                    value: _switch1,
                    onChanged: (value) => setState(() => _switch1 = value),
                  ),
                ),
                _buildControlRow(
                  'Switch On',
                  DSSwitch(
                    value: _switch2,
                    onChanged: (value) => setState(() => _switch2 = value),
                  ),
                ),
                _buildControlRow(
                  'Switch Disabled',
                  DSSwitch(
                    value: _switch3,
                    onChanged: null,
                    enabled: false,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, Widget child) {
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
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: DSColors.lightGray),
            borderRadius: BorderRadius.circular(8),
          ),
          child: child,
        ),
      ],
    );
  }

  Widget _buildControlRow(String label, Widget control) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          control,
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}