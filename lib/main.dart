import 'package:flutter/material.dart';
import 'package:whatsapp/home_conversations.dart';
import 'package:whatsapp/title_bar.dart';
import 'package:whatsapp/footer_tabs.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeConversations(),
    Text('Updates Page'),
    Text('Communities Page'),
    Text('Calls Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: CustomScrollView(
              slivers: <Widget>[
                const TitleBar(),
                SliverFillRemaining(
                  child: _widgetOptions.elementAt(_selectedIndex),
                ),
              ],
            ),
            bottomNavigationBar: FooterTabs(
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
            )),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green,
            brightness: Brightness.light,
          ),
          useMaterial3: true,
          brightness: Brightness.light,
          // textTheme: TextTheme(
          //   displayLarge: const TextStyle(
          //     fontSize: 72,
          //     fontWeight: FontWeight.bold,
          //   ),
          //   titleLarge: GoogleFonts.lato(
          //     fontSize: 50,
          //     fontStyle: FontStyle.italic,
          //   ),
          //   bodyMedium: GoogleFonts.merriweather(),
          //   displaySmall: GoogleFonts.pacifico(),
          // ),
        ));
  }
}
