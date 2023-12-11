import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CodePage extends StatefulWidget {
  const CodePage({Key? key}) : super(key: key);

  @override
  State<CodePage> createState() => _CodePageState();
}
final _formKey = GlobalKey<FormState>();
var _codecontroller = TextEditingController();

class _CodePageState extends State<CodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                    child: SvgPicture.asset('assets/images/Logo.svg')
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 50)),
              const Center(
                child: Text('Введите полученный\nкод ниже',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF272727),
                    fontSize: 18,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              TextFormField(
                textAlign: TextAlign.center,
                controller: _codecontroller,
                keyboardType: TextInputType.number,
                cursorColor: const Color(0xFF00C27C),
                decoration: InputDecoration(
                  hintText: '- - - - - -',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
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
                value == null || value.isEmpty || value != '123456' ? '' : null,
              ),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              const Center(
                child: Text('Не пришел код?', style: TextStyle(
                  color: Color(0xFF979797),
                  fontSize: 13,
                ),),
              ),
              const Center(
                child: Text('отправить еще раз', style: TextStyle(
                  color: Color(0xFF00C27C),
                  fontSize: 13,
                  decoration: TextDecoration.underline,
                ),),
              ),
          const Padding(padding: EdgeInsets.only(bottom: 50)),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, 'PasswordPage');
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
      ),
    );
  }
}
