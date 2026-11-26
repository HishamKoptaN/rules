---
name: rules-pull-before-modify
description: Before any modification, pull the latest state of branch dev from origin; when working in a separate worktree, pull there and avoid conflicting parallel worktrees
metadata:
  type: feedback
---

# سحب آخر نسخة من dev قبل أي تعديل (Pull Before Modify)

## القاعدة
قبل البدء بأي تعديل (ملف، أداة، أو أي تغيير)، يقوم الوكيل أولاً بسحب آخر نسخة من الفرع `dev` من `origin`:

```bash
git fetch origin
git pull origin dev
```

## حالة الـ worktree المنفصل
- إذا كان العمل في worktree منفصل (`git worktree`)، يُنفذ الـ pull داخل الـ worktree ذاته.
- عند وجود عدة worktrees تعمل في نفس الوقت، يجب التنسيق قبل البدء لتجنب التضارب (conflicts).
