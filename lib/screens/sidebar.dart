import 'package:dashboard/screens/dashboard.dart';
import 'package:dashboard/theme/app_colors.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  Widget? pageActive;
  String? titrePage;
  List<String> titreDesPages = [
    'Dashboard',
    'Suivi colis',
    'Contacts',
    'Calculatrice',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double largeurTotal = constraints.maxWidth;
          return Row(
            children: [
              Container(
                color: AppColors.primaryColor,
                width: largeurTotal * 0.20,
                child: sideBarElement(),
              ),

              Container(
                color: AppColors.backgroundColor,
                width: largeurTotal * 0.80,
                child: Center(
                  child: Column(
                    children: [
                      Text('Page active'),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Dashboard(),
                            ),
                          );
                        },
                        child: Text('Dashboard'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  //Les elements de la section sideBar
  Widget sideBarElement() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Nirida Expedition",
            style: TextStyle(
              color: AppColors.textLight,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
