import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pylons_flutter/pylons_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();


  PylonsWallet.setup(mode: PylonsMode.prod, host: 'example');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {
    super.initState();
    PylonsWallet.instance.exists().then((value){
      log('WALLET Existence $value');

    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();




  var MOCK_COOKBOOK = '''{
  "creator": "",
  "ID": "cookbookLOUDjawad",
  "name": "Legend of the Undead Dragon",
  "nodeVersion": "v0.1.3",
  "description": "Cookbook for running pylons recreation of LOUD",
  "developer": "Pylons Inc",
  "version": "v0.0.1",
  "supportEmail": "alex@shmeeload.xyz",
  "costPerBlock": {"denom":  "upylon", "amount":  "1000000"},
  "enabled": true
}''';


  void _incrementCounter() async {
    var cookBook = Cookbook.fromJson(jsonDecode(MOCK_COOKBOOK));

    var response = await PylonsWallet.instance.txCreateCookbook(cookBook);

    print('From App $response');


    if(response.success){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Cookbook created")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:  Text("Cookbook error : ${response.error}")));
    }



    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () async {


            // print('Cookbook 2 sent');
            // var cookBook = Cookbook.fromJson(jsonDecode(MOCK_COOKBOOK));
            // var key = 'txCreateCookbook';
            // var dataToEncode = [key, const JsonEncoder().convert(cookBook)];
            //
            // var response = await PylonsWallet.instance.sendMessage(dataToEncode);
            //
            //
            //
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response)));
            //
            // print('Cookbook 2 received');
            //
            //

          },
          child: Text('send another message '),

        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
