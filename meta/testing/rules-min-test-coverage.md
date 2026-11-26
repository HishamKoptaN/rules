---
name: rules-min-test-coverage
description: Enforce a minimum test coverage threshold and verify it before declaring a task complete
metadata:
  type: feedback
---

# حد أدنى لتغطية الاختبارات (Minimum Test Coverage)

## القاعدة
بعد إضافة الاختبارات وفق [[rules-test-all-parts]]، يقيس الوكيل التغطية ويتحقق من الحد الأدنى قبل إعلان اكتمال أي مهمة.

## الحد الأدنى
- تغطية الأسطر (line coverage) **80% على الأقل** للمنطق والطبقة `domain` والـ BLoC/Cubit.
- لا يُعلن اكتمال ميزة جديدة أو تعديل كبير إذا قلت التغطية عن هذا الحد دون سبب مكتوب.

## التنفيذ
- شغّل أمر التغطية المعتمد في المشروع (مثلاً `flutter test --coverage`) على بيئة `dev` وفق [[rules-testing-environments]].
- راجع التقرير، وأضف اختبارات للفروع والأسطر غير المغطاة قبل الإنهاء.
- إن تعذّر بلوغ الحد الأدنى، أبلغ المستخدم بالسبب واطلب موافقته قبل إعلان الإنجاز.
