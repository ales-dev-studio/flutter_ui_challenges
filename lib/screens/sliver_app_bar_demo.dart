import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/utils/dimens.dart';

class SliverAppBarDemo extends StatelessWidget {
  const SliverAppBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent.shade100,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu, color: Colors.white),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert, color: Colors.white),
              ),
            ],
            // title: Text('Sliver AppBar'),
            backgroundColor: Colors.deepPurpleAccent,

            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              // background: Image.network(
              //   'https://picsum.photos/id/85/600/600',
              //   fit: BoxFit.fitWidth,
              // ),
              title: Text(
                'Sliver AppBar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              height: 200,
              margin: EdgeInsets.all(Dimens.largePadding),
              color: Colors.deepPurpleAccent,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              margin: EdgeInsets.all(Dimens.largePadding),
              color: Colors.deepPurpleAccent,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              margin: EdgeInsets.all(Dimens.largePadding),
              color: Colors.deepPurpleAccent,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              margin: EdgeInsets.all(Dimens.largePadding),
              color: Colors.deepPurpleAccent,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              margin: EdgeInsets.all(Dimens.largePadding),
              color: Colors.deepPurpleAccent,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              margin: EdgeInsets.all(Dimens.largePadding),
              color: Colors.deepPurpleAccent,
            ),
          ),
        ],
      ),
    );
  }
}
