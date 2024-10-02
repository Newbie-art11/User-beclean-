import 'package:beclean_user/provider/account_provider.dart';
import 'package:beclean_user/provider/user_provider.dart';
import 'package:beclean_user/screens/nav/mutation_screen.dart';
import 'package:beclean_user/screens/nav/product_screen.dart';
import 'package:beclean_user/screens/nav/profile_screen.dart';
import 'package:beclean_user/screens/pickup_screen.dart';
import 'package:beclean_user/screens/schedule_notification_screen.dart';
import 'package:beclean_user/widgets/wasted_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({super.key});

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  int _currenctindex = 0;
  final List<Widget> _chidlren = [
    HomeScreen(),
    ProductScreen(),
    MutationScreen(),
    ProfileScreen()
  ];
  void onTabTapped(int index) {
    setState(() {
      _currenctindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _chidlren[_currenctindex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Produk',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Mutasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.green[400],
        onTap: onTabTapped,
        currentIndex: _currenctindex,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              padding: const EdgeInsets.all(16.0),
              color: Colors.green,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/img/icon4.png'),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Halo Fajar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.location_pin,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Kota Bireuen',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[400],
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.notifications,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: () {
                                //Naviation pus
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ScheduleNotificationScreen()));
                              },
                            ),
                          ),
                          Positioned(
                            right: 8.0,
                            top: 8.0,
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Saldo Anda',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Rp.20.000",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        height: 40.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.green[100],
                        ),
                        child: Center(
                          child: Text(
                            "Cairkan",
                            style: TextStyle(
                              color: Colors.green[900],
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16.0),
              child: WasteButton(
                label: 'JEMPUT SAMPAH',
                iconPath: 'assets/img/pickup_organik.png',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PickupScreen()));
                },
              ),
            ),
            lineSchedule('Jadwal Aktif', 'Lihat History'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      print("Sampah daur ulang");
                    },
                    child: ScheduleCard(
                      title: 'Sampah Daur Ulang',
                      address: 'Jl. Medan Banda Aceh, KM 100',
                      date: '11/8/2024',
                      statusColor: Colors.green,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Sampah Rumah Tangga");
                    },
                    child: const ScheduleCard(
                      title: 'Sampah Rumah Tangga',
                      address: 'Jl. Medan Banda Aceh, KM 100',
                      date: 'Pending',
                      statusColor: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Contoh Widget WasteButton
class WasteButton extends StatelessWidget {
  final String label;
  final String iconPath;
  final VoidCallback onTap;

  const WasteButton({
    required this.label,
    required this.iconPath,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(17.0),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              width: 90.0,
              height: 90.0,
              color: Colors.white,
            ),
            const SizedBox(width: 8.0),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Contoh Widget ScheduleCard
class ScheduleCard extends StatelessWidget {
  final String title;
  final String address;
  final String date;
  final Color statusColor;

  const ScheduleCard({
    required this.title,
    required this.address,
    required this.date,
    required this.statusColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(address),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(date),
                CircleAvatar(
                  backgroundColor: statusColor,
                  radius: 8.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget lineSchedule(String title, String actionText) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            actionText,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 14.0,
            ),
          ),
        ),
      ],
    ),
  );
}
