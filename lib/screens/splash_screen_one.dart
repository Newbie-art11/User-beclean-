import 'package:beclean_user/screens/onboarding_screen_two.dart';
import 'package:flutter/material.dart';

class SplashScreenOne extends StatelessWidget {
  const SplashScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _SplashScreenBody(),
    );
  }
}

class _SplashScreenBody extends StatelessWidget {
  const _SplashScreenBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _SplashScreenImage(),
            const SizedBox(height: 50),
            _SplashScreenTitle(),
            _SplashScreenDots(),
            const SizedBox(height: 20),
            _SplashScreenButtons(),
          ],
        ),
      ),
    );
  }
}

class _SplashScreenImage extends StatelessWidget {
  const _SplashScreenImage();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Image.asset(
        'assets/img/icon1.png',
        fit: BoxFit.contain,
      ),
    );
  }
}

class _SplashScreenTitle extends StatelessWidget {
  const _SplashScreenTitle();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Kelolah sampah \nrumah tangga anda',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _SplashScreenDots extends StatelessWidget {
  const _SplashScreenDots();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == 0 ? Colors.green : Colors.grey,
          ),
        );
      }),
    );
  }
}

class _SplashScreenButtons extends StatelessWidget {
  const _SplashScreenButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OnboardingScreenTwo()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: const Text(
            'Selanjutnya',
            style: TextStyle(color: Colors.white, fontSize: 14.0),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OnboardingScreenTwo()),
            );
          },
          child: const Text(
            'Lewati',
            style: TextStyle(color: Colors.grey, fontSize: 14.0),
          ),
        ),
      ],
    );
  }
}
