import 'dart:ffi' as ui;
import 'package:deli_very/widgets/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  final List<Product> _products = [
    Product(name: 'Соус с морепродуктами', price: 884),
  ];

  Future<void> _showDialogAdd() async {
    String name = '';
    double price = 0;

    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            // actionsPadding: const EdgeInsets.all(5),
            // // contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            // titlePadding: const EdgeInsets.all(5),
            title: Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 18),
                      child: Text('Добавление позиции',
                        style: GoogleFonts.montserratAlternates(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close)
                    ),
                  ],
                ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            content:  SingleChildScrollView(
              child: ListBody(
                children: [
                  Form(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            Container(
                              child: TextFormField(
                                onChanged: (value) => name = value,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF616161)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF00C27C)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  hintText: 'Введите название',
                                    hintStyle: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                        color: Color(0xFF979797),
                                        fontSize: 14,
                                      ),
                                    ),
                                ),
                                validator: (value) {
                                  if (value != null) {
                                    return '';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(bottom: 10)),
                            Container(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                onChanged: (value) => price = double.tryParse(value) ?? 0,
                                decoration: InputDecoration(
                                  filled: false,
                                  suffixText: '*',
                                    suffixStyle: const TextStyle(
                                      color: Color(0xFFEA374C),
                                      fontSize: 16,
                                    ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF616161)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF00C27C)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                    hintText: 'Введите цену',
                                  hintStyle: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                      color: Color(0xFF979797),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value != null) {
                                    return '';
                                  }
                                  return null;
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                  ),
                ],
              ),
            ),
            actions: [
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (name.trim().isEmpty || price <= 0) return;

                      setState(() {
                        _products.add(Product(
                            name: name.trim(),
                            price: price,
                        ),
                        );
                      });
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor:  const Color(0xFFFEFEFE),
                        fixedSize:  const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              width: 1,
                              color: Color(0xFF00C27C),
                            )
                        )
                    ),
                    child: Text('Сохранить',
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
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00C27C),
        toolbarHeight: 80,
        title: Text('Меню',
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
          onPressed: () {
            _showDialogAdd();
          },
          child: const Icon(Icons.add_rounded, size: 36),
        ),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: const Color(0xFFF4F4F4),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: TextFormField(
                  cursorColor: const Color(0xFF616161),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(top: 15),
                      focusColor: const Color(0xFF979797),
                      hintText: 'Поиск позиций',
                    hintStyle: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Color(0xFFD0D2D2),
                        fontSize: 14,
                      ),
                    ),
                    prefixIcon: const SizedBox(
                        height: 24,
                        width: 24,
                        child: Icon(Icons.search)
                    ),
                    prefixIconColor: const Color(0xFF00C27C),
                  ),
                )
              ),
              ),
              Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                        itemCount: _products.length,
                        itemBuilder: (context, index) {
                          return
                            Container(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1.0,
                                  color: Colors.grey,
                                ),
                              )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                // Padding(padding: EdgeInsets.only(bottom: 10)),

                                Text(_products[index].name,
                                  style:
                                    GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500
                                      ),
                                    ),
                                ),

                                // Padding(padding: EdgeInsets.only(bottom: 10)),

                                Align(
                                  alignment: Alignment.topRight,
                                  child: Text('${_products[index].price.toInt()} ₽',
                                    style:
                                    GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),

                                // SizedBox(
                                //   width: 24,
                                //   height: 24,
                                //   child: Image.asset('assets/images/edit_icon.png'),
                                // ),

                              ],
                            ),
                          );
                        }
                    ),
                  ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
