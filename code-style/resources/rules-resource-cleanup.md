---
name: rules-resource-cleanup
description: Dispose controllers, subscriptions and streams when widgets or blocs are removed, and verify no resource leaks remain
metadata:
  type: feedback
---

# تنظيف الموارد (Resource Cleanup)

## القاعدة
عند حذف أو إعادة هيكلة أي widget أو bloc/cubit، يتحقق الوكيل من تنظيف كل الموارد المرتبطة به، ولا يكتفي بحذف الكود.

## المطلوب
- استدعاء `dispose()` لكل `TextEditingController` و`AnimationController` و`ScrollController` و`FocusNode`.
- إلغاء الـ subscriptions والـ stream listeners.
- إغلاق أي `StreamController` أو `Sink` مملوك للعنصر المحذوف.

## التحقق
- البحث عن مراجع معلّقة للعنصر المحذوف في الملفات المتبقية.
- تشغيل التحليل والاختبارات قبل الـ commit.
