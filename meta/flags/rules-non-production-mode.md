---
name: rules-non-production-mode
description: When the .agent-non-production flag exists at the repo root, agents create branches, merge into dev and delete them locally and remotely without opening PRs
metadata:
  type: feedback
---

# وضع المشروع غير الإنتاجي (Non-Production Agent Flag)

## العلم
وجود الملف `.agent-non-production` في جذر المستودع يعني أن المشروع **ليس في الإنتاج حالياً**.

## سلوك الوكيل عند وجود العلم
- يعمل بشكل طبيعي: ينشئ فرعاً لكل مهمة، ويدمجه مباشرة في `dev` بعد نجاح الاختبارات، دون فتح طلب دمج (PR) على المستودع البعيد.
- يحذف الفرع محلياً وعن بُعد بعد الدمج وفق [[rules-merge-into-dev]] و[[rules-branch-cleanup]].
- لا يُنشأ PR يدوياً ولا يُعرض كخيار؛ قواعد [[rules-pull-requests]] لا تُطبَّق في هذا الوضع.

## عند غياب العلم
- تعود القواعد الافتراضية: الـ PRs تُنشأ تلقائياً عند الدفع، ولا يدمج الوكيل في `dev` أو الفرع الأساسي دون إذن صريح.

## الحدود
- قواعد حماية الفروع الأساسية تبقى سارية دائماً ولا يتأثر هذا الوضع بها.
