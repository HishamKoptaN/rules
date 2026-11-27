---
name: rules-laravel-naming
description: Naming conventions inside Laravel features — descriptive names, Actions, DTOs, Requests, Resources and Strategies
metadata:
  type: feedback
---

# تسمية ملفات Laravel داخل Features

- أسماء المتغيرات والدوال وصفية: `isRegisteredForDiscounts` لا `discount()`.
- `Actions/` للعمليات (`CreatePostAction.php`)، و`DTOs/` للبيانات المنقولة (`CreatePostDTO.php`).
- `Requests/` للتحقق من المدخلات (`StorePostRequest.php`)، و`Resources/` لإخراج الاستجابات.
- `Strategies/` و`Contracts/` للتبادلات القابلة للاستبدال مع Factory عند الحاجة.
- أسماء المجلدات والملفات تطابق الميزة (PascalCase) وتتبع نمط الملفات الشقيقة الموجودة.
- قبل إنشاء مكوّن جديد، تحقق من وجود مكوّن قابل لإعادة الاستخدام.
