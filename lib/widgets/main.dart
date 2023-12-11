import 'package:deli_very/widgets/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key,}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {

    // User user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
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
                child: SvgPicture.asset('assets/images/avatar.svg'),
              ),
            ),
             const Padding(padding: EdgeInsets.only(bottom: 10)),
             Center(
              child: Text( 'Название заведения\nв две строчки',
                // user.name,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserratAlternates(
                textStyle: const TextStyle(
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 30)),
             Text('Адрес:',
                textAlign: TextAlign.start,
              style: GoogleFonts.montserratAlternates(
                textStyle: const TextStyle(
                  color: Color(0xFFD0D2D2),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Text( 'ул. Пушкина, д. 27',
              // user.adress,
                textAlign: TextAlign.start,
                style: GoogleFonts.montserratAlternates(
                textStyle: const TextStyle(
                  color: Color(0xFF161F1C),
                  fontSize: 20,
                )
                ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 30)),
            Text('Контактный номер:',
                textAlign: TextAlign.start,
              style: GoogleFonts.montserratAlternates(
                textStyle: const TextStyle(
                  color: Color(0xFFD0D2D2),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Text( '+7 (978)-999-99-99',
              // user.number,
                textAlign: TextAlign.start,
              style: GoogleFonts.montserratAlternates(
                  textStyle: const TextStyle(
                    color: Color(0xFF161F1C),
                    fontSize: 20,
                  )
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 30)),
            Text('Мониторинг заказов:',
                textAlign: TextAlign.start,
                style: GoogleFonts.montserratAlternates(
                  textStyle: const TextStyle(
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.only(right: 10.0)),
                Text('Поиск исполнителя',
                  style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Color(0xFFE0E0E0),
                    fontSize: 20,
                  ),
                  ),
                ),
                const Spacer(),
                Text('2',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.only(right: 10.0)),
                Container(
                  child: Text('Принят',
                    style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      color: Color(0xFFF0DA46),
                      fontSize: 20,
                    ),
                    ),
                  ),
                ),
                const Spacer(),
                Text('4',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.only(right: 10.0)),
                Text('В пути',
                  style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Color(0xFFF08046),
                    fontSize: 20,
                  ),
                  ),
                ),
                const Spacer(),
                Text('1',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.only(right: 10.0)),
                Text('Завершен',
                  style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Color(0xFF00C27C),
                    fontSize: 20,
                  ),
                  ),
                ),
                const Spacer(),
                Text('32',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 20,
                    ),
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
