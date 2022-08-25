


import 'app_localizations.dart';

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get helloWorld => 'مرحبا بالعالم';

  @override
  String hello(String username) {
    return 'مرحبا $username';
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
  String get medicine_reservation => 'حجز دواء';

  @override
  String get medicine_show => 'عرض دواء';

  @override
  String get search_for_medicine => 'البحث عن دواء';

  @override
  String get username1 => 'Username';

  @override
  String get pharmacies_that_contain_the_medicine => 'الصيدليات التي تحتوي على الدواء';

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
  String get confirmation => 'تاكيد';

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
