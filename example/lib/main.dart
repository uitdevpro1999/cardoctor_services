import 'package:cardoctor_services/cardoctor_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:car_doctor_sdk_tracking/car_doctor_sdk_tracking.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AppTracking.instance.init("http://192.168.1.46/");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  // This widget is the root of your application.
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
        primarySwatch:  Colors.orange,
      ),
      home: const MyHomePage(title: 'SDK Car Services for Epass'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({key, required this.title});

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
  String? EncryptionData;
  String contractId="";
  String name="";
  String phone="";
  String identifier="";
  Future<void> openSDK(BuildContext context) async{
    final sdk = SdkCarServices(SdkFlavor.STAGING,EncryptionData,contractId,name,phone,identifier);
     await sdk.open(context);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
                onPressed: (){
                  openSDK(context);
                },
                icon: const Icon(Icons.login,color: Colors.deepOrange,))
          ],
        ),
      )
    );
  }
}
