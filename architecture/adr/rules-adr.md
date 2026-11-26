---
name: rules-adr
description: Document every architectural decision in a short ADR record inside the repository before implementing it
metadata:
  type: feedback
---

# سجل القرارات المعمارية (Architecture Decision Records)

## القاعدة
قبل تنفيذ أي تغيير معماري (طبقات جديدة، مكتبة مؤثرة، نمط حالة جديد)، يكتب الوكيل سجلاً مختصراً (ADR) داخل `architecture/adr/` ويحصل على موافقة المستخدم قبل التنفيذ.

## محتوى السجل
- **القرار:** ما الذي تغيّر ولماذا.
- **البدائل:** الخيارات المرفوضة وسبب رفضها.
- **الأثر:** الملفات والطبقات المتأثرة.

## الالتزام
- لا يُنفّذ القرار قبل كتابة السجل وموافقة المستخدم.
- يرتبط السجل بالمهمة أو الـ PR عند الإمكان.
