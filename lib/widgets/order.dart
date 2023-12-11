import 'package:deli_very/pages/addorder.dart';
import 'package:deli_very/widgets/regorder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderPage extends StatefulWidget {

  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}
class _OrderPageState extends State<OrderPage> {

  final List<Order> orders = [
    Order(
        adress: 'ул. Пушкина, д. 27',
        number: '+7 (978) 999-99-99',
    ),
  ];

  void _addNewOrder(Order order) {
    setState(() {
      orders.add(order);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final arguments = ModalRoute.of(context)?.settings?.arguments;
    // if (arguments != null && arguments is Order) {
    //   // final newOrder = arguments['newOrder'];
    //   // if (newOrder is Order) {
    //   _orders.add(arguments);
    //   // }
    // }
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF00C27C),
          onPressed: () async {
            Order? newOrder = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddOrder(),
                ),
            );
            if (newOrder != null) {
              _addNewOrder(newOrder);
            }
            // Navigator.pushNamed(context, 'AddOrder');
          },
            child: const Icon(Icons.add_rounded, size: 36),
        ),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                color: const Color(0xFFF4F4F4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 20, bottom: 9, top: 9),
                      child: InkWell(
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: SvgPicture.asset('assets/images/filter_icon.svg'),
                        ),
                        onTap: () {
                          // фильтр
                        },
                      ),
                    )
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              Expanded(

                  child: ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xFFE0E0E0),
                                )
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text('Поиск',
                                      style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFFE0E0E0),
                                          )
                                      ),
                                    ),
                                  ],
                                ),
                                const Padding(padding: EdgeInsets.only(bottom: 10)),
                                Text(orders[index].adress,
                                  style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      )
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.only(bottom: 10)),
                                Text(orders[index].number,
                                  style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      )
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.only(bottom: 15)),
                                // Row(
                                //   children: [
                                //     Text('Будет готов:',
                                //       style: GoogleFonts.montserrat(
                                //         textStyle: const TextStyle(
                                //           fontSize: 12,
                                //           fontWeight: FontWeight.w500,
                                //         ),
                                //       ),
                                //     ),
                                //     const Padding(padding: EdgeInsets.only(right: 5)),
                                //     Text(orders[index].time,
                                //       style: GoogleFonts.montserrat(
                                //         textStyle: const TextStyle(
                                //           fontSize: 14,
                                //           fontWeight: FontWeight.w500,
                                //           color: Color(0xFF646464),
                                //         ),
                                //       ),
                                //     ),
                                //     const Padding(padding: EdgeInsets.only(right: 23)),
                                //     Text('Доставить к:',
                                //       style: GoogleFonts.montserrat(
                                //         textStyle: const TextStyle(
                                //           fontSize: 12,
                                //           fontWeight: FontWeight.w500,
                                //         ),
                                //       ),
                                //     ),
                                //     const Padding(padding: EdgeInsets.only(right: 5)),
                                //     Text(orders[index].readytime,
                                //       style: GoogleFonts.montserrat(
                                //         textStyle: const TextStyle(
                                //           fontSize: 14,
                                //           fontWeight: FontWeight.w500,
                                //           color: Color(0xFF646464),
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                const Padding(padding: EdgeInsets.only(bottom: 15)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('На сумму:',
                                      style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),
                                    ),
                                    Text('1400 ₽',
                                      style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                            fontSize: 16,
                                          )
                                      ),
                                    ),
                                  ],
                                ),
                                const Padding(padding: EdgeInsets.only(bottom: 15)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('К оплате:',
                                      style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),
                                    ),
                                    Text('~800 ₽',
                                      style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                            fontSize: 16,
                                          )
                                      ),
                                    ),
                                  ],
                                ),
                                const Padding(padding: EdgeInsets.only(bottom: 15)),
                                Container(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {

                                    },
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor:  const Color(0xFFFEFEFE),
                                        fixedSize:  const Size(double.infinity, 50),
                                        shape:  RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                            side: BorderSide(
                                              width: 1,
                                              color: Color(0xFF00C27C),
                                            )
                                        )
                                    ),
                                    child: Text('Подробнее',
                                        style: GoogleFonts.montserratAlternates(
                                            textStyle: const TextStyle(
                                              fontSize: 16,
                                              color: Color(0xFF00C27C),
                                            )
                                        )
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                  ),
                      // Container(
              ),
            ],
          ),
        ),
      ),
    );
  }
}
