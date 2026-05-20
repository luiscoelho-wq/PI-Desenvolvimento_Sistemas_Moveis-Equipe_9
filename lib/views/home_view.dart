import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/dashboard_viewmodel.dart';
import 'dashboard_view.dart';
import 'client_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DashboardViewModel>(context);

    final pages = [
      DashboardView(vm: vm),   
      const ClientListView(),
    ];

    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        selectedItemColor: const Color(0xFF6A1B9A),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Clientes",
          ),
        ],
      ),
    );
  }
}
