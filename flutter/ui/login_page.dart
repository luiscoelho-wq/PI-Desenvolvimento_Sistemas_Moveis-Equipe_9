// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kPrimary = Color(0xFF8236FB);
const Color kText = Color(0xFF1F2937);
const Color kSubtext = Color(0xFF6B7280);
const Color kBorder = Color(0xFFE5E7EB);
const double kRadius = 14.0;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  bool obscurePass = true;
  bool isLoading = false;

  late AnimationController animCtrl;
  late Animation<double> fadeAnim;
  late Animation<Offset> slideAnim;

  @override
  void initState() {
    super.initState();
    animCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    fadeAnim = CurvedAnimation(parent: animCtrl, curve: Curves.easeOut);
    slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: animCtrl, curve: Curves.easeOutCubic));
    animCtrl.forward();
  }

  @override
  void dispose() {
    animCtrl.dispose();
    emailCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    setState(() => isLoading = true);

    await Future.delayed(const Duration(milliseconds: 1500));

    setState(() => isLoading = false);
    if (!mounted) return;

    Navigator.pushReplacementNamed(
      context,
      '/dashboard',
      arguments: {'userName': 'Lívia Moia'},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: FadeTransition(
          opacity: fadeAnim,
          child: SlideTransition(
            position: slideAnim,
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 32),
                    _buildLogo(),
                    const SizedBox(height: 40),
                    _buildCard(),
                    const SizedBox(height: 24),
                    _buildRegisterLink(),
                    const SizedBox(height: 16),
                    _buildFooter(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Logo
  Widget _buildLogo() {
    return Column(
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: kPrimary.withOpacity(0.12)),
            boxShadow: [
              BoxShadow(
                color: kPrimary.withOpacity(0.12),
                blurRadius: 20,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: const Icon(Icons.explore_outlined,
              color: kPrimary, size: 36),
        ),
        const SizedBox(height: 14),
        Text(
          'Atlas Contábil',
          style: GoogleFonts.quicksand(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: kText,
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Sua bússola na gestão fiscal',
          style: GoogleFonts.quicksand(
            fontSize: 13,
            color: kSubtext,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // Card do formulário
  Widget _buildCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Entrar na sua conta',
              style: GoogleFonts.quicksand(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: kText)),
          const SizedBox(height: 4),
          Text('Bem-vindo de volta!',
              style: GoogleFonts.quicksand(
                  fontSize: 13,
                  color: kSubtext,
                  fontWeight: FontWeight.w500)),
          const SizedBox(height: 22),
          AtlasField(
            controller: emailCtrl,
            label: 'E-mail',
            hint: 'seu@escritorio.com',
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            validator: (v) {
              final re = RegExp(r'^[\w.+-]+@[\w-]+\.[a-z]{2,}$',
                  caseSensitive: false);
              if (v == null || !re.hasMatch(v)) return 'E-mail inválido';
              return null;
            },
          ),
          const SizedBox(height: 16),
          AtlasPasswordField(
            controller: passCtrl,
            obscure: obscurePass,
            onToggle: () => setState(() => obscurePass = !obscurePass),
            validator: (v) {
              if (v == null || v.length < 6) return 'Mínimo de 6 caracteres';
              return null;
            },
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {},
              child: Text(
                'Esqueci minha senha',
                style: GoogleFonts.quicksand(
                  fontSize: 12,
                  color: kPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 22),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: isLoading ? null : _login,
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimary,
                disabledBackgroundColor: kPrimary.withOpacity(0.6),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kRadius),
                ),
              ),
              child: isLoading
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      'Entrar',
                      style: GoogleFonts.quicksand(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  // Link para cadastro
  Widget _buildRegisterLink() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/register'),
      child: RichText(
        text: TextSpan(
          style: GoogleFonts.quicksand(
            fontSize: 13,
            color: kSubtext,
            fontWeight: FontWeight.w500,
          ),
          children: [
            const TextSpan(text: 'Não tem uma conta? '),
            TextSpan(
              text: 'Cadastre-se',
              style: GoogleFonts.quicksand(
                color: kPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Rodapé
  Widget _buildFooter() {
    return Text(
      '© 2026 Atlas Contábil · Gestão Fiscal Inteligente',
      style: GoogleFonts.quicksand(fontSize: 11, color: kSubtext),
    );
  }
}

// Campo reutilizável
class AtlasField extends StatefulWidget {
  final TextEditingController controller;
  final String label, hint;
  final IconData icon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const AtlasField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  State<AtlasField> createState() => _AtlasFieldState();
}

class _AtlasFieldState extends State<AtlasField> {
  bool focused = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label,
            style: GoogleFonts.quicksand(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: kSubtext,
                letterSpacing: 0.3)),
        const SizedBox(height: 6),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(kRadius),
            border: Border.all(
              color: focused ? kPrimary : kBorder,
              width: focused ? 1.8 : 1.2,
            ),
            boxShadow: focused
                ? [
                    BoxShadow(
                      color: kPrimary.withOpacity(0.10),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    )
                  ]
                : [],
          ),
          child: Focus(
            onFocusChange: (v) => setState(() => focused = v),
            child: TextFormField(
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              validator: widget.validator,
              style: GoogleFonts.quicksand(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: kText,
              ),
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: GoogleFonts.quicksand(
                  color: kSubtext.withOpacity(0.6),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                prefixIcon: Icon(
                  widget.icon,
                  color: focused ? kPrimary : kSubtext,
                  size: 20,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 15,
                ),
                errorStyle: GoogleFonts.quicksand(
                  fontSize: 11,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Campo de senha reutilizável
class AtlasPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final bool obscure;
  final VoidCallback onToggle;
  final String? Function(String?)? validator;

  const AtlasPasswordField({
    super.key,
    required this.controller,
    required this.obscure,
    required this.onToggle,
    this.validator,
  });

  @override
  State<AtlasPasswordField> createState() => _AtlasPasswordFieldState();
}

class _AtlasPasswordFieldState extends State<AtlasPasswordField> {
  bool focused = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Senha',
            style: GoogleFonts.quicksand(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: kSubtext,
              letterSpacing: 0.3,
            )),
        const SizedBox(height: 6),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(kRadius),
            border: Border.all(
              color: focused ? kPrimary : kBorder,
              width: focused ? 1.8 : 1.2,
            ),
            boxShadow: focused
                ? [
                    BoxShadow(
                      color: kPrimary.withOpacity(0.10),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    )
                  ]
                : [],
          ),
          child: Focus(
            onFocusChange: (v) => setState(() => focused = v),
            child: TextFormField(
              controller: widget.controller,
              obscureText: widget.obscure,
              validator: widget.validator,
              style: GoogleFonts.quicksand(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: kText,
              ),
              decoration: InputDecoration(
                hintText: '........',
                hintStyle: GoogleFonts.quicksand(
                  color: kSubtext.withOpacity(0.6),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                prefixIcon: Icon(Icons.lock_outline,
                    color: focused ? kPrimary : kSubtext, size: 20),
                suffixIcon: IconButton(
                  onPressed: widget.onToggle,
                  icon: Icon(
                    widget.obscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: kSubtext,
                    size: 20,
                  ),
                  splashRadius: 20,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 15,
                ),
                errorStyle: GoogleFonts.quicksand(
                  fontSize: 11,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
