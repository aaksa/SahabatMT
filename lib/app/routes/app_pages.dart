import 'package:get/get.dart';

import '../modules/account/bindings/account_binding.dart';
import '../modules/account/views/account_view.dart';
import '../modules/article/bindings/article_binding.dart';
import '../modules/article/views/article_view.dart';
import '../modules/bottom_nav_bar/bindings/bottom_nav_bar_binding.dart';
import '../modules/bottom_nav_bar/views/bottom_nav_bar_view.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/itemdetailsscreen/bindings/itemdetailsscreen_binding.dart';
import '../modules/itemdetailsscreen/views/itemdetailsscreen_view.dart';
import '../modules/jasa/bindings/jasa_binding.dart';
import '../modules/jasa/views/jasa_view.dart';
import '../modules/latestlayanan/bindings/latestlayanan_binding.dart';
import '../modules/latestlayanan/views/latestlayanan_view.dart';
import '../modules/latestproduct/bindings/latestproduct_binding.dart';
import '../modules/latestproduct/views/latestproduct_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/market/bindings/market_binding.dart';
import '../modules/market/views/market_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/productdetail/bindings/productdetail_binding.dart';
import '../modules/productdetail/views/productdetail_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/upload/bindings/upload_binding.dart';
import '../modules/upload/views/upload_view.dart';
import '../modules/wishlist/bindings/wishlist_binding.dart';
import '../modules/wishlist/views/wishlist_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAV_BAR,
      page: () => const BottomNavBarView(),
      binding: BottomNavBarBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTDETAIL,
      page: () => const ProductdetailView(),
      binding: ProductdetailBinding(),
    ),
    GetPage(
      name: _Paths.LATESTPRODUCT,
      page: () => const LatestproductView(),
      binding: LatestproductBinding(),
    ),
    GetPage(
      name: _Paths.JASA,
      page: () => const JasaView(),
      binding: JasaBinding(),
    ),
    GetPage(
      name: _Paths.MARKET,
      page: () => const MarketView(),
      binding: MarketBinding(),
    ),
    GetPage(
      name: _Paths.LATESTLAYANAN,
      page: () => const LatestlayananView(),
      binding: LatestlayananBinding(),
    ),
    GetPage(
      name: _Paths.WISHLIST,
      page: () => const WishlistView(),
      binding: WishlistBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => AccountView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD,
      page: () => UploadView(),
      binding: UploadBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.ITEMDETAILSSCREEN,
      page: () => ItemDetailsScreen(),
      binding: ItemdetailsscreenBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLE,
      page: () => ArticleView(),
      binding: ArticleBinding(),
    ),
  ];
}
