
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projects_flutter/screens/splash_screen.dart';
import 'constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VisualDensity.adaptivePlatformDensity;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return  MediaQuery(
      data: const MediaQueryData(
      ),
      child:ScreenUtilInit(
        designSize: const Size (428,926),
        builder :()=>   GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(backgroundColor:K.blackColor),
            // scaffoldBackgroundColor:K.secondaryColor,
          ),
          home: SplashScreen(),
        ),
      ),
    );
  }
}
