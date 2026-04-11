// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get english => 'الإنجليزية';

  @override
  String get arabic => 'العربية';

  @override
  String get spanish => 'الأسبانية';

  @override
  String get frensh => 'الفرنسية';

  @override
  String get german => 'الألمانية';

  @override
  String get turkish => 'التركية';

  @override
  String get ok => 'حسناً';

  @override
  String get back => 'رجوع';

  @override
  String get openNavigationMenu => 'فتح قائمة التنقل';

  @override
  String get error => 'خطأ';

  @override
  String get pleaseChoose => 'الرجاء تحديد خيار';

  @override
  String get camera => 'الكاميرا';

  @override
  String get gallery => 'الاستوديو';

  @override
  String get share => 'شارك';

  @override
  String get errorHappenedWhileTryingToShareTheImage =>
      'حدث خطأ أثناء محاولة مشاركة الصورة.';

  @override
  String get saveToGallery => 'حفظ في الاستوديو';

  @override
  String get imageSavedToGallery => 'تم حفظ الصورة في الاستوديو';

  @override
  String get errorHappenedWhileSavingTheImage =>
      'حدث خطأ أثناء حفظ الصورة في الاستوديو.';

  @override
  String get attention => 'انتباه';

  @override
  String get doYouWantToExit => 'هل تريد الخروج؟';

  @override
  String get exit => 'الخروج';

  @override
  String get cancel => 'إلغاء';

  @override
  String get copyCode => 'إنسخ الكود';

  @override
  String get copid => 'تم النسخ!';

  @override
  String get km => 'كيلومتر';

  @override
  String get meter => 'متر';

  @override
  String get linkIsNotvalid => 'الرابط غير صالح';

  @override
  String get youAreCurrentlyOffline => 'أنت غير متصل بالانترنت';

  @override
  String get linkDoesnotPointToImage => 'الرابط لا يشير إلى الصورة';

  @override
  String get passwordMustBeAtLeastWithDetails =>
      'يجب أن تتكون كلمة المرور من 8 أحرف على الأقل، وأن تحتوي على 5 حروف ورقمين وحرف خاص واحد على الأقل مثل ';

  @override
  String get fiveAlphabetCharacters => '5 حروف';

  @override
  String get twoNumbers => 'رقمين';

  @override
  String get oneSpecialCharachtersLike => 'حرف خاص مثل ';

  @override
  String get passwordMustContainAtLeast => 'يجب أن تحتوي كلمة المرور على الأقل';

  @override
  String get comma => ' و';

  @override
  String get and => 'و';

  @override
  String get today => 'اليوم';

  @override
  String get yesterday => 'أمس';

  @override
  String get at => 'الساعة';

  @override
  String get justNow => 'الآن';

  @override
  String durationAgo(String durationInString) {
    return 'منذ $durationInString';
  }

  @override
  String durationFromNow(String durationInString) {
    return 'بعد $durationInString من الآن';
  }

  @override
  String get second => 'ثانية';

  @override
  String get twoSeconds => 'ثانيتين';

  @override
  String secondsBeteenThreeAndTen(int numberOfSeconds) {
    return '$numberOfSeconds ثواني';
  }

  @override
  String secondsMoreThanTen(int numberOfSeconds) {
    return '$numberOfSeconds ثانية';
  }

  @override
  String get minute => 'دقيقة';

  @override
  String get twoMinutes => 'دقيقتين';

  @override
  String minutesBeteenThreeAndTen(int numberOfMinutes) {
    return '$numberOfMinutes دقائق';
  }

  @override
  String minutesMoreThanTen(int numberOfMinutes) {
    return '$numberOfMinutes دقيقة';
  }

  @override
  String get hour => 'ساعة';

  @override
  String get twoHours => 'ساعتين';

  @override
  String hoursBeteenThreeAndTen(int numberOfHours) {
    return '$numberOfHours ساعات';
  }

  @override
  String hoursMoreThanTen(int numberOfHours) {
    return '$numberOfHours ساعة';
  }

  @override
  String get day => 'يوم';

  @override
  String get twoDays => 'يومين';

  @override
  String daysBeteenThreeAndTen(int numberOfDays) {
    return '$numberOfDays أيام';
  }

  @override
  String daysMoreThanTen(int numberOfDays) {
    return '$numberOfDays يوم';
  }

  @override
  String get week => 'إسبوع';

  @override
  String get twoWeeks => 'إسبوعين';

  @override
  String weeksBeteenThreeAndTen(int numberOfWeeks) {
    return '$numberOfWeeks أسابيع';
  }

  @override
  String weeksMoreThanTen(int numberOfWeeks) {
    return '$numberOfWeeks إسبوع';
  }

  @override
  String get month => 'شهر';

  @override
  String get twoMonths => 'شهرين';

  @override
  String monthsBeteenThreeAndTen(int numberOfMonths) {
    return '$numberOfMonths أشهر';
  }

  @override
  String monthsMoreThanTen(int numberOfMonths) {
    return '$numberOfMonths شهر';
  }

  @override
  String get year => 'سنة';

  @override
  String get twoYears => 'سنتين';

  @override
  String yearsBeteenThreeAndTen(int numberOfYears) {
    return '$numberOfYears سنوات';
  }

  @override
  String yearsMoreThanTen(int numberOfYears) {
    return '$numberOfYears سنة';
  }

  @override
  String get decade => 'عقد';

  @override
  String get twoDecades => 'عقدين';

  @override
  String decadesBeteenThreeAndTen(int numberOfDecades) {
    return '$numberOfDecades عقود';
  }

  @override
  String decadesMoreThanTen(int numberOfDecades) {
    return '$numberOfDecades عقد';
  }

  @override
  String get somethingWentWrongPleaseTryAgainLater =>
      'حدث خطأ ما ، الرجاء المحاولة في قت لاحق';

  @override
  String get errorHappendThereIsNoDataForThatAccount =>
      'حدث خطأ، لا توجد بيانات لهذا الحساب';

  @override
  String get unexpectedErrorHappened => 'حدث خطأ غير متوقع.';

  @override
  String get somethingWentWrong => 'حدث خطأ ما!!';

  @override
  String get notAbleToSaveFilesToLocalDeviceStorage =>
      'غير قادر على حفظ الملفات على مساحة تخزين الجهاز المحلي.';

  @override
  String get notAbleToDeleteFilesFromLocalDeviceStorage =>
      'غير قادر على حذف الملفات من مساحة تخزين الجهاز المحلي.';

  @override
  String get notAbleToReadDataFromLocalDevice =>
      'غير قادر على قرائة البيانات من داخل الجهاز';

  @override
  String get sorryThereIsNoResultForYourSearch =>
      'عذرًا، لا توجد نتائج لبحثك، تم تصفية النتيجة.';

  @override
  String get sorryThereIsNoResultForYourSearchWithDetails =>
      '**عذرًا، لا توجد نتائج لبحثك**\n\n* تمت تصفية النتيجة.\n* أو أنك تبحث باستخدام **لغة** غير مدعومة حالياً.';

  @override
  String get notAbleToSaveDataToLocalDevice =>
      'غير قادر على حفظ البيانات داخل الجهاز المحلي';

  @override
  String get home => 'الرئيسية';

  @override
  String get profile => 'الحساب الشخصي';

  @override
  String get mealsSettings => 'إعدادات الوجبات';

  @override
  String get generalSettings => 'الإعدادات العامة';

  @override
  String get settings => 'الإعدادات';

  @override
  String get shareTheApp => 'شارك التطبيق';

  @override
  String get shareTheAppText =>
      'تطبيق AI MealMingle \n لتحميل التطبيق من جوجل بلاي\n\nhttps://play.google.com/store/apps/details?id=com.salahalshafey.aimealmingle';

  @override
  String get about => 'عن التطبيق';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get adjustYourMealsSelection => 'تعديل اختيارات وجباتك';

  @override
  String get glutenfree => 'خالي من الجلوتين';

  @override
  String get lactosefree => 'خالي من اللاكتوز';

  @override
  String get vegetarian => 'نباتي';

  @override
  String get vegan => 'نباتي صارم (فيجان)';

  @override
  String displayMealTypeMeals(String mealType) {
    return 'عرض وجبات $mealType';
  }

  @override
  String get displayArabicLanguage => 'عرض اللغة العربية';

  @override
  String get displayDarkTheme => 'عرض الوضع المظلم';

  @override
  String get color => 'اللون';

  @override
  String get resetToDefault => 'إعادة إلى الوضع الافتراضي';

  @override
  String get theme => 'السمات';

  @override
  String get themeMode => 'السمات';

  @override
  String get systemDefault => 'تلقائياً مع النظام';

  @override
  String get light => 'فاتح';

  @override
  String get dark => 'مظلم';

  @override
  String get language => 'اللغة';

  @override
  String get notifications => 'الإشعارات';

  @override
  String get changeLanguage => 'تغيير اللغة';

  @override
  String get changeToLightMode => 'التغيير إلى الوضع الفاتح';

  @override
  String get changeToDarkMode => 'التغيير إلى الوضع المظلم';

  @override
  String get defaultWord => 'تلقائياً';

  @override
  String get allLanguages => 'كل اللغات';

  @override
  String get actAsANutritionistWithYearsOfExperienceInTheField =>
      'تصرف كخبير تغذية بخبرة 30 عامًا في هذا المجال.ماذا يوجد في هذه الصورة؟ وكم عدد السعرات الحرارية فيه؟\n';

  @override
  String get isThisFoodConsideredHealthyExplainTheBenefits =>
      'هل يعتبر هذا الطعام صحي؟ اشرح فوائد هذا الطعام بالتفصيل ولماذا؟\nإذا كان هناك أكثر من عنصر واحد، \"أعط النتيجة في جدول لكل عنصر\".\n';

  @override
  String get pleaseGiveMeTheFollowingNutritionFacts =>
      'من فضلك أعطني الحقائق الغذائية التالية:\n-  سعرات حرارية.\n- البروتينات (ز).\n- الدهون (ز).\n- ما هي الفيتامينات الموجودة فيه؟\n- الكربوهيدرات (جم).\n- الصوديوم (ملغ).\n- البوتاسيوم (ملغ).\n-  و اكثر...\n\nإذا كان هناك أكثر من عنصر، \"أعط النتيجة في جدول لكل عنصر وإجمالي (مجموع) نتائج كل ما سبق\".\n';

  @override
  String get pleaseAnswerTheFollowingnDoesThisFoodContain =>
      'الرجاء الإجابة على ما يلي:\n\n- هل يحتوي هذا الطعام على \"لحم الخنزير أو الكحول\"؟\n- هل يحتوي هذا الطعام على \"الجلوتين\"؟\n- هل يحتوي هذا الطعام على \"اللاكتوز\"؟\n- هل يعتبر هذا الطعام \"نباتي\"؟\n- هل يعتبر هذا الطعام \"فيجان\"؟\n-  و اكثر...\n\nإذا كان هناك أكثر من عنصر، \"أعط النتيجة في جدول لكل عنصر وإجمالي (مجموع) نتائج كل ما سبق\".\n';

  @override
  String
  get howToPrepareThisFoodnnifThereIsMoreThanOneItemGiveTheResultForEachItem =>
      'طريقة تحضير هذا الطعام؟ \"المكونات والخطوات\"\n\nإذا كان هناك أكثر من عنصر واحد، \"أعط النتيجة لكل عنصر\".';

  @override
  String get scanFoodWithAi => 'مسح الطعام باستخدام الذكاء الاصطناعي';

  @override
  String get scanFood => 'مسح الطعام';

  @override
  String get favorites => 'المفضلة';

  @override
  String get getImageToScan => 'الحصول على صورة طعام للمسح';

  @override
  String get youHaveNoFavoritesYetStartAddingSome =>
      'ليس لديك مفضلات بعد - ابدأ بإضافة بعض!';

  @override
  String get unveilingContentsAndCaloricBreakdown =>
      'كشف المحتويات وتفكيك السعرات الحرارية';

  @override
  String get healthinessAndBenefitsOfFeaturedFoods =>
      'الصحة والفوائد من الأطعمة المميزة';

  @override
  String get factsAndSummaries => 'الحقائق والملخصات';

  @override
  String get unveilingDietaryPreferencesAndStatus =>
      'كشف تفضيلاتك الغذائية والحالة الصحية';

  @override
  String get howToPrepareItAtHome => 'كيفية إعداده في المنزل';

  @override
  String get overview => 'نظرة عامة';

  @override
  String get nutritionalEvaluation => 'تقييم تغذوي';

  @override
  String get comprehensiveNutritionAnalysis => 'تحليل التغذية الشامل';

  @override
  String get ingredientInquiry => 'استفسار عن المكونات';

  @override
  String get howToPrepareIt => 'كيفية إعداده';

  @override
  String get confirmRemove => 'تأكيد الإزالة؟';

  @override
  String get areYouSureYouWantToRemoveThisScanResultFromFavorites =>
      'هل أنت متأكد أنك تريد إزالة نتيجة هذا المسح من المفضلات؟';

  @override
  String get remove => 'إزالة';

  @override
  String get removeFromFavorites => 'إزالة من المفضلات';

  @override
  String get saveToFavorites => 'حفظ في المفضلات';

  @override
  String get shareAsPdf => 'مشاركة كملف PDF';

  @override
  String get takingScreenshotsOfTheResults => 'أخذ لقطات شاشة للنتائج...';

  @override
  String get convertingScreenshotsToPdf => 'تحويل لقطات الشاشة إلى PDF...';

  @override
  String get preparingThePdfToBeSavedAtDesktop =>
      'تحضير ملف PDF للحفظ على سطح المكتب...';

  @override
  String get preparingThePdfToShare => 'تحضير ملف PDF للمشاركة...';

  @override
  String get errorHappenedCouldntShareThePdf =>
      'حدث خطأ، لم يتمكن من مشاركة ملف PDF!!!';

  @override
  String get search => 'بحث';

  @override
  String get searchMealsUsingAi => 'بحث عن وجبات باستخدام الذكاء الإصطناعي';

  @override
  String get clear => 'إزالة';

  @override
  String get meals => 'وجبات';

  @override
  String get ingredients => 'المكونات والمقادير';

  @override
  String get recipe => 'طريقة التحضير';

  @override
  String hi(String name) {
    return 'مرحبًا $name 👋 ';
  }

  @override
  String get whatDoYouWantToEat => 'ما الذي ترغب في تناوله؟';

  @override
  String get categories => 'الفئات';

  @override
  String get areYouSureYouWantToRemoveThisMealFromFavorites =>
      'هل أنت متأكد أنك تريد إزالة هذا الوجبة من المفضلات؟';

  @override
  String get appOverview => 'نظرة عامة';

  @override
  String get appOverviewdetailed =>
      '**تطبيق التوعية بسرطان الثدي** هو أداة شاملة مصممة لزيادة الوعي وتعزيز الكشف المبكر عن سرطان الثدي. ويتناول أربعة جوانب رئيسية: توفير `المعلومات والتوعية`، وتسهيل `الفحص الذاتي` من خلال أداة فحص الأعراض، ومساعدة الأطباء من خلال `نماذج التعلم العميق` للكشف، وتقديم `مصادر` الدعم و`التوجيه` للمرضى.\n* **الغرض:** تم إنشاء التطبيق بهدف أساسي هو تمكين الأفراد من تولي مسؤولية صحة الثدي. من خلال دمج المعلومات وأدوات الفحص الذاتي ونماذج الكشف المتقدمة والمصادر الداعمة، نهدف إلى المساهمة في الكشف المبكر عن سرطان الثدي وإدارته.\n* **الجمهور المستهدف:** يمتد جمهورنا المستهدف على نطاق واسع، بما في ذلك الأفراد من جميع الأجناس المهتمين بالتوعية بصحة الثدي، والذين يقومون بالفحوصات الذاتية، والأطباء الأخصائيين الذين يبحثون عن أدوات تشخيصية متقدمة، والمرضى الذين يحتاجون إلى الدعم والتوجيه.\n\n**الميزات الرئيسية**\n* **مركز المعلومات: ** معلومات يمكن الوصول إليها عن سرطان الثدي وأعراضه وعوامل الخطر والتدابير الوقائية.\n* **مدقق الأعراض:** أداة فحص ذاتي تفاعلية توجه المستخدمين خلال عملية اكتشاف الأعراض المحتملة.\n* **نماذج التعلم العميق:** نماذج ذكاء اصطناعي متقدمة للأطباء، تساعد في الكشف عن سرطان الثدي من خلال صور الأشعة السينية للثدي والنسيجي (هيستوباثولوجي).\n* **دعم المرضى:** توجيه التغذية والنظام الغذائي وممارسة التمارين الرياضية ، بالإضافة إلى برنامج chatbot الذي يوفر الإجابات والإرشادات من خلال إمكانيات تحويل النص إلى كلام وتحويل الكلام إلى نص.\n\n**البيانات والأبحاث**\n* **تطبيق التوعية بسرطان الثدي ** مبني على أساس البحث والتعاون مع الأطباء والأخصائيين. لقد قمنا بدمج رؤى من الدراسات العلمية واستشارة خبراء في هذا المجال لتطوير نماذج التعلم العميق. يتم تنظيم محتوى التطبيق بناءً على معلومات قائمة وموثوقة لضمان الدقة والإعتمادية.\n\n**الخصوصية و معلومات الإتصال**';

  @override
  String get contactUs => 'تواصل معنا عبر هذا البريد الإلكتروني';

  @override
  String get app => '';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get termsOfService => 'شروط الإستخدام';
}
