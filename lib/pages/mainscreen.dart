import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF000000),
        unselectedItemColor: const Color(0xFF9E9E9E),
        selectedLabelStyle: const TextStyle(
          color: Color(0xFF000000)
        ),
        unselectedLabelStyle: const TextStyle(
          color: Color(0xFF9E9E9E),
        ),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
            label: 'Главная',
            icon: Icon(Icons.home_outlined)
          ),
          BottomNavigationBarItem(
              label: 'Заказы',
              icon: Icon(Icons.access_time_rounded)
          ),
          BottomNavigationBarItem(
              label: 'Меню',
              icon: Icon(Icons.restaurant_outlined)
          ),
          BottomNavigationBarItem(
              label: 'Карта',
              icon: Icon(Icons.location_on_sharp)
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 150,
                child: Image.asset('assets/images/avatar.png'),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            const Center(
              child: Text('Назывние заведения\nв две строчки',
                textAlign: TextAlign.center,
                style: TextStyle(
                color: Color(0xFF000000),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 30)),
            const Text('Адрес:',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Color(0xFF000000),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            const Text('ул. Пушкина, д. 27',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color(0xFF9E9E9E),
                  fontSize: 20,
                )
            ),
            const Padding(padding: EdgeInsets.only(bottom: 30)),
            const Text('Контактный номер:',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            const Text('+7 (978) 999-99-99',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color(0xFF9E9E9E),
                  fontSize: 20,
                )
            ),
            const Padding(padding: EdgeInsets.only(bottom: 30)),
            const Text('Мониторинг заказов:',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFE0E0E0)),
                  width: 10,
                  height: 10,
                ),
                const Padding(padding: EdgeInsets.only(right: 10.0)),
                const Text('Поиск исполнителя',
                style: TextStyle(
                  color: Color(0xFFE0E0E0),
                  fontSize: 20,
                ),
                ),
                const Spacer(),
                const Text('2',
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 20,
                  ),
                )
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFCCCCCC)),
                  width: 10,
                  height: 10,
                ),
                const Padding(padding: EdgeInsets.only(right: 10.0)),
                const Text('Исполнитель найден',
                  style: TextStyle(
                    color: Color(0xFFCCCCCC),
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                const Text('0',
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 20,
                  ),
                )
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF9E9E9E)),
                  width: 10,
                  height: 10,
                ),
                const Padding(padding: EdgeInsets.only(right: 10.0)),
                const Text('В пути',
                  style: TextStyle(
                    color: Color(0xFF9E9E9E),
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                const Text('82',
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 20,
                  ),
                )
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF000000)),
                  width: 10,
                  height: 10,
                ),
                const Padding(padding: EdgeInsets.only(right: 10.0)),
                const Text('Завершено',
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                const Text('125',
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
