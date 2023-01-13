import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'dart:convert';

import 'package:quraan_read/data/httpApi.dart';

import '../data/detailData.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: SafeArea(
            child: Container(
          child: Column(
            children: [
              FutureBuilder<List<Ayah>>(
                future: dataPure(0),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Center(child: Lottie.asset('assets/images/i2.json'));
                  }

                  return Expanded(
                      child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Ayah ayah = snapshot.data![index];
                      return ListTile(
                        title: Text(ayah.page.toString()),
                        subtitle: Text(ayah.text),
                      );
                    },
                  ));
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}
