---
name: rules-headless-service-access
description: Prefer background/programmatic access (MCP tools, official CLIs, service accounts and APIs) over browser UI when interacting with Firebase, Google Cloud Console, Shorebird and similar services
metadata:
  type: feedback
---

# الوصول البرمجي للخدمات بدل التصفح (Headless Service Access)

## القاعدة
عند التعامل مع خدمات خارجية مثل Firebase، Google Cloud Console، Shorebird، أو ما شبهها، يستخدم الوكيل **الوصول البرمجي في الخلفية** بدل فتح وضع التصفح والتعامل مع الواجهة البصرية:
- أدوات MCP الخاصة بالخدمة إن وُجدت.
- الـ CLI الرسمي (مثل `firebase`، `gcloud`، `shorebird`) بحساب خدمة أو بيانات اعتماد مُهيّأة.
- واجهات API برموز وصول مُدارة عبر secrets.

## الترتيب
1. MCP أو API مباشر.
2. CLI رسمي في الخلفية.
3. التصفح فقط كملجأ أخير عند تعذّر ما سبق، وبعد إبلاغ المستخدم بالسبب.

## القيود
- لا يكتب الوكيل مفاتيح أو كلمات مرور في الملفات أو السجلات؛ يستخدم أسماء secrets فقط وفق [[rules-no-secrets]].
- العمليات الحساسة تخضع لقواعد الحماية والصلاحيات القائمة.
