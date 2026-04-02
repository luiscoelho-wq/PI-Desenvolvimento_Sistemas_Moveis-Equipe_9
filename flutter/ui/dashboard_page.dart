// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kPrimary = Color(0xFF8236FB);
const Color kPrimaryLight = Color(0xFFF3EEFF);
const Color kPrimaryMid = Color(0xFFEEEDFE);
const Color kText = Color(0xFF1F2937);
const Color kSubtext = Color(0xFF6B7280);
const Color kBg = Color(0xFFF9FAFB);
const Color kSurface = Color(0xFFFFFFFF);
const Color kBorder = Color(0xFFE5E7EB);
const Color kOrange = Color(0xFFFA8C36);
const Color kGreen = Color(0xFF1D9E75);
const Color kAmber = Color(0xFFFAC775);

class Task {
  final String title, subtitle, tag, dueLabel;
  final Color accent, tagBg, tagText, iconBg, iconColor;
  final IconData icon;

  const Task({
    required this.title,
    required this.subtitle,
    required this.tag,
    required this.dueLabel,
    required this.accent,
    required this.tagBg,
    required this.tagText,
    required this.iconBg,
    required this.iconColor,
    required this.icon,
  });
}

class _CalendarDay {
  final String label, number;
  final bool isToday, hasDot;
  final Color dotColor;

  const _CalendarDay({
    required this.label,
    required this.number,
    this.isToday = false,
    this.hasDot = false,
    this.dotColor = kPrimary,
  });
}

class DashboardPage extends StatefulWidget {
  final String userName;

  const DashboardPage({super.key, this.userName = 'Usuário'});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  int navIndex = 0;

  late AnimationController animCtrl;
  late Animation<double> fadeAnim;
  late Animation<Offset> slideAnim;

  final List<_CalendarDay> _days = const [
    _CalendarDay(label: 'Dom', number: '6'),
    _CalendarDay(label: 'Seg', number: '7', hasDot: true),
    _CalendarDay(label: 'Ter', number: '8', hasDot: true),
    _CalendarDay(label: 'Qua', number: '9', isToday: true, hasDot: true),
    _CalendarDay(label: 'Qui', number: '10'),
    _CalendarDay(label: 'Sex', number: '11', hasDot: true, dotColor: kOrange),
    _CalendarDay(label: 'Sab', number: '12'),
  ];

  final List<Task> tasks = const [
    Task(
      title: 'Finalizar tax reports',
      subtitle: 'IRPJ - Competência Jan/2026',
      tag: 'Urgente',
      dueLabel: 'Vence hoje',
      accent: kOrange,
      tagBg: Color(0xFFFEF0E8),
      tagText: Color(0xFF854F0B),
      iconBg: Color(0xFFFEF0E8),
      iconColor: Color(0xFF854F0B),
      icon: Icons.flag_outlined,
    ),
    Task(
      title: 'Review jurídico',
      subtitle: 'Contratos e compliance Q4',
      tag: 'Revisão',
      dueLabel: 'Amanhã',
      accent: kPrimary,
      tagBg: kPrimaryMid,
      tagText: Color(0xFF3C3489),
      iconBg: kPrimaryMid,
      iconColor: Color(0xFF534AB7),
      icon: Icons.checklist_outlined,
    ),
    Task(
      title: 'Atualizar financial records',
      subtitle: 'Conciliação bancária Fev/2026',
      tag: 'Regular',
      dueLabel: 'Esta semana',
      accent: kGreen,
      tagBg: Color(0xFFE1F5EE),
      tagText: Color(0xFF085041),
      iconBg: Color(0xFFE1F5EE),
      iconColor: Color(0xFF0F6E56),
      icon: Icons.account_balance_outlined,
    ),
  ];

