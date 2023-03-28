import 'package:banhawy/core/dio_helper/dio_helper.dart';
import 'package:banhawy/core/models/users_model/user_model.dart';
import 'package:banhawy/core/router/router.dart';
import 'package:banhawy/features/auth/login_screen/login_screen_view.dart';
import 'package:get_storage/get_storage.dart';




abstract class AppStorage {
  static final GetStorage _box = GetStorage();

  static Future<void> init() async => await GetStorage.init();

  static UserModel? get getUserInfo {
    UserModel? profileModel;
    if (_box.hasData('user')) {
      profileModel = UserModel.fromJson(_box.read('user'));
    }
    return profileModel;
  }
  static Future<void> saveAuthToken(String authToken) =>
      GetStorage().write('token', "Bearer $authToken");
  // static GoogleSignInAccount? get getGoogleInfo {
  //   GoogleSignInAccount? googleUser;
  //   if (_box.hasData('googleUser')) {
  //     googleUser = _box.read('googleUser');
  //   }
  //   return googleUser;
  // }

  static final socialData = {};

  static Future<void> cacheSocialData({
    String? email,
    String? name,
  }) async {
    socialData.addAll({
      'name': name,
      'email': email,
    });
    _box.write('googleUser', socialData);
  }

 // static bool get firstTime => getUserInfo!.token == null;

  static void saveFCMToken(String fcmToken) =>
      GetStorage().write('FCM', fcmToken);

  static String fcmToken() =>
      GetStorage().read('FCM') as String ?? "TEST_TOKEN";

  static bool get isLogged => getUserInfo != null ;

  static Future<void> cacheUserInfo(UserModel userModel) =>
      _box.write('user', userModel.toJson());

  static int? get getUserId => getUserInfo?.data?.id;

   static String? get getToken => getUserInfo?.token;
//
//   static User? get getUserData => getUserInfo?.data;

  /// to cache privacy model data///
  // static PrivacyAndAboutusModel? get getPrivacyAndAboutUsData {
  //   PrivacyAndAboutusModel? privacyAndAboutUsModel;
  //   if (_box.hasData('privacy')) {
  //     privacyAndAboutUsModel =
  //         PrivacyAndAboutusModel.fromJson(_box.read('privacy'));
  //   }
  //   return privacyAndAboutUsModel;
  // }

  // static Future<void> cachePrivacyAndAboutInfo(
  //     PrivacyAndAboutusModel privacyAndAboutUsModel) =>
  //     _box.write('privacy', privacyAndAboutUsModel.toJson());

  /// to cache states///

  static Future<void> cacheStates(List<String> states) =>
      _box.write('states', states);

  static List<String>? get getStatesTitle => _box.read('states');

  static Future<void> cacheCountryName(List<String> countryName) =>
      _box.write('countryName', countryName);

  static List<String>? get getCountryName => _box.read('countryName');

  // static Future<void> cacheCities(List<City> states) =>
  //     _box.write('cities', states);
  //
  // static List<City>? get getCities => _box.read('cities');
  //
  // static Future<void> cacheCountries(List<Country> countries) =>
  //     _box.write('countries', countries);
  //
  // static List<City>? get getCountries => _box.read('countries');
  //
  static Future<void> signOut() async {
    await _box.erase();
    MagicRouter.navigateAndPopAll( LoginScreenView());
  }

  static Future<void> fetchOnReview() async {
    final response = await DioHelper.post('core/review', true, body: {});
    final data = response.data as Map<String, dynamic>;
    print(data);
    await cacheOnReview(data['status']);
  }

  static Future<void> cacheOnReview(bool onReview) =>
      _box.write('onReview', onReview);

  static bool? get getOnReviewValue => _box.read('onReview');
}