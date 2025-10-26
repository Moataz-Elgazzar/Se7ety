import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/components/buttons/main_button_custom.dart';
import 'package:se7ety/core/constants/app_images.dart';
import 'package:se7ety/core/routes/navigator.dart';
import 'package:se7ety/core/routes/routes.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.welcomePng, width: double.infinity, height: double.infinity, fit: BoxFit.cover),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 2),
                  Text('اهلا بيك', style: TextStyles.boldStyle(color: AppColors.primaryColor, fontSize: 30)),
                  Gap(15),
                  Text('سجل و احجز عند دكتورك وانت فالبيت', style: TextStyles.regularStyle(fontSize: 18)),
                  Spacer(flex: 5),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: AppColors.primaryColor.withValues(alpha: 0.3), borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Gap(10),
                          Text('سجل دلوقتي كـ', style: TextStyles.semiBoldStyle(color: AppColors.wightColor, fontSize: 18)),
                          Gap(50),
                          MainButtonCustom(
                            title: 'دكتور',
                            backgroundColor: Colors.lightBlue[100],
                            textColor: AppColors.darkColor,
                            onPressed: () {
                              pushWithReplacement(context, Routes.login, extra: true);
                            },
                          ),
                          Gap(20),
                          MainButtonCustom(
                            title: 'مريض',
                            backgroundColor: Colors.lightBlue[100],
                            textColor: AppColors.darkColor,
                            onPressed: () {
                              pushWithReplacement(context, Routes.login, extra: false);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(flex: 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
