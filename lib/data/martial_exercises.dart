// نموذج التمرين: Exercise(name, description, image, category)
final List<Exercise> exercises = [

  // تمارين كاراتيه
  Exercise(
    name: 'اللكمة الأمامية',
    description: 'لكمة أساسية مُستقيمة (Jab) تعد أول درس يتعلمه المقاتلون في العديد من فنون القتال2.',
    image: 'https://upload.wikimedia.org/wikipedia/commons/7/78/Judo_Morote_Seoi_Nage_by_Bryan.gif',
    category: 'كاراتيه',
  ),
  Exercise(
    name: 'اللكمة الخلفية',
    description: 'لكمة قوية توجه باليد الخلفية مع دوران الجسم لإضافة قوة إضافية. تساعد على تحطيم توازن الخصم. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/1/14/Kumite_bracket.gif',
    category: 'كاراتيه',
  ),
  Exercise(
    name: 'اللكمة العلوية',
    description: 'لكمة تصاعدية تصوب نحو وجه الخصم من الأسفل إلى الأعلى، مثالية للقتال القريب. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Jud-seiza.gif',
    category: 'كاراتيه',
  ),
  Exercise(
    name: 'اللكمة الدائرية',
    description: 'لكمة دائرية قوية توجّه بحركة عرضية، تتطلب توازناً وتنسيقاً وتوقيتاً، إضافة إلى قوة الجسم ومرونة الساقين لتنفيذها بشكل صحيح3.',
    image: 'https://upload.wikimedia.org/wikipedia/commons/1/14/Kumite_bracket.gif',
    category: 'كاراتيه',
  ),
  Exercise(
    name: 'البلوك العلوي',
    description: 'حاجز تصاعدي يُستخدم لصد ضربات الخصم العالية، مع استخدام الساعد أو راحة اليد للوقاية. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/1/14/Kumite_bracket.gif',
    category: 'كاراتيه',
  ),
  Exercise(
    name: 'وضعية الحصان',
    description: 'وضعية ثابتة واسعة تدعم قوة الرجلين، تُمارس ببقاء الظهر مستقيمًا وتوجيه الركبتين نحو الخارج.',
    image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Jud-seiza.gif',
    category: 'كاراتيه',
  ),

  // تمارين كونغ فو
  Exercise(
    name: 'مخلب النمر',
    description: 'ضربة تستخدم راحة اليد المفتوحة وأصابع مشدودة تشبه مخالب النمر، تستهدف نقاط ضعف في جسم الخصم. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/1/14/Kumite_bracket.gif',
    category: 'كونغ فو',
  ),
  Exercise(
    name: 'ضربة التنين',
    description: 'لكمة قوية باليد ممدودة، مستوحاة من قوة التنين الأسطورية، تستهدف صدر أو ذراع الخصم. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/1/14/Kumite_bracket.gif',
    category: 'كونغ فو',
  ),
  Exercise(
    name: 'وضعية الكركي (قفزة الهواء)',
    description: 'وضعية تحاكي الطائر الكركي، تساعد في التوازن وحركة الطيران أثناء الركلات العالية. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Jud-seiza.gif',
    category: 'كونغ فو',
  ),
  Exercise(
    name: 'قبضة الثعبان',
    description: 'لكمة سريعة تحمل اسم الثعبان، حيث تكون الأصابع مثنية قليلاً لتوجيه قوة مركزة كلسعة. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Jud-seiza.gif',
    category: 'كونغ فو',
  ),
  Exercise(
    name: 'قبضة القرد',
    description: 'ضربة باليد مضمومة تشبه قبضة القرد، تُستخدم للضرب السريع والمتتابع نحو وجه الخصم. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Jud-seiza.gif',
    category: 'كونغ فو',
  ),

  // تمارين الجودو
  Exercise(
    name: 'رمية الورك الكبرى (Ō-goshi)',
    description: 'تقنية رمي تعتمد على خلق خلل في توازن الخصم من خلال سحبه واستخدام الورك لتنفيذ الرمية4.',
    image: 'https://upload.wikimedia.org/wikipedia/commons/7/78/Judo_Morote_Seoi_Nage_by_Bryan.gif',
    category: 'جودو',
  ),
  Exercise(
    name: 'الإخراج الخارجي الكبير (أوسوتوجاري)',
    description: 'تقنية رمي تقوم بسحب قدم الخصم الخلفية من مؤخرة فخذه، مع تدوير الجسم والارتكاز على الورك للطرح الأرضي5.',
    image: 'https://upload.wikimedia.org/wikipedia/commons/7/78/Judo_Morote_Seoi_Nage_by_Bryan.gif',
    category: 'جودو',
  ),
  Exercise(
    name: 'رمية الحذاء الخلفية (Harai Goshi)',
    description: 'تقنية رمي بالقدم يقوم فيها المنفذ بتمييع الحذاء الأمامي للخصم باستخدام جسده والورك، مما يؤدي لانقلاب الخصم أرضًا. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Jud-seiza.gif',
    category: 'جودو',
  ),
  Exercise(
    name: 'تمرين السقوط الآمن',
    description: 'تعلم كيفية السقوط بأمان على الأرض لحماية الجسم، عبر تدوير الظهر وانتشار الارتطام لتخفيف التأثير. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Jud-seiza.gif',
    category: 'جودو',
  ),
  Exercise(
    name: 'تمرين الثبات الأرضي',
    description: 'ممارسة السيطرة على الخصم على الأرض من خلال التحكم بالسواعد والجذع والورك. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Jud-seiza.gif',
    category: 'جودو',
  ),

  // تمارين الجيوجيتسو (المصارعة الأرضية)
  Exercise(
    name: 'مفتاح الذراع (Armbar)',
    description: 'خنق أو قفل يتم من وضع الرُّكوع أو الظهر، حيث يتم تمديد ذراع الخصم بعنف إلى الوراء لتثبيط مرفقه. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/7/78/Judo_Morote_Seoi_Nage_by_Bryan.gif',
    category: 'جيوجيتسو',
  ),
  Exercise(
    name: 'الخنق الثلاثي (Triangle Choke)',
    description: 'عقدة خنق تُنفَّذ من الرقبة والأرجل معًا، حيث تُحاصر رأس الخصم بين الفخذين لقطع تدفق الدم. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/7/78/Judo_Morote_Seoi_Nage_by_Bryan.gif',
    category: 'جيوجيتسو',
  ),
  Exercise(
    name: 'موقف الراكبة (Mount Position)',
    description: 'تحكم فيه المقاتل فوق صدر الخصم، مهيئاً نفسه لضربات مؤثرة أو قفل المفاصل. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Jud-seiza.gif',
    category: 'جيوجيتسو',
  ),
  Exercise(
    name: 'الركبة على البطن',
    description: 'وضع مهيمن يضع فيه المقاتل ركبةً فوق بطن الخصم، ما يزيد الضغط على حجاب الحاجز ويمنع الخصم من التنفس بعمق. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Jud-seiza.gif',
    category: 'جيوجيتسو',
  ),
  Exercise(
    name: 'التنقل الجانبي (Side Control)',
    description: 'وضع قتال يُحافظ فيه المقاتل على الاستقرار بجانب الخصم أرضًا من خلال توزيع الوزن والسيطرة بالذراعين. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Jud-seiza.gif',
    category: 'جيوجيتسو',
  ),

  // تمارين قتال الشوارع
  Exercise(
    name: 'لكمة مفاجئة',
    description: 'لكمة سريعة ومباشرة للمفاجأة، تستهدف مناطق حساسة كالوجه أو الصدر لكسب الوقت والاستفادة. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/1/14/Kumite_bracket.gif',
    category: 'قتال الشوارع',
  ),
  Exercise(
    name: 'دفع الخصم',
    description: 'دفعة قوية نحو الخصم لتفادي هجومه وإحداث مسافة بينكما، تُستخدم اللتان مع الساعد لدفع قوي. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/1/14/Kumite_bracket.gif',
    category: 'قتال الشوارع',
  ),
  Exercise(
    name: 'ركلة بالحوض',
    description: 'ركلة قوية تستهدف منطقة الحوض أو البطن للخصم، قد تكون من الأعلى أو من الأسفل لكسر توازنه. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/1/14/Kumite_bracket.gif',
    category: 'قتال الشوارع',
  ),
  Exercise(
    name: 'وقفة الدفاع (Clinch)',
    description: 'استلام وحجز الخصم عن قرب بالأذرع لضبطه وإعداد رميات أو ضربات قصيرة، مفيد في القتال الوثيق. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/1/14/Kumite_bracket.gif',
    category: 'قتال الشوارع',
  ),
  Exercise(
    name: 'الهروب من الحبال (Escape)',
    description: 'تمرين على الانفلات من تداخل الخصم مع الجسم (كيجل سكايب)، عن طريق تدوير الحوض والدفع. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/1/14/Kumite_bracket.gif',
    category: 'قتال الشوارع',
  ),

  // تمارين التايكوندو
  Exercise(
    name: 'ركلة أمامية (آب تشاجي)',
    description: 'ركلة تقدم الساق للأمام بإقلاع عالٍ وثني الركبة، تنتج القوة بدفع كامل للساق الأمامية6.',
    image: 'https://upload.wikimedia.org/wikipedia/commons/1/14/Kumite_bracket.gif',
    category: 'تايكوندو',
  ),
  Exercise(
    name: 'ركلة جانبية (يوب تشاجي)',
    description: 'ركلة يتم فيها تدوير الجسم 90 درجة وضرب الهدف بحافة القدم أو الكعب، مع بناء الزخم من الحوض والخصر7.',
    image: 'https://upload.wikimedia.org/wikipedia/commons/7/78/Judo_Morote_Seoi_Nage_by_Bryan.gif',
    category: 'تايكوندو',
  ),
  Exercise(
    name: 'ركلة الهلال (باندال تشاجي)',
    description: 'ركلة عالية بحركة هلالية تستهدف الرأس بحافة القدم أو الكعب، مع نوعين رئيسيين: من الداخل إلى الخارج أو العكس8.',
    image: 'https://upload.wikimedia.org/wikipedia/commons/7/78/Judo_Morote_Seoi_Nage_by_Bryan.gif',
    category: 'تايكوندو',
  ),
  Exercise(
    name: 'ركلة راوندهاوس (دوليو تشاجي)',
    description: 'ركلة شائعة تتطلب تدوير الوركين وتمديد الساق أثناء التوازن على الساق الأخرى، يمكن إيصال الضربة بباطن القدم أو الساق9.',
    image: 'https://upload.wikimedia.org/wikipedia/commons/7/78/Judo_Morote_Seoi_Nage_by_Bryan.gif',
    category: 'تايكوندو',
  ),
  Exercise(
    name: 'اللكمة بالساعد (Striking Elbow)',
    description: 'ضربة قصيرة بالساعد أو الكوع، تُستخدم لقياس المسافة وخداع الخصم مع توجيه ضربات سريعة نحو الوجه أو الجذع10.',
    image: 'https://upload.wikimedia.org/wikipedia/commons/7/78/Judo_Morote_Seoi_Nage_by_Bryan.gif',
    category: 'تايكوندو',
  ),
  Exercise(
    name: 'القبضة القوية (قبضة هيمين)',
    description: 'لكمة مستقيمة قوية توجه من الجسم الخلفي إلى الأمام مع التدوير، تضرب بالمفاصل الأولى للأصابع بهدف فك الخصم أو صدّه11.',
    image: 'https://upload.wikimedia.org/wikipedia/commons/7/78/Judo_Morote_Seoi_Nage_by_Bryan.gif',
    category: 'تايكوندو',
  ),

  // تمارين وينج تشون
  Exercise(
    name: 'سلسلة اللكمات المتتابعة',
    description: 'إسقاط متتابع لللكمات باليدين في خط مستقيم (Chain Punches)، تُوجه واحدة تلو الأخرى بإيقاع سريع دون توقف. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Jud-seiza.gif',
    category: 'وينج تشون',
  ),
  Exercise(
    name: 'تشي ساو (الأيدي الملتصقة)',
    description: 'تمرين تفاعلي باليدين مع شريك، بهدف تطوير ردود الفعل المرنة والوعي بضغط الخصم، مع الحفاظ على اتصال مستمر بين الذراعين. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Jud-seiza.gif',
    category: 'وينج تشون',
  ),
  Exercise(
    name: 'قبضة الخنجر الخلفية',
    description: 'لكمة بظهر اليد المستقيم (Back Fist) تستخدم إما في الزحف أو بنهاية دوران، تضرب بسرعة لإرباك الخصم. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Jud-seiza.gif',
    category: 'وينج تشون',
  ),
  Exercise(
    name: 'قبضة المتتالية بالقفز',
    description: 'نمط متقدم من سلسلة اللكمات، حيث يُدخل المقاتل قفزة قصيرة لاستبدال القدمين أثناء الإيقاع، مضيفًا قوة وزمن للحركة. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Jud-seiza.gif',
    category: 'وينج تشون',
  ),

  // تمارين فتح الحوض والمرونة
  Exercise(
    name: 'الانقسام الأمامي الكامل',
    description: 'تمرين لزيادة مرونة عضلات الفخذ والأرداف، حيث تُفرد الساقان لأقصى مدى أمامي باستقامة الجسم إلى الأسفل. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Jud-seiza.gif',
    category: 'فتح الحوض والمرونة',
  ),
  Exercise(
    name: 'انحناء لمس الأقدام',
    description: 'من وضع الوقوف، يقوم المتدرب بثني الجسم للأمام نحو الأرض محاولة لمس أصابع القدمين، لتحسين انثناء الظهر ومرونة الفخذ. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Jud-seiza.gif',
    category: 'فتح الحوض والمرونة',
  ),
  Exercise(
    name: 'جلوس الفراشة',
    description: 'جلسة مرنة يجلس فيها المتدرب مع ثني الركبتين نحو بعضهما، محاكيًا أجنحة الفراشة، لتوسيع فتحة الورك الخارجية تدريجيًا. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Jud-seiza.gif',
    category: 'فتح الحوض والمرونة',
  ),
  Exercise(
    name: 'رفع الساق للأمام',
    description: 'تمرين حركي، يرفع المتدرب ساقه أمامه مستقيمة مع الحفاظ على ثبات جسمه، لتحسين مرونة عضلات الورك والأوتار. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Jud-seiza.gif',
    category: 'فتح الحوض والمرونة',
  ),
  Exercise(
    name: 'تمرين التمدد الجانبي',
    description: 'وضعية تمدد lateral حيث تمتد الساقان إلى الجانبين وتثني الجسم باتجاه إحدى الركبتين، لفتح عضلات الورك الداخلية. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Jud-seiza.gif',
    category: 'فتح الحوض والمرونة',
  ),

  // تمارين نزع السلاح
  Exercise(
    name: 'نزع سكين من اليد',
    description: 'تقنية للدفاع عن النفس تطبق بمسكة قوية لليد العليا للخصم وحركة سريعة لإزاحة السكين بعيداً عن يد المنفذ. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/1/14/Kumite_bracket.gif',
    category: 'نزع السلاح',
  ),
  Exercise(
    name: 'نزع مسدس (Gun Disarm)',
    description: 'تمرّن على السيطرة على ذراع حامل المسدس ثم دفعه بعيدًا وتفادي التسديد، مع تحويل الخطر بعيدًا عن الخصم. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/1/14/Kumite_bracket.gif',
    category: 'نزع السلاح',
  ),
  Exercise(
    name: 'نزع عصا/هراوة',
    description: 'استخدام تقنية لتفادي ضربة العصا بواسطة الالتفاف وحركة اليد لكسر قبضة الخصم والتحكم بالعصا أو الهراوة. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/1/14/Kumite_bracket.gif',
    category: 'نزع السلاح',
  ),
  Exercise(
    name: 'نزع خنجر وفتح ذراع',
    description: 'طريقة للهجوم المضاد بإمساك معصم الخصم المسلّح بالخنجر ومن ثم تدوير المعصم فجأة لإجباره على إطلاق السلاح. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/1/14/Kumite_bracket.gif',
    category: 'نزع السلاح',
  ),
  Exercise(
    name: 'نزع مسدس مقبض أمامي',
    description: 'تقنية لسحب السلاح بعيداً من الخصم عن طريق دفع الكمامة بذراع الخصم العالي وفصل المقبض عن متنه. ',
    image: 'https://upload.wikimedia.org/wikipedia/commons/1/14/Kumite_bracket.gif',
    category: 'نزع السلاح',
  ),
];
