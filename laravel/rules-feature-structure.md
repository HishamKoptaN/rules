---
name: rules-feature-structure
description: Laravel projects use app/Features and app/Modules with Domain/Data/Present layers instead of Laravel's default directory layout
metadata:
  type: feedback
---

# بنية Features/Modules في Laravel

## القاعدة
لا تُستخدم البنية الافتراضية لـ Laravel (`app/Http/Controllers`، `app/Models`، ...) كمرجع. كل ميزة أو وحدة تُبنى داخل:
- `app/Features/<Feature>/` للميزات.
- `app/Modules/<Module>/` للوحدات الأكبر.

## الطبقات داخل كل Feature/Module
- `Domain/` — UseCases، Events، Listeners، Notifications، Contracts، والمنطق الخالص.
- `Data/` — Models، Repositories، Contracts، Strategies، DTOs، والوصول للبيانات.
- `Present/` — Controllers، Requests، Resources، والواجهة الخارجية.

## قواعد إضافية
- لا يُنشأ مجلد أساسي جديد في `app/` دون موافقة المستخدم.
- كل ملف جديد يوضع في أقرب طبقة وظيفية، ويُراعى نمط الملفات الشقيقة قبل الإنشاء.
- الملفات المولّدة تلقائياً لا تُعدّل يدوياً.
