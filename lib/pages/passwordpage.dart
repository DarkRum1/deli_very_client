import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

final _formKey = GlobalKey<FormState>();
bool _checkedvalue = true;
var _passwordcontroller = TextEditingController();
var _passwordrepeatcontroller = TextEditingController();

class _PasswordPageState extends State<PasswordPage> {
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
                const Padding(padding: EdgeInsets.only(bottom: 50)),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      child: SvgPicture.asset('assets/images/Logo.svg')
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 50.0)),
                const Text('Остался последний шаг!', style: TextStyle(
                  color: Color(0xFF00C27C),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10.0)),
                const Text('Придумайте пароль ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF272727),
                    fontSize: 18,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                TextFormField(
                  controller: _passwordcontroller,
                  keyboardType: TextInputType.phone,
                  cursorColor: const Color(0xFF00C27C),
                  decoration: InputDecoration(
                    hintText: 'Введите пароль',
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
                TextFormField(
                  controller: _passwordrepeatcontroller,
                  keyboardType: TextInputType.phone,
                  cursorColor: const Color(0xFF00C27C),
                  decoration: InputDecoration(
                    hintText: 'Повсторите пароль',
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
                const Padding(padding: EdgeInsets.only(bottom: 30)),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, 'RegObject');
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
                    child: const Text('Продолжить', style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 18,
                    ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}