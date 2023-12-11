import 'package:deli_very/pages/mainscreen.dart';
import 'package:deli_very/widgets/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../widgets/regorder.dart';

class AddOrder extends StatefulWidget {
  const AddOrder({Key? key}) : super(key: key);

  @override
  State<AddOrder> createState() => _AddOrderState();
}

TextEditingController _adress = TextEditingController();
TextEditingController _number = TextEditingController();
TextEditingController timeCtl = TextEditingController();
TextEditingController timeCtl1 = TextEditingController();

class _AddOrderState extends State<AddOrder> {

  final List<Order> _orders = [];
  final _formKey = GlobalKey<FormState>();
  String adress = '';
  String number = '';
  final TextEditingController _mapController = TextEditingController();

  var maskFormatter = MaskTextInputFormatter(
      mask: '+# (###) ###-##-##',
      filter: { "#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy
  );

  void _addOrder() {
    final newOrder = Order(
        adress: _adress.text.trim(),
        number: _number.text.trim(),
    );
    Navigator.pop(context, newOrder);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00C27C),
        toolbarHeight: 80,
        title: Text('Заказы',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: FlutterMap(
                  options: MapOptions(
                  center: LatLng(44.9572, 34.1108),
                  zoom: 13.0,
                 ),
                    children: [
                      TileLayer(
                        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.deli_very.app',
                      ),
                      // MarkerLayer(
                      //   markers: [
                      //     Marker(
                      //         width: 80,
                      //         height: 80,
                      //         point: LatLng(44.9572, 34.1108),
                      //         builder: (ctx) => Container(
                      //           child: Icon(Icons.location_on,
                      //           size: 50,
                      //             color: Colors.red,
                      //           ),
                      //         )
                      //     )
                      //   ],
                      // )
                      // RichAttributionWidget(
                      //     attributions: [
                      //       // TextSourceAttribution(
                      //       //   'OpenStreetMap contributors',
                      //       //   onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
                      //       // )
                      //     ]
                      // ),
                    ],
              ),
            ),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                TextFormField(
                  controller: _mapController,
                  onTap: () {

                  },
                  // onChanged: (value) => adress = value,
                  cursorColor: const Color(0xFF979797),
                  decoration: InputDecoration(
                    hintText: 'Адрес доставки',
                    hintStyle: TextStyle(
                      color: Color(0xFF979797),
                      fontSize: 14,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF616161)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF00C27C)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusColor: Color(0xFF979797),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                TextFormField(
                  inputFormatters: [maskFormatter],
                  controller: _number,
                  onChanged: (value) => number = value,
                  keyboardType: TextInputType.number,
                  cursorColor: const Color(0xFF979797),
                  decoration: InputDecoration(
                    hintText: 'Номер телефона клиента',
                    hintStyle: TextStyle(
                      color: Color(0xFF979797),
                      fontSize: 14,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF616161)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF00C27C)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusColor: Color(0xFF979797),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 25)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: const Text('Позиций в заказе: ', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      ),
                    ),
                    Container(
                      child: const Text('0', style: TextStyle(
                        color: Color(0xFFEA374C),
                        fontSize: 20,
                      ),),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('На сумму: ', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    ),
                    Text('0 ₽', style: TextStyle(
                      fontSize: 20,
                    ),),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 15)),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        // Меню
                      },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                      backgroundColor: const Color(0xFFFEFEFE),
                      fixedSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          width: 1,
                          color: Color(0xFF00C27C),
                        )
                      )
                    ),
                      child: const Text('Добавить', style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF00C27C),
                      ),
                      )
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 70)),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _addOrder();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: const Color(0xFFB8B8B8),
                      fixedSize: const Size(double.infinity, 50),
                    ),
                    child: const Text('Сформировать', style: TextStyle(
                      color: Color(0xFFD4D4D4),
                      fontSize: 18,
                    ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
