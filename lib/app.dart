import 'package:flutter/material.dart';
import 'package:movie_app/page/booking_date_time_of_moive_page/booking_date_time_of_moive_page.dart';
import 'package:movie_app/page/booking_movie_seat_page/booking_movie_seat_page.dart';
import 'package:movie_app/router/router.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Calculator>(
          create: (context) => Calculator(),
        ),
        ChangeNotifierProvider<CheckLogin>(create: (context) => CheckLogin()),
        ChangeNotifierProvider<YourTiket>(create: (context) => YourTiket()),
        ChangeNotifierProvider<SetIdFirm>(create: (context) => SetIdFirm()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          theme: ThemeData(primarySwatch: Colors.red),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: RouterName.splassScreen,
        ),
      ),
    );
  }
}

class CheckLogin extends ChangeNotifier {
  bool check = false;
  void login() {
    check = true;
    notifyListeners();
  }

  void logOut() {
    check = false;
    notifyListeners();
  }
}
