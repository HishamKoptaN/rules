---
name: rules-git-granularity
description: Git granularity & PR size rules — max 150 modified lines per commit, 350-400 lines max per branch/PR, sequential sub-branches for large features, and Conventional Commits
metadata:
  type: feedback
---

# Git Granularity & Pull Request Size Rules

Related: [[rules]], [[git-workflow]], [[architecture]]

هذه القواعد ملزمة لأي وكيل برمجي (AI Agent) يعمل على أي مستودع لضمان جودة الكود، سهولة المراجعة البشرية، واستقرار سجل التغييرات.

---

## 1. تقسيم المهام الذري (Atomic Decomposition)
- **حد أقصى للالتزام الواحد (Max 150 lines per commit):**
  - يُحظر كتابة أكثر من **150 سطراً معدلاً** في الـ Commit الواحد (مجموع أسطر الإضافة والحذف `+ / -`).
  - **الاستثناء الوحيد:** الملفات المولدة تلقائياً (مثل `*.g.dart`، `*.freezed.dart`، ومولدات الموك `*.mocks.dart`).
- **التخطيط المسبق والتفكيك المعماري:**
  - عند استلام مهمة كبيرة أو معقدة، يجب على الوكيل تفكيكها مسبقاً إلى خطوات منطقية صغيرة ومستقلة معمارياً قبل بدء التنفيذ.
  - التسلسل الموصى به:
    1. **النماذج والكيانات (Models / Entities)**
    2. **مصادر البيانات والمستودعات (DataSources / Repositories)**
    3. **منطق إدارة الحالة (Logic / BLoC / Cubit)**
    4. **واجهة المستخدم والعناصر المرئية (UI / Views / Widgets)**
- **الالتزام النظيف (Clean & Validated Commits):**
  - عمل Commit مستقل ونظيف لكل خطوة بعد التأكد التام من خلو الكود من أخطاء البناء والتحليل الثابت (`dart analyze` / Lint / Compile).
  - لا يُسمح بعمل Commit لطبقة أو خطوة معطلة أو تحوي أخطاء تصريف.

---

## 2. حد حجم الفرع وطلب السحب (Branch & Pull Request Size Limit)
- **سقف التعديلات (350–400 lines max):**
  - ألا يتجاوز إجمالي التعديلات في أي فرع جديد (`Branch`) أو طلب سحب (`Pull Request`) حاجز **350–400 سطر** كحد أقصى (شاملاً جميع التعديلات).
- **الهدف وضمان جودة المراجعة:**
  - ضمان سهولة وسرعة المراجعة البشرية دون تشتت، وتفادي الإرهاق الذهني للمراجع، وتسهيل تتبع أي أخطاء أو التراجع عنها مستقبلاً.

---

## 3. التقسيم التلقائي للميزات الكبيرة (Large Features Auto-Splitting)
إذا تطلبت الميزة أو المهمة تعديلات تتجاوز حاجز الـ 400 سطر، يُلزم الوكيل باتباع إحدى الآليتين التاليتين تلقائياً:
1. **الفروع الفرعية المتسلسلة (Sequential Sub-branches):**
   - تقسيم الميزة إلى عدة فروع فرعية متسلسلة ومرتبطة (مثال: `feature/<feature_name>-part1-models` ثم `feature/<feature_name>-part2-repository` ثم `feature/<feature_name>-part3-ui`).
   - إنشاء طلب سحب منفصل لكل فرع فرعي لا يتجاوز 350–400 سطر.
2. **التوقف ونقاط المراجعة (Layer Checkpoint & Summary):**
   - التوقف بعد إتمام كل طبقة معمارية رئيسية (مثل الانتهاء من Data layer بالكامل).
   - عرض ملخص مختصر ودقيق للتغييرات المنجزة (Summary of Changes) والتحقق من سلامتها قبل الانتقال للطبقة التالية.

---

## 4. رسائل الالتزام القياسية (Conventional Commits)
- **صيغة واضحة ومختصرة:**
  - استخدام بادئات Conventional Commits القياسية:
    - `feat(<scope>): ...` للميزات الجديدة.
    - `fix(<scope>): ...` للإصلاحات البرمجية.
    - `refactor(<scope>): ...` لإعادة الهيكلة والتنظيف.
    - `test(<scope>): ...`، `chore(<scope>): ...`.
- **الدقة والتحديد:**
  - توضيح المكون أو الطبقة الدقيقة التي شملها التعديل (مثال: `feat(complaints): add complaint entity and model` بدلاً من `feat: add complaint`).
  - تجنب الرسائل المبهمة أو المفرطة في العمومية.
