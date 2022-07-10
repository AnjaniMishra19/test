import 'package:sahash/routes/route_name.dart';
import 'package:sahash/screen/authentication_page_setting.dart';
import 'package:sahash/screen/add_new_product.dart';
import 'package:sahash/screen/balance.dart';
import 'package:sahash/screen/customer.dart';
import 'package:sahash/screen/dashboard_controller.dart';
import 'package:sahash/screen/forget_password.dart';
import 'package:sahash/screen/language_page.dart';
import 'package:sahash/screen/login_page.dart';
import 'package:sahash/screen/low_stock_product.dart';
import 'package:sahash/screen/main_gradient.dart';
import 'package:sahash/screen/multiple_selection_table.dart';
import 'package:sahash/screen/order_page.dart';
import 'package:sahash/screen/pagination_table.dart';
import 'package:sahash/screen/phone_verification.dart';
import 'package:sahash/screen/products.dart';
import 'package:sahash/screen/qr_code_scan_page.dart';
import 'package:sahash/screen/ratings.dart';
import 'package:sahash/screen/registration_page.dart';
import 'package:sahash/screen/setting_page.dart';
import 'package:sahash/screen/sold_out.dart';
import 'package:sahash/screen/splash_screen.dart';
import 'package:sahash/screen/under_construction_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../customWidgets/no_internet.dart';
import '../networking/connectivity_provider.dart';

class CustomRoute {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      final isOnline = Provider.of<ConnectivityProvider>(context).isOnline;

      if (isOnline != null && !isOnline) {
        return const NoInternet();
      }

      return otherRoutes(settings.name, settings.arguments);
    });
  }

  static dynamic otherRoutes(String routeName, Object args) {
    switch (routeName) {
      case RouteName.splashScreen:
        return const SplashScreen();
      case RouteName.noInternet:
        return const NoInternet();
      case RouteName.loginPage:
        return const LoginPage();
      case RouteName.registrationPage:
        return const RegistrationPage();
      case RouteName.forgetPassword:
        return const ForgetPassword();
      case RouteName.settingPage:
        int selectedId = args as int;
        return SettingPage(selectedId: selectedId);
      case RouteName.languagePage:
        return const LanguagePage();
      case RouteName.authenticationPageSetting:
        String page = args as String;
        return AuthenticationPageSettings(page);
      case RouteName.underConstruction:
        return const UnderConstructionPage();
      case RouteName.addNewProduct:
        return const AddNewProduct();
      case RouteName.qrCodeScan:
        return const QRCodePage();
      case RouteName.orderPage:
        return const OrderPage();
      case RouteName.productPage:
        return const Products();
      case RouteName.soldOut:
        return const ExampleDragAndDrop();
      case RouteName.balance:
        return const BalanceInformation();
      case RouteName.customer:
        return const CustomerScreen();
      case RouteName.lowStock:
        return const LowStockProduct();
      case RouteName.ratings:
        return const Rating();
      case RouteName.dashboard:
        int selectedId = args as int;
        return DashboardContoller(selectedId: selectedId);
      case RouteName.gradient:
        return const MainGradient();
      case RouteName.multiple:
        return const MultipleSelectionTable();
      case RouteName.paginationtable:
        return const PaginationTable();
      case RouteName.phoneVerification:
        String phoneno = args as String;
        return PhoneVerification(phoneno: phoneno);
    }
  }
}
