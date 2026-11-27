---
name: rules-project-topology
description: Follow the real project hosting, environment and URL conventions declared in projects/schema; never invent endpoints, project IDs or secrets
metadata:
  type: feedback
---

# طوبولوجيا المشاريع (Project Topology Rules)

هذه القواعد مستخرجة من فحص مشاريع المستخدم الفعلية. المرجع هو `projects/schema/project-environment.schema.json`، ولكل مشروع ملف manifest يصف بيئاته واستضافته.

## البيئات
- بيئتان أساسيتان: `dev` و`prod`، وتُختار عبر `ENV` (أو `FLUTTER_ENV`) في `String.fromEnvironment` بقيمة افتراضية `dev`.
- بنية Flutter تعتمد `lib/config/env.dart` مع `lib/config/envs/dev_env.dart` و`lib/config/envs/prod_env.dart`.
- في وضع debug يستخدم `dev` localhost (`http://127.0.0.1:8000/...`)، وفي release يستخدم رابط `dev` المنشور؛ `prod` يستخدم HTTPS فقط.

## الاستضافة
- Firebase Hosting: `.firebaserc` بمفاتيح `default`/`dev`/`prod` وتargets للهوستينغ، و`firebase.json` بـ `public: build/web` وrewrites إلى `/index.html`؛ الروابط بصيغة `<firebase-project>.web.app`.
- Hostinger: نشر عبر SFTP/FTP إلى `/domains/<domain>/public_html/<path>/` ونطاقات `*.hostingersite.com`.
- نطاقات مخصصة: `dev.<domain>` للتطوير و`<domain>` للإنتاج، وقد تُستخدم Vercel (`*.vercel.app`).
- سير الـ CI يبني بـ `flutter build web --dart-define=ENV=<branch>` وينشر عند الدفع إلى `dev` أو `prod`.

## قواعد الوكيل
- لا يخترع رابطاً أو معرّف مشروع أو بيئة؛ يقرأ الـ manifest ويتبعه.
- لا يكتب كلمات مرور أو مفاتيح في الملفات؛ يستخدم أسماء secrets فقط (`secretRefs`).
- أي تغيير في الاستضافة أو البيئات أو الروابط يُحدَّث معه الـ manifest في نفس الـ commit.
- الاختبارات والتجارب على `dev` فقط وفق [[rules-testing-environments]].
