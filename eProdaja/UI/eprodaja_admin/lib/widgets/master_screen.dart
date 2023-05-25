// ignore_for_file: prefer_const_constructors

import 'package:eprodaja_admin/main.dart';
import 'package:eprodaja_admin/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../screens/product_list_screen.dart';

class MasterScreenWidget extends StatefulWidget {
  Widget? child;
  String? title;
  Widget? title_widget;

  MasterScreenWidget({this.child, this.title, this.title_widget, Key? key}) : super(key: key);

  @override
  State<MasterScreenWidget> createState() => _MasterScreenWidgetState();
}

class _MasterScreenWidgetState extends State<MasterScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.title_widget ?? Text(widget.title ?? ""),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Back'),
              onTap: () {
               Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>  LoginPage(),
                        ),
                      );
              },
            ),
            ListTile(
              title: Text('Proizvodi'),
              onTap: () {
                Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProductListScreen(),
                        ),
                      );
              },
            ),
            ListTile(
              title: Text('Detalji'),
              onTap: () {
                Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(),
                        ),
                      );
              },
            )
          ],
        ),
      ),
      body: widget.child!,
    );
  }
}