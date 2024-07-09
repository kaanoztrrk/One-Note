import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:one_note/Util/Constant/sizes.dart';
import 'package:one_note/blocs/auth_blocs/sign_in_bloc/sign_in_event.dart';
import 'package:one_note/common/widget/button/classic_button.dart';

import '../../Util/Constant/text_strings.dart';
import '../../Util/validators/validationHelpers.dart';
import '../../blocs/auth_blocs/sign_in_bloc/sign_in_bloc.dart';
import '../../blocs/auth_blocs/sign_in_bloc/sign_in_state.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool signInRequired = false;
  IconData iconPassword = CupertinoIcons.eye_fill;
  bool obscurePassword = true;
  String? _errorMsg;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          setState(() {
            signInRequired = false;
          });
        } else if (state is SignInProcess) {
          setState(() {
            signInRequired = true;
          });
        } else if (state is SignInFailure) {
          setState(
            () {
              signInRequired = false;
              _errorMsg = 'Invalid email or password';
            },
          );
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextFormField(
                controller: emailController,
                validator: (value) => ViValidator.validateEmail(value!),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: ViTexts.email,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextFormField(
                controller: passwordController,
                validator: (value) => ViValidator.validatePassword(value),
                obscureText: obscurePassword,
                keyboardType: TextInputType.visiblePassword,
                expands: false,
                decoration: InputDecoration(
                  labelText: ViTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  errorText:
                      _errorMsg, // errorText yerine error kullanılmıştı, düzelttik
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                        if (obscurePassword) {
                          iconPassword = CupertinoIcons.eye_fill;
                        } else {
                          iconPassword = CupertinoIcons.eye_slash_fill;
                        }
                      });
                    },
                    icon:
                        Icon(iconPassword), // iconPassword burada kullanılıyor
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            !signInRequired
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: ViSizes.md),
                    child: ViClassicButton(
                      heigth: 65,
                      title: "Sign In",
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<SignInBloc>().add(SignInRequired(
                              emailController.text, passwordController.text));
                        }
                      },
                    ),
                  )
                : const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
