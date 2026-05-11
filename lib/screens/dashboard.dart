import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //Declaration de variables
  late Map<String, dynamic> data;
  late List<Map<String, dynamic>> teams;

  //Ici un bloc pour charger les donnees au lancement de la page
  @override
  void initState() {
    super.initState();
    loadJson();
  }

  //Exemple de fonction pour recuperer les donnees json.
  //Il faut tout d'abord declarer les variables. Ici data et teams declares si haut
  Future<void> loadJson() async {
    final String root = await rootBundle.loadString('assets/data/root.json');
    final String team = await rootBundle.loadString('assets/data/users.json');
    List<dynamic> teamList = json.decode(team);

    setState(() {
      data = jsonDecode(root);
      teams = List<Map<String, dynamic>>.from(teamList);
    });
    //appliquer une map pour recuperer juste key -> name
    var users = teams.map((user) => user['name']).toList();
    print('Test d\'affichage de donnees json transformees en donnees dart');
    print('l\'equipe de ${data['titre']} ');
    print('Une equipe de ${teams.length} personnes');
    print('Liste des developpeurs -> $users');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Dashboard')));
  }
}
