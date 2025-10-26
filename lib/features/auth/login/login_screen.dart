import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/components/buttons/main_button_custom.dart';
import 'package:se7ety/components/inputs/custome_password.dart';
import 'package:se7ety/components/inputs/custome_text_form_field%20copy.dart';
import 'package:se7ety/core/constants/app_images.dart';
import 'package:se7ety/core/functions/validation.dart';
import 'package:se7ety/core/routes/navigator.dart';
import 'package:se7ety/core/routes/routes.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.isDoctor});

  final bool isDoctor;

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logoPng, height: 250, width: 250),
                  Text('ثروتك الاولى احجز الان', style: TextStyles.semiBoldStyle(color: AppColors.greenColor, fontSize: 20)),
                  Gap(40),
                  Text(isDoctor ? 'سجل دخول الان كـ"دكتور"' : 'سجل دخول الان كـ"مريض"', style: TextStyles.semiBoldStyle(color: AppColors.primaryColor, fontSize: 20)),
                  Gap(30),
                  CustomeTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'ادخل البريد الالكتروني';
                      } else if (!validationEmail(value)) {
                        return 'ادخل بريد الكتروني صحيح';
                      }
                      return null;
                    },
                    color: AppColors.greyColor.withValues(alpha: 2.0),
                    hintText: 'ادخل البريد الالكتروني',
                    prefixIcon: Icon(Icons.mail, color: AppColors.primaryColor),
                    controller: emailController,
                  ),
                  Gap(20),
                  CustomePassword(
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'ادخل كلمه السر';
                      } else if (!validationPassword(value)) {
                        return 'ادخل كلمه سر صحيحه';
                      }

                      return null;
                    },
                  ),
                  Gap(5),
                  Align(
                    alignment: AlignmentGeometry.centerRight,
                    child: TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
                      onPressed: () {},
                      child: Text('نسيت كلمة السر؟', style: TextStyles.regularStyle(color: AppColors.darkColor, fontSize: 15)),
                    ),
                  ),
                  MainButtonCustom(
                    title: 'تسجيل الدخول',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (isDoctor == true) {
                          pushWithReplacement(context, Routes.registerComplete);
                        }
                        return null;
                      }
                    },
                    backgroundColor: AppColors.primaryColor,
                    textColor: AppColors.wightColor,
                    height: 55,
                  ),
                  Gap(50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('ليس لدي حساب؟', style: TextStyles.semiBoldStyle(color: AppColors.darkColor, fontSize: 15)),
                      TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
                        onPressed: () {
                          pushWithReplacement(context, Routes.register, extra: isDoctor);
                        },
                        child: Text('سجل الان', style: TextStyles.semiBoldStyle(color: AppColors.primaryColor, fontSize: 15)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
