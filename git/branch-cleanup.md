---
name: branch-cleanup
description: Clean up local branches that are merged or have been removed from remote
metadata:
  type: feedback
---

# تنظيف الفروع المحلية (Branch Cleanup Rules)

تُعنى هذه القواعد بحفظ نظافة المستودع المحلي وجعله يطابق الحالة الحالية للمستودع البعيد (`origin`) فقط، وذلك بحذف الفروع المحلية التي:
1. أصبحت **`[gone]`** بعد حذف فرعها من Remote.
2. تمت **دمجها** بالكامل في فرع الأساس (مثل `main` أو `dev`).

---

## الخطوة 1: مزامنة وحذف مراجع الفروع المحذوفة من Remote

قبل أي عملية حذف، يجب تحديث قائمة الفروع البعيدة والتخلص من أي مراجع لم تعد موجودة:

```bash
# تحديث المراجع وحذف الفروع المحذوفة من Remote مرة واحدة:
git fetch --prune

# لجعل عملية الحذف التلقائية تحدث مع كل fetch أو pull (يوصى بتفعيلها globally):
git config --global fetch.prune true
```

**التحقق:** سيطبع Git أسطراً مثل `x [deleted] origin/اسم-الفرع` لأي فرع تم حذفه من المستودع البعيد.

---

## الخطوة 2: حذف الفروع المحلية التي أصبحت `[gone]`

بعد الخطوة 1، يتم إعلام Git أن الفروع المحلية التي كان فرعها البعيد موجوداً ثم حُذف صارت حالتها **`[gone]`**.

### معاينة الفروع المرشحة للحذف (آمن - لا يحذف شيئاً):
```bash
git branch -vv | grep ': gone]'
```

### الحذف التلقائي لهذه الفروع (يحذف الفروع المدمجة بأمان باستخدام `-d`):
```bash
git branch -vv | grep ': gone]' | awk '{print $1}' | xargs -r git branch -d
```

> **ملاحظة هامة:** استخدام `-d` يحذف الفرع فقط إذا كان مدمجاً (merged) في الفرع الحالي.  
> إذا كان الفرع قد حُذف من Remote بعد عمل **Squash merge**، فقد يرفض `-d` ويطالب باستخدام `-D` لأن Git لا يرى التغييرات كـ ancestor مباشر بنفس الـ commit hash.  
> **قاعدة استعمال:** إذا كنت تعتمد على Squash and merge في Pull Requests، يفضل استخدام `-D` للتأكد من الحذف، أو التحقق يدوياً من كل فرع.

### الحذف الجبري (احذر - يمحى الفرع نهائياً حتى لو كان غير مدمج):
```bash
git branch -vv | grep ': gone]' | awk '{print $1}' | xargs -r git branch -D
```

---

## الخطوة 3: حذف الفروع المحلية المدمجة في فرع الأساس

إذا كان لديك فروع محلية تم دمج الـ commits الخاصة بها بالكامل داخل فرعك الحالي (مثل `main` أو `dev`) وتريد التخلص منها:

### عرض الفروع المحلية المدمجة (استثناء الفروع الأساسية والفرع الحالي):
```bash
git branch --merged main | grep -vE '^\*|^\s*(main|master|dev)$'
```

### الحذف الدفعة الواحدة بعد التأكد:
```bash
git branch --merged main | grep -vE '^\*|^\s*(main|master|dev)$' | xargs -r git branch -d
```

> **تنبيه مهم بخصوص Squash merge:**  
> عند استخدام **Squash and merge** في Pull Requests، فإن الـ commits تُطبق على فرع الأساس كـ commits جديدة دون إنشاء Merge commit.  
> هنا قد يبدو الفرع المحلي **غير مدمج** في نظر `git branch -d` حتى لو كانت التغييرات داخل `main`، لأن Git لا يرى أن الـ commit الخاص بالفرع هو ancestor مباشر لـ main.  
> **الحل:** في حال استخدام Squash merge، يعتمد الحذف على التحقق اليدوي من أن التغييرات موجودة في branch الأساسي، أو استخدام `git branch -D` بحذر بعد التأكد من عدم الحاجة للفرع.

---

## الخطوة 4: تحويل التنظيف إلى أمر واحد (Git Alias)

يمكنك تبسيط العملية بأكملها إلى أمر واحد (Alias) يعمل بضغطة زر، بإضافة التالي إلى ملف `~/.gitconfig` (أو `.git/config` داخل المستودع):

```ini
[alias]
    cleanup = "!git fetch --prune && git branch -vv | grep ': gone]' | awk '{print $1}' | xargs -r git branch -D"
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

---

## الخطوة 5: دمج مع هووكات التشغيل التلقائي (Optional)

يمكنك ربط عملية التنظيف بالعمل التلقائي عند تغيير الفروع أو الدمج المحلي:

### هووكا `post-checkout` و `post-merge`
أنشئ الملفين `~/my-git/hooks/post-checkout` و `~/my-git/hooks/post-merge` بالمحتوى ذاته:
```bash
#!/bin/bash
git cleanup
```

ثم اجعلهما قابلين للتنفيذ:
```bash
chmod +x ~/my-git/hooks/post-checkout ~/my-git/hooks/post-merge
```

> **تنبيه:** ربط الهووكات بالعمل التلقائي قد يحذف فروعاً فجأة أثناء تبديل الفرع، لذا تأكد من فهمك للأمر `git cleanup` أولاً قبل تمكينه تلقائياً.

---

## ملخص الإجراءات العملية

| الخطوة | الأمر | الهدف |
|--------|-------|-------|
| 1 | `git fetch --prune` | مزامنة مراجع Remote وحذف الفروع المحذوفة |
| 2 | `git branch -vv \| grep ': gone]'` | معاينة الفروع المحلية التي أصبحت `[gone]` |
| 3 | `git branch -vv \| grep ': gone]' \| awk '{print $1}' \| xargs -r git branch -D` | حذف الفروع gone تلقائياً |
| 4 | `git branch --merged main \| grep -vE '^\*\|^\s*(main\|master\|dev)$'` | عرض الفروع المحلية المدمجة |
| 5 | `git branch --merged main \| grep -vE '^\*\|^\s*(main\|master\|dev)$' \| xargs -r git branch -d` | حذف الفروع المدمجة |

---

## اعتبارات مهمة (Important Considerations)

1. **Squash vs Merge:**  
   - إذا كان اعتمادك على **Squash and merge**، فإن `git branch -d` قد يرفض حذف فروع بدت غير مدمجة رغم وجود تغييراتها في `main`. يفضل التحقق يدوياً أو استخدام `-D` بعد التأكد.

2. **حماية الفروع الأساسية:**  
   - الأوامر أعلاه تستثني تلقائياً `main`، `master`، و `dev` من الحذف. يمكنك تعديل تعبير `grep -vE` لإضافة فروع أخرى تحميها.

3. **العمل بأمان:**  
   - جرب الخطوات بالمعاينة (`grep` فقط) قبل الحذف الفعلي، خصوصاً عند استخدام `-D` للتفرض الحذف.

4. **التكرار الدوري:**  
   - اجعل `git cleanup` عادةً قبل البدء في عمل جديد، أو ضعها في `post-checkout` hook إذا كنت متأكداً من سلوكها.