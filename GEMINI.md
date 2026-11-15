# Git Granularity & Pull Request Size Rules

هذه القواعد ملزمة لجميع الوكلاء البرمجيين (AI Agents) عند تنفيذ أي مهام تطويرية، لضمان جودة الكود، سرعة وسهولة المراجعة البشرية، واستقرار فروع العمل.

---

## 1. تقسيم المهام الذري (Atomic Decomposition)
- **حد أسطر الـ Commit الواحد (Max 150 Lines):**
  - يُحظر تجاوز **150 سطراً معدلاً** في الـ Commit الواحد (مجموع أسطر الإضافة والحذف `+ / -`).
  - **الاستثناء:** الملفات المولدة تلقائياً (مثل `*.g.dart` و`*.freezed.dart` وملفات الـ mocks).
- **التفكيك المسبق للمهام الكبيرة (Pre-Decomposition):**
  - عند استلام مهمة كبيرة أو معقدة، يجب تفكيكها مسبقاً إلى خطوات منطقية صغيرة ومستقلة معمارياً:
    1. **Models / Entities** (طبقة النماذج والكيانات)
    2. **DataSources / Repositories** (طبقة مصادر البيانات والمستودعات)
    3. **Logic / State Management** (منطق الأعمال وإدارة الحالة مثل BLoC / Cubit)
    4. **UI / Views / Widgets** (واجهات المستخدم والعناصر المرئية)
- **الالتزام النظيف والمفحوص (Clean & Verified Commits):**
  - عمل Commit مستقل ونظيف لكل خطوة بعد التأكد التام من خلوها من أي أخطاء بناء أو تحليل ثابت (`dart analyze` / Lint / Compile).
  - يُمنع دمج طبقات معمارية غير مترابطة في commit واحد أو عمل commit لكود يحتوي أخطاء.

---

## 2. حد حجم الفرع وطلب السحب (Branch & Pull Request Size Limit)
- **سقف التعديلات (350–400 Lines Max):**
  - ألا يتجاوز إجمالي التعديلات في أي فرع جديد (`Branch`) أو طلب سحب (`Pull Request`) حاجز **350–400 سطر كحد أقصى**.
- **الهدف من الحد:**
  - تمكين المراجع البشري من قراءة وفحص التعديلات بدقة وسرعة وبدون تشتت أو إجهاد ذهني (Cognitive Overload).

---

## 3. التقسيم التلقائي للميزات الكبيرة (Large Features Auto-Splitting)
إذا تطلبت المهمة تعديلات تتجاوز حاجز الـ 400 سطر، يُلزم الوكيل باتباع إحدى الآليتين التاليتين تلقائياً:
1. **الفروع الفرعية المتسلسلة (Sequential Sub-branches):**
   - تقسيم الميزة إلى عدة فروع فرعية متسلسلة ومرتبطة (مثل: `feature/<name>-part1-models` ثم `feature/<name>-part2-repository` ثم `feature/<name>-part3-ui`).
   - فتح طلب سحب (PR) مستقل لكل فرع فرعي بحيث لا يتجاوز 350–400 سطر.
2. **التوقف عند نقاط التفتيش المعمارية (Layer Checkpoint & Summary):**
   - التوقف الإلزامي بعد إتمام كل طبقة معمارية رئيسية.
   - تقديم ملخص مختصر ودقيق للتغييرات المنجزة (Summary of Changes) والتحقق من سلامتها مع المستخدم قبل الانتقال للجزء التالي.

---

## 4. رسائل الالتزام القياسية (Conventional Commits)
- **الصيغة الدقيقة:**
  - استخدام صيغة Conventional Commits الواضحة والمختصرة:
    - `feat(<scope>): ...` للميزات الجديدة.
    - `fix(<scope>): ...` للإصلاحات.
    - `refactor(<scope>): ...` لإعادة الهيكلة والتنظيم.
    - `test(<scope>): ...`، `chore(<scope>): ...`.
- **التحديد الدقيق:**
  - توضيح المكون أو الطبقة الدقيقة التي شملها التعديل (مثال: `feat(complaints): add complaint entity and model` بدلاً من `feat: update`).

---

# General Workspace Rulebook Index

@[Git Granularity & PR Size](rules-git-granularity.md)
@[Git Workflow](git-workflow.md)
@[Architecture & Feature Conventions](architecture.md)
@[Stack Packages & pubspec Baseline](rules-packages.md)
@[BLoC Rules](rules-bloc.md)
@[Dart Syntax Rules](rules-dart-syntax.md)
@[Theme-Driven Styling Rules](rules-theming.md)
@[Responsive Design Rules](rules-responsive.md)
@[Component Rules](rules-components.md)
@[Action Button Rules](rules-action-buttons.md)
@[File Structure Rules](rules-file-structure.md)
@[Post-Task Suggestions](suggestions.md)
