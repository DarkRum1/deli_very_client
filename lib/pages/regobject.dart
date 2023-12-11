import 'package:deli_very/pages/mainscreen.dart';
import 'package:deli_very/widgets/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegObject extends StatefulWidget {

  const RegObject({Key? key}) : super(key: key);

  @override
  State<RegObject> createState() => _RegObjectState();
}

var _namecontroller = TextEditingController();
var _adresscontroller = TextEditingController();
var _emailcontroller = TextEditingController();
final _formKey = GlobalKey<FormState>();
bool _checkedvalue = true;

class _RegObjectState extends State<RegObject> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 150,
                  child: SvgPicture.asset('assets/images/loadavatar.svg'),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 25)),
              const Text('Регистрация заведения', style: TextStyle(
                color: Color(0xFF00C27C),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10.0)),
              const Text('Отлично! Теперь заполните\nданные заведения!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF272727),
                  fontSize: 18,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 25)),
              TextFormField(
                controller: _namecontroller,
                cursorColor: const Color(0xFF00C27C),
                decoration: InputDecoration(
                  hintText: 'Введите название заведения',
                  hintStyle: TextStyle(
                    color: Color(0xFF979797),
                    fontSize: 14,
                  ),
                  suffixText: '*',
                  suffixStyle: TextStyle(
                    color: Color(0xFFEA374C),
                  ),
                  errorStyle: TextStyle(
                    height: 0,
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                      color: Color(0xFFEA374C),
                    )
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
                validator: (value) =>
                value == null || value.isEmpty ? '' : null,
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),

              TextFormField(
                controller: _adresscontroller,
                cursorColor: const Color(0xFF00C27C),
                decoration: InputDecoration(
                  hintText: 'Введите адрес заведения',
                  hintStyle: TextStyle(
                    color: Color(0xFF979797),
                    fontSize: 14,
                  ),
                  suffixText: '*',
                  suffixStyle: TextStyle(
                    color: Color(0xFFEA374C),
                  ),
                  errorStyle: TextStyle(
                    height: 0,
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color(0xFFEA374C),
                      )
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
                validator: (value) =>
                value == null || value.isEmpty ? '' : null,
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),

              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailcontroller,
                cursorColor: const Color(0xFF00C27C),
                decoration: InputDecoration(
                  hintText: 'Введите ваш E-mail',
                  hintStyle: TextStyle(
                    color: Color(0xFF979797),
                    fontSize: 14,
                  ),
                  errorStyle: TextStyle(
                    height: 0,
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color(0xFFEA374C),
                      )
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
                validator: (value) =>
                value == null || value.isEmpty ? '' : null,
              ),
              const Padding(padding: EdgeInsets.only(bottom: 30)),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(
                            context,
                            'MainScreen',
                          // arguments: User(
                          //     name: _namecontroller.text.toString(),
                          //     adress: _adresscontroller.text.toString(),
                          //     number: _emailcontroller.text.toString()
                          // ),
                        );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: const Color(0xFF00C27C),
                    fixedSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('Продолжить', style: TextStyle(
                    fontSize: 18,
                  ),
                  ),
                ),
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 210,
                      child: CheckboxListTile(
                        activeColor: Color(0xFF00C27C),
                        contentPadding: EdgeInsets.zero,
                        title: RichText(
                          // textAlign: TextAlign.center,
                          text: const TextSpan(
                              style: TextStyle(
                                color: Color(0xFFC4C4C4),
                                fontSize: 14,
                              ),
                              children: [
                                TextSpan(text: 'Согласен с '),
                                TextSpan(text: 'правилами', style: (TextStyle(
                                  color: Color(0xFF00C27C),
                                  fontSize: 14,
                                  decoration: TextDecoration.underline,
                                )))
                              ]
                          ),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _checkedvalue,
                        onChanged: (bool? value) => {
                          if (value != null) {
                            setState(() {
                              _checkedvalue = value;
                            })
                          },
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
