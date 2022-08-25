


import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String hello(String username) {
    return 'Hello $username';
  }

  @override
  String get login1 => 'Log In';

  @override
  String get login2 => 'LOGIN';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get registernow => 'Register Now';

  @override
  String get signup => 'Sign Up';

  @override
  String get location => 'Location';

  @override
  String get confirmpassword => 'Confirm Password';

  @override
  String get medicine_reservation => 'Medicine reservation';

  @override
  String get medicine_show => 'Medicine show';

  @override
  String get search_for_medicine => 'search for medicine';

  @override
  String get username1 => 'Username';

  @override
  String get pharmacies_that_contain_the_medicine => 'Pharmacies that contain the medicine';

  @override
  String get area => 'Area';

  @override
  String get city => 'City';

  @override
  String get governorate => 'Governorate';

  @override
  String get street => 'Street';

  @override
  String get user => 'Username musn\'t be empty';

  @override
  String get empty => 'The field must\'nt remain empty';

  @override
  String get pass => 'Password must be atleast 8 characters long';

  @override
  String get prescription => 'Picture of the prescription that contains the medicine';

  @override
  String get confirmation => 'Confirmation';

  @override
  String get medicines => 'All medicines';

  @override
  String get profile => 'Profile';

  @override
  String get drug => 'Drug Administration';

  @override
  String get signout => 'Sign out';

  @override
  String get fullname => 'Full name';
}
