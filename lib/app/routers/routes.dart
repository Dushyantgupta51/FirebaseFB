import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked_annotations.dart';
import '../../Johannes_Milke/ForgotPass_page/Forgot_view.dart';
import '../../Johannes_Milke/Home_page/Chat_room.dart';
import '../../Johannes_Milke/Home_page/Home_view.dart';
import '../../Johannes_Milke/Home_page/Select.dart';
import '../../Johannes_Milke/Login_page/Login_view.dart';
import '../../Johannes_Milke/Phone_verification_page/phoneVer_view.dart';
import '../../Johannes_Milke/SignUp_page/SignUp_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: LoginScreen),
    MaterialRoute(page: HomePage),
    MaterialRoute(page: ForgotPass),
    MaterialRoute(page: SignUpScreen),
    MaterialRoute(page: PhoneScreen),
    MaterialRoute(page: ChatHere),
    MaterialRoute(page: Select, initial: true),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
)
class $Router {}
