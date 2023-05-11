import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(

              title: Text("Sliver appbar"),
              leading: Icon(Icons.menu),
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("this is flexible space"),

                )
            ),
            SliverToBoxAdapter(),

          ],
        ),
      ),
    );
  }
}
