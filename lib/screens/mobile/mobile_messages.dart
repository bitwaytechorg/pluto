import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import '../../models/message.dart';

class MobileMessages extends StatefulWidget {
  const MobileMessages({Key? key}) : super(key: key);

  @override
  State<MobileMessages> createState() => _MobileMessagesState();
}

class _MobileMessagesState extends State<MobileMessages> {

  List<Message> messages = [

    Message(
      text: "Yes, years ago.",
      date: DateTime.now().subtract(Duration(minutes: 5)),
      isSendByMe: false,
    ),



  ].reversed.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.more_vert),
          )
        ],
        title: const Text("another user name here."),
      ),
      body: Column(children: [
        Expanded(
            child: Container(
              child: GroupedListView<Message, DateTime>(
                reverse: true,
                  order: GroupedListOrder.DESC,
                  useStickyGroupSeparators: true,
                  floatingHeader: true,
                  elements: messages,
                  groupBy: (message)=>DateTime(
                    message.date.year,
                    message.date.month,
                    message.date.day,
                  ),
                 groupHeaderBuilder: (Message message)=>SizedBox(
                   height: 40,
                   child: Center(
                     child: Padding(
                       padding: const EdgeInsets.all(3),
                       child: Card(
                           color:Theme.of(context).primaryColor.withAlpha(10),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(DateFormat.yMMMd().format(message.date),
                            style: const TextStyle(color: Colors.white),
                            ),
                          ),
                       ),
                     ),
                   ),
                 ),
                 itemBuilder: (context, message)=> Align(
                   alignment: message.isSendByMe? Alignment.centerRight:Alignment.centerLeft,
                   child: Card(
                     color: message.isSendByMe?Colors.blue:Colors.white,
                     elevation: 8,
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text(message.text, style: TextStyle(
                         color: message.isSendByMe?Colors.white:Colors.blue,
                       ),),
                     ),
                   ),
                 ),
              ),
            )
        ),

        Container(
          color: Colors.grey,
          child: TextField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(7),
              hintText: "type your message here...",
            ),
            onSubmitted: (text){
              final message = Message(
                text: text,
                date: DateTime.now(),
                isSendByMe: true,
              );
              setState(() {
                messages.add(message);
              });
            },
          ),
        ),
      ],),
    );
  }
}
