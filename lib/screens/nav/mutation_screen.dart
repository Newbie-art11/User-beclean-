import 'package:flutter/material.dart';

class MutationScreen extends StatefulWidget {
  const MutationScreen({super.key});

  @override
  State<MutationScreen> createState() => _MutationScreenState();
}

class _MutationScreenState extends State<MutationScreen> {
  final List<Map<String, dynamic>> transactions = [
    {
      "month": "Bulan Ini",
      "transactions": [
        {
          "type": "Transaksi Masuk",
          "amount": "Rp 50.000",
          "date": "30 Jun 2024, 23:59",
        },
        {
          "type": "Transaksi Keluar",
          "amount": "Rp 50.000",
          "date": "25 Jun 2024, 23:59",
        },
      ]
    },
    {
      "month": "Juni",
      "transactions": [
        {
          "type": "Transaksi Masuk",
          "amount": "Rp 50.000",
          "date": "30 Jun 2024, 23:59",
        },
        {
          "type": "Transaksi Keluar",
          "amount": "Rp 50.000",
          "date": "25 Jun 2024, 23:59",
        },
      ]
    },
    {
      "month": "Mei",
      "transactions": [
        {
          "type": "Transaksi Masuk",
          "amount": "Rp 50.000",
          "date": "30 Mei 2024, 23:59",
        },
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Mutasi',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      body: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            return _buildTransactionSection(transactions[index]);
          }),
    );
  }
}

Widget _buildTransactionSection(Map<String, dynamic> section) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              section['month'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              'Total Transaksi',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Column(
          children: section['transactions']
              .map<Widget>(
                (transaction) => ListTile(
                  leading: Icon(Icons.compare_arrows, color: Colors.blue),
                  title: Text(transaction['type']),
                  subtitle: Text(transaction['date']),
                  trailing: Text(
                    transaction['amount'],
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    ),
  );
}
