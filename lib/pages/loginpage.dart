// import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
  }

  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  bool _checkedvalue = true;
  var _phonecontroller = TextEditingController();
  var _phoneregcontroller = TextEditingController();
  var _passwordcontroller = TextEditingController();

  var maskFormatter = MaskTextInputFormatter(
    mask: '+# (###) ###-##-##',
    filter: { "#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy
);


class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {

  @override

  void initState() {
    super.initState();
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  void performLogin() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    Navigator.pushNamed(context, 'MainScreen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 152,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))
                          ),
                          backgroundColor: const Color(0xFF00C27C)
                      ),
                      onPressed: () {
                        // Переход на страницу входа
                      },
                      child: const Text('Вход', style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFFFFFFF),
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
                        backgroundColor: const Color(0xFFFFFFFF),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'registration');
                      },
                      child: const Text('Регистрация', style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFD0D2D2)
                      ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Column(
            children: [
              Padding(padding: EdgeInsets.only(bottom: 50)),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                    child: SvgPicture.asset('assets/images/Logo.svg')
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 50.0)),
              const Text('Добро пожаловать!', style: TextStyle(
                color: Color(0xFF00C27C),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 24.0)),
              const Text('Введите данные для входа: ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF272727),
                  fontSize: 20,
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
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF616161)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF00C27C)),
                      borderRadius: BorderRadius.circular(15),
                    )
                ),
                validator: (value) =>
                value == null || value.isEmpty ? '' : null,
              ),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              TextFormField(
                controller: _passwordcontroller,
                obscureText: _passwordVisible,
                cursorColor: const Color(0xFF00C27C),
                decoration: InputDecoration(
                  hintText: 'Введите пароль',
                  hintStyle: const TextStyle(
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
                  suffixIcon: IconButton(
                    color: Color(0xFF00C27C),
                    onPressed: initState,
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Color(0xFF00C27C),
                    ),
                  ),
                ),
                validator: (value) =>
                value == null || value.isEmpty ? '' : null,
              ),
              const Padding(padding: EdgeInsets.only(bottom: 35)),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, 'MainScreen');
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
                  child: const Text('Вход', style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 18,
                  ),
                  ),
                ),
              ),
            ],
          )
          ],
        ),
        ),
      ),
    );
  }
}