import 'package:flutter/material.dart';

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
                  width: 150,
                  child: Image.asset('assets/images/log.png'),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
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
                cursorColor: const Color(0xFF616161),
                decoration: const InputDecoration(
                  hintText: '- - - - - -',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF616161)),
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
                  color: Color(0xFF272727),
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
