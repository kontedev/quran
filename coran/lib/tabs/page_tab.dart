import 'package:coran/models/sourate.dart';
import 'package:coran/screens/detail_page.dart';
import 'package:coran/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PageTab extends StatelessWidget {
  const PageTab({super.key});

  Future<List<Sourate>> _getSourateListe() async {
    String data = await rootBundle.loadString("assets/api/coran.json");
    return sourateFromJson(data);
  }

  @override
  Widget build(BuildContext context) {
     return FutureBuilder<List<Sourate>>(
      future: _getSourateListe(),
      initialData:const [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("Error loading data"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No data available"));
        } else {
          // Group sourates by juz and calculate verses per sourate in each juz
          Map<int, List<Map<String, dynamic>>> souratesByPage = {};

          for (var sourate in snapshot.data!) {
            if (sourate.verset != null) {
              for (var verset in sourate.verset!) {
                if (!souratesByPage.containsKey(verset.page)) {
                  souratesByPage[verset.page] = [];
                }

                var souratesInPage = souratesByPage[verset.page]!.firstWhere(
                  (s) => s['sourate'].number == sourate.number,
                  orElse: () => {},
                );

                if (souratesInPage.isEmpty) {
                  souratesByPage[verset.page]!.add({
                    'sourate': sourate,
                    'verseCount': 1,
                  });
                } else {
                  souratesInPage['verseCount'] =
                      (souratesInPage['verseCount'] as int) + 1;
                }
              }
            }
          }

          return GridView.builder(
            itemCount: souratesByPage.keys.length,
            itemBuilder: (context, index) {
              int page = souratesByPage.keys.elementAt(index);
        List<Map<String, dynamic>> souratesInPage = souratesByPage[page]!;

              return _pageCard(
                page: page,
                sourates: souratesInPage,
                context: context,
              );
            }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          );
        }
      },
    );
  }
}

Widget _pageCard({
  required int page,
  required List<Map<String, dynamic>> sourates,
  required BuildContext context,
}) {
  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DetailPage(page: page, numeroSourate: sourates.isNotEmpty ? sourates[0]['sourate'].number : 0,),  // Pass the page number
      ));
    },
    child: Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Text(
            'Page $page',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}


// Widget _pageCard({
//   required int page,
//   required List<Map<String, dynamic>> sourates,
//   required BuildContext context,
// }) {
//   return GestureDetector(
//     behavior: HitTestBehavior.opaque,
//     onTap: () {
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => DetailScreen(numeroSourate: sourates.length),
//       ));
//     },
//     child: Card(
//       elevation: 10,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15.0),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Center(  // Added Center widget
//           child: Text(
//             'Page $page',
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }


  //  return ListView.builder(
  //           itemCount: souratesByPage.keys.length,
  //           itemBuilder: (context, index) {
  //             int page = souratesByPage.keys.elementAt(index);
  //             List<Map<String, dynamic>> souratesInPage = souratesByPage[page]!;

  //             int totalVersesInPage = souratesInPage.fold<int>(
  //                 0, (sum, s) => sum + (s['verseCount'] as int));

  //             return _pageCard(
  //               page: page,
  //               sourates: souratesInPage,
  //               totalVerses: totalVersesInPage,
  //               context: context,
  //             );
  //           },
  //         );