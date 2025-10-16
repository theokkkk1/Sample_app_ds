import 'package:flutter/material.dart';
import '../design_system/ds_colors.dart';
import '../design_system/components/ds_text_field.dart';

class TextFieldsPage extends StatefulWidget {
  const TextFieldsPage({Key? key}) : super(key: key);

  @override
  State<TextFieldsPage> createState() => _TextFieldsPageState();
}

class _TextFieldsPageState extends State<TextFieldsPage> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController(text: 'Texto de exemplo');
  final _errorController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_formKey.currentState != null) {
        _formKey.currentState!.validate();
      }
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _errorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Text Fields'),
        backgroundColor: DSColors.primary,
        foregroundColor: DSColors.white,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const Text(
              'Text Fields',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: DSColors.black,
              ),
            ),
            const SizedBox(height: 32),
            
            
            _buildTextFieldGroup(
              'Normal',
              DSTextField(
                label: 'Label',
                hint: 'Placeholder text',
                helperText: 'Helper text',
              ),
            ),
            const SizedBox(height: 24),

            
            _buildTextFieldGroup(
              'Com Texto',
              DSTextField(
                label: 'Label',
                hint: 'Placeholder text',
                helperText: 'Helper text',
                controller: _textController,
              ),
            ),
            const SizedBox(height: 24),

            
            _buildTextFieldGroup(
              'Disabled',
              const DSTextField(
                label: 'Label',
                hint: 'Placeholder text',
                helperText: 'Helper text',
                enabled: false,
              ),
            ),
            const SizedBox(height: 24),

           
            _buildTextFieldGroup(
              'Com Erro',
              DSTextField(
                label: 'Label',
                hint: 'Placeholder text',
                helperText: 'Mensagem de erro',
                controller: _errorController,
                validator: (value) {
                  return 'Este campo é obrigatório';
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldGroup(String title, Widget textField) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: DSColors.black,
          ),
        ),
        const SizedBox(height: 12),
        textField,
      ],
    );
  }
}