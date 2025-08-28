 // هذا الملف يحتوي على كل شيء: تعريف النموذج وقائمة الـ 100 تمرين الكاملة مع روابط GIF

// تعريف "بطاقة التعريف" لكل تمرين
class MartialArtsExercise {
  final int id;
  final String nameAr;
  final String nameEn;
  final String category;
  final String difficulty;
  final String gifUrl; // تم تغيير الاسم هنا ليعكس أنه رابط
  final int duration;
  final int calories;
  final List<String> targetMuscles;
  final String equipment;

  const MartialArtsExercise({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.category,
    required this.difficulty,
    required this.gifUrl,
    required this.duration,
    required this.calories,
    required this.targetMuscles,
    required this.equipment,
  });
}

// قائمة التمارين الكاملة (100 تمرين)
List<MartialArtsExercise> allExercises = [
  // --- تمارين الكاراتيه (20 تمرين) ---
  MartialArtsExercise(
    id: 1, nameAr: "الضربة المباشرة", nameEn: "Straight Punch", category: "الكاراتيه", difficulty: "مبتدئ",
    gifUrl: "https://i.pinimg.com/originals/9a/36/f1/9a/36f111307613573d5b0350328775f0.gif",
    duration: 30, calories: 50, targetMuscles: ["صدر", "ترايسبس", "كتف"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 2, nameAr: "الركلة الأمامية", nameEn: "Front Kick", category: "الكاراتيه", difficulty: "مبتدئ",
    gifUrl: "https://i.makeagif.com/media/10-09-2015/e_l709.gif",
    duration: 30, calories: 60, targetMuscles: ["فخذ", "بطن", "أرداف"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 3, nameAr: "الركلة الجانبية", nameEn: "Side Kick", category: "الكاراتيه", difficulty: "متوسط",
    gifUrl: "https://thumbs.gfycat.com/SoftTemptingGourami-size_restricted.gif",
    duration: 35, calories: 70, targetMuscles: ["فخذ", "جانبي البطن", "أرداف"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 4, nameAr: "دفاع علوي", nameEn: "High Block", category: "الكاراتيه", difficulty: "مبتدئ",
    gifUrl: "https://i.imgur.com/80D488r.gif",
    duration: 25, calories: 40, targetMuscles: ["كتف", "ترايسبس", "ظهر"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 5, nameAr: "دفاع متوسط", nameEn: "Middle Block", category: "الكاراتيه", difficulty: "مبتدئ",
    gifUrl: "https://i.imgur.com/00H8g7a.gif",
    duration: 25, calories: 40, targetMuscles: ["ذراع", "كتف", "ظهر"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 6, nameAr: "كاتا أساسي", nameEn: "Basic Kata", category: "الكاراتيه", difficulty: "مبتدئ",
    gifUrl: "https://i.pinimg.com/originals/e7/17/a1/e717a15185a165a287682bf554188f63.gif",
    duration: 120, calories: 150, targetMuscles: ["جسم كامل"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 7, nameAr: "الضربة الدائرية", nameEn: "Roundhouse Punch", category: "الكاراتيه", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/dJ8vG3z.gif",
    duration: 30, calories: 55, targetMuscles: ["صدر", "كتف", "ظهر"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 8, nameAr: "الركلة الدائرية", nameEn: "Roundhouse Kick", category: "الكاراتيه", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/G5g2efV.gif",
    duration: 35, calories: 75, targetMuscles: ["فخذ", "بطن", "أرداف"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 9, nameAr: "دفاع سفلي", nameEn: "Low Block", category: "الكاراتيه", difficulty: "مبتدئ",
    gifUrl: "https://i.imgur.com/g0t7Z1o.gif",
    duration: 25, calories: 40, targetMuscles: ["ذراع", "كتف", "ظهر"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 10, nameAr: "حركة القدم السريعة", nameEn: "Footwork", category: "الكاراتيه", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/iOqvqza.gif",
    duration: 45, calories: 80, targetMuscles: ["أرجل", "بطن", "ظهر"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 11, nameAr: "ضربة الكوع", nameEn: "Elbow Strike", category: "الكاراتيه", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/3i4A3bS.gif",
    duration: 30, calories: 60, targetMuscles: ["كتف", "صدر", "ترايسبس"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 12, nameAr: "ضربة الركبة", nameEn: "Knee Strike", category: "الكاراتيه", difficulty: "متوسط",
    gifUrl: "https://acefitness.org/wp-content/uploads/2021/11/2021-11-15_Move-of-the-Week_Knee-Strike.gif",
    duration: 30, calories: 65, targetMuscles: ["فخذ", "بطن", "أرداف"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 13, nameAr: "الضربة القاضية", nameEn: "Knockout Punch", category: "الكاراتيه", difficulty: "متقدم",
    gifUrl: "https://i.makeagif.com/media/11-20-2015/VDB02n.gif",
    duration: 25, calories: 70, targetMuscles: ["صدر", "كتف", "ترايسبس"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 14, nameAr: "الركلة الخلفية", nameEn: "Back Kick", category: "الكاراتيه", difficulty: "متقدم",
    gifUrl: "https://i0.wp.com/boec.com/wp-content/uploads/2018/11/back-kick.gif?ssl=1",
    duration: 35, calories: 80, targetMuscles: ["أرداف", "فخذ", "ظهر"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 15, nameAr: "الدفاع المتقدم", nameEn: "Advanced Block", category: "الكاراتيه", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/6h0uP7v.gif",
    duration: 30, calories: 50, targetMuscles: ["ذراع", "كتف", "ظهر"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 16, nameAr: "كاتا متقدم", nameEn: "Advanced Kata", category: "الكاراتيه", difficulty: "متقدم",
    gifUrl: "https://i.makeagif.com/media/7-29-2016/5K07hC.gif",
    duration: 180, calories: 200, targetMuscles: ["جسم كامل"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 17, nameAr: "الضربة السريعة", nameEn: "Speed Punch", category: "الكاراتيه", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/UdyVQuK.gif",
    duration: 20, calories: 45, targetMuscles: ["صدر", "ترايسبس", "كتف"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 18, nameAr: "الركلة السريعة", nameEn: "Speed Kick", category: "الكاراتيه", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/fV3b7bQ.gif",
    duration: 25, calories: 60, targetMuscles: ["فخذ", "بطن", "أرداف"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 19, nameAr: "التوازن على قدم واحدة", nameEn: "One Leg Balance", category: "الكاراتيه", difficulty: "مبتدئ",
    gifUrl: "https://i.imgur.com/8QG8z8h.gif",
    duration: 40, calories: 50, targetMuscles: ["أرجل", "بطن", "ظهر"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 20, nameAr: "القفز والركلة", nameEn: "Jumping Kick", category: "الكاراتيه", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/6Xy1R8A.gif",
    duration: 30, calories: 85, targetMuscles: ["أرجل", "بطن", "أرداف"], equipment: "بدون",
  ),

  // --- تمارين التايكوندو (20 تمرين) ---
  MartialArtsExercise(
    id: 21, nameAr: "الركلة الأمامية", nameEn: "Front Kick", category: "التايكوندو", difficulty: "مبتدئ",
    gifUrl: "https://i.imgur.com/j1wG2iV.gif",
    duration: 30, calories: 60, targetMuscles: ["فخذ", "بطن", "أرداف"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 22, nameAr: "الركلة الجانبية", nameEn: "Side Kick", category: "التايكوندو", difficulty: "متوسط",
    gifUrl: "https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExM3p0eGNtdXRpdjM5ejBua2s0dGJ5ajl2b2JjaHZrbXo5Nmc1b3RsayZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/kHy2325Eno4dZH5Cna/giphy.gif",
    duration: 35, calories: 70, targetMuscles: ["فخذ", "جانبي البطن", "أرداف"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 23, nameAr: "الركلة الدائرية", nameEn: "Roundhouse Kick", category: "التايكوندو", difficulty: "متوسط",
    gifUrl: "https://thumbs.gfycat.com/AbleDeliciousAmericanpainthorse-size_restricted.gif",
    duration: 35, calories: 75, targetMuscles: ["فخذ", "بطن", "أرداف"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 24, nameAr: "ركلة القفز", nameEn: "Jumping Kick", category: "التايكوندو", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/mS9Wn7c.gif",
    duration: 30, calories: 85, targetMuscles: ["أرجل", "بطن", "أرداف"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 25, nameAr: "الركلة الخلفية", nameEn: "Back Kick", category: "التايكوندو", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/k2G7sC3.gif",
    duration: 35, calories: 80, targetMuscles: ["أرداف", "فخذ", "ظهر"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 26, nameAr: "الركلة الخطافية", nameEn: "Hook Kick", category: "التايكوندو", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/W2o2X0U.gif",
    duration: 35, calories: 75, targetMuscles: ["فخذ", "بطن", "أرداف"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 27, nameAr: "دفاع التايكوندو", nameEn: "Taekwondo Block", category: "التايكوندو", difficulty: "مبتدئ",
    gifUrl: "https://i.imgur.com/M6L7N33.gif",
    duration: 25, calories: 40, targetMuscles: ["ذراع", "كتف", "ظهر"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 28, nameAr: "بولراك أساسي", nameEn: "Basic Poomsae", category: "التايكوندو", difficulty: "مبتدئ",
    gifUrl: "https://i.imgur.com/h5vYn6Q.gif",
    duration: 120, calories: 150, targetMuscles: ["جسم كامل"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 29, nameAr: "الركلة المزدوجة", nameEn: "Double Kick", category: "التايكوندو", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/0i1s3bL.gif",
    duration: 30, calories: 90, targetMuscles: ["فخذ", "بطن", "أرداف"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 30, nameAr: "ركلة الدوران", nameEn: "Spinning Kick", category: "التايكوندو", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/0I5d2q0.gif",
    duration: 35, calories: 95, targetMuscles: ["أرجل", "بطن", "ظهر"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 31, nameAr: "ركلة المقص", nameEn: "Scissor Kick", category: "التايكوندو", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/8xY6P0d.gif",
    duration: 30, calories: 80, targetMuscles: ["فخذ", "بطن", "أرداف"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 32, nameAr: "ركلة المحور", nameEn: "Axe Kick", category: "التايكوندو", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/qFp3y5b.gif",
    duration: 35, calories: 85, targetMuscles: ["فخذ", "بطن", "ظهر"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 33, nameAr: "دفاع متقدم", nameEn: "Advanced Block", category: "التايكوندو", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/k1R1x5y.gif",
    duration: 30, calories: 50, targetMuscles: ["ذراع", "كتف", "ظهر"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 34, nameAr: "التوازن والركلة", nameEn: "Balance and Kick", category: "التايكوندو", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/8QG8z8h.gif",
    duration: 40, calories: 70, targetMuscles: ["أرجل", "بطن", "ظهر"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 35, nameAr: "الركلة السريعة", nameEn: "Speed Kick", category: "التايكوندو", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/fV3b7bQ.gif",
    duration: 25, calories: 65, targetMuscles: ["فخذ", "بطن", "أرداف"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 36, nameAr: "ركلة القفز العالي", nameEn: "High Jump Kick", category: "التايكوندو", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/Q2h3G5y.gif",
    duration: 30, calories: 95, targetMuscles: ["أرجل", "بطن", "أرداف"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 37, nameAr: "ركلة الدوران السريع", nameEn: "Fast Spinning Kick", category: "التايكوندو", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/x0q4w4y.gif",
    duration: 30, calories: 90, targetMuscles: ["أرجل", "بطن", "ظهر"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 38, nameAr: "دفاع وركلة", nameEn: "Block and Kick", category: "التايكوندو", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/2Xy8R5Z.gif",
    duration: 35, calories: 75, targetMuscles: ["ذراع", "فخذ", "بطن"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 39, nameAr: "ركلة متتالية", nameEn: "Combo Kick", category: "التايكوندو", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/y1r9z5B.gif",
    duration: 40, calories: 100, targetMuscles: ["فخذ", "بطن", "أرداف"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 40, nameAr: "بولراك متقدم", nameEn: "Advanced Poomsae", category: "التايكوندو", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/w9z5C4e.gif",
    duration: 180, calories: 200, targetMuscles: ["جسم كامل"], equipment: "بدون",
  ),

  // --- تمارين الملاكمة (15 تمرين) ---
  MartialArtsExercise(
    id: 41, nameAr: "اللكمة المستقيمة", nameEn: "Jab", category: "الملاكمة", difficulty: "مبتدئ",
    gifUrl: "https://i.gifer.com/origin/f2/f233f277a0b5a7b69a2a78f237f86f8b_w200.gif",
    duration: 25, calories: 45, targetMuscles: ["صدر", "ترايسبس", "كتف"], equipment: "قفازات",
  ),
  MartialArtsExercise(
    id: 42, nameAr: "اللكمة القوية", nameEn: "Cross", category: "الملاكمة", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/0hV2Y2b.gif",
    duration: 25, calories: 50, targetMuscles: ["صدر", "كتف", "ظهر"], equipment: "قفازات",
  ),
  MartialArtsExercise(
    id: 43, nameAr: "اللكمة الخطافية", nameEn: "Hook", category: "الملاكمة", difficulty: "متوسط",
    gifUrl: "https://jiujitsulegacy.com/wp-content/uploads/2021/04/hook-punch.gif",
    duration: 30, calories: 55, targetMuscles: ["صدر", "كتف", "جانبي البطن"], equipment: "قفازات",
  ),
  MartialArtsExercise(
    id: 44, nameAr: "اللكمة العلوية", nameEn: "Uppercut", category: "الملاكمة", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/1B9n4mH.gif",
    duration: 30, calories: 60, targetMuscles: ["صدر", "كتف", "بطن"], equipment: "قفازات",
  ),
  MartialArtsExercise(
    id: 45, nameAr: "التمايل", nameEn: "Slip", category: "الملاكمة", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/J4j5d4f.gif",
    duration: 20, calories: 35, targetMuscles: ["بطن", "ظهر", "أرجل"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 46, nameAr: "الانحناء", nameEn: "Bob and Weave", category: "الملاكمة", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/5y4f3eA.gif",
    duration: 25, calories: 40, targetMuscles: ["أرجل", "بطن", "ظهر"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 47, nameAr: "الحركة الدائرية", nameEn: "Footwork", category: "الملاكمة", difficulty: "مبتدئ",
    gifUrl: "https://i.imgur.com/n3T3R3e.gif",
    duration: 40, calories: 70, targetMuscles: ["أرجل", "بطن", "ظهر"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 48, nameAr: "حماية الوجه", nameEn: "Guard", category: "الملاكمة", difficulty: "مبتدئ",
    gifUrl: "https://i.imgur.com/m5h6y4r.gif",
    duration: 20, calories: 30, targetMuscles: ["ذراع", "كتف", "ظهر"], equipment: "قفازات",
  ),
  MartialArtsExercise(
    id: 49, nameAr: "الضربات المتتالية", nameEn: "Combination", category: "الملاكمة", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/4q4V5vR.gif",
    duration: 35, calories: 75, targetMuscles: ["صدر", "كتف", "ترايسبس"], equipment: "قفازات",
  ),
  MartialArtsExercise(
    id: 50, nameAr: "الدفاع ضد الضربات", nameEn: "Defense", category: "الملاكمة", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/1C7n9eR.gif",
    duration: 30, calories: 50, targetMuscles: ["ذراع", "كتف", "ظهر"], equipment: "قفازات",
  ),
  MartialArtsExercise(
    id: 51, nameAr: "اللكمة السريعة", nameEn: "Speed Punch", category: "الملاكمة", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/x4f5v5e.gif",
    duration: 20, calories: 45, targetMuscles: ["صدر", "ترايسبس", "كتف"], equipment: "قفازات",
  ),
  MartialArtsExercise(
    id: 52, nameAr: "اللكمة القفاز", nameEn: "Glove Punch", category: "الملاكمة", difficulty: "مبتدئ",
    gifUrl: "https://i.imgur.com/9v6d5hR.gif",
    duration: 25, calories: 50, targetMuscles: ["صدر", "كتف", "ترايسبس"], equipment: "قفازات",
  ),
  MartialArtsExercise(
    id: 53, nameAr: "اللكمة المزدوجة", nameEn: "Double Punch", category: "الملاكمة", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/6Xy1R8A.gif",
    duration: 25, calories: 60, targetMuscles: ["صدر", "كتف", "ترايسبس"], equipment: "قفازات",
  ),
  MartialArtsExercise(
    id: 54, nameAr: "اللكمة الدائرية", nameEn: "Circular Punch", category: "الملاكمة", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/dJ8vG3z.gif",
    duration: 30, calories: 55, targetMuscles: ["صدر", "كتف", "جانبي البطن"], equipment: "قفازات",
  ),
  MartialArtsExercise(
    id: 55, nameAr: "اللكمة القاضية", nameEn: "Knockout Punch", category: "الملاكمة", difficulty: "متقدم",
    gifUrl: "https://i.makeagif.com/media/11-20-2015/VDB02n.gif",
    duration: 25, calories: 65, targetMuscles: ["صدر", "كتف", "ترايسبس"], equipment: "قفازات",
  ),

  // --- تمارين الكونغ فو (15 تمرين) ---
  MartialArtsExercise(
    id: 56, nameAr: "حركة النمر", nameEn: "Tiger Style", category: "الكونغ فو", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/8Q9Z5bQ.gif",
    duration: 40, calories: 80, targetMuscles: ["أرجل", "بطن", "ظهر"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 57, nameAr: "حركة الثعبان", nameEn: "Snake Style", category: "الكونغ فو", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/7p4x5vR.gif",
    duration: 45, calories: 85, targetMuscles: ["بطن", "ظهر", "أرجل"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 58, nameAr: "حركة الكرني", nameEn: "Crane Style", category: "الكونغ فو", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/5y4f3eA.gif",
    duration: 40, calories: 75, targetMuscles: ["أرجل", "بطن", "ظهر"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 59, nameAr: "حركة التنين", nameEn: "Dragon Style", category: "الكونغ فو", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/0i1s3bL.gif",
    duration: 50, calories: 95, targetMuscles: ["جسم كامل"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 60, nameAr: "حركة القرد", nameEn: "Monkey Style", category: "الكونغ فو", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/0I5d2q0.gif",
    duration: 45, calories: 90, targetMuscles: ["أرجل", "بطن", "ظهر"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 61, nameAr: "اللكمة اللولبية", nameEn: "Screw Punch", category: "الكونغ فو", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/1B9n4mH.gif",
    duration: 30, calories: 60, targetMuscles: ["صدر", "كتف", "ترايسبس"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 62, nameAr: "الركلة الدائرية", nameEn: "Circle Kick", category: "الكونغ فو", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/G5g2efV.gif",
    duration: 35, calories: 75, targetMuscles: ["فخذ", "بطن", "أرداف"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 63, nameAr: "حركة اليد اللينة", nameEn: "Soft Hand", category: "الكونغ فو", difficulty: "مبتدئ",
    gifUrl: "https://i.imgur.com/m6L7N33.gif",
    duration: 35, calories: 65, targetMuscles: ["ذراع", "كتف", "ظهر"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 64, nameAr: "التوازن على قدم واحدة", nameEn: "One Leg Balance", category: "الكونغ فو", difficulty: "مبتدئ",
    gifUrl: "https://i.imgur.com/8QG8z8h.gif",
    duration: 40, calories: 70, targetMuscles: ["أرجل", "بطن", "ظهر"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 65, nameAr: "الدوران", nameEn: "Spin", category: "الكونغ فو", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/x0q4w4y.gif",
    duration: 30, calories: 80, targetMuscles: ["بطن", "ظهر", "أرجل"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 66, nameAr: "القفز والضربة", nameEn: "Jump and Strike", category: "الكونغ فو", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/Q2h3G5y.gif",
    duration: 35, calories: 85, targetMuscles: ["أرجل", "بطن", "ظهر"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 67, nameAr: "الدفاع الدائري", nameEn: "Circular Defense", category: "الكونغ فو", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/k1R1x5y.gif",
    duration: 30, calories: 60, targetMuscles: ["ذراع", "كتف", "ظهر"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 68, nameAr: "الضربة السريعة", nameEn: "Quick Strike", category: "الكونغ فو", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/UdyVQuK.gif",
    duration: 25, calories: 55, targetMuscles: ["صدر", "ترايسبس", "كتف"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 69, nameAr: "الحركة الأرضية", nameEn: "Ground Movement", category: "الكونغ فو", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/8xY6P0d.gif",
    duration: 45, calories: 90, targetMuscles: ["بطن", "ظهر", "أرجل"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 70, nameAr: "التأمل والحركة", nameEn: "Meditation and Movement", category: "الكونغ فو", difficulty: "مبتدئ",
    gifUrl: "https://i.imgur.com/5y4f3eA.gif",
    duration: 60, calories: 100, targetMuscles: ["جسم كامل"], equipment: "بدون",
  ),

  // --- تمارين الجيو جيتسو (15 تمرين) ---
  MartialArtsExercise(
    id: 71, nameAr: "الخنق الخلفي", nameEn: "Rear Naked Choke", category: "الجيو جيتسو", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/8V5Zz9A.gif",
    duration: 40, calories: 85, targetMuscles: ["ذراع", "ظهر", "بطن"], equipment: "حصيرة",
  ),
  MartialArtsExercise(
    id: 72, nameAr: "قفل الذراع", nameEn: "Armbar", category: "الجيو جيتسو", difficulty: "متوسط",
    gifUrl: "https://jiujitsutimes.com/wp-content/uploads/arm-bar.gif",
    duration: 35, calories: 80, targetMuscles: ["ذراع", "ظهر", "بطن"], equipment: "حصيرة",
  ),
  MartialArtsExercise(
    id: 73, nameAr: "مثلث الرأس", nameEn: "Triangle Choke", category: "الجيو جيتسو", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/6Xy1R8A.gif",
    duration: 45, calories: 90, targetMuscles: ["أرجل", "بطن", "ظهر"], equipment: "حصيرة",
  ),
  MartialArtsExercise(
    id: 74, nameAr: "التدحرج الأمامي", nameEn: "Forward Roll", category: "الجيو جيتسو", difficulty: "مبتدئ",
    gifUrl: "https://i.imgur.com/j1wG2iV.gif",
    duration: 25, calories: 50, targetMuscles: ["بطن", "ظهر", "أرجل"], equipment: "حصيرة",
  ),
  MartialArtsExercise(
    id: 75, nameAr: "التدحرج الخلفي", nameEn: "Backward Roll", category: "الجيو جيتسو", difficulty: "مبتدئ",
    gifUrl: "https://i.imgur.com/k2G7sC3.gif",
    duration: 25, calories: 50, targetMuscles: ["بطن", "ظهر", "أرجل"], equipment: "حصيرة",
  ),
  MartialArtsExercise(
    id: 76, nameAr: "الهروب من التثبيت", nameEn: "Escape", category: "الجيو جيتسو", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/8xY6P0d.gif",
    duration: 30, calories: 65, targetMuscles: ["بطن", "ظهر", "أرجل"], equipment: "حصيرة",
  ),
  MartialArtsExercise(
    id: 77, nameAr: "القفص", nameEn: "Guard", category: "الجيو جيتسو", difficulty: "مبتدئ",
    gifUrl: "https://i.imgur.com/1C7n9eR.gif",
    duration: 30, calories: 60, targetMuscles: ["أرجل", "بطن", "ظهر"], equipment: "حصيرة",
  ),
  MartialArtsExercise(
    id: 78, nameAr: "القفص المغلق", nameEn: "Closed Guard", category: "الجيو جيتسو", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/m5h6y4r.gif",
    duration: 35, calories: 70, targetMuscles: ["أرجل", "بطن", "ظهر"], equipment: "حصيرة",
  ),
  MartialArtsExercise(
    id: 79, nameAr: "القفص المفتوح", nameEn: "Open Guard", category: "الجيو جيتسو", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/9v6d5hR.gif",
    duration: 35, calories: 70, targetMuscles: ["أرجل", "بطن", "ظهر"], equipment: "حصيرة",
  ),
  MartialArtsExercise(
    id: 80, nameAr: "الخنق المقصي", nameEn: "Guillotine Choke", category: "الجيو جيتسو", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/0I5d2q0.gif",
    duration: 40, calories: 85, targetMuscles: ["ذراع", "ظهر", "بطن"], equipment: "حصيرة",
  ),
  MartialArtsExercise(
    id: 81, nameAr: "قفل الركبة", nameEn: "Knee Bar", category: "الجيو جيتسو", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/qFp3y5b.gif",
    duration: 40, calories: 80, targetMuscles: ["أرجل", "ظهر", "بطن"], equipment: "حصيرة",
  ),
  MartialArtsExercise(
    id: 82, nameAr: "قفل الكاحل", nameEn: "Ankle Lock", category: "الجيو جيتسو", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/x0q4w4y.gif",
    duration: 35, calories: 75, targetMuscles: ["أرجل", "ظهر", "بطن"], equipment: "حصيرة",
  ),
  MartialArtsExercise(
    id: 83, nameAr: "الهروب من الخنق", nameEn: "Choke Escape", category: "الجيو جيتسو", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/2Xy8R5Z.gif",
    duration: 30, calories: 65, targetMuscles: ["بطن", "ظهر", "ذراع"], equipment: "حصيرة",
  ),
  MartialArtsExercise(
    id: 84, nameAr: "الهروب من القفل", nameEn: "Lock Escape", category: "الجيو جيتسو", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/y1r9z5B.gif",
    duration: 30, calories: 65, targetMuscles: ["بطن", "ظهر", "ذراع"], equipment: "حصيرة",
  ),
  MartialArtsExercise(
    id: 85, nameAr: "التثبيت الأرضي", nameEn: "Ground Pin", category: "الجيو جيتسو", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/w9z5C4e.gif",
    duration: 35, calories: 70, targetMuscles: ["بطن", "ظهر", "أرجل"], equipment: "حصيرة",
  ),

  // --- تمارين الأسلحة (10 تمارين) ---
  MartialArtsExercise(
    id: 86, nameAr: "الضربات بالعصا", nameEn: "Staff Strikes", category: "الأسلحة", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/pYm9F3B.gif",
    duration: 40, calories: 90, targetMuscles: ["ذراع", "كتف", "ظهر"], equipment: "عصا طويلة",
  ),
  MartialArtsExercise(
    id: 87, nameAr: "الدفاع بالعصا", nameEn: "Staff Defense", category: "الأسلحة", difficulty: "متوسط",
    gifUrl: "https://i.imgur.com/k1R1x5y.gif",
    duration: 45, calories: 95, targetMuscles: ["ذراع", "كتف", "ظهر"], equipment: "عصا طويلة",
  ),
  MartialArtsExercise(
    id: 88, nameAr: "حركات الننشاكو", nameEn: "Nunchaku Moves", category: "الأسلحة", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/0i1s3bL.gif",
    duration: 50, calories: 100, targetMuscles: ["ذراع", "كتف", "ظهر"], equipment: "ننشاكو",
  ),
  MartialArtsExercise(
    id: 89, nameAr: "الضربات بالساي", nameEn: "Sai Strikes", category: "الأسلحة", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/0I5d2q0.gif",
    duration: 45, calories: 95, targetMuscles: ["ذراع", "كتف", "ظهر"], equipment: "ساي",
  ),
  MartialArtsExercise(
    id: 90, nameAr: "القطع بالسيف", nameEn: "Sword Cuts", category: "الأسلحة", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/qFp3y5b.gif",
    duration: 50, calories: 100, targetMuscles: ["ذراع", "كتف", "ظهر"], equipment: "سيف",
  ),
  MartialArtsExercise(
    id: 91, nameAr: "الدفاع بالسيف", nameEn: "Sword Defense", category: "الأسلحة", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/x0q4w4y.gif",
    duration: 45, calories: 95, targetMuscles: ["ذراع", "كتف", "ظهر"], equipment: "سيف",
  ),
  MartialArtsExercise(
    id: 92, nameAr: "الرمي بالنجوم", nameEn: "Shuriken Throwing", category: "الأسلحة", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/2Xy8R5Z.gif",
    duration: 40, calories: 85, targetMuscles: ["ذراع", "كتف", "ظهر"], equipment: "نجوم",
  ),
  MartialArtsExercise(
    id: 93, nameAr: "حركات متقدمة بالعصا", nameEn: "Advanced Staff Moves", category: "الأسلحة", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/y1r9z5B.gif",
    duration: 55, calories: 105, targetMuscles: ["ذراع", "كتف", "ظهر"], equipment: "عصا طويلة",
  ),
  MartialArtsExercise(
    id: 94, nameAr: "الدفاع ضد السكين", nameEn: "Knife Defense", category: "الأسلحة", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/w9z5C4e.gif",
    duration: 50, calories: 100, targetMuscles: ["ذراع", "كتف", "ظهر"], equipment: "سكين تدريب",
  ),
  MartialArtsExercise(
    id: 95, nameAr: "الهجوم بالسكين", nameEn: "Knife Attack", category: "الأسلحة", difficulty: "متقدم",
    gifUrl: "https://i.imgur.com/UdyVQuK.gif",
    duration: 45, calories: 95, targetMuscles: ["ذراع", "كتف", "ظهر"], equipment: "سكين تدريب",
  ),

  // --- تمارين اللياقة البدنية (5 تمارين) ---
  MartialArtsExercise(
    id: 96, nameAr: "تمرين الضغط", nameEn: "Push-up", category: "اللياقة", difficulty: "مبتدئ",
    gifUrl: "https://www.inspireusafoundation.org/wp-content/uploads/2021/08/push-up.gif",
    duration: 30, calories: 60, targetMuscles: ["صدر", "ترايسبس", "كتف"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 97, nameAr: "تمرين البطن", nameEn: "Sit-up", category: "اللياقة", difficulty: "مبتدئ",
    gifUrl: "https://i.imgur.com/1C7n9eR.gif",
    duration: 30, calories: 55, targetMuscles: ["بطن", "ظهر"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 98, nameAr: "تمرين القرفصاء", nameEn: "Squat", category: "اللياقة", difficulty: "مبتدئ",
    gifUrl: "https://www.inspireusafoundation.org/wp-content/uploads/2022/04/bodyweight-squat.gif",
    duration: 35, calories: 65, targetMuscles: ["أرجل", "أرداف", "ظهر"], equipment: "بدون",
  ),
  MartialArtsExercise(
    id: 99, nameAr: "تمرين البلانك", nameEn: "Plank", category: "اللياقة", difficulty: "متوسط",
    gifUrl: "https://media1.popsugar-assets.com/files/thumbor/t2vDm44t123h24QGgmjT21M_2pA/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2017/06/13/788/n/1922729/493b684959402e2eb0c8d9.49755998_edit_img_gif_43542341_1495563959/i/Beginner-Ab-Workout.gif",
    duration: 40, calories: 70, targetMuscles: ["بطن", "ظهر", "أرجل"], equipment: "بدون",
  ),MartialArtsExercise(
    id: 100,
    nameAr: "تمرين القفز",
    nameEn: "Jumping Jack",
    category: "اللياقة",
    difficulty: "مبتدئ",
    gifUrl: "https://i.pinimg.com/originals/c7/2a/3b/c72a3b1e336d36e84d5218c545362c3f.gif",
    duration: 30,
    calories: 75,
    targetMuscles: ["أرجل", "بطن", "ظهر"],
    equipment: "بدون",
  ),
]; // <--- تأكد من أن الملف ينتهي بهذين الرمزين
