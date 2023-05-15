import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  Color color = Colors.red;
  bool isChecked = false;
  List<String> itemList = [ "Item1", "Item2", "Item3", "Item4" ];
  String selectedItem = "Item1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: DragTarget<Color>(
                onAccept: (data){
                  setState(() {
                    color = data;
                  });
                },
                builder: (BuildContext context, _, __) => Container( color: color, height: 200, width: 200,),


              )
            ),
            SliverToBoxAdapter(

              child: Draggable<Color>(
                data: Colors.yellow,
                feedback: Container(
                  color: Colors.yellow,
                  width: 200,
                  height: 200,
                ),
                child: Container(
                  color: Colors.green,
                  height: 200,
                  width: 200,
                ),


              )
            ),
            SliverToBoxAdapter(
              child: DropdownButton<String>(
                value: selectedItem,
                items: itemList.map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item))).toList(),
                onChanged: (value) {
                 setState(() {
                   selectedItem = value!;
                 });
                },),
            ),
            SliverToBoxAdapter(
              child: ElevatedButton(
                  onPressed: () {
                showDialog(context: context, builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("This is alert box"),
                    content: Text("With Dart-only initialization now supported, manually configuring and installing platforms is no longer required. If you wish to view the documentation for"),
                    actions: [
                      ElevatedButton(onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.menu)),
                    ],
                  );
                }, );
              },
                child: Text("Show dialog")),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: CheckboxListTile(
                  title: Text("this is man"),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },),),
            ),
            SliverToBoxAdapter(
              child: ElevatedButton(
                onPressed: (){
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(child:
                            ElevatedButton( onPressed: () {
                              Navigator.pop(context);
                            },
                              child: Text("Close bottom bar"),)
                            ,),
                          Center(child:
                          ElevatedButton(onPressed: () {
                            Navigator.pop(context);
                          },
                            child: Text("Close bottom bar"),)
                            ,),
                          Center(
                            child:
                          ElevatedButton(onPressed: () {
                            Navigator.pop(context);
                          },
                            child: Text("Close bottom bar"),)
                            ,),
                          Center(
                            child:
                            ElevatedButton(onPressed: () {
                              Navigator.pop(context);
                            },
                              child: Text("Close bottom bar"),)
                            ,),
                          Center(
                            child:
                            ElevatedButton(onPressed: () {
                              Navigator.pop(context);
                            },
                              child: Text("Close bottom bar"),)
                            ,),
                        ],
                      ),
                    );
                  },

                  );
                },
                child: Text("Open Bottom sheet"),
              ),

            ),
            SliverToBoxAdapter(
              child: Container(
                height: 600,
                child: DefaultTabController(
                  length: 3, child: Scaffold(
                  appBar: AppBar(
                    bottom: TabBar(
                      tabs: [
                        Tab(text: 'tab 1',),
                        Tab(text: 'tab 1',),
                        Tab(text: 'tab 1',),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      Text("tab 1"),
                      Text("tab 2"),
                      Text("tab 3"),
                    ],
                  ),

                ),

                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
