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
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.settings),
                )
              ],
              title: Text("Sliver appbar"),
              leading: Icon(Icons.menu),
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("this is flexible space"),

                )
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 1", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 2", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 3", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 4", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 5", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 6", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 7", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 8", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 9", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 10", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 11", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 1", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 2", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 3", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 4", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 5", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 6", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 7", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 8", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 9", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 10", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 11", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 1", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 2", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 3", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 4", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 5", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 6", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 7", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 8", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 9", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 10", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 11", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 1", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 2", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 3", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 4", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 5", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 6", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 7", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 8", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 9", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 10", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 11", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 1", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 2", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 3", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 4", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 5", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 6", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 7", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 8", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 9", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 10", style: TextStyle(fontSize: 25),),
            ),
            SliverToBoxAdapter(
              child: Text("This is Sliver Text List 11", style: TextStyle(fontSize: 25),),
            ),


          ],
        ),
      ),
    );
  }
}
