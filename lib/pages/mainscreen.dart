// import 'package:persistent_bottom_nav_bar/nav_bar_styles/style_6_bottom_nav_bar.widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:deli_very/widgets/main.dart';
import 'package:deli_very/widgets/map.dart';
import 'package:deli_very/widgets/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/menu.dart';
import '../widgets/order.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key,}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int _selectPage = 1;

PersistentTabController _controller = PersistentTabController(initialIndex: 1);

class _MainScreenState extends State<MainScreen> {


  static final List<Widget> _pageOptions = <Widget> [
    OrderPage(),
    MainPage(),
    MenuPage(),
  ];

  late final GlobalKey<NavigatorState> navigatorKey;

  void onSelectPage (int index) {
    if (_selectPage == index) return;
    setState(() {
      _selectPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    // User user = ModalRoute.of(context)!.settings.arguments as User;

    return PersistentTabView(
      context,
      controller: _controller,
      navBarStyle: NavBarStyle.style6,
      screens: [
        OrderPage(),
        MainPage(),
        MenuPage(),
      ],
      items: [
        PersistentBottomNavBarItem(
            icon: Icon(Icons.access_time_rounded),
            title: 'Заказы',
            activeColorPrimary: Color(0xFF00C27C),
            inactiveColorPrimary: Color(0xFFD0D2D2)
        ),
        PersistentBottomNavBarItem(
            icon: Icon(Icons.home_outlined),
            title: 'Главная',
            activeColorPrimary: Color(0xFF00C27C),
            inactiveColorPrimary: Color(0xFFD0D2D2)
        ),
        PersistentBottomNavBarItem(
            icon: Icon(Icons.restaurant_outlined),
            title: 'Меню',
            activeColorPrimary: Color(0xFF00C27C),
            inactiveColorPrimary: Color(0xFFD0D2D2)
        ),
      ],


      // BottomNavigationBar(
      //   currentIndex: _selectPage,
      //   type: BottomNavigationBarType.fixed,
      //   selectedItemColor: const Color(0xFF000000),
      //   unselectedItemColor: const Color(0xFF9E9E9E),
      //   selectedLabelStyle: GoogleFonts.montserrat(
      //   textStyle: const TextStyle(
      //     color: Color(0xFF000000)
      //   ),
      //   ),
      //   unselectedLabelStyle: GoogleFonts.montserrat(
      //     textStyle: TextStyle(
      //       color: Color(0xFF9E9E9E),
      //     )
      //   ),
      //   selectedFontSize: 14,
      //   unselectedFontSize: 14,
      //   items: const [
      //     BottomNavigationBarItem(
      //         label: 'Заказы',
      //         icon: Icon(Icons.access_time_rounded)
      //     ),
      //     BottomNavigationBarItem(
      //         label: 'Главная',
      //         icon: Icon(Icons.home_outlined)
      //     ),
      //     BottomNavigationBarItem(
      //         label: 'Меню',
      //         icon: Icon(Icons.restaurant_outlined)
      //     ),
      //   ],
      //   onTap: onSelectPage,
      // ),
      // body:
      // Stack(
      //   children: <Widget>[
      // Offstage(
      // offstage: _selectPage != 0,
      //   child: TickerMode(
      //     enabled: _selectPage == 0,
      //     child: const MaterialApp(home: MainPage()),
      //   ),
      // ),
      // Offstage(
      //   offstage: _selectPage != 1,
      //   child: TickerMode(
      //     enabled: _selectPage == 1,
      //     child: const MaterialApp(home: OrderPage()),
      //   ),
      // ),
      //     Offstage(
      //       offstage: _selectPage != 2,
      //       child: TickerMode(
      //         enabled: _selectPage == 2,
      //         child: const MaterialApp(home: MenuPage()),
      //       ),
      //     ),
      //     Offstage(
      //       offstage: _selectPage != 4,
      //       child: TickerMode(
      //         enabled: _selectPage == 4,
      //         child: const MaterialApp(home: AddOrder()),
      //       ),
      //     ),
      // Navigator(
      //   onGenerateRoute: (settings) {
      //     Widget page = OrderPage();
      //     if (settings.name == 'AddOrder') page = AddOrder();
      //     return MaterialPageRoute(builder: (_) => page);
      //   },
      // )
      // Center(
      //    child: _pageOptions[_selectPage],
      //  ),
      // ]
      // )
    );
  }
}
