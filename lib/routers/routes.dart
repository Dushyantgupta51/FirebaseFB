import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked_annotations.dart';

import '../FB/ForgotPass_page/Forgot_view.dart';
import '../FB/Home_page/Chat_room.dart';

import '../FB/Home_page/Home_view.dart';
import '../FB/Home_page/Select.dart';
import '../FB/Login_page/Login_view.dart';
import '../FB/Phone_verification_page/phoneVer_view.dart';
import '../FB/SignUp_page/SignUp_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: LoginScreen),
    MaterialRoute(page: HomePage),
    MaterialRoute(page: ForgotPass),
    MaterialRoute(page: SignUpScreen),
    MaterialRoute(page: PhoneScreen),
    MaterialRoute(page: ChatHere),
    MaterialRoute(page: Select),
    
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
)
class $Router {}
