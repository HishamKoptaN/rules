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
└── meta/                      # سلوك الوكيل بعد انتهاء المهام
```

## `git/` — Version Control
- [[git-workflow]] — فرع مستقل لكل مهمة: إنشاء، دفع، عودة إلى الفرع الأساسي.
- [[rules-git-granularity]] — حد 150 سطرًا للـ commit، و350–400 سطرًا للفرع/PR، والتقسيم التلقائي.

## `architecture/` — Structure & State
- [[architecture]] — Clean Architecture (`data` / `domain` / `present` / `views`) و`ExecuteGuard<T>`.
- [[rules-bloc]] — توجيهات `part` وإرسال الأحداث عبر GetIt.
- [[rules-file-structure]] — حد 100 سطر للملف وعتبة 4 ملفات لتقسيم المجلد.
- [[rules-action-buttons]] — تفعيل أزرار الإجراء ومنطق `hasChanges` في الـ Entity.

## `code-style/` — Language & Styling
- [[rules-dart-syntax]] — block bodies إلزامية و dot shorthand.
- [[rules-theming]] — صفر ألوان أو أنماط نصية مكتوبة يدويًا؛ كل شيء من الـ Theme.

## `ui/` — Layout & Components
- [[rules-responsive]] — تخطيط متكيف للابتوب/التابلت/الموبايل مع امتدادات ScreenUtil.
- [[rules-components]] — `CustomPhoneFormField` وأيقونات FontAwesome / Lucide فقط.

## `packages/` — Stack & Dependencies
- [[rules-packages]] — حزم الـ Baseline، حزمك الداخلية، dev dependencies، والحزم الممنوعة.

## `meta/` — Agent Behavior
- [[suggestions]] — 2–3 اقتراحات لخطوات تالية بعد كل مهمة.
- [[rules-rate-limits]] — التعامل التلقائي مع حدود المعدل (Rate Limits) وأخطاء 429.
- [[rules-post-task-review]] — مراجعة المشروع بعد كل مهمة (flutter analyze) وإصلاح الأخطاء.

## قواعد إضافة ملف جديد
1. ضعه في المجلد الذي يطابق اختصاصه، وإن لم يوجد مجلد مناسب أنشئ واحدًا باسم واضح.
2. حدّث هذا الفهرس وقسم المجلد المقابل في `GEMINI.md` في نفس الـ commit.
3. لا تتجاوز 4 ملفات في المجلد الواحد؛ قسّمه إلى مجلدات فرعية عند التجاوز.

Related: [[git-workflow]], [[architecture]], [[rules-packages]]
