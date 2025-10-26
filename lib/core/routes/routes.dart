import 'package:go_router/go_router.dart';
import 'package:se7ety/features/auth/login/login_screen.dart';
import 'package:se7ety/features/auth/register/register_complete_screen.dart';
import 'package:se7ety/features/auth/register/register_screen.dart';
import 'package:se7ety/features/splash/splash_screen.dart';
import 'package:se7ety/features/welcome/welcome_screen.dart';

class Routes {
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String registerComplete = '/registerComplete';

  static GoRouter route = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => SplashScreen()),
      GoRoute(path: welcome, builder: (context, state) => WelcomeScreen()),
      GoRoute(
        path: login,
        builder: (context, state) {
          final isDoctor = state.extra as bool? ?? false;
          return LoginScreen(isDoctor: isDoctor);
        },
      ),
      GoRoute(
        path: register,
        builder: (context, state) {
          final isDoctor = state.extra as bool? ?? false;
          return RegisterScreen(isDoctor: isDoctor);
        },
      ),
      GoRoute(path: registerComplete, builder: (context, state) => RegisterCompleteScreen()),
    ],
  );
}
