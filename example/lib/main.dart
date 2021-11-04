import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pylons_flutter/pylons_flutter.dart';
import 'package:fixnum/fixnum.dart';

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
    PylonsWallet.instance.exists().then((value) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RaisedButton(
            onPressed: () async {
              createCookBook();
            },
            child: const Text('Cookbook'),
          ),
          RaisedButton(
            onPressed: () async {
              createRecipe();
            },
            child: const Text('Recipe'),
          ),

          RaisedButton(
            onPressed: () async {
              executeRecipe();
            },
            child: const Text('Execute Recipe'),
          ),


          RaisedButton(
            onPressed: () async {
              updateRecipe();
            },
            child: const Text('Update Recipe'),
          ),

        ],
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void createCookBook() async {
    var cookBook1 = Cookbook(
        creator: "",
        iD: "cookbookLOUDahmed5",
        name: "Legend of the Undead Dragon",
        nodeVersion: "v0.1.3",
        description: "Cookbook for running pylons recreation of LOUD",
        developer: "Pylons Inc",
        version: "v0.0.1",
        supportEmail: "alex@shmeeload.xyz",
        costPerBlock: Coin(denom: "upylon", amount: "1000000"), enabled: true);

    var response = await PylonsWallet.instance.txCreateCookbook(cookBook1);

    print('From App $response');

    if (response.success) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Cookbook created")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Cookbook error : ${response.error}")));
    }
  }

  void createRecipe() async {
    var recipe = Recipe(
        cookbookID: "cookbookLOUDahmed5",
        iD: "khwaja20",
        nodeVersion: "v0.1.3",
        name: "LOUD's Wooden sword lv1 buy recipe",
        description: "this recipe is used to buy wooden sword lv1.",
        version: "v0.1.3",
        coinInputs: [],
        itemInputs: [],
        entries: EntriesList(coinOutputs: [], itemOutputs: [
          ItemOutput(
            iD: "copper_sword_lv1",
            doubles: [],
            longs: [],
            strings: [],
            mutableStrings: [],
            transferFee: [],
            tradePercentage: DecString.decStringFromDouble(0.1),
            tradeable: true,
          ),
        ], itemModifyOutputs: []),
        outputs: [
          WeightedOutputs(entryIDs: ["copper_sword_lv1"], weight: Int64(1))
        ],
        blockInterval: Int64(0),
        enabled: true,
        extraInfo: "extraInfo");

    var response = await PylonsWallet.instance.txCreateRecipe(recipe);

    print('From App $response');

    if (response.success) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Receipe created")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Receipe error : ${response.error}")));
    }
  }

  void executeRecipe() async {

    var response = await PylonsWallet.instance.txExecuteRecipe(cookbookId: 'cookbookLOUDahmed4', recipeName: 'khwaja20', coinInputIndex: 0, itemIds: [], paymentInfo: []);

    print('From App $response');

    if (response.success) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Recipe  executed")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Recipe  error : ${response.error}")));
    }



  }

  void updateRecipe() async {
    var recipe = Recipe(
        cookbookID: "cookbookLOUDahmed5",
        iD: "khwaja20",
        nodeVersion: "v0.1.3",
        name: "LOUD's Wooden sword lv1 buy recipe",
        description: "this recipe is used to buy wooden sword lv1.",
        version: "v0.1.5",
        coinInputs: [],
        itemInputs: [],
        entries: EntriesList(coinOutputs: [], itemOutputs: [
          ItemOutput(
            iD: "copper_sword_lv1",
            doubles: [],
            longs: [],
            strings: [],
            mutableStrings: [],
            transferFee: [],
            tradePercentage: DecString.decStringFromDouble(0.2),
            tradeable: true,
          ),
        ], itemModifyOutputs: []),
        outputs: [
          WeightedOutputs(entryIDs: ["copper_sword_lv1"], weight: Int64(1))
        ],
        blockInterval: Int64(0),
        enabled: true,
        extraInfo: "extraInfo");

    var response = await PylonsWallet.instance.txUpdateRecipe(recipe);

    print('From App $response');

    if (response.success) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Receipe updated")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Receipe update error : ${response.error}")));
    }

  }
}
