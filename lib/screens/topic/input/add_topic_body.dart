import '../../../models/topic.dart';
import '../topic_screen.dart';
import '../topic_viewmodel.dart';
import '../../view.dart';
import 'package:flutter/material.dart';

class AddTopicBody extends StatefulWidget {
  AddTopicBody();

  @override
  _AddTopicBodyState createState() => _AddTopicBodyState();
}

class _AddTopicBodyState extends State<AddTopicBody> {
  void _openTopicScreen(context) async {
    final result = await Navigator.push(context, TopicScreen.route());
    if (result != null) {}
  }

  String title, desc, link, formLvl, babNum;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Center(child: View<TopicViewmodel>(
      builder: (_, vm, ___) {
        return Column(children: [
          Image.asset('assets/topicinput.jpg'),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TextFormField(
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                      fontFamily: 'AvenirLight'),
                  hintText: 'Type the title here',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  title = value;
                }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TextFormField(
                maxLines: 3,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                      fontFamily: 'AvenirLight'),
                  hintText: 'Type the description here',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  desc = value;
                }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TextFormField(
                maxLines: 2,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  labelText: 'Note Link',
                  labelStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                      fontFamily: 'AvenirLight'),
                  hintText: 'Type the note link here',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  link = value;
                }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TextFormField(
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  labelText: 'Form Level',
                  labelStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                      fontFamily: 'AvenirLight'),
                  hintText: 'Type the form level here',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  formLvl = value;
                }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TextFormField(
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                      fontFamily: 'AvenirLight'),
                  labelText: 'Bab Number',
                  hintText: 'Type the bab Number here',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  babNum = value;
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  child: Text("Cancel".toUpperCase(),
                      style: TextStyle(fontSize: 12)),
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(110.0),
                              side: BorderSide(color: Colors.red)))),
                  onPressed: () async {
                    _openTopicScreen(context);
                  }),
              ElevatedButton(
                  child: Text("Add Topic".toUpperCase(),
                      style: TextStyle(fontSize: 12)),
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.indigo),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(110.0),
                              side: BorderSide(color: Colors.indigo)))),
                  onPressed: () {
                    vm.addTopic(Topic(
                        title: title,
                        desc: desc,
                        link: link,
                        formLvl: formLvl,
                        babNum: babNum));
                    _openTopicScreen(context);
                  }),
            ],
          ),
        ]);
      },
    )));
  }
}
