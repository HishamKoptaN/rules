---
name: rules-dead-code-cleanup
description: Remove unused imports, variables, classes and dead code after every feature or fix, before the commit
metadata:
  type: feedback
---

# تنظيف الكود غير المستخدم (Dead Code Cleanup)

## القاعدة
بعد كل ميزة أو إصلاح، وقبل الـ commit، ينظّف الوكيل الكود الذي لم يعد مستخدماً في الملفات التي لمسها:
- الـ imports غير المستخدمة.
- المتغيرات والدوال والفئات غير المستخدمة.
- المسارات والشروح القديمة المرتبطة بالكود المحذوف.

## التنفيذ
- يعتمد على التحليل الثابت (`dart analyze` / Lint) للكشف.
- يحذف الكود الميت دون تغيير السلوك، ثم يعيد التحليل والاختبارات قبل الـ commit.
