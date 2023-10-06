import 'package:flutter/material.dart';
import 'package:iklin/Partner/auth/presentation/pages/partner_otp_verification_page.dart';
import 'package:iklin/Partner/auth/presentation/pages/partner_signup_page.dart';
import 'package:iklin/Partner/auth/presentation/pages/partner_signup_page2.dart';
import 'package:iklin/Partner/auth/presentation/pages/partner_signup_page3.dart';
import 'package:iklin/Partner/home/presentation.dart/drawerscreens/about_us/about_us_page.dart';
import 'package:iklin/Partner/home/presentation.dart/drawerscreens/about_us/contact_us_page.dart';
import 'package:iklin/Partner/home/presentation.dart/drawerscreens/notificatio_page.dart';
import 'package:iklin/Partner/home/presentation.dart/drawerscreens/profile_page.dart';
import 'package:iklin/Partner/home/presentation.dart/drawerscreens/settings/add_bank_page.dart';
import 'package:iklin/Partner/home/presentation.dart/drawerscreens/settings/manage_bank_page.dart';
import 'package:iklin/Partner/home/presentation.dart/drawerscreens/settings/settings_page.dart';
import 'package:iklin/Partner/home/presentation.dart/drawerscreens/settings/update_profile_page.dart';
import 'package:iklin/Partner/home/presentation.dart/drawerscreens/settings/updated_profile_page.dart';
import 'package:iklin/Partner/home/presentation.dart/pages/partner_home_navbar.dart';
import 'package:iklin/core/navigators/route_name.dart';
import 'package:iklin/features/auth/presentation/pages/complete_signup_page.dart';
import 'package:iklin/features/auth/presentation/pages/forgot_password.dart';
import 'package:iklin/features/auth/presentation/pages/lets_go_screen.dart';
import 'package:iklin/features/auth/presentation/pages/login_screen.dart';
import 'package:iklin/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:iklin/features/auth/presentation/pages/set_new_password_screen.dart';
import 'package:iklin/features/auth/presentation/pages/sign_up_page.dart';
import 'package:iklin/features/cleaning/presentation/pages/cleaner_page.dart';
import 'package:iklin/features/cleaning/presentation/pages/cleaner_personal_page.dart';
import 'package:iklin/features/cleaning/presentation/pages/cleaner_review_page.dart';
import 'package:iklin/features/cleaning/presentation/pages/cleaning_information.dart';
import 'package:iklin/features/cleaning/presentation/pages/cleaning_payment.dart';
import 'package:iklin/features/cleaning/presentation/pages/select_cleaning_type.dart';
import 'package:iklin/features/cleaning/presentation/pages/select_house_information.dart';
import 'package:iklin/features/error_pages/no_internet_error_page.dart';
import 'package:iklin/features/home/presentation/drawerscreen/profile/user_update_profile.dart';
import 'package:iklin/features/home/presentation/drawerscreen/referral/referral_page.dart';
import 'package:iklin/features/home/presentation/drawerscreen/referral/referral_performance_page.dart';
import 'package:iklin/features/home/presentation/pages/home_navbar.dart';
import 'package:iklin/features/home/presentation/pages/receipt_screen.dart';
import 'package:iklin/features/laundry/presentation/pages/all_review_page.dart';
import 'package:iklin/features/laundry/presentation/pages/basket_screen.dart';
import 'package:iklin/features/laundry/presentation/pages/create_basket.dart';
import 'package:iklin/features/laundry/presentation/pages/debit_screen.dart';
import 'package:iklin/features/laundry/presentation/pages/laundry_screen.dart';
import 'package:iklin/features/laundry/presentation/pages/payment_method_screen.dart';
import 'package:iklin/features/laundry/presentation/pages/select_laundry_man.dart';
import 'package:iklin/features/laundry/presentation/pages/select_pickup_date.dart';
import 'package:iklin/features/laundry/presentation/pages/selected_laundry_laundry_screen.dart';
import 'package:iklin/features/laundry/presentation/pages/track_order.dart';
import 'package:iklin/features/lets_go/presentation/pages/address_page.dart';
import 'package:iklin/features/lets_go/presentation/pages/set_location_screen.dart';
import 'package:iklin/features/onboarding/onboarding.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteName.splashScreen:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const SplashhScreen(),
      );
    case RouteName.onboardingScreen:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const OnboardingScreen(),
      );
    case RouteName.getStarted:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const GetStarted(),
      );
    case RouteName.loginScreen:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const LoginScreen(),
      );
    case RouteName.signUpScreen:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const SignUpScreen(),
      );
    case RouteName.otpVerification:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: OtpVerificationPage(
          params: settings.arguments as VerificationArgument,
        ),
      );
    case RouteName.partnerOtpVerificationPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const PartnerOtpVerificationPage(),
      );
    case RouteName.completeSignupPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const CompleteSignupPage(),
      );
    case RouteName.partnerSignupPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const PartnerSignupPage(),
      );
    case RouteName.partnerSignupPage2:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const PartnerSignupPage2(),
      );
    case RouteName.partnerSignupPage3:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const PartnerSignupPage3(),
      );
    case RouteName.letsGoScreen:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const LetsGoScreen(),
      );
    case RouteName.forgotPassword:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const ForgotPassword(),
      );
    case RouteName.setNewPassword:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const SetNewPassword(),
      );
    case RouteName.setLocationScreen:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const SetLocationScreen(),
      );
    case RouteName.addressPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const AddressPage(),
      );
    case RouteName.errorScreen:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const NoInternetPage(),
      );
    case RouteName.homeNav:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const HomveNavbar(),
      );
    case RouteName.partnerHomeNavbar:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const PartnerHomeNavbar(),
      );
    case RouteName.receiptScreen:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const ReceiptScreen(),
      );
    case RouteName.laundryScreen:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const LaundryScreen(),
      );
    case RouteName.selectLaundryMan:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const SelectLaundryMan(),
      );
    case RouteName.selectedLaundryPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const SelectedLandryScreen(),
      );

    case RouteName.allReviewPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const AllReviewPage(),
      );
    case RouteName.updateProfilePage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const UpdateProfilePage(),
      );
    case RouteName.contactUsPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const ContactUsPage(),
      );
    case RouteName.aboutUsPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const AboutUsPage(),
      );    
    case RouteName.updatedProfilePage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const UpdatedProfilePage(),
      );
    case RouteName.addBankPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const AddBankPage(),
      );  
     case RouteName.profilePage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const ProfilePage(),
      );  
     case RouteName.notificationPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const NotificationPage(),
      );        
    case RouteName.settingsPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const SettingsPage(),
      );  
    case RouteName.referralPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const ReferralPage(),
      );          
    case RouteName.manageBankPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const ManageBankPage(),
      );  
    case RouteName.referralPerformancePage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const ReferralPerformancePage(),
      );
     case RouteName.userUpdateProfile:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const UserUpdateProfile(),
      );         
    case RouteName.createBasket:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const CreateBasket(),
      );
    case RouteName.basketScreen:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const BasketScreen(),
      );
    case RouteName.selectPickupDate:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const SelectPickupDate(),
      );
    case RouteName.paymentMethod:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const PaymentMethodScreen(),
      );
    case RouteName.debitCardScreen:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const DebitCardScreen(),
      );
    case RouteName.orderTracking:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const TrackOrder(),
      );
    case RouteName.selectCleaningType:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const SelectCleanningType(),
      );
    case RouteName.cleanersScreen:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const CleanerPage(),
      );
    case RouteName.cleanerPersonalPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const CleanerPersonalPage(),
      );
    case RouteName.cleanerReviewPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const CleanerReviewPage(),
      );
    case RouteName.selectHouseInfo:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const SelectHouseInformationn(),
      );
    case RouteName.cleaningInnformation:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const CleaningInformation(),
      );
    case RouteName.cleaningPayment:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const CleaningPayment(),
      );
    default:
      return MaterialPageRoute<void>(
        builder: (_) => Scaffold(
          body: Center(
            child: Text(
              'No route defined for ${settings.name}',
            ),
          ),
        ),
      );
  }
}

PageRoute _getPageRoute({String? routeName, Widget? viewToShow}) {
  return MaterialPageRoute<void>(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow!,
  );
}
