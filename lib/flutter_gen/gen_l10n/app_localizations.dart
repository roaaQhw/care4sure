
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// The conventional newborn programmer greeting
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// A welcome message
  ///
  /// In en, this message translates to:
  /// **'Hello {username}'**
  String hello(String username);

  /// The log in
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get login1;

  /// The login
  ///
  /// In en, this message translates to:
  /// **'LOGIN'**
  String get login2;

  /// The email
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// The Password
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// The Register Now
  ///
  /// In en, this message translates to:
  /// **'Register Now'**
  String get registernow;

  /// The Sign Up
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signup;

  /// The location
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// The confirmpassword
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmpassword;

  /// No description provided for @medicine_reservation.
  ///
  /// In en, this message translates to:
  /// **'Medicine reservation'**
  String get medicine_reservation;

  /// The Username
  ///
  /// In en, this message translates to:
  /// **'Medicine show'**
  String get medicine_show;

  /// The Username
  ///
  /// In en, this message translates to:
  /// **'search for medicine'**
  String get search_for_medicine;

  /// The Username
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username1;

  /// pharmacies_that_contain_the_medicine
  ///
  /// In en, this message translates to:
  /// **'Pharmacies that contain the medicine'**
  String get pharmacies_that_contain_the_medicine;

  /// Area
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get area;

  /// City
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// Governorate
  ///
  /// In en, this message translates to:
  /// **'Governorate'**
  String get governorate;

  /// Street
  ///
  /// In en, this message translates to:
  /// **'Street'**
  String get street;

  /// username musn't be empty
  ///
  /// In en, this message translates to:
  /// **'Username musn\'t be empty'**
  String get user;

  /// The field must'nt remain empty
  ///
  /// In en, this message translates to:
  /// **'The field must\'nt remain empty'**
  String get empty;

  /// Password must be atleast 8 characters long
  ///
  /// In en, this message translates to:
  /// **'Password must be atleast 8 characters long'**
  String get pass;

  /// Picture of the prescription that contains the medicine
  ///
  /// In en, this message translates to:
  /// **'Picture of the prescription that contains the medicine'**
  String get prescription;

  /// Confirmation
  ///
  /// In en, this message translates to:
  /// **'Confirmation'**
  String get confirmation;

  /// All medicines
  ///
  /// In en, this message translates to:
  /// **'All medicines'**
  String get medicines;

  /// Profile
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// Drug Administration
  ///
  /// In en, this message translates to:
  /// **'Drug Administration'**
  String get drug;

  /// Sign out
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get signout;

  /// Full name
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullname;


}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
          'an issue with the localizations generation tool. Please file an issue '
          'on GitHub with a reproducible sample app and the gen-l10n configuration '
          'that was used.'
  );
}
