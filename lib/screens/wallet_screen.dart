import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../utils/dimens.dart';
import '../utils/gen/assets.gen.dart';
import '../widgets/app_bordered_icon_button.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.all(Dimens.largePadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Header()],
                ),
              ),
            ),
          ),
          SliverAppBar(
            expandedHeight: 180,
            pinned: true,
            backgroundColor: Color(0xFFFF3B66),
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.all(Dimens.largePadding),
              centerTitle: false,
              expandedTitleScale: 1.5,
              background: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    transform: GradientRotation(0.6),
                    colors: [Color(0xFFFF3B66), Color(0xFF6766F2)],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(Dimens.largePadding),
                  child: Column(
                    spacing: Dimens.padding,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        '\$5,233.00',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Balance',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              title: Text('My Wallet', style: TextStyle(color: Colors.white)),
            ),
          ),
          SliverAppBar(
            backgroundColor: Colors.grey.shade100,
            toolbarHeight: 120,
            pinned: true,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Quick actions',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimens.largePadding,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ActionItem(icon: Icons.call_made, label: "Send"),
                        ActionItem(icon: Icons.call_received, label: "Receive"),
                        ActionItem(icon: Icons.groups, label: "Family"),
                        ActionItem(icon: Icons.more_horiz, label: "More"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: TitleWidget(
              title: 'Recent transactions',
              onSeeAllTap: () {},
            ),
          ),
          TransactionsList(),
          SliverToBoxAdapter(child: TitleWidget(title: 'Statistics')),
          SliverToBoxAdapter(child: TransactionsChart()),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
        AppBorderedIconButton(
          iconPath: Assets.icons.notification,
          width: 46,
          height: 46,
          color: Colors.black,
        ),
      ],
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.title, this.onSeeAllTap});

  final String title;
  final GestureTapCallback? onSeeAllTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimens.largePadding,
        right: Dimens.largePadding,
        top: Dimens.padding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: Dimens.largePadding,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          if (onSeeAllTap != null)
            TextButton(onPressed: onSeeAllTap, child: Text('See all')),
        ],
      ),
    );
  }
}

class ActionItem extends StatelessWidget {
  const ActionItem({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(Dimens.largePadding),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimens.corners),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Icon(icon, color: Colors.black),
        ),
        const SizedBox(height: 6),
        Text(label),
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
    ];
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
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
              backgroundColor: Colors.grey.shade200,
              child: Icon(Icons.wallet, color: Colors.black87),
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
      }, childCount: transactions.length),
    );
  }
}

class TransactionsChart extends StatefulWidget {
  const TransactionsChart({super.key});

  @override
  State<StatefulWidget> createState() => _TransactionsChartState();
}

class _TransactionsChartState extends State<TransactionsChart> {
  final double width = 7;
  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 8, 7);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 16, 15);
    final barGroup4 = makeGroupData(3, 19, 16);
    final barGroup5 = makeGroupData(4, 17, 14);
    final barGroup6 = makeGroupData(5, 15, 16);
    final barGroup7 = makeGroupData(6, 10, 12);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];
    rawBarGroups = items;
    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(Dimens.largePadding),
        child: BarChart(
          BarChartData(
            maxY: 21,
            titlesData: FlTitlesData(
              show: true,
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: bottomTitles,
                  reservedSize: 42,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  interval: 1,
                  getTitlesWidget: leftTitles,
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
            barGroups: showingBarGroups,
            gridData: const FlGridData(
              drawVerticalLine: false,
              drawHorizontalLine: true,
            ),
          ),
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    String text;
    if (value == 0) {
      text = '0';
    } else if (value == 5) {
      text = '200';
    } else if (value == 10) {
      text = '400';
    } else if (value == 15) {
      text = '600';
    } else if (value == 20) {
      text = '800';
    } else {
      return Container();
    }
    return SideTitleWidget(meta: meta, space: 10, child: Text(text));
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Mn', 'Te', 'Wd', 'Tu', 'Fr', 'St', 'Su'];

    return SideTitleWidget(
      meta: meta,
      space: 16, //margin top
      child: Text(titles[value.toInt()]),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(toY: y1, color: Color(0xFFFF3B66), width: width),
        BarChartRodData(toY: y2, color: Color(0xFF6766F2), width: width),
      ],
    );
  }
}
