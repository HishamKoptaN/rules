---
name: rules-branch-cleanup-advanced
description: Advanced branch cleanup — delete merged-in-base branches, set up the cleanup alias, and attach post-checkout/post-merge hooks
metadata:
  type: feedback
---

# تنظيف الفروع المتقدم (Advanced Branch Cleanup)

## الخطوة 3: حذف الفروع المحلية المدمجة في فرع الأساس

إذا كان لديك فروع محلية تم دمج الـ commits الخاصة بها بالكامل داخل فرعك الحالي (مثل `main` أو `dev`) وتريد التخلص منها:

### عرض الفروع المحلية المدمجة (استثناء الفروع الأساسية والفرع الحالي):
```bash
git branch --merged main | grep -vE '^\*|^\s*(main|master|dev|prod)$'
```

### الحذف الدفعة الواحدة بعد التأكيد:
```bash
git branch --merged main | grep -vE '^\*|^\s*(main|master|dev|prod)$' | xargs -r git branch -d
```

> **تنبيه مهم بخصوص Squash merge:**  
> عند استخدام **Squash and merge** في Pull Requests، فإن الـ commits تُطبق على فرع الأساس كـ commits جديدة دون إنشاء Merge commit.  
> هنا قد يبدو الفرع المحلي **غير مدمج** في نظر `git branch -d` حتى لو كانت التغييرات داخل `main`، لأن Git لا يرى أن الـ commit الخاص بالفرع هو ancestor مباشر لـ main.  
> **الحل:** في حال استخدام Squash merge، يعتمد الحذف على التحقق اليدوي من أن التغييرات موجودة في branch الأساسي، أو استخدام `git branch -D` بحذر بعد التأكد من عدم الحاجة للفرع.

## الخطوة 4: تحويل التنظيف إلى أمر واحد (Git Alias)

يمكنك تبسيط العملية بأكملها إلى أمر واحد (Alias) يعمل بضغطة زر، بإضافة التالي إلى ملف `~/.gitconfig` (أو `.git/config` داخل المستودع):

```ini
[alias]
    cleanup = "!git fetch --prune && git branch -vv | grep ': gone]' | awk '{print $1}' | grep -vE '^(dev|prod)$' | xargs -r git branch -D"
```

### الاستخدام:
```bash
git cleanup
```

سيقوم الأمر بتشغيل التالي بالترتيب:
1. `git fetch --prune` → مزامنة وحذف مراجع Remote المحذوفة.
2. `grep ': gone]'` → فلترة الفروع المحلية التي أصبحت `[gone]`.
3. `awk '{print $1}'` → استخراج اسم الفرع من كل سطر.
4. `xargs -r git branch -D` → الحذف الجبري لهذه الفروع.

## الخطوة 5: دمج مع هووكات التشغيل التلقائي (Optional)

يمكنك ربط عملية التنظيف بالعمل التلقائي عند تغيير الفروع أو الدمج المحلي:

### هووكا `post-checkout` و `post-merge`
أنشئ الملفين `~/my-git/hooks/post-checkout` و`~/my-git/hooks/post-merge` بالمحتوى ذاته:
```bash
#!/bin/bash
git cleanup
```

ثم اجعلهما قابلين للتنفيذ:
```bash
chmod +x ~/my-git/hooks/post-checkout ~/my-git/hooks/post-merge
```

> **تنبيه:** ربط الهووكات بالعمل التلقائي قد يحذف فروعاً فجأة أثناء تبديل الفرع، لذا تأكد من فهمك للأمر `git cleanup` أولاً قبل تمكينه تلقائياً.

## ملخص الإجراءات العملية

| الخطوة | الأمر | الهدف |
|--------|-------|-------|
| 1 | `git fetch --prune` | مزامنة مراجع Remote وحذف الفروع المحذوفة |
| 2 | `git branch -vv \| grep ': gone]'` | معاينة الفروع المحلية التي أصبحت `[gone]` |
| 3 | `git branch -vv \| grep ': gone]' \| awk '{print $1}' \| grep -vE '^(dev\|prod)$' \| xargs -r git branch -D` | حذف الفروع gone تلقائياً (باستثناء dev/prod) |
| 4 | `git branch --merged main \| grep -vE '^\*\|^\s*(main\|master\|dev\|prod)$'` | عرض الفروع المحلية المدمجة (باستثناء المحمية) |
| 5 | `git branch --merged main \| grep -vE '^\*\|^\s*(main\|master\|dev\|prod)$' \| xargs -r git branch -d` | حذف الفروع المدمجة (باستثناء المحمية) |

## اعتبارات مهمة (Important Considerations)

1. **Squash vs Merge:**  
   - إذا كان اعتمادك على **Squash and merge**، فإن `git branch -d` قد يرفض حذف فروع بدت غير مدمجة رغم وجود تغييراتها في `main`. يفضل التحقق يدوياً أو استخدام `-D` بعد التأكد.

2. **حماية الفروع الأساسية (إلزامي):**  
   - يُمنع حذف `dev` و `prod` نهائياً (محلياً أو عن بُعد) تحت أي ظرف. الأوامر أعلاه تستثنيهما صراحةً بالإضافة إلى `main` و `master`. لا يُسمح بإزالة هذا الاستثناء.

3. **العمل بأمان:**  
   - جرب الخطوات بالمعاينة (`grep` فقط) قبل الحذف الفعلي، خصوصاً عند استخدام `-D` للتفرض الحذف.

4. **التكرار الدوري:**  
   - اجعل `git cleanup` عادةً قبل البدء في عمل جديد، أو ضعها في `post-checkout` hook إذا كنت متأكداً من سلوكها.
