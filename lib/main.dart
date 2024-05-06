import 'package:doctorproject/7doctor/cubit/cubit.dart';
import 'package:doctorproject/7doctor/homescreen/homescreen.dart';
import 'package:doctorproject/7doctor/moduels/chatModel/chatScreen.dart';
import 'package:doctorproject/7doctor/moduels/loginmodel/logincubit/cubit.dart';
import 'package:doctorproject/7doctor/moduels/loginmodel/loginscreen.dart';
import 'package:doctorproject/7doctor/moduels/registermodel/registercubit/cubit.dart';
import 'package:doctorproject/7doctor/moduels/registermodel/registerscreen.dart';
import 'package:doctorproject/7doctor/moduels/settingmodel/settingScreen.dart';
import 'package:doctorproject/7doctor/onBoarding/onBoarding.dart';
import 'package:doctorproject/firebase_options.dart';
import 'package:doctorproject/shared/constants/blocobserver.dart';
import 'package:doctorproject/shared/constants/constants.dart';
import 'package:doctorproject/shared/shared_preferense/sharedPreferense.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'map_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // var token=await FirebaseMessaging.instance.getToken();
  // print(token);
  // FirebaseMessaging.onMessage.listen((event) {
  //   print(event.data.toString());
  // });
  await SharedHelper.init();
  Bloc.observer=MyBlocObserver();
  Widget widget=OnBoardingScreen();
  dynamic isOnBoard=SharedHelper.getData(key: 'onBoard');
  uid=SharedHelper.getData(key: 'uid');
  role=SharedHelper.getData(key: 'role');
  //SharedHelper.RemoveData(key: 'onBoard');
  //SharedHelper.RemoveData(key: 'role');
  //SharedHelper.RemoveData(key: 'uid');
  // selectedRole=SharedHelper.getData(key: 'role');
 // print(selectedRole);
  print(uid);
  print(isOnBoard);
  print(role);
   if(isOnBoard!=null){
     if(uid!=null) {
       widget = HomeScreen();
     }
     else
       widget=LoginScreen();
   }
   else
     {
       widget=OnBoardingScreen();
     }
  runApp(MyApp(
    onBoardScreen: isOnBoard,
    StartWidget: widget,
  ));
}
class MyApp extends StatelessWidget{
  dynamic onBoardScreen;
  Widget ?StartWidget;
  MyApp({
    bool ?onBoardScreen,
    Widget ?StartWidget
}){
    this.onBoardScreen=onBoardScreen;
    this.StartWidget=StartWidget;

  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>DoctorCubit()..getUserData()),
        BlocProvider(create: (BuildContext context)=>LoginCubit()),


      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
            appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.blue,

                ),
                centerTitle: true,
                color: Colors.blue,
                elevation: 0,
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                )
            ),
            textTheme: TextTheme(
                titleLarge: TextStyle(
                    color: Colors.white
                ),
                titleSmall: TextStyle(
                    color: Colors.white
                )
            ),
            fontFamily: 'Janna',
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.blue,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white,
            )
        ),
        home:StartWidget,
        debugShowCheckedModeBanner: false,
      ),
    );
  }

}