  @override
  void initState() {
    super.initState();
    animCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    fadeAnim = CurvedAnimation(parent: animCtrl, curve: Curves.easeOut);
    slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.04),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: animCtrl, curve: Curves.easeOutCubic));
    animCtrl.forward();
  }

  @override
  void dispose() {
    animCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      extendBody: true,
      body: FadeTransition(
        opacity: fadeAnim,
        child: SlideTransition(
          position: slideAnim,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                _buildHeader(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 110),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      _buildCalendar(),
                      const SizedBox(height: 20),
                      _buildSectionTitle('Tarefas do dia', 'Ver todas'),
                      const SizedBox(height: 10),
                      ...tasks.map(_buildTaskCard),
                      const SizedBox(height: 20),
                      _buildSectionTitle('Insights de IA', null, badge: true),
                      const SizedBox(height: 10),
                      _buildPieCard(),
                      const SizedBox(height: 10),
                      _buildBarCard(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // Header
  Widget _buildHeader() {
    return Container(
      decoration: const BoxDecoration(
        color: kPrimary,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      padding: EdgeInsets.fromLTRB(
        22,
        MediaQuery.of(context).padding.top + 16,
        22,
        52,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Painel Inteligente',
                        style: GoogleFonts.quicksand(
                            fontSize: 12,
                            color: Colors.white70,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(height: 3),
                    Text('Olá, ${widget.userName}',
                        style: GoogleFonts.quicksand(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.3)),
                  ],
                ),
              ),
              const Icon(Icons.notifications_none_rounded,
                  color: Colors.white, size: 26),
              const SizedBox(width: 8),
              CircleAvatar(
                radius: 18,
                backgroundColor: const Color(0xFFC4A3FF),
                child: Text(
                  widget.userName.isNotEmpty
                      ? widget.userName
                          .split(' ')
                          .where((w) => w.isNotEmpty)
                          .take(2)
                          .map((w) => w[0])
                          .join()
                      : 'U',
                  style: GoogleFonts.quicksand(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF3C3489)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Calendar
  Widget _buildCalendar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.calendar_today_outlined,
                  color: kPrimary, size: 16),
              const SizedBox(width: 8),
              Text('Março 2026',
                  style: GoogleFonts.quicksand(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: kText)),
              const Spacer(),
              const Icon(Icons.chevron_left, color: kPrimary),
              const SizedBox(width: 6),
              const Icon(Icons.chevron_right, color: kPrimary),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _days.map(_buildDayPill).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildDayPill(_CalendarDay d) {
    return Column(
      children: [
        Text(d.label,
            style: GoogleFonts.quicksand(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: d.isToday ? kPrimary : kSubtext
                                )),
        const SizedBox(height: 4),
        Container(
          width: 32,
          height: 32,
          decoration: d.isToday
              ? const BoxDecoration(
                  color: kPrimary, shape: BoxShape.circle)
              : null,
          child: Center(
            child: Text(
              d.number,
              style: GoogleFonts.quicksand(
                fontSize: 14,
                fontWeight:
                    d.isToday ? FontWeight.w700 : FontWeight.w500,
                color: d.isToday ? Colors.white : kSubtext,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        d.hasDot
            ? Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  color: d.dotColor,
                  shape: BoxShape.circle,
                ),
              )
            : const SizedBox(height: 5),
      ],
    );
  }

  // Section title
  Widget _buildSectionTitle(String title, String? action,
      {bool badge = false}) {
    return Row(
      children: [
        Text(title,
            style: GoogleFonts.quicksand(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: kText)),
        if (badge) ...[
          const SizedBox(width: 8),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: kPrimaryMid,
              borderRadius: BorderRadius.circular(99),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.schedule,
                    color: Color(0xFF534AB7), size: 11),
                const SizedBox(width: 4),
                Text('Atualizado agora',
                    style: GoogleFonts.quicksand(
                        fontSize: 10,
                        color: const Color(0xFF3C3489),
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
        if (action != null) ...[
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Text(action,
                style: GoogleFonts.quicksand(
                    fontSize: 12,
                    color: kPrimary,
                    fontWeight: FontWeight.w700)),
          ),
        ],
      ],
    );
  }

  // Task card
  Widget _buildTaskCard(Task t) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: t.iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(t.icon, color: t.iconColor, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t.title,
                    style: GoogleFonts.quicksand(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: kText)),
                Text(t.subtitle,
                    style: GoogleFonts.quicksand(
                        fontSize: 12,
                        color: kSubtext,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: t.tagBg,
              borderRadius: BorderRadius.circular(99),
            ),
            child: Text(t.tag,
                style: GoogleFonts.quicksand(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: t.tagText)),
          ),
        ],
      ),
    );
  }

  // Placeholder para gráficos
  Widget _buildPieCard() {
    return Container(
      height: 160,
      decoration: _cardDecoration(),
      child: Center(
        child: Text('Gráfico de Pizza (placeholder)',
            style: GoogleFonts.quicksand(
                fontSize: 13, color: kSubtext)),
      ),
    );
  }

  Widget _buildBarCard() {
    return Container(
      height: 160,
      decoration: _cardDecoration(),
      child: Center(
        child: Text('Gráfico de Barras (placeholder)',
            style: GoogleFonts.quicksand(
                fontSize: 13, color: kSubtext)),
      ),
    );
  }

  // Bottom navigation
  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: navIndex,
      onTap: (i) => setState(() => navIndex = i),
      selectedItemColor: kPrimary,
      unselectedItemColor: kSubtext,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined), label: 'Painel'),
        BottomNavigationBarItem(
            icon: Icon(Icons.task_alt_outlined), label: 'Tarefas'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: 'Perfil'),
      ],
    );
  }

  // Card decoration padrão
  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: kSurface,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 20,
          offset: const Offset(0, 6),
        ),
      ],
    );
  }
}
