import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'jab9mbrk': {
      'en': 'Button',
      'ar': '',
    },
    '0tm8xm45': {
      'en': 'Offers',
      'ar': '',
    },
    'kf65c4ri': {
      'en': 'Open',
      'ar': '',
    },
    'om6qd6k2': {
      'en': 'SAR',
      'ar': '',
    },
    'y1zlhdc7': {
      'en': 'Parking',
      'ar': '',
    },
    'voj7ni24': {
      'en': 'settings',
      'ar': '',
    },
    'h2164gv6': {
      'en': 'Settings',
      'ar': '',
    },
    'w6l3uevo': {
      'en': 'My Account',
      'ar': '',
    },
    'tlax35da': {
      'en': 'Send Feedback',
      'ar': '',
    },
    'ggp1vpe6': {
      'en': 'Privacy Policy',
      'ar': '',
    },
    'yv47klky': {
      'en': 'Light Mode',
      'ar': '',
    },
    'j9kw6scp': {
      'en': 'Dark Mode',
      'ar': '',
    },
    '27qdvf43': {
      'en': 'Help&Support',
      'ar': '',
    },
    'ytpn9f8x': {
      'en': 'About Us',
      'ar': '',
    },
    'wxx41bnk': {
      'en': 'Log Out',
      'ar': '',
    },
    '9pjdoey2': {
      'en': 'Version 1.2.3',
      'ar': '',
    },
    '0821rw8u': {
      'en': 'Stores',
      'ar': '',
    },
    '9xhyv7i2': {
      'en': 'TAYSIR',
      'ar': '',
    },
    'jgmybtsk': {
      'en': 'Home',
      'ar': '',
    },
  },
  // welcomepage
  {
    'jwirhlzn': {
      'en': 'Welcome To TAYSIR',
      'ar': '',
    },
    '40gp2re1': {
      'en': 'Sign Up',
      'ar': '',
    },
    '94ij2vbb': {
      'en': 'Sign In',
      'ar': '',
    },
    'mrj58qqo': {
      'en': 'Home',
      'ar': '',
    },
  },
  // UserFeedbackPage
  {
    '8hqplyhg': {
      'en': 'Back',
      'ar': '',
    },
    'xhq99ac3': {
      'en': 'Add Your Store',
      'ar': '',
    },
    'l8pg4uta': {
      'en': 'We\'d love your feedback!',
      'ar': '',
    },
    '0nlxvaas': {
      'en': 'Fill out the form below ',
      'ar': '',
    },
    '4i0506tk': {
      'en': 'Type of Issue',
      'ar': '',
    },
    'gk2potgb': {
      'en': 'Search...',
      'ar': '',
    },
    'silchyt0': {
      'en': '',
      'ar': '',
    },
    'p9i3dszx': {
      'en': '',
      'ar': '',
    },
    'g7ucq7bz': {
      'en': 'App Error',
      'ar': '',
    },
    'ax0jwwes': {
      'en': 'Other',
      'ar': '',
    },
    '4ub8skng': {
      'en': 'Write your feedback here...',
      'ar': '',
    },
    'i9be793o': {
      'en': 'Submit Feedback',
      'ar': '',
    },
    'xmih8lpa': {
      'en': 'Home',
      'ar': '',
    },
  },
  // report
  {
    '46ztr0qj': {
      'en': 'Report an Accessibility Issue ',
      'ar': '',
    },
    'dp8up6c4': {
      'en': 'Fill out the form below ',
      'ar': '',
    },
    'aychjt6i': {
      'en': 'Select...',
      'ar': '',
    },
    'yz1ycy26': {
      'en': 'Search...',
      'ar': '',
    },
    'ppx42i30': {
      'en': 'Parking Issue',
      'ar': '',
    },
    '7rg63ha5': {
      'en': 'Pathway Issue',
      'ar': '',
    },
    '90gf2zyp': {
      'en': 'Store issue',
      'ar': '',
    },
    '2eqnno05': {
      'en': 'Description..',
      'ar': '',
    },
    'h0py0xbx': {
      'en': 'Select Location',
      'ar': '',
    },
    '5l81wb2z': {
      'en': 'Attach Photo Evidence',
      'ar': '',
    },
    'lq8l6sf0': {
      'en': 'Submit Report \t',
      'ar': '',
    },
    's57sx966': {
      'en': 'Home',
      'ar': '',
    },
  },
  // VendorAddStorePage
  {
    '18nvzjaz': {
      'en': 'Back',
      'ar': '',
    },
    '3ua8so3f': {
      'en': 'Add Your Store',
      'ar': '',
    },
    'yxb9uonq': {
      'en': 'Store Name\t',
      'ar': '',
    },
    '2myiks71': {
      'en': 'Store Description\t',
      'ar': '',
    },
    '1e1ekay3': {
      'en': 'Phone',
      'ar': '',
    },
    'ip9hhuyy': {
      'en': 'Email',
      'ar': '',
    },
    '72kgr7d5': {
      'en': 'Add Photo',
      'ar': '',
    },
    'itukvzqh': {
      'en': 'Accessibility Services & Standards',
      'ar': '',
    },
    'fv6yx2rh': {
      'en': 'Dedicated Parking Available\t',
      'ar': '',
    },
    'recllvuf': {
      'en': 'Accessible Entrance/Ramp\t',
      'ar': '',
    },
    'pnjvpxwf': {
      'en': 'Accessible Restrooms\t',
      'ar': '',
    },
    '7q2gwoz6': {
      'en': 'Wheelchair Charging Station\t',
      'ar': '',
    },
    '28xxsh5p': {
      'en': 'Wide Aisles for Wheelchairs\t',
      'ar': '',
    },
    'ywjpbqpe': {
      'en': 'Accessible Elevator (Multi-floor)\t',
      'ar': '',
    },
    'l9v4fq6k': {
      'en': 'Staff Assistance Available\t',
      'ar': '',
    },
    'iy5ubyth': {
      'en': 'Add Store',
      'ar': '',
    },
    '2bzyqjdh': {
      'en': 'Home',
      'ar': '',
    },
  },
  // VendorAddAdPage
  {
    '9bmen1v5': {
      'en': 'Type of Post...',
      'ar': '',
    },
    'it6s6zvr': {
      'en': 'Search...',
      'ar': '',
    },
    'vx9se72h': {
      'en': 'Offer',
      'ar': '',
    },
    'mlqln88a': {
      'en': 'Event',
      'ar': '',
    },
    'txoo4sj0': {
      'en': 'Ad Title\t',
      'ar': '',
    },
    '702ha4iz': {
      'en': 'Description\t',
      'ar': '',
    },
    'htkzhym4': {
      'en': 'Price / Discount\t',
      'ar': '',
    },
    'hp271gt2': {
      'en': 'Attach Ad Photo',
      'ar': '',
    },
    '1lcb4e9f': {
      'en': 'Chose start date',
      'ar': '',
    },
    '6m6hcnuo': {
      'en': 'Chose end date',
      'ar': '',
    },
    'zokbz46x': {
      'en': 'Publish Ad',
      'ar': '',
    },
    '3suwteef': {
      'en': 'Back',
      'ar': '',
    },
    't7e6z9jy': {
      'en': 'Add New Ads',
      'ar': '',
    },
    'wlwcwoqt': {
      'en': 'Home',
      'ar': '',
    },
  },
  // VendorDashboardPage
  {
    'tjxmhwj7': {
      'en': 'Home',
      'ar': '',
    },
    'q3clecwh': {
      'en': 'You haven\'t added your store yet.',
      'ar': '',
    },
    'bbnm6wy8': {
      'en': 'Add New Store',
      'ar': '',
    },
    'fdarcfh7': {
      'en': 'Store location',
      'ar': '',
    },
    '11yv5vpf': {
      'en': 'Dedicated Parking\t',
      'ar': '',
    },
    '3hc4cy32': {
      'en': '',
      'ar': '',
    },
    '6luj9b0n': {
      'en': 'Accessible Ramp\t',
      'ar': '',
    },
    '8o08h29g': {
      'en': '',
      'ar': '',
    },
    '7xj0whfb': {
      'en': 'Wide Aisles\t',
      'ar': '',
    },
    '8js42ibk': {
      'en': '',
      'ar': '',
    },
    'ivwtwkkc': {
      'en': 'Staff Assistance\t',
      'ar': '',
    },
    '9igawqc6': {
      'en': '',
      'ar': '',
    },
    '7iur9i0l': {
      'en': 'Accessible Restroom\t',
      'ar': '',
    },
    'sicnbvry': {
      'en': '',
      'ar': '',
    },
    'nh8en1dk': {
      'en': 'Wheelchair Charger\t',
      'ar': '',
    },
    '5vztm4a6': {
      'en': '',
      'ar': '',
    },
    'gmcdlhw5': {
      'en': 'Elevator\t',
      'ar': '',
    },
    'tw4q6e6a': {
      'en': '',
      'ar': '',
    },
    'yj28zwsz': {
      'en': 'Modify Store Info',
      'ar': '',
    },
    '4epyqyym': {
      'en': 'My Ads',
      'ar': '',
    },
    'eelzyp2f': {
      'en': 'SAR',
      'ar': '',
    },
    'j0jpfdn4': {
      'en': 'Setting',
      'ar': '',
    },
    'dns5zxzd': {
      'en': 'Settings',
      'ar': '',
    },
    'ns4st60i': {
      'en': 'My Account',
      'ar': '',
    },
    'k0cpkk0e': {
      'en': 'Send Feedback',
      'ar': '',
    },
    '5wjxxt0m': {
      'en': 'Privacy Policy',
      'ar': '',
    },
    '58fz12pw': {
      'en': 'Light Mode',
      'ar': '',
    },
    'a71p0a3g': {
      'en': 'Dark Mode',
      'ar': '',
    },
    'z0utimco': {
      'en': 'Help&Support',
      'ar': '',
    },
    'mu63t8al': {
      'en': 'Log Out',
      'ar': '',
    },
    '0jpwveke': {
      'en': 'Version 1.2.3',
      'ar': '',
    },
    'q5m5uuci': {
      'en': 'TAYSIR',
      'ar': '',
    },
    'fu5gaoco': {
      'en': 'Home',
      'ar': '',
    },
  },
  // VendorEditAdPage
  {
    'eaa60nje': {
      'en': 'Type of Post...',
      'ar': '',
    },
    'twfn495j': {
      'en': 'Search...',
      'ar': '',
    },
    's09yrcv5': {
      'en': 'Offer',
      'ar': '',
    },
    'psw7wamj': {
      'en': 'Event',
      'ar': '',
    },
    'weddxxen': {
      'en': 'Ad Title\t',
      'ar': '',
    },
    'di7n0vnv': {
      'en': 'Description\t',
      'ar': '',
    },
    'spni18se': {
      'en': 'Price / Discount\t',
      'ar': '',
    },
    'alrkzhl4': {
      'en': 'Change Ad Photo',
      'ar': '',
    },
    'pmneg6ca': {
      'en': 'Chose start date',
      'ar': '',
    },
    'oytrv2yq': {
      'en': 'Chose end date',
      'ar': '',
    },
    'hsizzb93': {
      'en': 'Save Changes',
      'ar': '',
    },
    'iv3fvsn3': {
      'en': 'Back',
      'ar': '',
    },
    'fywesuwf': {
      'en': 'Edit Ads',
      'ar': '',
    },
    'e2qkv2zv': {
      'en': 'Home',
      'ar': '',
    },
  },
  // VendorUpdateStorePage
  {
    '3gnnvx24': {
      'en': 'Back',
      'ar': '',
    },
    'a2wagv8j': {
      'en': 'Update Your Store Info',
      'ar': '',
    },
    'p9xxagz1': {
      'en': 'Store Name\t',
      'ar': '',
    },
    'g2ddnoyl': {
      'en': 'Store Description\t',
      'ar': '',
    },
    'zswkqmab': {
      'en': 'Phone',
      'ar': '',
    },
    'di36m3rx': {
      'en': 'Email',
      'ar': '',
    },
    'xbox41en': {
      'en': 'Add Photo',
      'ar': '',
    },
    'g325ttb2': {
      'en': 'Accessibility Services & Standards',
      'ar': '',
    },
    'k20p1uo1': {
      'en': 'Dedicated Parking Available\t',
      'ar': '',
    },
    '26exi49v': {
      'en': 'Accessible Entrance/Ramp\t',
      'ar': '',
    },
    '23tudoiw': {
      'en': 'Accessible Restrooms\t',
      'ar': '',
    },
    'hs5quack': {
      'en': 'Wheelchair Charging Station\t',
      'ar': '',
    },
    'xnql30yh': {
      'en': 'Wide Aisles for Wheelchairs\t',
      'ar': '',
    },
    'dcgl243r': {
      'en': 'Accessible Elevator (Multi-floor)\t',
      'ar': '',
    },
    'cqlxp6zm': {
      'en': 'Staff Assistance Available\t',
      'ar': '',
    },
    'ke2q7pux': {
      'en': ' Update Store Info',
      'ar': '',
    },
    'ofyhfomh': {
      'en': 'Home',
      'ar': '',
    },
  },
  // sign
  {
    'm20ajqp5': {
      'en': 'Create Account',
      'ar': '',
    },
    '6668j82z': {
      'en': 'Let\'s get started by filling out the form below.',
      'ar': '',
    },
    '3cjhu07t': {
      'en': 'Add your Photo',
      'ar': '',
    },
    'b0rjvxaz': {
      'en': 'Full name',
      'ar': '',
    },
    '436pgnul': {
      'en': 'Email',
      'ar': '',
    },
    'r5077pio': {
      'en': 'Phone',
      'ar': '',
    },
    'n5cmj2oq': {
      'en': ' ',
      'ar': '',
    },
    'kt5rnawo': {
      'en': 'Username',
      'ar': '',
    },
    '7gon72re': {
      'en': 'Password',
      'ar': '',
    },
    'uz6tgyup': {
      'en': 'Confirm Password',
      'ar': '',
    },
    '6f3lf6u0': {
      'en': 'Already have an account? ',
      'ar': '',
    },
    'e41951d5': {
      'en': 'Log in',
      'ar': '',
    },
    '8pg5lq0z': {
      'en': 'Get Started',
      'ar': '',
    },
    '4u8ts5d7': {
      'en': 'Home',
      'ar': '',
    },
  },
  // RoleSelectorPage
  {
    'vqnsnwzm': {
      'en': 'Select Your Role',
      'ar': '',
    },
    '3k1dkwqs': {
      'en': 'People With Disabilities',
      'ar': '',
    },
    'x5nqwq6f': {
      'en': 'I want to find accessible services and offers.',
      'ar': '',
    },
    'mfom2p6r': {
      'en': 'Choose Role',
      'ar': '',
    },
    'eck2gz2t': {
      'en': 'Vendor',
      'ar': '',
    },
    'tnci2bl0': {
      'en': 'I want to promote my business and offers.',
      'ar': '',
    },
    'f11collf': {
      'en': 'Choose Roie',
      'ar': '',
    },
    'cnttvutu': {
      'en': 'Home',
      'ar': '',
    },
  },
  // UserMyAccountPage
  {
    'ojrv0qax': {
      'en': 'Back',
      'ar': '',
    },
    'z6gj0p2j': {
      'en': 'My Account',
      'ar': '',
    },
    'le6ufgcp': {
      'en': 'Edit Profile',
      'ar': '',
    },
    'guhmr242': {
      'en': '',
      'ar': '',
    },
    'b9awqjb8': {
      'en': 'Change Password',
      'ar': '',
    },
    'mticpcy6': {
      'en': '',
      'ar': '',
    },
    'iy26sq94': {
      'en': 'Home',
      'ar': '',
    },
  },
  // UserChangePasswordPage
  {
    'yuacxxyw': {
      'en': 'Back',
      'ar': '',
    },
    'mx8m3x29': {
      'en': 'Change Password',
      'ar': '',
    },
    'gdletgba': {
      'en': 'Current Password',
      'ar': '',
    },
    '020ux4gz': {
      'en': 'new password',
      'ar': '',
    },
    '703skwg0': {
      'en': 'Confirm the new password',
      'ar': '',
    },
    'u8dik41z': {
      'en': 'Update Password',
      'ar': '',
    },
    'gywr8b6j': {
      'en': 'Home',
      'ar': '',
    },
  },
  // StoreDetailPage
  {
    '9d9w9efl': {
      'en': 'Accessibility Standards',
      'ar': '',
    },
    'o4edk20f': {
      'en': 'Dedicated Parking Available',
      'ar': '',
    },
    'k3jjz5iz': {
      'en': 'Accessible Entrance / Ramp',
      'ar': '',
    },
    'x2yhtri7': {
      'en': 'Accessible Restrooms',
      'ar': '',
    },
    'iy7icvjw': {
      'en': 'Wheelchair Charging Station',
      'ar': '',
    },
    'bt8r4tqx': {
      'en': 'Wide, Clear Aisles',
      'ar': '',
    },
    'uovtich8': {
      'en': 'Accessible Elevator\t',
      'ar': '',
    },
    '42d7ng61': {
      'en': 'Staff Assistance Available\t',
      'ar': '',
    },
    'clbqof7z': {
      'en': 'Back',
      'ar': '',
    },
    '2l10335x': {
      'en': 'Store Detaile',
      'ar': '',
    },
    'f3rssw7l': {
      'en': 'Home',
      'ar': '',
    },
  },
  // UserEditProfilePage
  {
    '634vi7gl': {
      'en': 'Back',
      'ar': '',
    },
    '2cw75t5e': {
      'en': 'Edit Profile',
      'ar': '',
    },
    '29zcyje1': {
      'en': 'Your Name',
      'ar': '',
    },
    'jxot2duq': {
      'en': 'Your Email',
      'ar': '',
    },
    '1mon0adp': {
      'en': 'Save Changes',
      'ar': '',
    },
    'm8g3jb8x': {
      'en': 'Home',
      'ar': '',
    },
  },
  // VendorFeedbackPage
  {
    'acw4mwfn': {
      'en': 'Back',
      'ar': '',
    },
    'k5x36ehc': {
      'en': 'Add Your Store',
      'ar': '',
    },
    'dezwgukk': {
      'en': 'We\'d love your feedback!',
      'ar': '',
    },
    'iu138a4d': {
      'en': 'Fill out the form below ',
      'ar': '',
    },
    'yeiy5hd1': {
      'en': 'Type of Issue',
      'ar': '',
    },
    'xayqj5v8': {
      'en': 'Search...',
      'ar': '',
    },
    'gwsd45jf': {
      'en': '',
      'ar': '',
    },
    '4qamd1iw': {
      'en': '',
      'ar': '',
    },
    'kmhkkl9c': {
      'en': 'App Error',
      'ar': '',
    },
    '7v9w8m4w': {
      'en': 'Other',
      'ar': '',
    },
    'pe2cej1y': {
      'en': 'Write your feedback here...',
      'ar': '',
    },
    'ue3jmi7d': {
      'en': 'Submit Feedback',
      'ar': '',
    },
    'kxfoix07': {
      'en': 'Home',
      'ar': '',
    },
  },
  // VendorChangePasswordPage
  {
    'h1isn0lk': {
      'en': 'Back',
      'ar': '',
    },
    '5pguzhal': {
      'en': 'Change Password',
      'ar': '',
    },
    'njoav2p1': {
      'en': 'Current Password',
      'ar': '',
    },
    'gfz1h8hk': {
      'en': 'new password',
      'ar': '',
    },
    'ztm8zbbd': {
      'en': 'Confirm the new password',
      'ar': '',
    },
    'amtmbtb5': {
      'en': 'Update Password',
      'ar': '',
    },
    'zd2gjv1n': {
      'en': 'Home',
      'ar': '',
    },
  },
  // UserViewAdsDetails
  {
    'vxzc4s2u': {
      'en': 'Ads Location',
      'ar': '',
    },
    '3f4o32wh': {
      'en': 'Start at ',
      'ar': '',
    },
    'p9r39u3h': {
      'en': ' to ',
      'ar': '',
    },
    '0v1ftiwc': {
      'en': 'Back',
      'ar': '',
    },
    'f23umevh': {
      'en': 'Ads  datailes',
      'ar': '',
    },
    '5agnrgly': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Auth2
  {
    'tvms7t54': {
      'en': 'Filling out the form below.',
      'ar': '',
    },
    'xjw3tzyl': {
      'en': 'Email',
      'ar': '',
    },
    'twxmypfr': {
      'en': 'Password',
      'ar': '',
    },
    'oe3w4w9g': {
      'en': 'Sign In',
      'ar': '',
    },
    'ndlugqlk': {
      'en': 'Forgot Password',
      'ar': '',
    },
    'waznzhbf': {
      'en': 'Back',
      'ar': '',
    },
    'g3i50cwn': {
      'en': 'Sign in',
      'ar': '',
    },
    'knd3k3br': {
      'en': 'Home',
      'ar': '',
    },
  },
  // AdminDashbord
  {
    'zdxg1yld': {
      'en': 'TAYSIR',
      'ar': '',
    },
    'g6tkmm4k': {
      'en': 'Ads',
      'ar': '',
    },
    'zalnkw7q': {
      'en': 'SAR',
      'ar': '',
    },
    'q7f59m8r': {
      'en': 'stores',
      'ar': '',
    },
    '0ra9g6xt': {
      'en': 'Users',
      'ar': '',
    },
    'o4pi5wv6': {
      'en': 'Reports',
      'ar': '',
    },
    'zy2gbfhd': {
      'en': 'Reported by: ',
      'ar': '',
    },
    'mqipvv2s': {
      'en': 'Hello World',
      'ar': '',
    },
    'sf5gd7cq': {
      'en': 'Ignore it',
      'ar': '',
    },
    'lljf0qka': {
      'en': 'Archive it',
      'ar': '',
    },
    'duwf6e5p': {
      'en': 'accept report',
      'ar': '',
    },
    'sw8jko9d': {
      'en': 'Setting',
      'ar': '',
    },
    'qjr039je': {
      'en': 'Settings',
      'ar': '',
    },
    'zwo3lt9x': {
      'en': 'My Account',
      'ar': '',
    },
    'xj3hshud': {
      'en': 'Role Management',
      'ar': '',
    },
    'szzcrnbc': {
      'en': 'Light Mode',
      'ar': '',
    },
    'kzf8zwuw': {
      'en': 'Dark Mode',
      'ar': '',
    },
    'qdwzf4iw': {
      'en': 'Developer Information',
      'ar': '',
    },
    'sbu2x1z8': {
      'en': 'Log Out',
      'ar': '',
    },
    'qixmpjbg': {
      'en': 'Version 1.2.3',
      'ar': '',
    },
    'itt6vu9k': {
      'en': 'Home',
      'ar': '',
    },
  },
  // welcomepageCopy
  {
    '2jj7e1bb': {
      'en': 'Welcome To TAYSIR',
      'ar': '',
    },
    'jx4bw9hs': {
      'en': 'Pull to the left to find out more about us',
      'ar': '',
    },
    '4ff68q1w': {
      'en': 'Awesome Recipes',
      'ar': '',
    },
    '2f820mza': {
      'en': 'I have some great food options here!! Yum yum!!',
      'ar': '',
    },
    'xed8wlxt': {
      'en': 'Personalized recipe discovery',
      'ar': '',
    },
    'silb2fyd': {
      'en': 'I have some great food options here!! Yum yum!!',
      'ar': '',
    },
    '30qtc5hh': {
      'en': 'Next',
      'ar': '',
    },
    'nifbo334': {
      'en': 'Skip',
      'ar': '',
    },
    'pmw6dveb': {
      'en': 'Home',
      'ar': '',
    },
  },
  // UserDetailes
  {
    'ubydlau6': {
      'en': 'User inormation',
      'ar': '',
    },
    'o9jubd8w': {
      'en': 'User photo',
      'ar': '',
    },
    '73r4g963': {
      'en': 'User role: ',
      'ar': '',
    },
    '0gwbawqh': {
      'en': 'Username: ',
      'ar': '',
    },
    'n1lx3lv8': {
      'en': 'UserID: ',
      'ar': '',
    },
    'qzgdcn7f': {
      'en': 'created at ',
      'ar': '',
    },
    '9xeuculb': {
      'en': 'Suspend User',
      'ar': '',
    },
    '4t5cf2ou': {
      'en': 'Activate  User',
      'ar': '',
    },
    'ty5uc174': {
      'en': 'Delete User',
      'ar': '',
    },
    'dnrzcaj6': {
      'en': 'Home',
      'ar': '',
    },
  },
  // AdsDetaile
  {
    'ugl9gwu1': {
      'en': 'Type of Post...',
      'ar': '',
    },
    'hw8xscp5': {
      'en': 'Search...',
      'ar': '',
    },
    'z8zy4vgz': {
      'en': 'Offer',
      'ar': '',
    },
    '9ym8dngw': {
      'en': 'Event',
      'ar': '',
    },
    '6ddke1lq': {
      'en': 'Ad Title\t',
      'ar': '',
    },
    'brznki15': {
      'en': 'Description\t',
      'ar': '',
    },
    't3mt72xt': {
      'en': 'Price / Discount\t',
      'ar': '',
    },
    '9pqrhd0v': {
      'en': 'Attach Ad Photo',
      'ar': '',
    },
    'qz9jj50l': {
      'en': 'Chose start date',
      'ar': '',
    },
    '26yfhg3c': {
      'en': 'Chose end date',
      'ar': '',
    },
    'bzqfs0mc': {
      'en': 'Save Changes',
      'ar': '',
    },
    'xc5ptecv': {
      'en': 'Back',
      'ar': '',
    },
    '6clynj54': {
      'en': 'Modify ads',
      'ar': '',
    },
    '25zjljb2': {
      'en': 'Home',
      'ar': '',
    },
  },
  // ListReports
  {
    'j01x6awv': {
      'en': 'archived',
      'ar': '',
    },
    '5cjel3vy': {
      'en': 'sended',
      'ar': '',
    },
    'vhq0i42z': {
      'en': 'ignored',
      'ar': '',
    },
    'sensqr9h': {
      'en': 'Back',
      'ar': '',
    },
    '7zpzprxq': {
      'en': 'Past Reports',
      'ar': '',
    },
    '9ccmza6z': {
      'en': 'Home',
      'ar': '',
    },
  },
  // UserManagementPage
  {
    'f85ior66': {
      'en': 'Home',
      'ar': '',
    },
  },
  // DeveloperInfoPage
  {
    '0t70wtzp': {
      'en': 'Development and supervisory team.',
      'ar': '',
    },
    'esdvj0x1': {
      'en': 'Al-Baha University.',
      'ar': '',
    },
    'v71y0v54': {
      'en': '',
      'ar': '',
    },
    'sj5jjwml': {
      'en': 'Dr. Najib Ben Aoun.',
      'ar': '',
    },
    'hcnk6i9h': {
      'en': '',
      'ar': '',
    },
    '19iloegp': {
      'en': 'Contact & Support',
      'ar': '',
    },
    'v1gjkbua': {
      'en': 'support@taysirapp.com',
      'ar': '',
    },
    'a2c24dxi': {
      'en': '',
      'ar': '',
    },
    'fi4r4g5m': {
      'en': 'Version',
      'ar': '',
    },
    'peqa0nmx': {
      'en': '1.2.3',
      'ar': '',
    },
    'rpzhwv5o': {
      'en': 'Back',
      'ar': '',
    },
    '8p6mrs0f': {
      'en': 'Developer information',
      'ar': '',
    },
    'zrhg0i6b': {
      'en': 'Home',
      'ar': '',
    },
  },
  // AdminMyAccountpage
  {
    'eqrvzig6': {
      'en': 'Back',
      'ar': '',
    },
    'y7g34jcj': {
      'en': 'MyAccount',
      'ar': '',
    },
    'wdgpns71': {
      'en': 'Edit Profile',
      'ar': '',
    },
    'd3x1ytx3': {
      'en': '',
      'ar': '',
    },
    'aadahn2z': {
      'en': 'Change Password',
      'ar': '',
    },
    'zxkldl0w': {
      'en': '',
      'ar': '',
    },
    'o7btjwby': {
      'en': 'Home',
      'ar': '',
    },
  },
  // AdminChangePasswordPage
  {
    'v9g2d3ky': {
      'en': 'Back',
      'ar': '',
    },
    'hf8xleen': {
      'en': 'Change Password',
      'ar': '',
    },
    'ojin7443': {
      'en': 'Current Password',
      'ar': '',
    },
    '1189znd8': {
      'en': 'new password',
      'ar': '',
    },
    '1uxsv9f6': {
      'en': 'Confirm the new password',
      'ar': '',
    },
    'hyn1kasc': {
      'en': 'Update Password',
      'ar': '',
    },
    'l1fvag7b': {
      'en': 'Home',
      'ar': '',
    },
  },
  // AdminUpdateStorePage
  {
    '7o29b66e': {
      'en': 'Back',
      'ar': '',
    },
    '2rbhns5r': {
      'en': 'Update Your Store Info',
      'ar': '',
    },
    'wvp4feh5': {
      'en': 'Store Name\t',
      'ar': '',
    },
    'gokxqwpf': {
      'en': 'Store Description\t',
      'ar': '',
    },
    'rig8a3h5': {
      'en': 'Phone',
      'ar': '',
    },
    'z2ojjw6t': {
      'en': 'Email',
      'ar': '',
    },
    '41rp1yop': {
      'en': 'Add Photo',
      'ar': '',
    },
    'buc6h429': {
      'en': 'Accessibility Services & Standards',
      'ar': '',
    },
    'wt2lqsaa': {
      'en': 'Dedicated Parking Available\t',
      'ar': '',
    },
    'pj0wadnt': {
      'en': 'Accessible Entrance/Ramp\t',
      'ar': '',
    },
    'c4fhefqw': {
      'en': 'Accessible Restrooms\t',
      'ar': '',
    },
    '6y9phel6': {
      'en': 'Wheelchair Charging Station\t',
      'ar': '',
    },
    'q93imlcs': {
      'en': 'Wide Aisles for Wheelchairs\t',
      'ar': '',
    },
    'nnbvl7bj': {
      'en': 'Accessible Elevator (Multi-floor)\t',
      'ar': '',
    },
    '2orgjnik': {
      'en': 'Staff Assistance Available\t',
      'ar': '',
    },
    '8qi7i1cu': {
      'en': ' Update Store Info',
      'ar': '',
    },
    'fnst50l4': {
      'en': 'Home',
      'ar': '',
    },
  },
  // StoreDetailPageCopy
  {
    'wxob7zle': {
      'en': 'Accessibility Standards',
      'ar': '',
    },
    'sg3ky2f6': {
      'en': 'Dedicated Parking Available',
      'ar': '',
    },
    'j3plriy1': {
      'en': 'Accessible Entrance / Ramp',
      'ar': '',
    },
    'lg66kjqd': {
      'en': 'Accessible Restrooms',
      'ar': '',
    },
    'oducqvus': {
      'en': 'Wheelchair Charging Station',
      'ar': '',
    },
    'pvzx2ztv': {
      'en': 'Wide, Clear Aisles',
      'ar': '',
    },
    '57mvsut0': {
      'en': 'Accessible Elevator\t',
      'ar': '',
    },
    '0ieathmu': {
      'en': 'Staff Assistance Available\t',
      'ar': '',
    },
    'tj4rflpq': {
      'en': 'Modify store',
      'ar': '',
    },
    'gqam0uq8': {
      'en': 'Delete store',
      'ar': '',
    },
    '61blzg40': {
      'en': 'Back',
      'ar': '',
    },
    'm7lj3cpn': {
      'en': 'Store Detaile',
      'ar': '',
    },
    '7vzvzzfs': {
      'en': 'Home',
      'ar': '',
    },
  },
  // VendorEditProfilePage
  {
    'u1565cvv': {
      'en': 'Back',
      'ar': '',
    },
    '59ijq6g7': {
      'en': 'Edit Profile',
      'ar': '',
    },
    'tfm05z3m': {
      'en': 'Your Name',
      'ar': '',
    },
    'snb3s0iz': {
      'en': 'Your Email',
      'ar': '',
    },
    'pvrkzx4t': {
      'en': 'Save Changes',
      'ar': '',
    },
    '41uj3rs0': {
      'en': 'Home',
      'ar': '',
    },
  },
  // VendorMyAccountPage
  {
    'kqo1r0p2': {
      'en': 'Back',
      'ar': '',
    },
    'o9if59y5': {
      'en': 'My Account',
      'ar': '',
    },
    'kum0m2iv': {
      'en': 'Edit Profile',
      'ar': '',
    },
    'v74cerlu': {
      'en': '',
      'ar': '',
    },
    '374quhu9': {
      'en': 'Change Password',
      'ar': '',
    },
    '08c2ozux': {
      'en': '',
      'ar': '',
    },
    '43unxpal': {
      'en': 'Home',
      'ar': '',
    },
  },
  // AdminEditProfilePage
  {
    'bvr3oqzp': {
      'en': 'Back',
      'ar': '',
    },
    'wd2kn088': {
      'en': 'Edit Profile',
      'ar': '',
    },
    'nj44zrn8': {
      'en': 'Your Name',
      'ar': '',
    },
    'pt78di1b': {
      'en': 'Your Email',
      'ar': '',
    },
    'htezuaq9': {
      'en': 'Save Changes',
      'ar': '',
    },
    'sfodd79a': {
      'en': 'Home',
      'ar': '',
    },
  },
  // VendorPrivacyPolicyPage
  {
    'yo0kx4i2': {
      'en': 'Privacy Policy',
      'ar': '',
    },
    '3irzrdut': {
      'en':
          'Taysir commits to protecting your commercial data. This policy explains how we manage the information and offers you share with us.',
      'ar': '',
    },
    '66tk82j5': {
      'en': 'Data We Collect',
      'ar': '',
    },
    '8kbjnfmx': {
      'en': 'Store Owner Details',
      'ar': '',
    },
    'mxk28i66': {
      'en': '• Owner Name\n• Email Address\n• Phone Number',
      'ar': '',
    },
    'rot0ny7a': {
      'en': 'Store Information',
      'ar': '',
    },
    'i7jylal3': {
      'en': '• Store Name\n• Store Address\n• Store Description',
      'ar': '',
    },
    'mcnchdbg': {
      'en': 'Offers & Advertisements',
      'ar': '',
    },
    '9bvt55uo': {
      'en':
          '• Advertisement Details\n• Product Prices\n• Product Images\n• Expiry Dates',
      'ar': '',
    },
    'ojvon0fj': {
      'en': 'How We Use Your Data',
      'ar': '',
    },
    'c4i0tlmm': {
      'en':
          'Your data is used strictly for:\n\n• Publishing your advertisements to target users\n• Account management and maintenance\n• Content review to ensure quality\n• Compliance with Taysir policies',
      'ar': '',
    },
    'p15b03yq': {
      'en': 'Your Agreement',
      'ar': '',
    },
    'ejjya3it': {
      'en':
          'By using the vendor account, you agree to this privacy policy and our terms of service.',
      'ar': '',
    },
    '6c6w5qvc': {
      'en': 'Need Help?',
      'ar': '',
    },
    'v403w6h3': {
      'en':
          'For any questions about this privacy policy, please contact our support team:',
      'ar': '',
    },
    'zig5sv0t': {
      'en': 'support@taysirapp.com',
      'ar': '',
    },
    'ijhkipcj': {
      'en': 'Privacy Policy',
      'ar': '',
    },
  },
  // UserHelpSupportpage
  {
    '3s4pwrc0': {
      'en': 'We\'re Here to Help',
      'ar': '',
    },
    'is659jaq': {
      'en':
          'If you are facing issues using the app or have suggestions to make it better, we are here to help.',
      'ar': '',
    },
    'qse338oa': {
      'en': 'Common Questions',
      'ar': '',
    },
    '3n5ivays': {
      'en': 'How can I find accessible parking?',
      'ar': '',
    },
    'c56ye9if': {
      'en': 'Open the map and look for the wheelchair icons.',
      'ar': '',
    },
    '9rvzyoos': {
      'en': 'How can I report a problem?',
      'ar': '',
    },
    'x74cgort': {
      'en': 'Use the \\\"Report Issue\\\" button on the parking map.',
      'ar': '',
    },
    'v7fovuy2': {
      'en': 'Need more help?',
      'ar': '',
    },
    'bmqebesk': {
      'en': 'Email Support',
      'ar': '',
    },
    'gbq8i4l0': {
      'en': 'support@taysir.life',
      'ar': '',
    },
    'sdsl6wx0': {
      'en': 'Call Us',
      'ar': '',
    },
    'cvk84c82': {
      'en': '+966 558 223 3843',
      'ar': '',
    },
    'r3etcnjg': {
      'en': 'Help & Support',
      'ar': '',
    },
  },
  // UserAboutPage
  {
    '25ifdics': {
      'en':
          'TAYSIR is a mobile application developed by students from Al-Baha University to help people with disabilities.',
      'ar': '',
    },
    'clpilg4s': {
      'en': 'Features:',
      'ar': '',
    },
    '1fvugwm6': {
      'en': 'Real-time accessible parking locations',
      'ar': '',
    },
    'fxz7hksn': {
      'en': 'Offers and events for people with disabilities',
      'ar': '',
    },
    'ej1974ad': {
      'en': 'Discounts and stores',
      'ar': '',
    },
    's2rlca7o': {
      'en': 'Developed by:',
      'ar': '',
    },
    'mq31ekm2': {
      'en': 'Taysir Team',
      'ar': '',
    },
    '0gy7x68r': {
      'en': 'Supervised by:',
      'ar': '',
    },
    'pynaklfw': {
      'en': 'Dr. Najib Ben Aoun',
      'ar': '',
    },
    'ekgu3bur': {
      'en': 'Version:',
      'ar': '',
    },
    'rbjcup8l': {
      'en': '1.2.3',
      'ar': '',
    },
    'nxraayax': {
      'en': 'About TAYSIR',
      'ar': '',
    },
  },
  // UserPrivacyPolicypage
  {
    '458owif5': {
      'en': 'Privacy Policy',
      'ar': '',
    },
    '66bittsa': {
      'en':
          'TAYSIR respects your privacy. We collect only the data needed to provide parking accessibility services for people with disabilities.',
      'ar': '',
    },
    's02svcym': {
      'en': 'Data We Collect:',
      'ar': '',
    },
    'ayfeyuma': {
      'en': 'Your location',
      'ar': '',
    },
    '9a1inljt': {
      'en': 'To show nearby accessible parking',
      'ar': '',
    },
    'yjukcxgx': {
      'en': 'Your email',
      'ar': '',
    },
    'm9k2z6u4': {
      'en': 'For account login',
      'ar': '',
    },
    'sjgch1sh': {
      'en': 'Your reports and feedback',
      'ar': '',
    },
    'plqttc22': {
      'en': 'To improve services',
      'ar': '',
    },
    'g9xea8ax': {
      'en':
          'We never share your data with third parties except with relevant authorities to fix accessibility issues or manage parking spots.',
      'ar': '',
    },
    'tsfkvu88': {
      'en': 'By using the app, you agree to this privacy policy.',
      'ar': '',
    },
    '7oaml11g': {
      'en': 'Questions?',
      'ar': '',
    },
    '84ajhqk2': {
      'en': 'support@taysirapp.com',
      'ar': '',
    },
  },
  // AddParkingDialog
  {
    'fsav1xf1': {
      'en':
          'Help others navigate easily! Please identify the handicapped parking spot and add its details.\t',
      'ar': '',
    },
    'j4k7jjrw': {
      'en': 'Select Location',
      'ar': '',
    },
    'oh02yu46': {
      'en': 'Add photo',
      'ar': '',
    },
    'oa248lhz': {
      'en': 'Add Parkibg',
      'ar': '',
    },
  },
  // LogOut
  {
    'lcxjuizx': {
      'en': 'Are you sure you want to sign out?',
      'ar': '',
    },
    '5xkih2aq': {
      'en':
          'FlutterFlow is a visual development platform that allows you to easily create beautiful and responsive user interfaces for your mobile and web applications. ',
      'ar': '',
    },
    'eg0sln3x': {
      'en': 'Cancel',
      'ar': '',
    },
    '0mwj6qro': {
      'en': 'Confirm',
      'ar': '',
    },
  },
  // AdminDeleteUserConfirm
  {
    '492y8pq1': {
      'en': 'Are you sure you want to delete this user?',
      'ar': '',
    },
    'lj2v22jv': {
      'en':
          'FlutterFlow is a visual development platform that allows you to easily create beautiful and responsive user interfaces for your mobile and web applications. ',
      'ar': '',
    },
    'orrhax9x': {
      'en': 'Cancel',
      'ar': '',
    },
    '0fabeh1p': {
      'en': 'Confirm',
      'ar': '',
    },
  },
  // AdminChangeRoleDialog
  {
    '51yzmwtd': {
      'en': 'Select Role...',
      'ar': '',
    },
    'hjkfl4u3': {
      'en': 'Search...',
      'ar': '',
    },
    '3df9ts07': {
      'en': 'Admin',
      'ar': '',
    },
    '2f02rcvu': {
      'en': 'Vendor',
      'ar': '',
    },
    'n6s6oywm': {
      'en': 'User',
      'ar': '',
    },
    'nhjiiycf': {
      'en': 'Confirm',
      'ar': '',
    },
    '1sqz6qrb': {
      'en': 'Cancel',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    'fdmc6nzj': {
      'en': '',
      'ar': '',
    },
    'qd98rqlm': {
      'en': '',
      'ar': '',
    },
    '1v97qr6m': {
      'en': '',
      'ar': '',
    },
    'uqlblmy6': {
      'en': '',
      'ar': '',
    },
    's7mn7tos': {
      'en': '',
      'ar': '',
    },
    '02vqbjqi': {
      'en': '',
      'ar': '',
    },
    'yvqxqsbb': {
      'en': '',
      'ar': '',
    },
    'wf8elzm3': {
      'en': '',
      'ar': '',
    },
    'b9buigid': {
      'en': '',
      'ar': '',
    },
    'm45xqcat': {
      'en': '',
      'ar': '',
    },
    't32ym9nc': {
      'en': '',
      'ar': '',
    },
    '62xecqoq': {
      'en': '',
      'ar': '',
    },
    'sa91hx3z': {
      'en': '',
      'ar': '',
    },
    'u78pnzbf': {
      'en': '',
      'ar': '',
    },
    'akwzy44f': {
      'en': '',
      'ar': '',
    },
    'tv6uu5lm': {
      'en': '',
      'ar': '',
    },
    '9htbzxhl': {
      'en': '',
      'ar': '',
    },
    'vry3dzpi': {
      'en': '',
      'ar': '',
    },
    'to0bx8hf': {
      'en': '',
      'ar': '',
    },
    'jqkg1xgj': {
      'en': '',
      'ar': '',
    },
    'p46phqpx': {
      'en': '',
      'ar': '',
    },
    'ovydoknc': {
      'en': '',
      'ar': '',
    },
    't3of45xm': {
      'en': '',
      'ar': '',
    },
    'c7ri4jl0': {
      'en': '',
      'ar': '',
    },
    'zhrk9ny1': {
      'en': '',
      'ar': '',
    },
    'uj1hyxtl': {
      'en': '',
      'ar': '',
    },
    'ao0pbwma': {
      'en': '',
      'ar': '',
    },
    'yly51cx9': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
