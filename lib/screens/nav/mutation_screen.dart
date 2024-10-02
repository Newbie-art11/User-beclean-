import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:beclean_user/provider/mutation_provider/mutation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MutationScreen extends StatelessWidget {
  const MutationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Mutasi',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<MutationProvider>(context, listen: false)
            .fetchMutations(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return dialogAwesome(context);
          } else if (!snapshot.hasData ||
              Provider.of<MutationProvider>(context, listen: false)
                  .mutations
                  .isEmpty) {
            return const Center(child: Text('No mutations available'));
          } else {
            return Consumer<MutationProvider>(
              builder: (ctx, mutationProvider, child) {
                return ListView.builder(
                  itemCount: mutationProvider.mutations.length,
                  itemBuilder: (ctx, i) {
                    final mutation = mutationProvider.mutations[i];
                    return ListTile(
                      title: Text(mutation.bankName),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Account Name: '),
                          Text('Account Number:'),
                          Text('Debit: '),
                        ],
                      ),
                      trailing: Text(mutation.createdAt),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

dialogAwesome(BuildContext context) {
  return AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    dialogType: DialogType.info,
    body: const Center(
      child: Text(
        'If the body is specified, then title and description will be ignored, this allows to 											further customize the dialogue.',
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
    ),
    title: 'This is Ignored',
    desc: 'This is also Ignored',
    btnOkOnPress: () {
      Navigator.of(context).pop();
    },
  )..show();
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
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Text(
              'Total Transaksi',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Column(
          children: (section['transactions'] as List<dynamic>)
              .map<Widget>(
                (transaction) => ListTile(
                  leading: const Icon(Icons.compare_arrows, color: Colors.blue),
                  title: Text(transaction['type']),
                  subtitle: Text(transaction['date']),
                  trailing: Text(
                    transaction['amount'],
                    style: const TextStyle(
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
