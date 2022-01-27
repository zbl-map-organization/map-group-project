import '../../../models/topic.dart';
import '../topic_viewmodel.dart';
import '../../../screens/view.dart';
import 'package:flutter/material.dart';

import 'input_screen.dart';

class InputBody extends StatelessWidget {
  void _openInputScreen(context, index, text) async {
    final result = await Navigator.push(
        context, InputScreen.route(index: index, text: text));
    if (result != null) {}
  }

  final int index;
  final bool editbool;
  InputBody(this.index, this.editbool);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Center(
        child: SelectorView<TopicViewmodel, Topic>(
      selector: (_, vm) => vm.getTopic(index),
      builder: (_, vm, topic, __) {
        return Column(children: [
          Container(
            padding: EdgeInsets.all(25.0),
            color: Colors.transparent,
            child: new Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.blue[400],
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: new Icon(
                Icons.menu_book,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TextFormField(
                initialValue: vm.getTopic(index).title,
                enabled: editbool,
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
                  topic.title = value;
                  vm.updateTopic(
                      id: vm.getTopic(index).id,
                      data: Topic(
                          title: value,
                          desc: topic.desc,
                          link: topic.link,
                          formLvl: topic.formLvl,
                          babNum: topic.babNum));
                }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TextFormField(
                maxLines: 3,
                initialValue: vm.getTopic(index).desc,
                enabled: editbool,
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
                  topic.desc = value;
                  vm.updateTopic(
                      id: vm.getTopic(index).id,
                      data: Topic(
                          title: topic.title,
                          desc: value,
                          link: topic.link,
                          formLvl: topic.formLvl,
                          babNum: topic.babNum));
                }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TextFormField(
                maxLines: 2,
                initialValue: vm.getTopic(index).link,
                enabled: editbool,
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
                  topic.link = value;
                  vm.updateTopic(
                      id: vm.getTopic(index).id,
                      data: Topic(
                          title: topic.title,
                          desc: topic.desc,
                          link: value,
                          formLvl: topic.formLvl,
                          babNum: topic.babNum));
                }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TextFormField(
                keyboardType: TextInputType.number,
                initialValue: vm.getTopic(index).formLvl,
                enabled: editbool,
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
                  topic.formLvl = value;
                  vm.updateTopic(
                      id: vm.getTopic(index).id,
                      data: Topic(
                          title: topic.title,
                          desc: topic.desc,
                          link: topic.link,
                          formLvl: value,
                          babNum: topic.babNum));
                }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TextFormField(
                keyboardType: TextInputType.number,
                initialValue: vm.getTopic(index).babNum,
                enabled: editbool,
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
                  topic.babNum = value;
                  vm.updateTopic(
                      id: vm.getTopic(index).id,
                      data: Topic(
                          title: topic.title,
                          desc: topic.desc,
                          link: topic.link,
                          formLvl: topic.formLvl,
                          babNum: value));
                }),
          ),
          Visibility(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    child: Text("Edit".toUpperCase(),
                        style: TextStyle(fontSize: 12)),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(10)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(110.0),
                                    side: BorderSide(color: Colors.blue)))),
                    onPressed: () => _openInputScreen(context, index, 'Edit'))
              ],
            ),
            visible: !editbool,
          ),
          Visibility(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    child: Text("Save".toUpperCase(),
                        style: TextStyle(fontSize: 12)),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(110.0),
                                    side: BorderSide(color: Colors.red)))),
                    onPressed: () {
                      _openInputScreen(context, index, 'View');
                    }),
              ],
            ),
            visible: editbool,
          ),
        ]);
      },
    )));
  }
}
