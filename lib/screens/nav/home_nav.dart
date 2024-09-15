import 'package:beclean_user/screens/nav/mutation_screen.dart';
import 'package:beclean_user/screens/nav/product_screen.dart';
import 'package:beclean_user/screens/nav/profile_screen.dart';
import 'package:beclean_user/screens/pickup_screen.dart';
import 'package:beclean_user/screens/schedule_notification_screen.dart';
import 'package:beclean_user/widgets/wasted_button.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.green,
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/img/icon4.png'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text(
                              'Halo,John Doe',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                color: Colors.white,
                              ),
                              Text(
                                'Kota Bireuen',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        width: 120,
                      ),
                      Stack(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey[400]),
                            child: IconButton(
                              icon: Icon(
                                Icons.notifications,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: () {
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
                                    color: Colors.red, shape: BoxShape.circle),
                              ))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                      padding: EdgeInsets.only(right: 300.0),
                      child: Text(
                        'Saldo anda',
                        style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                  Row(children: [
                    Text(
                      "Rp.20.000",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: 200.0,
                    ),
                    Container(
                      height: 40.0,
                      width: 70.0,
                      child: Center(
                          child: Text(
                        "cairkan",
                        style: TextStyle(color: Colors.green, fontSize: 15.0),
                      )),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.green[100],
                      ),
                    )
                  ])
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(16.0),
              child: WasteButton(
                  label: 'JEMPUT SAMPAH',
                  iconPath: 'assets/img/pickup_organik.png',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PickupScreen()));
                  }),
            ),
            lineSchedule('Jadwal Aktif', 'Lihat History'),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: GestureDetector(
                    onTap: () {
                      print("Sampah daur ulang");
                    },
                    child: ScheduleCard(
                        title: 'Sampah Daur Ulang',
                        address: 'jl. Medan Banda aceh, KM 100',
                        date: '11/8/2024',
                        statusColor: Colors.green),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: GestureDetector(
                    onTap: () {
                      print("Sampah Rumah Tangga");
                    },
                    child: ScheduleCard(
                        title: 'Sampah Rumah Tangga',
                        address: 'jl. Medan Banda aceh, KM 100',
                        date: 'pending',
                        statusColor: Colors.orange),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String title;
  final String address;
  final String date;
  final Color statusColor;

  ScheduleCard({
    required this.title,
    required this.address,
    required this.date,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(address),
        trailing: Container(
          padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            date,
            style: TextStyle(color: statusColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

Widget lineSchedule(String jadwal, String history) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(
        jadwal,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
      ),
      SizedBox(
        width: 150.0,
      ),
      Text(history),
    ],
  );
}
