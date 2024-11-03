import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:wear_weather/presentation/auth/screen/signin_page.dart';
import 'package:wear_weather/presentation/common/custom_text_field.dart';
import 'package:wear_weather/presentation/common/long_button.dart';
import 'package:wear_weather/services/auth_services.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Image.asset(
            'assets/images/logo.png',
            width: 40,
            height: 31,
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tu nous as manqué',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      controller: _emailController,
                      label: "Email",
                      isRequired: true,
                    ),
                    const SizedBox(height: 24),
                    PasswordTextField(controller: _passwordController),
                    const SizedBox(height: 24),
                    LongButton(
                        text: "Se connecter",
                        onPressed: () async {
                          AuthServices().signin(
                              context: context,
                              email: _emailController.text,
                              password: _passwordController.text);
                        }),
                    Center(
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Mot de passe oublié ?',
                            style: TextStyle(
                                color: Color.fromRGBO(250, 51, 184, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )),
                    ),
                    const SizedBox(height: 24),
                    const Row(
                      children: [
                        Expanded(
                            child: Divider(
                                height: 1, thickness: 1, color: Colors.black)),
                        SizedBox(width: 5),
                        Text('ou'),
                        SizedBox(width: 5),
                        Expanded(
                            child: Divider(
                                height: 1, thickness: 1, color: Colors.black)),
                      ],
                    ),
                    const SizedBox(height: 24),
                    LongButton(
                        icon: const Icon(PhosphorIconsBold.googleLogo),
                        text: "Continuer avec Google",
                        onPressed: () {
                          AuthServices().signInWithGoogle(context);
                        }),
                    const SizedBox(height: 8),
                    LongButton(
                        icon: const Icon(PhosphorIconsBold.metaLogo),
                        text: "Continuer avec Meta",
                        onPressed: () {}),
                    const SizedBox(height: 8),
                    LongButton(
                        icon: const Icon(PhosphorIconsBold.appleLogo),
                        text: "Continuer avec Apple",
                        onPressed: () {}),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Pas de compte ? ",
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SigninPage()),
                      );
                    },
                    child: const Text(
                      'Inscris-toi',
                      style: TextStyle(
                          color: Color.fromRGBO(250, 51, 184, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
