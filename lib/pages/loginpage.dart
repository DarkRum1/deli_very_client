// import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
  }

  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  var _emailcontroller = TextEditingController();
  var _passwordcontroller = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override

  void initState() {
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
                          backgroundColor: const Color(0xFF616161)
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
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0)
                            ),
                            side: const BorderSide(
                              width: 1.5,
                              color: Color(0xFF616161)
                            ),
                            backgroundColor: const Color(0xFFFFFFFF),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 'registration');
                        },
                        child: const Text('Регистрация', style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF616161)
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
              const Text('Введите данные\nдля входа: ',
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
              const Padding(padding: EdgeInsets.only(bottom: 20)),
                TextFormField(
                  controller: _passwordcontroller,
                  obscureText: _passwordVisible,
                  cursorColor: const Color(0xFF616161),
                  decoration: InputDecoration(
                    hintText: 'Введите пароль',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF616161)),
                    ),
                    suffixIcon: IconButton(
                        onPressed: initState,
                      icon: Icon(
                        _passwordVisible
                        ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black54,
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
                    child: const Text('Вход', style: TextStyle(
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