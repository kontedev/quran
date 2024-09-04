import 'package:coran/screens/globales.dart';
import 'package:coran/widgets/profile_menu_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: IconButton(onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left)),
        // title: Text(tProfile, style: Theme.of(context).textTheme.headline4),
        // actions: [IconButton(onPressed: () {}, icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              /// -- IMAGE
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100), child: Image.asset(
                      'assets/images/coran.png',
                      height: 140,
                    )),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: primary),
                      child: const Icon(
                        // LineAwesomeIcons.alternate_pencil,
                        Icons.alternate_email,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text("header", style: Theme.of(context).textTheme.headline4),
              Text("Sub header", style: Theme.of(context).textTheme.bodyText2),
              const SizedBox(height: 20),

              /// -- BUTTON
              // SizedBox(
              //   width: 200,
              //   child: ElevatedButton(
              //     onPressed: () => Get.to(() => const UpdateProfileScreen()),
              //     style: ElevatedButton.styleFrom(
              //         backgroundColor: tPrimaryColor, side: BorderSide.none, shape: const StadiumBorder()),
              //     child: const Text(tEditProfile, style: TextStyle(color: tDarkColor)),
              //   ),
              // ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              /// -- MENU
              ProfileMenuWidget(title: "Settings", icon: Icons.settings, onPress: () {}),
              ProfileMenuWidget(title: "Billing Details", icon: Icons.wallet, onPress: () {}),
              ProfileMenuWidget(title: "User Management", icon: Icons.person, onPress: () {}),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(title: "Information", icon: Icons.info, onPress: () {}),
              ProfileMenuWidget(
                  title: "Logout",
                  icon: Icons.logout,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {

                    // Get.defaultDialog(
                    //   title: "LOGOUT",
                    //   titleStyle: const TextStyle(fontSize: 20),
                    //   content: const Padding(
                    //     padding: EdgeInsets.symmetric(vertical: 15.0),
                    //     child: Text("Are you sure, you want to Logout?"),
                    //   ),
                    //   confirm: Expanded(
                    //     child: ElevatedButton(
                    //       onPressed: () => {},
                    //       style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, side: BorderSide.none),
                    //       child: const Text("Yes"),
                    //     ),
                    //   ),
                    //   cancel: OutlinedButton(onPressed: () => Get.back(), child: const Text("No")),
                    // );
                  }),
            ],
          ),
        ),
      ),
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
            "Profile",
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          IconButton(onPressed: (() => {}), icon: Icon(Icons.search_rounded)),
        ],
      ),
    );
  }


  BottomNavigationBar _bottomNavigationBar() {
    return 
    
    BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: gray,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: text),
              activeIcon: Icon(Icons.home, color: primary),
              label: "Accueil"),
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: text),
              activeIcon: Icon(Icons.home, color: primary),
              label: "Accueil"),
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: text),
              activeIcon: Icon(Icons.home, color: primary),
              label: "Accueil"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark, color: text),
              activeIcon: Icon(Icons.bookmark, color: primary),
              label: "Accueil"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: text),
              activeIcon: Icon(Icons.person, color: primary),
              label: "Accueil"),

          //  _bottomBarItem(icon: Icon(Ico) ),
          //  _bottomBarItem(),
          //  _bottomBarItem(),
          //  _bottomBarItem(),
        ]);
  }
}