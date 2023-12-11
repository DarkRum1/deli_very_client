import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

final _formKey = GlobalKey<FormState>();
bool _checkedvalue = true;
var _phonecontroller = TextEditingController();

var maskFormatter = MaskTextInputFormatter(
  mask: '+# (###) ###-##-##',
  filter: { "#": RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.lazy
);

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.only(right: 30, left: 30, top: 45),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 152,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))
                              ),
                              backgroundColor: const Color(0xFFFFFFFF),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, 'login');
                          },
                          child: const Text('Вход', style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFD0D2D2),
                          ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 180,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8))
                            ),
                            backgroundColor: const Color(0xFF00C27C),
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
                      child: SvgPicture.asset('assets/images/Logo.svg')
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 50.0)),
                const Text('Начнем регистрацию!', style: TextStyle(
                  color: Color(0xFF00C27C),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10.0)),
                const Text('Введите данные для регистрации: ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF272727),
                    fontSize: 18,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                TextFormField(
                  inputFormatters: [maskFormatter],
                  controller: _phonecontroller,
                  keyboardType: TextInputType.phone,
                  cursorColor: const Color(0xFF00C27C),
                  decoration: InputDecoration(
                    hintText: 'Введите номер телефона',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF616161)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF00C27C)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) =>
                  value == null || value.isEmpty ? '' : null,
                ),
                const Padding(padding: EdgeInsets.only(bottom: 13)),
                const Text('В течении 5 минут вам поступит СМС\nс кодом подтверждения!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF979797),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 50)),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, 'CodePage');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      ),
                      backgroundColor: const Color(0xFF00C27C),
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
        )
    );
  }
}