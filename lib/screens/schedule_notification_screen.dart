import 'package:beclean_user/widgets/notification_widget.dart';
import 'package:flutter/material.dart';

class ScheduleNotificationScreen extends StatefulWidget {
  const ScheduleNotificationScreen({super.key});

  @override
  State<ScheduleNotificationScreen> createState() =>
      _ScheduleNotificationScreenState();
}

class _ScheduleNotificationScreenState
    extends State<ScheduleNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Notifikasi',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            notificationWidget('Sampah anda telah diangkut'),
            notificationWidget('Driver sedang menuju tempat anda'),
            notificationWidget('Transaksi berhasil'),
          ],
        ),
      ),
    );
  }
}
