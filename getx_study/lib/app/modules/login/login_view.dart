import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:getx_study/app/modules/login/login_controller.dart';
import 'package:getx_study/app/utils/widgets/alredy_have_account.dart';
import 'package:getx_study/app/utils/widgets/background.dart';
import 'package:getx_study/app/utils/widgets/loading.dart';
import 'package:getx_study/app/utils/widgets/rounded_button.dart';
import 'package:getx_study/app/utils/widgets/rounded_input_field.dart';
import 'package:getx_study/app/utils/widgets/rounded_input_password.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Get.theme.hintColor,
        ),
        title: Text(
          'Voltar',
          style: TextStyle(
            color: Get.theme.hintColor,
          ),
        ),
      ),
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formLoginKey,
            child: Column(
              children: <Widget>[
                const Text(
                  "ENTRAR",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: Get.height * 0.03),
                SvgPicture.asset(
                  "assets/login.svg",
                  height: Get.height * 0.35,
                ),
                SizedBox(height: Get.height * 0.03),
                GetBuilder<LoginController>(
                  id: 'inputUsername',
                  builder: (_) {
                    return RoundedInputField(
                      hintText: 'Usuário',
                      controller: controller.usernameController,
                      onChanged: (value) {},
                      error: _.usernameEmpty,
                      errorMessage: _.textFieldEmpty,
                    );
                  },
                ),
                SizedBox(height: Get.height * 0.01),
                GetBuilder<LoginController>(
                  id: 'inputPassword',
                  builder: (_) {
                    return RoundedPasswordField(
                      error: _.passwordEmpty,
                      errorMesage: _.textFieldEmpty,
                      controller: _.passwordController,
                      showPassword: _.showPassword,
                      changeShowPassword: () =>
                          _.showPassword = _.statePassword(),
                      onChanged: (value) {},
                    );
                  },
                ),
                GetBuilder<LoginController>(
                  id: 'loadingLogin',
                  builder: (_) {
                    if (!_.loadingLogin) {
                      return RoundedButton(
                          text: "ENTRAR", press: () => _.login());
                    }
                    return const LoadingButton();
                  },
                ),
                SizedBox(height: Get.height * 0.10),
                AlreadyHaveAnAccountCheck(
                  press: () => Get.toNamed('/signup'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
