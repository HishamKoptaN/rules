---
name: rules-test-all-parts
description: Add comprehensive logical tests — unit, bloc/cubit, repository, widget and integration — covering every part and layer of the project
metadata:
  type: feedback
---

# تغطية الاختبارات لجميع أجزاء المشروع (Test All Parts)

## القاعدة
عند بناء أي ميزة أو تعديل أي جزء من المشروع، يضيف الوكيل **اختبارات منطقية تغطي جميع أنواع الاختبارات تقريباً** لكل جزء متأثر، ولا يكتفي بالتحليل الثابت (`flutter analyze`).

## أنواع الاختبارات المطلوبة
- **Unit tests:** للمنطق، الخدمات، الـ Use Cases، والـ helpers.
- **BLoC/Cubit tests:** لكل بلوك/كيوبت (الحالات، الأحداث، وترتيبها).
- **Repository / DataSource tests:** لطبقة البيانات مع mocks.
- **Widget tests:** لكل شاشة أو مكوّن مُعدَّل (الحالات والتفاعل).
- **Integration tests:** للمسارات الكاملة والحالات الحرجة.

## نطاق التغطية
- كل طبقات المشروع: `data` / `domain` / `present` / `views`.
- كل ميزة جديدة أو تعديل على ميزة قائمة.
- تُشغَّل الاختبارات على بيئة `dev` فقط وفق [[rules-testing-environments]].
- لا يُعلن اكتمال المهمة دون اختبارات الأجزاء المُعدَّلة ونجاحها.
