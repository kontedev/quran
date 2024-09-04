import 'package:coran/screens/globales.dart';
import 'package:coran/services/coran_provider.dart';
import 'package:coran/tabs/hijb_tab.dart';
import 'package:coran/tabs/page_tab.dart';
import 'package:coran/tabs/para_tab.dart';
import 'package:coran/tabs/sourate_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hijri/hijri_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _hijr = HijriCalendar.now();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: background,
        appBar: _appBar(),
        // bottomNavigationBar: _bottomNavigationBar(),
        body: DefaultTabController(
          length: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverToBoxAdapter(
                  child: _contenu(),
                ),
               SliverAppBar(
                  pinned: true,
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  backgroundColor: background,
                  shape: Border(bottom: BorderSide(
                    color: const Color(0xFFAAAAAA).withOpacity(.1),
                    
                  )),
                  bottom: PreferredSize(preferredSize: const Size.fromHeight(0),
                   child: _tab()),
                )
              ],
              body: const TabBarView(children: [
                SourateTab(), ParaTab(), PageTab(), HijbTab()
              ],)
              ),
          ),
        ));
  }

  TabBar _tab() {
    return TabBar(unselectedLabelColor: text,labelColor:Colors.white , indicatorColor: primary,indicatorWeight:3 , tabs: 
                [
                  _tabItem(label: "Sourate"),
                  _tabItem(label: "Para"),
                  _tabItem(label: "Page"),
                  _tabItem(label: "Hijb"),
                  
                ]);
  }

  Tab _tabItem({required String label}) =>  Tab(
    child: Text(label, style: GoogleFonts.poppins(fontSize:11.3, fontWeight:FontWeight.w600),),);

  Column _contenu() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "As salam aleykoum",
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.w500, color: text),
            ),
            const SizedBox(height: 4),
            Text(
              "Fatoumata KONTE",
              style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            const SizedBox(height: 20),
           RichText(
  text: TextSpan(
    children: [
      TextSpan(
        text: '${_hijr.dayNameInFrench} ',
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
       TextSpan(
        text: '${_hijr.hDay.toString()} ',
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
      TextSpan(
        text: '${_hijr.monthNameInFrench} ',
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
      TextSpan(
        text: '${_hijr.hYear} AH',
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    ],
  ),
)
,
            const SizedBox(height: 24),
            _statistique()
          ],
        );
  }

  Stack _statistique() {
    return Stack(
              children: [
                Container(
                  height: 131,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomLeft,
                          stops: [
                            0,
                            .6,
                            1
                          ],
                          colors: [
                            Color(0xFFDF98FA),
                            Color(0xFFB070FD),
                            Color(0xFF9055FF)
                          ])),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/images/coran.png',
                      height: 140,
                    )),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset( 
                            'assets/images/coran.png',
                            height: 40,
                          ),
                        const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Derniere lecture",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Al Fatihah",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Ayat No: 1",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
  }

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      // backgroundColor: background,
      elevation: 0,
      title: Row(
        children: [
          IconButton(onPressed: (() => {}), icon: Icon(Icons.menu)),
          SizedBox(
            width: 24,
          ),
          Text(
            "Coran App",
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          IconButton(onPressed: (() => {}), icon: Icon(Icons.search_rounded)),
        ],
      ),
    );
  }
}
