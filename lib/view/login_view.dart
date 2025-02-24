import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture/res/components/custom_text_widget.dart';
import 'package:mvvm_architecture/routes/app_routes.dart';
import 'package:provider/provider.dart';

import '../res/app_colors.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {



    //value notifier for changing visibility icon state
    ValueNotifier<bool> isVisible = ValueNotifier(true);

    //TextField controllers
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    //FocusNodes of text fields
    final emailFocusNode = FocusNode();
    final passwordFocusNode = FocusNode();

    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(
          text: 'Login View',
          color: AppColor.textWhiteColor,
          fontSize: 20,
        ),
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),

        //Form
        child: Form(
            key: formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //Email TextField
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: emailController,
                      focusNode: emailFocusNode,
                      onFieldSubmitted: (_) {
                        Utils.changeFocusNode(
                            context, emailFocusNode, passwordFocusNode);
                      },
                      validator: (val) => val!.isEmpty ? 'Enter Email' : null,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        suffixIcon:
                            Icon(Icons.mail, color: AppColor.primaryColor),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //Listenable Builder
                    ValueListenableBuilder(
                      valueListenable: isVisible,
                      builder: (BuildContext context, value, Widget? child) {
                        //Password TextField
                        return TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: isVisible.value,
                          controller: passwordController,
                          focusNode: passwordFocusNode,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (_) {},
                          validator: (val) =>
                              val!.isEmpty ? 'Enter Password' : null,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                  value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColor.primaryColor),
                              onPressed: () {
                                isVisible.value = !isVisible.value;
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),

                    //Login button
                    Consumer<AuthViewModel>(
                        builder: (context, value, child) => SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.primaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      if (kDebugMode) {
                                        print('Successfully');
                                      }
                                      Map data = {
                                        'email' : emailController.text.toString(),
                                        'password' : emailController.text.toString(),
                                      };
                                      value.loginApi(data, context);
                                    }
                                  },
                                  child: value.isLoginLoading
                                      ? const Center(
                                          child: CircularProgressIndicator(color: Colors.white,),
                                        )
                                      : const CustomTextWidget(
                                          text: 'Login',
                                          color: Colors.white,
                                        )),
                            )),
                    const SizedBox(height: 30,),
                    TextButton(onPressed: (){
                      Navigator.pushNamed(context, AppRoutes.signUpView);
                    }, child: const CustomTextWidget(text: 'Don\'t have an account? SignUp'))
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
