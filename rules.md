---
name: rules
description: Index of the Flutter/Dart rulebook — grouped into folders by specialty (git, architecture, code-style, ui, packages, meta)
metadata:
  type: feedback
---

# Rulebook Index

لكل مجموعة قواعد مجلدها الخاص حسب الاختصاص. أضف أي قاعدة جديدة داخل المجلد المناسب، ولا تكسر بنية الصفحة المسطحة.

```
rules/
├── GEMINI.md                  # نقطة الدخول (تُحمّل تلقائياً)
├── rules.md                   # هذا الفهرس
├── git/                       # التحكم بالإصدارات وسير العمل
├── architecture/              # البنية، الطبقات، إدارة الحالة، تنظيم الملفات
├── code-style/                # صياغة Dart والتنسيق المعتمد على الـ Theme
├── ui/                        # التجاوب والتصميم والعناصر المرئية
├── packages/                  # الحزم والإصدارات وملف pubspec
└── meta/                      # سلوك الوكيل قبل وبعد المهام
    ├── design/                # طلب تصاميل Google Stitch عند الحاجة إلى تصميم
    ├── planning/              # بدء المهمة بخطة مع تأكيد
    └── testing/               # قواعد بيئة الاختبارات
```

## `git/` — Version Control
- [[git-workflow]] — فرع مستقل لكل مهمة: إنشاء، دفع، عودة إلى الفرع الأساسي.
- [[rules-git-granularity]] — حد 150 سطرًا للـ commit، و350–400 سطرًا للفرع/PR، والتقسيم التلقائي.
- [[rules-pull-requests]] — طلبات السحب تُنشأ تلقائياً عند الدفع؛ لا خيار ولا إجراء محلي لها.
- [[rules-branch-cleanup]] — حذف الفروع المحلية التي أصبحت `[gone]` أو مدمجة في الفرع الأساس، مع منع نهائي لحذف `dev` و`prod`.
- [[rules-worktrees]] — إدارة worktrees المتعددة: إنشاء worktree منفصل لكل مهمة بدل تبديل الفروع.
- [[rules-branch-cleanup-advanced]] — خطوات متقدمة: حذف الفروع المدمجة، الـ alias للتنظيف، والهووكات التلقائية.
- [[rules-pull-before-modify]] — قبل أي تعديل: سحب آخر نسخة من dev من origin لمنع التضارب، خاصة في worktrees المنفصلة.
- [[rules-no-secrets]] — منع تضمين مفاتيح API وكلمات المرور وملفات `.env` في أي commit.
- [[rules-lint-before-push]] — تشغيل `scripts/lint-rules.sh` والتحقق من نجاحه قبل دفع أي فرع.
- [[rules-commit-file-limit]] — سقف 5 ملفات معدّلة لكل commit، والتقسيم إلى commits متتالية عند التجاوز.
- [[rules-merge-into-dev]] — دمج فرع المهمة في dev أولاً لتمر الاختبارات، ثم حذفه محلياً وعن بُعد بعد الدمج.

## `architecture/` — Structure & State
- [[architecture]] — Clean Architecture (`data` / `domain` / `present` / `views`) و`ExecuteGuard<T>`.
- [[rules-bloc]] — توجيهات `part` وإرسال الأحداث عبر GetIt.
- [[rules-file-structure]] — حد 100 سطر للملف وعتبة 4 ملفات لتقسيم المجلد.
- [[rules-action-buttons]] — تفعيل أزرار الإجراء ومنطق `hasChanges` في الـ Entity.
- [[rules-adr]] — توثيق القرارات المعمارية في سجل ADR مختصر قبل التنفيذ.

## `code-style/` — Language & Styling
- [[rules-dart-syntax]] — block bodies إلزامية و dot shorthand.
- [[rules-theming]] — صفر ألوان أو أنماط نصية مكتوبة يدويًا؛ كل شيء من الـ Theme.
- [[rules-resource-cleanup]] — تنظيف controllers وsubscriptions عند حذف widget أو bloc.
- [[rules-documentation-language]] — التوثيق والتعليقات بالعربية، ومعرّفات Dart/Flutter بالإنجليزية.
- [[rules-dead-code-cleanup]] — حذف الكود غير المستخدم والـ imports غير الضرورية قبل الـ commit.

## `ui/` — Layout & Components
- [[rules-responsive]] — تصميم Mobile-first أولًا، ثم تكيف الويب/التابلت مع امتدادات ScreenUtil.
- [[rules-components]] — `CustomPhoneFormField` وأيقونات FontAwesome / Lucide فقط.
- [[rules-no-web-html-js]] — يُمنع بناء صفحات/أكواد بـ HTML/JS داخل `web/`؛ تُبنى بـ Flutter/Dart.

## `packages/` — Stack & Dependencies
- [[rules-packages]] — حزم الـ Baseline، حزمك الداخلية، dev dependencies، والحزم الممنوعة.
- [[rules-packages-add-ons]] — dev dependencies، حزم الميزات، الحزم الممنوعة، وقواعد إضافة الحزم.

## `meta/` — Agent Behavior
- [[suggestions]] — اقتراحات تفاعلية متعددة الاختيار (`multiple: true`): تُنفَّذ كل الخيارات المختارة معاً بعد الموافقة، واقتراحات ما قبل التنفيذ تُختار ثم يُوافق عليها قبل التنفيذ.
- [[rules-rate-limits]] — التعامل التلقائي مع حدود المعدل (Rate Limits) وأخطاء 429.
- [[rules-post-task-review]] — مراجعة المشروع بعد كل مهمة (flutter analyze) وإصلاح الأخطاء.
- [[rules-prod-invisible]] — اعتبار `prod` غير مرئي لأي وكيل؛ لا دمج ولا دفع إلا بأمر مباشر وصريح من المستخدم، ولا تعديل ولا استعادة ولا ذكر.
- [[rules-testing-environments]] — كل الاختبارات والتجارب على بيئة `dev` فقط، ومنع أي اختبار على بيئة الإنتاج.
- [[rules-min-test-coverage]] — قياس تغطية الاختبارات وحد أدنى 80% قبل إعلان اكتمال المهمة.
- [[rules-test-all-parts]] — إضافة اختبارات منطقية (unit، bloc، repository، widget، integration) لجميع أجزاء المشروع وطبقاته.
- [[rules-task-planning]] — بدء المهمة بخطة مكونة من 2–4 خطوات ذرية، مع تأكيد المستخدم قبل التنفيذ.
- [[rules-google-stitch-design]] — طلب تصاميل من Google Stitch عند الحاجة إلى تصميم؛ معظم المشاريع لدينا لديها مشروع Stitch باسم مطابق تقريبًا.
- [[rules-change-summary]] — ملخص مختصر للتغييرات مع كل commit وربطه بالـ PR.

## قواعد إضافة ملف جديد
1. ضعه في المجلد الذي يطابق اختصاصه، وإن لم يوجد مجلد مناسب أنشئ واحدًا باسم واضح.
2. حدّث هذا الفهرس وقسم المجلد المقابل في `GEMINI.md` في نفس الـ commit.
3. لا تتجاوز 4 ملفات في المجلد الواحد؛ قسّمه إلى مجلدات فرعية عند التجاوز.

Related: [[git-workflow]], [[architecture]], [[rules-packages]]
