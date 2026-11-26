---
name: rules-no-secrets
description: Never commit secrets, API keys, passwords or .env files; scan changed files before every commit
metadata:
  type: feedback
---

# منع البيانات الحساسة في الـ commits (No Secrets)

## القاعدة
يُمنع تضمين أي بيانات حساسة في أي commit: مفاتيح API، كلمات مرور، رموز وصول (tokens)، مفاتيح خاصة، أو ملفات `.env`.

## قبل الـ commit
- يفحص الوكيل الملفات المعدّلة بحثاً عن قيم حساسة، ويستبدلها بمتغيرات بيئة.
- لا يضيف ملفات `.env` أو ملفات مفاتيح إلى Git، ويستخدم `.gitignore` لاستبعادها.

## عند الاكتشاف
- يوقف الـ commit، ويُبلغ المستخدم، ولا يكتب قيمة حساسة في السجل أو رسالة الـ commit.
