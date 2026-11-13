---
name: git-workflow
description: Every task (bug fix, refactor, new feature) starts on its own branch, gets pushed to origin, then the workspace returns to dev
metadata:
  type: feedback
---

لكل مهمة على المشروع — إصلاح مشكلة، ريفактор، أو فيتشر جديدة — أنشئ فرعًا مستقلًا قبل تعديل أي ملف، ثم ادفع الفرع إلى `origin` بعد الانتهاء، ثم ارجع إلى فرع `dev`.

**Why:** المستخدم يريد أن يبقى `dev` نظيفًا وقابلًا للمراجعة، وأن يكون لكل تغيير سجل مستقل يمكن تتبعه أو التراجع عنه دون خلط أعمال غير مترابطة.

**How to apply:**
1. `git status` أولًا. إن وُجدت تعديلات غير مرتبطة بالمهمة، اتركها كما هي ولا تُدرجها في الـ commit (استخدم مسارات محددة مع `git add` بدل `git add .`).
2. تأكد أن `dev` محدَّث مقابل `origin/dev` (`git fetch` ثم قارن؛ استخدم `pull` فقط عند الحاجة).
3. أنشئ الفرع بالبادئة المناسبة: `feature/<name>` للفيتشر، `fix/<name>` للإصلاح، `refactor/<name>` لإعادة الهيكلة والحذف/التنظيف.
4. نفّذ العمل وتحقق منه (تحليل/اختبار) قبل الـ commit.
5. رسائل الـ commit بصيغة Conventional Commits: `feat(scope): ...`، `fix(scope): ...`، `refactor(scope): ...`.
6. `git push -u origin <branch>` ثم `git checkout dev`.
7. الدفع يخص فرع المهمة فقط. الدمج في `dev`/`main`، والـ force-push، وإعادة كتابة التاريخ، وأي عملية إتلافية تحتاج تأكيدًا صريحًا من المستخدم.

هذه العمليات الروتينية (إنشاء الفرع، الـ commit، دفع الفرع، العودة إلى `dev`) مصرَّح بها مسبقًا ولا تحتاج سؤالًا في كل مرة. القاعدة عامة لكل مستودعات المستخدم، وفرع الأساس هو `dev` ما لم يكن للمستودع فرع أساس آخر.