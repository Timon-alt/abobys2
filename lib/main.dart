import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.yellow,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
        dividerColor: Colors.white24,
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 31, 31, 31),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          centerTitle: true,
        ),
        textTheme: TextTheme(
          bodyMedium: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
          labelSmall: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.w700,
            fontSize: 14,
          )
        ),
      ),
      routes: {
        '/' :(context) => MainPage(),
        '/coin': (context) => CoinScreen()
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto List'),
      ),
      // Абоба
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, i) {
          final coinName = 'Bitcoin';
          return ListTile(
          leading: SvgPicture.asset(
            'assets/svg/bitcoin-logo.svg', 
            width: 30, 
            height: 30,),
          title: Text(
            coinName, 
            style: Theme.of(context).textTheme.bodyMedium,),
          subtitle: Text(
            "200000\$",
            style: Theme.of(context).textTheme.labelSmall,
          ),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.of(context).pushNamed(
              '/coin',
              arguments: coinName 
            );
          },
        );
        }
      ),
    );
  }
}

class CoinScreen extends StatelessWidget {
  const CoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bitcoin")),
    );
  }
}