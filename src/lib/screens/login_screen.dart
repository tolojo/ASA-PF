import 'package:flutter/material.dart';
import 'package:src/screens/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Iniciar Sessão',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Quicksand',
                  color: Color(0xFFFFFFFF)),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Color(0xFFD3D3D3)),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'E-mail',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ), 
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    maxLines: 1,
                    obscureText: true,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Color(0xFFD3D3D3),
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),         
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    elevation: 15,
                    shadowColor: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                    child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Home(),
                      ));
                      if (_formKey.currentState!.validate()) {}
                    },                 
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(154, 15, 154, 15),
                      primary: const Color(0xFF77BECE),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      )
                    ),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        color:  Color(0xFFFFFFFF)
                      ),
                    ),
                  ),
                  ),
                  const SizedBox(
                    height: 20,
                    
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
