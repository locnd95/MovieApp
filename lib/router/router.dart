import 'package:flutter/material.dart';
import 'package:movie_app/page/all_detail_content_image/all_detail_content_image_page.dart';
import 'package:movie_app/page/all_videos_content_page/all_videos_content_page.dart';
import 'package:movie_app/page/booking_date_time_of_moive_page/booking_date_time_of_moive_page.dart';
import 'package:movie_app/page/booking_movie_seat_page/booking_movie_seat_page.dart';
import 'package:movie_app/page/card_memmber/card_memmber.dart';
import 'package:movie_app/page/change_password_page/change_password_page.dart';
import 'package:movie_app/page/cine_channel_page/cine_channel_page.dart';
import 'package:movie_app/page/circle_content_page/circle_content_page.dart';
import 'package:movie_app/page/confirm_pasword_to_show_user/confirm_pasword_to_show_user.dart';
import 'package:movie_app/page/detail_content_image/detail_content_image_page.dart';
import 'package:movie_app/page/enter_verification_code_page/enter_verification_code_page.dart';
import 'package:movie_app/page/forgot_password_page/forgot_password_page.dart';
import 'package:movie_app/page/gift_voucher_coupon/gift_voucher_coupon.dart';
import 'package:movie_app/page/history_deal/history_deal.dart';
import 'package:movie_app/page/home_screeen_page/home_screeen_page.dart';
import 'package:movie_app/page/imax_4dx_page/imax_4dx_page.dart';
import 'package:movie_app/page/infor_user_page/infor_user_page.dart';
import 'package:movie_app/page/login_page/login_page.dart';
import 'package:movie_app/page/member_page/member_page.dart';
import 'package:movie_app/page/move_page/movie_page.dart';
import 'package:movie_app/page/movie_online_page/movie_online_page.dart';
import 'package:movie_app/page/my_ticket/my_ticket.dart';
import 'package:movie_app/page/point_cgv_page/point_cgv_page.dart';
import 'package:movie_app/page/setting_password_payment/setting_password_payment.dart';
import 'package:movie_app/page/signup_page/sign_up_page.dart';
import 'package:movie_app/page/splass_screen/splass_screen_page.dart';
import 'package:movie_app/page/term_of_use_page/term_of_use_page.dart';
import 'package:movie_app/page/test_page/test_page.dart';
import '../page/discount_member_page/discount_for_member_page.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterName.splassScreen:
        return MaterialPageRoute(builder: (context) => const SplassScren());
      case RouterName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RouterName.discountForMember:
        return MaterialPageRoute(
            builder: (context) => const DiscountForMember());
      case RouterName.loginPage:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case RouterName.signUpPage:
        return MaterialPageRoute(builder: (context) => const SignUpPage());
      case RouterName.forgotPasswordPage:
        return MaterialPageRoute(
            builder: (context) => const ForgotPasswordPage());
      case RouterName.testPage:
        return MaterialPageRoute(builder: (context) => const TestPage());
      case RouterName.enterVerificationCodePage:
        return MaterialPageRoute(
            builder: (context) => const EnterVerificationCode());
      case RouterName.detailContentImage:
        return MaterialPageRoute(
            builder: (context) => const DetailContentImage(),
            settings: settings);
      case RouterName.imax4DX:
        return MaterialPageRoute(
            builder: (context) => const Imax4DX(), settings: settings);
      case RouterName.movie:
        return MaterialPageRoute(
            builder: (context) => const Movie(), settings: settings);
      case RouterName.movieOnline:
        return MaterialPageRoute(
            builder: (context) => const MovieOnline(), settings: settings);
      case RouterName.allDetailContentImage:
        return MaterialPageRoute(
            builder: (context) => const AllDetailContentImage(),
            settings: settings);
      case RouterName.allVideosContents:
        return MaterialPageRoute(
            builder: (context) => const AllVideosContents(),
            settings: settings);
      case RouterName.cineChannel:
        return MaterialPageRoute(
            builder: (context) => const CineChannel(), settings: settings);
      case RouterName.circleContent:
        return MaterialPageRoute(
            builder: (context) => const CircleContent(), settings: settings);
      case RouterName.termOfUse:
        return MaterialPageRoute(
            builder: (context) => const TermOfUse(), settings: settings);
      case RouterName.bookingMovieChair:
        return MaterialPageRoute(
            builder: (context) => const BookingMovieSeat(), settings: settings);
      case RouterName.bookingDateTimeOfMovie:
        return MaterialPageRoute(
            builder: (context) => const BookingDateTimeOfMovie(),
            settings: settings);
      case RouterName.memberPage:
        return MaterialPageRoute(
          builder: (context) => const MemberPage(),
        );
      case RouterName.confirmPasswordToShowUser:
        return MaterialPageRoute(
          builder: (context) => const ConfirmPasswordToShowUser(),
        );
      case RouterName.inforUserPage:
        return MaterialPageRoute(
          builder: (context) => const InforUserPage(),
        );
      case RouterName.changePasswordPage:
        return MaterialPageRoute(
          builder: (context) => const ChangePasswordPage(),
        );
      case RouterName.cardMember:
        return MaterialPageRoute(
          builder: (context) => const CardMember(),
        );
      case RouterName.poitnCGVPage:
        return MaterialPageRoute(
          builder: (context) => const PoitnCGVPage(),
        );
      case RouterName.giftVoucherCoupon:
        return MaterialPageRoute(
          builder: (context) => const GiftVoucherCoupon(),
        );
      case RouterName.settingPasswordPayment:
        return MaterialPageRoute(
          builder: (context) => const SettingPasswordPayment(),
        );
      case RouterName.historyDeal:
        return MaterialPageRoute(
          builder: (context) => const HistoryDeal(),
        );
      case RouterName.myTicket:
        return MaterialPageRoute(
          builder: (context) => const MyTicket(),
        );
    }
    return null;
  }
}

class RouterName {
  static const splassScreen = "/splassScreen";
  static const homeScreen = "/homeScreen";
  static const discountForMember = "/discountForMember";
  static const loginPage = "/loginPage";
  static const signUpPage = "/signUpPage";
  static const forgotPasswordPage = "/forgotPasswordPage";
  static const testPage = "/testPage";
  static const enterVerificationCodePage = "/enterVerificationCodePage";
  static const detailContentImage = "/detailContentImage";
  static const imax4DX = "/imax4DX";
  static const movie = "/movie";
  static const movieOnline = "/movieOnline";
  static const allDetailContentImage = "/allDetailContentImage";
  static const allVideosContents = "/allVideosContents";
  static const termOfUse = "/termOfUse";
  static const circleContent = "/circleContent";
  static const cineChannel = "/cineChannel";
  static const bookingMovieChair = "/bookingMovieChair";
  static const bookingDateTimeOfMovie = "/bookingDateTimeOfMovie";
  static const memberPage = "/memberPage";
  static const confirmPasswordToShowUser = "/confirmPasswordToShowUser";
  static const inforUserPage = "/inforUser";
  static const changePasswordPage = "/changePasswordPage";
  static const settingPasswordPayment = "/settingPasswordPayment";
  static const cardMember = "/cardMember";
  static const poitnCGVPage = "/poitnCGVPage";
  static const giftVoucherCoupon = "/giftVoucherCoupon";
  static const historyDeal = "/historyDeal";
  static const myTicket = "/myTicket";
}
