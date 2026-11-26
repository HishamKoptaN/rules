---
name: rules-change-summary
description: Include a concise summary of changes in every commit and task report and link it to the pull request
metadata:
  type: feedback
---

# ملخص التغييرات (Summary of Changes)

## القاعدة
مع كل commit وفي نهاية كل مهمة، يكتب الوكيل ملخصاً مختصراً ودقيقاً لما تغيّر، ويربطه بالـ PR عند توفره.

## المطلوب
- الملفات والطبقات التي شملها التغيير.
- نتيجة التحقق (`analyze` / lint / tests).
- رقم الـ PR أو رابطه عند وجوده.

## الالتزام
- لا يُنشأ PR يدوياً؛ الـ PR يُنشأ تلقائياً عند الدفع وفق [[rules-pull-requests]].
