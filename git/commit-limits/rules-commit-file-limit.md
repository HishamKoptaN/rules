---
name: rules-commit-file-limit
description: Cap each commit at a maximum number of changed files (5) and split larger changes into sequential commits
metadata:
  type: feedback
---

# سقف عدد الملفات في الـ commit (Commit File Limit)

## القاعدة
بالإضافة إلى حد الأسطر في [[rules-git-granularity]]، لا يتجاوز الـ commit الواحد **5 ملفات معدّلة** كحد أقصى.

## التقسيم
- إذا تطلبت المهمة تعديل أكثر من 5 ملفات، قسّمها إلى commits متتالية حسب الطبقة أو الوظيفة.
- كل commit يبقى مكتملاً ومفحوصاً (analyze / lint / tests) ولا يُخل بوحدة البناء.

## الاستثناء
- الملفات المولّدة تلقائياً (مثل `*.g.dart` و`*.freezed.dart`) تُستثنى من العدّ، وتُولَّد في نفس الـ commit الذي غيّر مصدرها.
