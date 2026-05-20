import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/client_viewmodel.dart';
import '../core/utils/currency_formatter.dart';

class ClientFormView extends StatefulWidget {
  const ClientFormView({super.key});

  @override
  State<ClientFormView> createState() => _ClientFormViewState();
}

class _ClientFormViewState extends State<ClientFormView> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  final cnpjController = TextEditingController();
  final razaoSocialController = TextEditingController();
  final nomeFantasiaController = TextEditingController();

  final faturamentoController = TextEditingController();
  final funcionariosController = TextEditingController();

  void _applyPhoneMask(String value) {
    String digits = value.replaceAll(RegExp(r'\D'), '');
    if (digits.length > 11) digits = digits.substring(0, 11);

    String formatted = '';

    for (int i = 0; i < digits.length; i++) {
      if (i == 0) formatted += '(';
      if (i == 2) formatted += ') ';
      if (i == 7) formatted += '-';

      formatted += digits[i];
    }

    phoneController.value = TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  void _applyCnpjMask(String value) {
    String digits = value.replaceAll(RegExp(r'\D'), '');
    if (digits.length > 14) digits = digits.substring(0, 14);

    String formatted = '';

    for (int i = 0; i < digits.length; i++) {
      if (i == 2) formatted += '.';
      if (i == 5) formatted += '.';
      if (i == 8) formatted += '/';
      if (i == 12) formatted += '-';

      formatted += digits[i];
    }

    cnpjController.value = TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ClientViewModel>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: Column(
          children: [
           Container(
  width: double.infinity,
  padding: const EdgeInsets.fromLTRB(22, 24, 22, 30),

  decoration: const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF7B2FD3),
        Color(0xFF6A1B9A),
      ],
    ),

    boxShadow: [
      BoxShadow(
        color: Color(0x4D6A1B9A),
        blurRadius: 14,
        offset: Offset(0, 6),
      ),
    ],
  ),

  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Novo Cliente",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          SizedBox(height: 4),

          Text(
            "Cadastro da empresa",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
        ],
      ),

      GestureDetector(
        onTap: () => Navigator.pop(context),

        child: Container(
          padding: const EdgeInsets.all(4),

          decoration: BoxDecoration(
            color: Colors.white24,
            shape: BoxShape.circle,
          ),

          child: const CircleAvatar(
            radius: 22,
            backgroundColor: Colors.white,

            child: Icon(
              Icons.arrow_back,
              color: Color(0xFF6A1B9A),
            ),
          ),
        ),
      ),
    ],
  ),
),

            const SizedBox(height: 20),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _field(nameController, "Nome"),
                      _field(emailController, "Email"),

                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        onChanged: _applyPhoneMask,
                        decoration: _dec("Telefone / WhatsApp"),
                      ),

                      const SizedBox(height: 10),

                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Dados da Empresa",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                      const SizedBox(height: 8),

                      TextFormField(
                        controller: cnpjController,
                        keyboardType: TextInputType.number,
                        onChanged: _applyCnpjMask,
                        decoration: _dec("CNPJ"),
                      ),

                      const SizedBox(height: 10),

                      _field(razaoSocialController, "Razão Social"),
                      _field(nomeFantasiaController, "Nome Fantasia"),

                      const SizedBox(height: 12),

                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Dados de Faturamento",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                      const SizedBox(height: 10),

                      TextFormField(
                        controller: faturamentoController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [CurrencyInputFormatter()],
                        decoration: _dec("Faturamento mensal"),
                      ),

                      const SizedBox(height: 10),

                      _field(funcionariosController, "Nº de funcionários"),

                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                     backgroundColor: const Color(0xFF6A1B9A),
                     foregroundColor: Colors.white,

                     shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(12),
                       ),
                      ),
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) return;

                            vm.addClient(
                              nameController.text,
                              emailController.text,
                              phoneController.text,
                              cnpjController.text,
                              razaoSocialController.text,
                              nomeFantasiaController.text,
                              CurrencyInputFormatter.parse(
                                  faturamentoController.text),
                              int.tryParse(funcionariosController.text),
                            );

                            Navigator.pop(context);
                          },
                         child: const Text(
                          "Salvar",
                         style: TextStyle(
                         fontSize: 16,
                          fontWeight: FontWeight.bold,
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _field(TextEditingController c, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: c,
        decoration: _dec(label),
      ),
    );
  }

  InputDecoration _dec(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }
}