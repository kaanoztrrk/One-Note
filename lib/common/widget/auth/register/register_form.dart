import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:one_note/blocs/auth_blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:one_note/blocs/auth_blocs/sign_up_bloc/sign_up_event.dart';
import 'package:one_note/data/src/model/user_model/user_model.dart';

import '../../../../../Util/Constant/sizes.dart';
import '../../../../../Util/Constant/text_strings.dart';
import '../../../../../Util/validators/validationHelpers.dart';
import '../../../../blocs/auth_blocs/sign_up_bloc/sign_up_state.dart';

class ViSignupForm extends StatefulWidget {
  const ViSignupForm({
    super.key,
  });

  @override
  State<ViSignupForm> createState() => _ViSignupFormState();
}

class _ViSignupFormState extends State<ViSignupForm> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController userName = TextEditingController();
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();

    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          setState(() {});
          // context.pop();
        } else if (state is SignUpProcess) {
          setState(() {});
        } else if (state is SignUpFailure) {
          return;
        }
      },
      child: Form(
          //   key: signupFormKey,
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: ViSizes.spaceBtwInputFields),
          TextFormField(
              controller: userName,
              validator: (value) =>
                  ViValidator.validateEmtyText('Username', value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: ViTexts.userName,
                  prefixIcon: Icon(Iconsax.user_edit))),
          const SizedBox(height: ViSizes.spaceBtwInputFields),
          TextFormField(
              controller: email,
              validator: (value) => ViValidator.validateEmail(value!),
              expands: false,
              decoration: const InputDecoration(
                  labelText: ViTexts.email, prefixIcon: Icon(Iconsax.direct))),
          const SizedBox(height: ViSizes.spaceBtwInputFields),
          TextFormField(
            controller: password,
            validator: (value) => ViValidator.validatePassword(value),
            //    obscureText: controller.hidePassword.value,
            expands: false,
            decoration: InputDecoration(
              labelText: ViTexts.password,
              prefixIcon: const Icon(Iconsax.password_check),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Iconsax.eye),
              ),
            ),
          ),
          const SizedBox(height: ViSizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                UserModel userModel = UserModel.empty;
                userModel = userModel.copyWith(
                  email: email.text,
                  name: userName.text,
                );

                setState(() {
                  context
                      .read<SignUpBloc>()
                      .add(SignUpRequired(userModel, password.text));
                });
              },
              child: const Text(ViTexts.createAccount),
            ),
          ),
        ],
      )),
    );
  }
}
