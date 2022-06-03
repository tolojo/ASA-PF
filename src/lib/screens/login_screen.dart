import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:src/screens/home.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  final url = "http://10.0.2.2:3000/cidadao/login";
  bool _isLoading = false;
  late String email, password;
  late var rStatus = 400;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signIn(String email, String password) async {
    Map data = {'email': email, 'password': password};
    print(data.toString());
    var dados = data.toString();
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));
    setState(() {
      _isLoading = false;
    });
    print(response.statusCode);
    rStatus = response.statusCode;
    if (response.statusCode == 200) {
      Map<String, dynamic> user = jsonDecode(response.body);
      print(user);
      print("Username ${user['cidadao_id']}");
      savePref(1, user['cidadao_email'], user['cidadao_id']);
      Navigator.push(context, MaterialPageRoute(builder: (_) => const Home()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please try again!")));
    }
  }

  savePref(int value, String email, int id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setInt("value", value);
    preferences.setString("email", email);
    preferences.setString("id", id.toString());
    preferences.commit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                    key: formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
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
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Obrigatório"),
                            EmailValidator(
                                errorText: "Introduza um email válido"),
                          ]),
                          onSaved: (val) {
                            email = val!;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          maxLines: 1,
                          obscureText: true,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFFD3D3D3),
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Obrigatório"),
                          ]),
                          onSaved: (val) {
                            email = val!;
                          },
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
                              setState(() {
                                _isLoading = true;
                              });
                              signIn(emailController.text,
                                  passwordController.text);
                              if (formkey.currentState!.validate() && rStatus == 200) {                               
                                formkey.currentState!.save();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const Home()));
                                print("Válido!");
                              } else {
                                _isLoading = false;
                                print("Credênciais Inválidas!");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.fromLTRB(154, 15, 154, 15),
                                primary: const Color(0xFF77BECE),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            child: const Text(
                              'Sign in',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto',
                                  fontSize: 20,
                                  color: Color(0xFFFFFFFF)),
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
