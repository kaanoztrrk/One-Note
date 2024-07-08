import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:one_note/core/routes/routes.dart';

import '../../../../../../Util/Constant/sizes.dart';
import '../../../../../../Util/Constant/text_strings.dart';
import '../../../../../../Util/validators/validationHelpers.dart';
import '../../../../blocs/auth_blocs/sign_in_bloc/sign_in_bloc.dart';
import '../../../../blocs/auth_blocs/sign_in_bloc/sign_in_event.dart';

class ViLoginForm extends StatefulWidget {
  const ViLoginForm({
    super.key,
  });

  @override
  State<ViLoginForm> createState() => _ViLoginFormState();
}

class _ViLoginFormState extends State<ViLoginForm> {
  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController();
    final emailController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    bool signInRequired = false;
    IconData iconPassword = CupertinoIcons.eye_fill;
    bool obscurePassword = true;
    String? errorMsg;
    return Form(
      key: formKey,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: ViSizes.spaceBtwSections * 2),
        child: Column(
          children: [
            // Email
            TextFormField(
              controller: emailController,
              validator: (value) => ViValidator.validateEmail(value!),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: ViTexts.email,
              ),
            ),
            const SizedBox(height: ViSizes.spaceBtwInputFields),

            // Password
            TextFormField(
              controller: passwordController,
              validator: (value) => ViValidator.validatePassword(value),
              obscureText: obscurePassword,
              expands: false,
              decoration: InputDecoration(
                labelText: ViTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
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
                  icon: const Icon(Iconsax.eye),
                ),
              ),
            ),
            const SizedBox(height: ViSizes.spaceBtwInputFields / 2),

            // Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //Forget Password,
                TextButton(
                    onPressed: () {}, child: const Text(ViTexts.forgetPassword))
              ],
            ),
            const SizedBox(height: ViSizes.spaceBtwSections),

            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    context.read<SignInBloc>().add(SignInRequired(
                        emailController.text, passwordController.text));
                  },
                  child: const Text(ViTexts.signIn)),
            ),
            const SizedBox(height: ViSizes.spaceBtwItems),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {
                    context.push(Routes.register_view);
                  },
                  child: const Text(ViTexts.createAccount)),
            )
          ],
        ),
      ),
    );
  }
}
