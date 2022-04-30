
//@dart=2.9

import 'package:aprendendoingles/telas/Numeros.dart';
import 'package:aprendendoingles/telas/Vogais.dart';
import 'package:aprendendoingles/telas/bichos.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{


  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 3,
        vsync: this
    );
  }
    @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(122, 91, 59, 48),

        title: Text('aprenda inglês'),
        bottom: TabBar(


          indicatorWeight: 4,
           indicatorColor: Colors.grey,
           labelStyle: TextStyle(
             fontSize: 18,
             fontWeight: FontWeight.bold
           ),
           controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Color.fromRGBO(251, 223, 196, 98),
          tabs: [
            Tab(text: 'Bichos',),
            Tab(text: 'Números',),
            Tab(text: 'Vogais',),
          ],
        )
      ),
      body: TabBarView(
        controller: _tabController,
          children: [
            bichos(),
            Numeros(),
            Vogais()

          ]
      ),
    );
  }
}
