---
name: rules-worktrees
description: When several tasks run at once, use a separate git worktree per task instead of switching branches, with worktrees as the working base
metadata:
  type: feedback
---

# إدارة Worktrees (Git Worktrees Rules)

## القاعدة
عند الحاجة للعمل على مهام بالوقت الواحد، يقوم الوكيل بإنشاء **worktree منفصل لكل مهمة** بدلاً من التبديل بين الفروع.

## كيفية الإنشاء
```bash
git fetch origin
git worktree add <path> <branch-or-commit>
```
مثال: `git worktree add ../rules-feature feature/pull-before-modify`.

## شروط العمل
- يعمل داخل worktree واحد في كل مرة.
- عند الانتهاء من العمل في الـ worktree، أخرج منه بـ `git worktree remove`.
- قبل البدء في أي تعديل داخل الـ worktree، حدّث آخر نسخة من dev كما تشير القواعد الخاصة بـ git.
