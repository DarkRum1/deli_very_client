import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

final _formKey = GlobalKey<FormState>();
bool _checkedvalue = true;
var _emailcontroller = TextEditingController();

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0)
                              ),
                              backgroundColor: const Color(0xFFFFFFFF),
                            side: const BorderSide(
                                width: 1.5,
                                color: Color(0xFF616161)
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, 'login');
                          },
                          child: const Text('Вход', style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF616161),
                          ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 180,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0)
                            ),
                            backgroundColor: const Color(0xFF616161),
                          ),
                          onPressed: () {
                            //
                          },
                          child: const Text('Регистрация', style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFFFFFFFF)
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 50)),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 150,
                    child: Image.asset('assets/images/log.png'),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20.0)),
                const Text('Добро пожаловать!', style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 24.0)),
                const Text('Ваше email\nдля регистрации: ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF272727),
                    fontSize: 20,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                TextFormField(
                  controller: _emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: const Color(0xFF616161),
                  decoration: const InputDecoration(
                    hintText: 'Введите email',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF616161)),
                    ),
                  ),
                  validator: (value) =>
                  value == null || value.isEmpty ? '' : null,
                ),
                const Padding(padding: EdgeInsets.only(bottom: 13)),
                const Text('В течении 5 минут вам придет письмо\nдля подтверждения почты!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF979797),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 25)),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, 'CodePage');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      backgroundColor: const Color(0xFF616161),
                      fixedSize: const Size(double.infinity, 50),
                    ),
                    child: const Text('Отправить', style: TextStyle(
                      color: Color(0xFFFFFFFF),
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
                          activeColor: Color(0xFF616161),
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
                                  color: Color(0xFF616161),
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
        )
    );
  }
}