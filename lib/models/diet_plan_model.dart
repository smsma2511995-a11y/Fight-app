// هذا الملف يحتوي على "بطاقات التعريف" لكل ما يتعلق بخطط التغذية

class DietPlan {
  final String title;
  final String description;
  final List<Meal> meals; // كل خطة تحتوي على قائمة من الوجبات

  DietPlan({
    required this.title,
    required this.description,
    required this.meals,
  });
}

class Meal {
  final String name; // مثل: "وجبة الإفطار"
  final String foodItems; // مثل: "شوفان، حليب، وموز"
  final int calories;

  Meal({
    required this.name,
    required this.foodItems,
    required this.calories,
  });
}
```
5.  انزل للأسفل واضغط على الزر الأخضر **"Commit new file"**.

---

#### الخطوة 2: إنشاء بيانات التغذية (`diet_plans_seed.dart`)

الآن، سننشئ بعض البيانات المؤقتة لخطط التغذية.

1.  اذهب إلى مستودعك على GitHub.
2.  اضغط على زر **"Add file"** واختر **"Create new file"**.
3.  في خانة اسم الملف، اكتب هذا المسار:
    ```
    lib/data/diet_plans_seed.dart
    ```
4.  **انسخ كل الكود الموجود في المربع التالي** والصقه في محرر الكود.

<br>

📋 **انسخ هذا الكود بالكامل لملف `lib/data/diet_plans_seed.dart`:**
```dart
import 'package:fight_app/models/diet_plan_model.dart';

final List<DietPlan> allDietPlans = [
  DietPlan(
    title: "خطة لزيادة الوزن (عضل صافي)",
    description: "خطة غنية بالبروتين والسعرات الحرارية الصحية لبناء العضلات.",
    meals: [
      Meal(name: "الإفطار", foodItems: "3 بيضات، 1 كوب شوفان مع حليب، 1 موزة", calories: 500),
      Meal(name: "وجبة خفيفة", foodItems: "زبادي يوناني مع مكسرات", calories: 300),
      Meal(name: "الغداء", foodItems: "200 جرام صدر دجاج، 1.5 كوب أرز، سلطة خضراء", calories: 700),
      Meal(name: "وجبة خفيفة", foodItems: "مخفوق بروتين (Protein Shake)", calories: 250),
      Meal(name: "العشاء", foodItems: "150 جرام سلمون، بطاطا حلوة، بروكلي", calories: 600),
    ],
  ),
  DietPlan(
    title: "خطة لخسارة الدهون (الحفاظ على العضل)",
    description: "خطة متوازنة مع عجز بسيط في السعرات الحرارية لحرق الدهون.",
    meals: [
      Meal(name: "الإفطار", foodItems: "2 بيضة مسلوقة، شريحة توست أسمر، نصف أفوكادو", calories: 350),
      Meal(name: "وجبة خفيفة", foodItems: "تفاحة مع ملعقة زبدة فول سوداني", calories: 200),
      Meal(name: "الغداء", foodItems: "سلطة تونة كبيرة مع خضروات متنوعة", calories: 400),
      Meal(name: "وجبة خفيفة", foodItems: "حفنة من اللوز", calories: 150),
      Meal(name: "العشاء", foodItems: "150 جرام صدر دجاج مشوي، كينوا، سلطة", calories: 450),
    ],
  ),
  // يمكنك إضافة المزيد من الخطط هنا
];
