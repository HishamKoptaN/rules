---
name: rules-lint-before-push
description: Run scripts/lint-rules.sh and confirm it passes before pushing any change to the rules repository
metadata:
  type: feedback
---

# تشغيل lint القواعد قبل الدفع (Lint Before Push)

## القاعدة
قبل دفع أي فرع في مستودع القواعد، يشغّل الوكيل `bash scripts/lint-rules.sh` ويتحقق من نجاحه (exit 0).

## ما يتحقق منه السكريبت
- صيغة frontmatter في ملفات القواعد، وفرادة الأسماء.
- أن كل ملف قواعد مرجع في `GEMINI.md` أو `rules.md`.
- الحد الأقصى 100 سطر للملف، و4 ملفات للمجلد.

## عند الفشل
- يُصلح الوكيل المخالفات قبل الـ push، أو يوقف الدفع ويُبلغ المستخدم بالسبب.
