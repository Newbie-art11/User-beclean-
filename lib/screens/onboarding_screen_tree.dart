import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnBoardingTree extends StatelessWidget {
  const OnBoardingTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                  height: 300, child: Image.asset('assets/img/icon3.png')),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Akses Layanan \n dimana saja dan kapan saja',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  width: 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == 2 ? Colors.green : Colors.grey,
                  ),
                );
              }),
            ),
            SizedBox(
              height: 50.0,
            ),
            ElevatedButton(
              onPressed: () => context.go('/LoginScreen'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 50.0),
                child: Text(
                  'Login atau daftar',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
