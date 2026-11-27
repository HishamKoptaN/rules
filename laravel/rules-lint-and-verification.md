---
name: rules-laravel-lint
description: Verify Laravel changes with composer test and Laravel Boost MCP tools instead of tinker, ad-hoc scripts or manual DB queries
metadata:
  type: feedback
---

# التحقق والـ Lint في مشاريع Laravel

## أدوات مفضّلة (Headless)
- أدوات Laravel Boost MCP المتاحة (`search-docs`، `database-query`، `database-schema`، `get-absolute-url`، `browser-logs`) قبل البدائل اليدوية، وفق [[rules-headless-service-access]].
- `search-docs` قبل أي تغيير يعتمد على API أو إصدار حزمة، مع تحديد `packages`.

## التحقق
- `composer test` / `php artisan test` هو التحقق الأساسي؛ لا تُنشأ سكربتات تحقق أو تinker بدل الاختبارات.
- لا تُغيّر التبعيات (`composer.json`) دون موافقة صريحة.
- تحقق من إصدار الحزمة المثبّت (`composer show`) قبل افتراض API.

## القواعد العامة
- التوثيق لا يُنشأ إلا بطلب صريح.
- الردود مختصرة ومركّزة على المهمة.
- الاختبارات على بيئة `dev` فقط وفق [[rules-testing-environments]].
