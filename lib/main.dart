import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pmsn2024/screens/dashboard_screen.dart';
import 'package:pmsn2024/screens/despensa_screen.dart';
import 'package:pmsn2024/screens/splash_screen.dart';
import 'package:pmsn2024/settings/app_value_notifier.dart';
import 'package:pmsn2024/settings/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyB5s6hZgMsGO23hDb1z3vdx-rrsU38Dz5w",
        appId: "com.example.pmsn2024",
        messagingSenderId: "449625947250",
        projectId: "appmoviles-37540"),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppValueNotifier.banTheme,
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: value
              ? ThemeApp.darkTheme(context)
              : ThemeApp.lightTheme(context),
          home: SplashScreen(),
          routes: {
            "/dash": (BuildContext context) => DashboardScreen(),
            "/despensa": (BuildContext context) => DespensaScreen(),
            "/movies": (BuildContext context) => DespensaScreen(),
          },
        );
      },
    );
  }
}

/*class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Práctica 1', 
            style: TextStyle(
              fontSize: 30, 
              fontWeight: FontWeight.bold),
            ),
        ),
        drawer: Drawer(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: (){
            contador++;
            print(contador);
            setState(() {});
          },
          child: Icon(Icons.ads_click),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.network('https://celaya.tecnm.mx/wp-content/uploads/2021/02/cropped-FAV.png', 
              height: 250,),
            ),
            Text('Valor del Contador $contador')
          ],
        )
      ),
    );
  }
}*/