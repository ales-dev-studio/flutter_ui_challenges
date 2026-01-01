import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/utils/dimens.dart';
import 'package:flutter_ui_challenges/utils/sized_context.dart';
import 'package:showcaseview/showcaseview.dart';

GlobalKey menuShowcaseKey = GlobalKey();
GlobalKey profileShowcaseKey = GlobalKey();
GlobalKey bankCardShowcaseKey = GlobalKey();
GlobalKey transactionsShowcaseKey = GlobalKey();
GlobalKey sendFabShowcaseKey = GlobalKey();
GlobalKey receiveFabShowcaseKey = GlobalKey();

class ShowCaseDemoScreen extends StatefulWidget {
  const ShowCaseDemoScreen({super.key});

  @override
  State<ShowCaseDemoScreen> createState() => _ShowCaseDemoScreenState();
}

class _ShowCaseDemoScreenState extends State<ShowCaseDemoScreen> {
  @override
  void initState() {
    super.initState();
    ShowcaseView.register(
      autoPlayDelay: const Duration(seconds: 3),
      globalFloatingActionWidget:
          (showcaseContext) => FloatingActionWidget(
            left: 16,
            bottom: 16,
            child: Padding(
              padding: const EdgeInsets.all(Dimens.largePadding),
              child: ElevatedButton(
                onPressed: () => ShowcaseView.get().dismiss(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                ),
                child: Row(
                  spacing: Dimens.padding,
                  children: [
                    Icon(Icons.close, color: Colors.white),
                    const Text('Close', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
      globalTooltipActions: [
        TooltipActionButton(
          type: TooltipDefaultActionType.previous,
          textStyle: const TextStyle(color: Colors.white),
          backgroundColor: Colors.deepOrange,
          hideActionWidgetForShowcase: [menuShowcaseKey],
        ),
        TooltipActionButton(
          type: TooltipDefaultActionType.next,
          textStyle: const TextStyle(color: Colors.white),
          backgroundColor: Colors.deepOrange,
          hideActionWidgetForShowcase: [receiveFabShowcaseKey],
        ),
      ],
      onStart: (index, key) {},
      onComplete: (index, key) {},
      onDismiss: (key) {},
      onFinish: (){},
    );

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ShowcaseView.get().startShowCase([
        menuShowcaseKey,
        profileShowcaseKey,
        bankCardShowcaseKey,
        transactionsShowcaseKey,
        sendFabShowcaseKey,
        receiveFabShowcaseKey,
      ]),
    );
  }

  @override
  void dispose() {
    ShowcaseView.get().unregister();
    super.dispose();
  }

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
        leading: AppShowCaseWidget(
          globalKey: menuShowcaseKey,
          title: 'Main Menu',
          description:
              'Access all core features and navigation options from one place, '
              'Use the menu to move through the app effortlessly.',
          progressValue: 0.16,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu, color: Colors.deepOrange),
          ),
        ),
        actions: [
          AppShowCaseWidget(
            globalKey: profileShowcaseKey,
            title: 'Your Profile',
            description:
            'Manage your personal details, preferences, and security settings, '
                'Keep your account information always up to date.',
            progressValue: 0.32,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.account_circle_outlined, color: Colors.deepOrange),
            ),
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
                    AppShowCaseWidget(
                      globalKey: bankCardShowcaseKey,
                      title: 'Bank Card',
                      description:
                      'View your bank card details at a glance, '
                          'Check your current balance and card status anytime, '
                          'Stay in control of your card activity.',
                      progressValue: 0.48,
                      child: InkWell(
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
                    AppShowCaseWidget(
                      globalKey: transactionsShowcaseKey,
                      title: 'Recent transactions',
                      description:
                      'See all your incoming and outgoing transactions in one place, '
                          'Track payment details and timestamps easily, '
                          'Keep a clear record of your financial activity.',
                      progressValue: 0.65,
                      child: InkWell(
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
          AppShowCaseWidget(
            globalKey: sendFabShowcaseKey,
            title: 'Send Money',
            description:
            'Send money quickly with just a few taps.\n'
                'Fast, secure, and simple transfers.',
            progressValue: 0.8,
            child: FloatingActionButton.extended(
              heroTag: 'SendFab',
              onPressed: () {},
              label: Text('Send', style: TextStyle(color: Colors.white)),
              icon: Icon(Icons.call_made, color: Colors.white),
              backgroundColor: Colors.deepOrange,
            ),
          ),
          AppShowCaseWidget(
            globalKey: receiveFabShowcaseKey,
            title: 'Receive Money',
            description:
            'Receive or request money instantly from others.\n'
                'All incoming funds appear here.',
            progressValue: 1.0,
            child: FloatingActionButton.extended(
              heroTag: 'ReceiveFab',
              onPressed: () {},
              label: Text('Receive', style: TextStyle(color: Colors.white)),
              icon: Icon(Icons.call_received, color: Colors.white),
              backgroundColor: Colors.deepOrange,
            ),
          ),
        ],
      ),
    );
  }
}

class AppShowCaseWidget extends StatelessWidget {
  const AppShowCaseWidget({
    super.key,
    required this.globalKey,
    required this.title,
    required this.description,
    required this.progressValue,
    required this.child,
  });

  final GlobalKey globalKey;
  final String title;
  final String description;
  final double progressValue;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Showcase.withWidget(
      key: globalKey,
      targetShapeBorder: const CircleBorder(),
      disableBarrierInteraction: true,
      targetPadding: EdgeInsets.all(30),
      overlayOpacity: 0.4,
      targetBorderRadius: BorderRadius.circular(50),
      container: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: context.widthPx,
            padding: const EdgeInsets.all(Dimens.largePadding),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(Dimens.corners),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: Dimens.padding,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(description),
                SizedBox(height: Dimens.largePadding),
                LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(Dimens.corners),
                  value: progressValue,
                  minHeight: 7,
                  color: Colors.deepOrange,
                  backgroundColor: Colors.deepOrange.withValues(alpha: 0.2),
                ),
                SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
      child: child,
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
