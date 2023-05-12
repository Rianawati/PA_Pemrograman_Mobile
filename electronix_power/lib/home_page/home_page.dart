import 'package:electronix_power/Color/color.dart';
import 'package:electronix_power/PageDrawer/aboutApp.dart';
import 'package:electronix_power/PageDrawer/announcement.dart';
import 'package:electronix_power/PageDrawer/privacyPolish.dart';
import 'package:electronix_power/create_data.dart';
import 'package:electronix_power/home_page/favorite.dart';
import 'package:electronix_power/home_page/profile.dart';
import 'package:electronix_power/home_page/utama.dart';
import 'package:electronix_power/landing_page/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<BottomNavigationBarItem> navbarItem = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.favorite), label: "Favorite"),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  ];

  int _index = 0; // index yang digunakan untuk buttom navigation bar
  final List<Widget> _body = [utama(), const favorite(), const profile()];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Home',
          style: GoogleFonts.barlowCondensed(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              icon: const Icon(Icons.menu),
              iconSize: 25,
              color: Colors.black,
            );
          },
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: const Icon(
              Icons.add_shopping_cart_sharp,
              color: Colors.black,
            ),
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Container(
          color: Colors.grey.shade200,
          child: Column(
            children: [
              // ignore: avoid_unnecessary_containers
              Container(
                child: DrawerHeader(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://i.pinimg.com/564x/98/56/a1/9856a11dc5c3605d726ea1bce81f8164.jpg'),
                    ),
                  ),
                  // decoration: BoxDecoration(color: Colors.grey.shade500),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://i.pinimg.com/originals/2f/d8/3e/2fd83e5a7d7b76cd846365796cd979bc.png'),
                        radius: 50,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'User0903',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 25.0),
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            'user0903xxx@gmail.com',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 14.0),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text("Profile"),
                subtitle: const Text("Application user accounts"),
                tileColor: const Color.fromARGB(255, 246, 246, 233),
                onTap: () {
                  _scaffoldKey.currentState!.openDrawer();
                  setState(() {
                    _index = 2;
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text("Announcement"),
                subtitle: const Text("Announcement !"),
                tileColor: const Color.fromARGB(255, 246, 246, 233),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return const announcement();
                    }),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings_applications),
                title: const Text("About Application"),
                subtitle: const Text("Application Specifications"),
                tileColor: const Color.fromARGB(255, 246, 246, 233),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return const about(
                        title: 'About Application',
                      );
                    }),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text("Privacy Policy"),
                subtitle:
                    const Text("Contents and permissions of the application"),
                tileColor: const Color.fromARGB(255, 246, 246, 233),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return const privacy();
                    }),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.addchart),
                title: const Text("Create Item"),
                subtitle: const Text("Add Item on List"),
                tileColor: const Color.fromARGB(255, 246, 246, 233),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return const create();
                    }),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Log Out"),
                subtitle: const Text("Exit the application"),
                tileColor: const Color.fromARGB(255, 246, 246, 233),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return const landing_page();
                    }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: _body[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue.shade900.withOpacity(1),
        currentIndex: _index,
        selectedItemColor: background,
        unselectedItemColor: Colors.grey,
        items: navbarItem,
        onTap: (i) {
          setState(() {
            _index = i;
          });
        },
      ),
    );
  }
}
