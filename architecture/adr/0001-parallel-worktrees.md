---
name: parallel-worktrees
description: Use one isolated git worktree and feature branch per concurrent task to avoid conflicts between agents
metadata:
  type: feedback
---

# ADR 001: عمل عدة وكلاء بالتوازي دون تضارب

## القرار
كل محادثة/وكيل يعمل في **worktree مستقل** وفرع خاص به يُنشأ من `origin/dev`، عبر `scripts/new-task.sh <repo> <task>`. لا يعمل أي وكيل في checkout الأساسي المرتبط بالفرع المحمي. قبل التعديل يُحدَّث الفرع بـ `git fetch` ثم `git rebase origin/dev`.

## البدائل المرفوضة
- workspace واحد لعدة وكلاء: يؤدي إلى كتابة نفس الملفات وتضارب git.
- checkout متعدد لنفس الفرع: Git يمنعه أصلاً.
- دمج فروع متعددة في وقت واحد في `dev`: يسبب تعارضات في الملفات المشتركة ويصعب التراجع.

## الأثر
- ملفات مشتركة حساسة (`pubspec.yaml`، `route_config.dart`، `dependency_injection.dart`، workflows، ADR) تُعدَّل في مهمة واحدة ثم يُعاد rebase باقي الفروع عليها.
- الالتزامات ≤150 سطراً و≤5 ملفات، والفرع ≤400 سطر.
- بعد نجاح التحليل والاختبارات يُدمج الفرع في `dev` ويُحذف محلياً وعن بُعد.
- الأداة: `scripts/new-task.sh` + `tools.opencode.session.move`.
