import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quraan_read/data/httpApi.dart';
import 'package:lottie/lottie.dart';

import '../data/data.dart';


// ignore: camel_case_types
class Wellcome extends StatefulWidget {
  const Wellcome({Key? key}) : super(key: key);

  @override
  State<Wellcome> createState() => _WellcomeState();
}

class _WellcomeState extends State<Wellcome> with TickerProviderStateMixin {
  late TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 20,
          title: const Center(
            child: Text(
              "Quraan Read",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 100),
                  child: Center(
                    child: Text.rich(
                      TextSpan(
                          text:
                              '\u0628\u0633\u0645\u0627\u0644\u0644\u0627\u0647\u0631\u062d\u0645\u0646\u0631\u0627\u0645\u0646\u0631\u0627\u0645\u06CC\u0631\u0627\u0645',
                          style: TextStyle(
                              fontFamily: 'Arabic',
                              color: Colors.white,
                              fontSize: 20)),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: TabBar(
                tabs: const [
                  Text("Surah"),
                  Text("Juz"),
                  Text("Tafsir"),
                ],
                controller: _tabController,
                indicatorColor: Colors.deepPurple,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white54,
              ),
            ),
            Expanded(
              // ignore: prefer_const_literals_to_create_immutables
              child: TabBarView(
                controller: _tabController,
                children: [
                  Column(
                    children: [
                      FutureBuilder<List<apiQuraan>>(
                          future: getData(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: Lottie.asset('assets/images/i2.json',
                                    width: 200, height: 200),
                              );
                            }
                            return Expanded(
                              child: ListView.builder(
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    apiQuraan apiquraan = snapshot.data![index];
                                    return Column(
                                      children: [
                                        ListTile(
                                          title: Text(
                                            apiquraan.name +
                                                "-" +
                                                apiquraan.number.toString(),
                                            style: GoogleFonts.amiri(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white60),
                                          ),
                                          subtitle: Text(
                                            apiquraan.revelationType +
                                                "-" +
                                                apiquraan.numberOfAyahs
                                                    .toString(),
                                            style: GoogleFonts.amiri(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white60),
                                          ),
                                          trailing: Text(
                                            apiquraan.englishNameTranslation,
                                            style: GoogleFonts.amiri(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white60),
                                          ),
                                          onTap: () {
                                          
                                          },
                                        ),
                                        const Divider(
                                          color: Colors.white,
                                          thickness: 2,
                                        )
                                      ],
                                    );
                                  }),
                            );
                          })
                    ],
                  ),
                  const Center(
                    child: Text("Juz"),
                  ),
                  const Center(
                    child: Text("Tafsir"),
                  ),
                ],
              ),
            ),

            
            
          ],
        ),
         
    ));
  }
}

