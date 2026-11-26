---
name: rules-merge-into-dev
description: Every task branch is merged into dev first to pass tests, then deleted locally and remotely once fully merged, except protected branches
metadata:
  type: feedback
---

# دمج الفروع في dev قبل حذفها (Merge Into Dev First)

## القاعدة
كل فرع يُنشأ لتعديل أو إضافة ميزة يُدمج **أولاً في `dev`**، ولا يُحذف إلا بعد دمجه فعلياً فيه وتمرير الاختبارات على `dev` وفق [[rules-testing-environments]].

## بعد الدمج
- يُحذف الفرع محلياً بـ `git branch -d <branch>` بعد التأكد من دمجه في `dev`.
- يُحذف الفرع على المستودع البعيد بـ `git push origin --delete <branch>`.
- الفروع المحمية (`dev` و`prod`) مستثناة من الحذف، وتخضع لقواعد الحماية الخاصة بها في [[rules-branch-cleanup]].

## التحقق قبل الحذف
1. `git branch --merged dev` — التأكد أن الفرع مدمج فعلياً في `dev`.
2. تشغيل الاختبارات على `dev` ونجاحها.
3. لا يُحذف أي فرع غير مدمج أو لم تمر اختباراته.
