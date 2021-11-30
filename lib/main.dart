import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gituser/models/user.dart';
import 'package:gituser/models/result.dart';
import 'package:gituser/providers/user.dart';
import 'package:gituser/widget/search_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Git User',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Git User'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Result result = Result(total_count: 1, incomplete_results: false, items: [
]);

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController searchController = new TextEditingController();
  String filter = "";
  List<GitUser> users = result.items;

  @override
  void initState() {
    // TODO: implement initState
    searchController.addListener(() {
      setState(() {
        users = result.items;
        filter = searchController.text;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.all(8.0),
              child: buildSearch()
            ),
            new Expanded(
              child: new ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return filter == ""
                      ? new Container()
                      : '${users[index].login}'
                              .toLowerCase()
                              .contains(filter.toLowerCase())
                          ? Card(
                              child: ListTile(
                                title: Text(
                                  '${users[index].login}',
                                ),
                                subtitle: Text('${users[index].type}'),
                                onTap: () =>
                                    _openDialog(context, users[index]),
                              ),
                            )
                          : new Container();
                },
              ),
            ),
          ],
        ));
  }

  Widget buildSearch() => SearchWidget(text: filter, onChanged: searchUser, hintText: 'Search');

  void _openDialog(BuildContext context, GitUser post) {
    AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.INFO,
      title: post.login,
      desc: post.type,
      body: Column(
        children: [
          Center(
            child: Text(
              post.login,
              style: TextStyle(fontSize: 30),
            ),
          ),
          Center(
            child: Text(post.type,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ),
          Center(
            child: Text(post.node_id,
                style: TextStyle(fontSize: 20), textAlign: TextAlign.justify),
          ),
        ],
      ),
      btnOkOnPress: () {},
      btnOkIcon: Icons.check_circle,
    ).show();
  }

  Future searchUser(String name) async {
    if(name != ""){
      final users = await user.getResult(name);

      if(!mounted) return;

      setState(() {
        this.filter = name;
        this.users = users;
      });
    }

  }
}
