import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/utils/dimens.dart';

class ShowCaseDemoScreen extends StatelessWidget {
  const ShowCaseDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome back!',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Text(
              'Ales Dev',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: Colors.deepOrange),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_circle_outlined, color: Colors.deepOrange),
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: Dimens.largePadding,
                  right: Dimens.largePadding,
                  top: Dimens.padding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bank card',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(Dimens.corners),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimens.largePadding,
                          vertical: Dimens.padding,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Manage',
                              style: TextStyle(color: Colors.deepOrange),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Dimens.largePadding),
                child: Center(
                  child: BankCard(
                    bankName: 'Deutsche Bank',
                    cardNumber: '1234 5678 9012 3456',
                    cardHolder: 'ALES',
                    expiryDate: '08/27',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: Dimens.largePadding,
                  right: Dimens.largePadding,
                  top: Dimens.padding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent transactions',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(Dimens.corners),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimens.largePadding,
                          vertical: Dimens.padding,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'See all',
                              style: TextStyle(color: Colors.deepOrange),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TransactionsList(),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: Dimens.largePadding,
        children: [
          FloatingActionButton.extended(
            heroTag: 'SendFab',
            onPressed: () {},
            label: Text('Send', style: TextStyle(color: Colors.white)),
            icon: Icon(Icons.call_made, color: Colors.white),
            backgroundColor: Colors.deepOrange,
          ),
          FloatingActionButton.extended(
            heroTag: 'ReceiveFab',
            onPressed: () {},
            label: Text('Receive', style: TextStyle(color: Colors.white)),
            icon: Icon(Icons.call_received, color: Colors.white),
            backgroundColor: Colors.deepOrange,
          ),
        ],
      ),
    );
  }
}

class BankCard extends StatelessWidget {
  final String bankName;
  final String cardNumber;
  final String cardHolder;
  final String expiryDate;

  const BankCard({
    super.key,
    required this.bankName,
    required this.cardNumber,
    required this.cardHolder,
    required this.expiryDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.deepOrange,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bank Name
          Text(
            bankName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const Spacer(),
          // Card Number
          Text(
            cardNumber,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              letterSpacing: 2,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          // Card Details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _CardInfo(label: 'CARD HOLDER', value: cardHolder),
              _CardInfo(label: 'EXPIRES', value: expiryDate),
            ],
          ),
        ],
      ),
    );
  }
}

class _CardInfo extends StatelessWidget {
  final String label;
  final String value;

  const _CardInfo({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      {"title": "Starbucks Coffee", "date": "Today", "amount": "-\$6.50"},
      {"title": "Netflix", "date": "Yesterday", "amount": "-\$15.99"},
      {"title": "Salary Deposit", "date": "Jan 18", "amount": "+\$2,200.00"},
      {"title": "Uber Ride", "date": "Jan 16", "amount": "-\$12.80"},
      {"title": "Grocery Store", "date": "Jan 14", "amount": "-\$54.20"},
      {"title": "Starbucks Coffee", "date": "Today", "amount": "-\$6.50"},
      {"title": "Netflix", "date": "Yesterday", "amount": "-\$15.99"},
      {"title": "Salary Deposit", "date": "Jan 18", "amount": "+\$2,200.00"},
      {"title": "Uber Ride", "date": "Jan 16", "amount": "-\$12.80"},
      {"title": "Grocery Store", "date": "Jan 14", "amount": "-\$54.20"},
    ];
    return ListView.builder(
      itemCount: transactions.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (final context, final index) {
        final item = transactions[index];
        final isPositive = item["amount"]!.contains("+");
        return Container(
          margin: const EdgeInsets.symmetric(
            horizontal: Dimens.largePadding,
            vertical: Dimens.padding,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(Dimens.corners),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.deepOrange.shade50,
              child: Icon(Icons.wallet, color: Colors.deepOrange),
            ),
            title: Text(item["title"]!),
            subtitle: Text(item["date"]!, style: TextStyle(color: Colors.grey)),
            trailing: Text(
              item["amount"]!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isPositive ? Colors.green : Colors.red,
                fontSize: 14,
              ),
            ),
          ),
        );
      },
    );
  }
}
