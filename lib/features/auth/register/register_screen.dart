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

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key, required this.isDoctor});

  final bool isDoctor;

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final nameController = TextEditingController();
    final passwordController = TextEditingController();
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
                  Gap(20),
                  Text(isDoctor ? 'سجل حساب جديد كـ"دكتور"' : 'سجل حساب جديد كـ"مريض"', style: TextStyles.semiBoldStyle(color: AppColors.primaryColor, fontSize: 20)),
                  Gap(10),
                  CustomeTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'ادخل الاسم';
                      } else if (!validationUserName(value)) {
                        return 'ادخل الاسم صحيح';
                      }
                      return null;
                    },
                    color: AppColors.greyColor.withValues(alpha: 2.0),
                    hintText: 'الاسم',
                    prefixIcon: Icon(Icons.person, color: AppColors.primaryColor),
                    controller: nameController,
                  ),
                  Gap(10),
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
                  Gap(10),
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
                    title: 'تسجيل حساب',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                    },
                    backgroundColor: AppColors.primaryColor,
                    textColor: AppColors.wightColor,
                    height: 55,
                  ),
                  Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('لدي حساب؟', style: TextStyles.semiBoldStyle(color: AppColors.darkColor, fontSize: 15)),
                      TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
                        onPressed: () {
                          pushWithReplacement(context, Routes.login, extra: isDoctor);
                        },
                        child: Text('سجل دخول', style: TextStyles.semiBoldStyle(color: AppColors.primaryColor, fontSize: 15)),
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
