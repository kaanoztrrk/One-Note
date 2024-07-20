import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:one_note/data/src/model/user_model/user_model.dart';

import '../../Util/Constant/sizes.dart';
import '../../Util/Constant/text_strings.dart';
import '../../Util/validators/validationHelpers.dart';
import '../../blocs/auth_blocs/sign_up_bloc/sign_up_bloc.dart';
import '../../blocs/auth_blocs/sign_up_bloc/sign_up_event.dart';
import '../../blocs/auth_blocs/sign_up_bloc/sign_up_state.dart';
import '../../common/widget/button/classic_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          // Handle navigation or other side effects
        } else if (state is SignUpFailure) {
          // Show a snackbar or other error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message ?? 'Sign up failed')),
          );
        }
      },
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Center(
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
                      obscureText: state.obscurePassword,
                      keyboardType: TextInputType.visiblePassword,
                      expands: false,
                      decoration: InputDecoration(
                        labelText: ViTexts.password,
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                          onPressed: () {
                            context
                                .read<SignUpBloc>()
                                .add(TogglePasswordVisibility());
                          },
                          icon: Icon(state.obscurePassword
                              ? CupertinoIcons.eye_fill
                              : CupertinoIcons.eye_slash_fill),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: ViTexts.userName,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  state is! SignUpProcess
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: ViSizes.md),
                          child: ViClassicButton(
                            heigth: 65,
                            title: "Sign Up",
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                UserModel myUser = UserModel.empty;
                                myUser = myUser.copyWith(
                                  email: emailController.text,
                                  name: nameController.text,
                                );
                                context.read<SignUpBloc>().add(SignUpRequired(
                                    myUser, passwordController.text));
                              }
                            },
                          ),
                        )
                      : const CircularProgressIndicator(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
