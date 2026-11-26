---
name: rules-packages-add-ons
description: Dev dependencies baseline, feature add-ons, banned packages, and rules for adding new packages to the stack
metadata:
  type: feedback
---

# إضافات الحزم (Packages Add-Ons)

## 3. dev_dependencies Baseline

`flutter_lints`, `build_runner`, `freezed`, `json_serializable`, `injectable_generator`, `retrofit_generator`, `flutter_launcher_icons`, `flutter_native_splash`, `flutter_arb_translator`, `package_rename`. وللاختبار: `flutter_test`, `bloc_test`, `mocktail`.

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
  build_runner: ^2.4.13
  freezed: ^3.1.0
  json_serializable: ^6.9.0
  injectable_generator: ^3.0.0
  retrofit_generator: ^10.0.0
  flutter_launcher_icons: ^0.14.4
  flutter_native_splash: ^2.4.6
  flutter_arb_translator: ^1.1.0
  package_rename: ^1.8.0
```

## 4. Feature Add-Ons (تُضاف عند الحاجة فقط)

- **Video/Audio:** `video_player`, `chewie`, `cached_video_player_plus`, `just_audio`, `file_picker`, `image_cropper`.
- **PDF:** `pdf`, `printing`, `syncfusion_flutter_pdfviewer`.
- **Maps/Location:** `geolocator`, `flutter_map`, `latlong2`, `geocoding`, `permission_handler`.
- **Pickers/Formatters:** `country_picker`, `country_code_picker`, `syncfusion_flutter_datepicker`, `currency_text_input_formatter`, `intl`, `timeago`.
- **Realtime/Background:** `pusher_channels_flutter`, `flutter_local_notifications`, `workmanager`, `connectivity_plus`, `badges`, `event_bus`.
- **Arabic support:** `hijri`, `hijri_date`, `number_words_reader`, `to_arabic_number`, `bidi`.
- **Utilities:** `share_plus`, `package_info_plus`, `archive`, `visibility_detector`, `isolate_manager`, `easy_debounce`, `flutter_otp_kit`, `rxdart` (للاتجاهات المتعددة فقط).

## 5. ممنوع في المشاريع الجديدة (Legacy)

| ممنوع | البديل المعتمد |
| --- | --- |
| `dartz` / `Either` | `ExecuteGuard<T>` من `error_handler` |
| `get` (GetX) | `flutter_bloc` + `get_it` |
| `provider` | `flutter_bloc` |
| `vexana` | `dio` + `retrofit` |
| `fluttertoast` | `delightful_toast` / feedback من الـ Theme |
| `shimmer` , `flutter_skeleton_ui` | `skeletonizer` |
| `get_storage` | `shared_preferences` + `flutter_secure_storage` |
| `flutter_quick_router` | `go_router` |
| `flutter_gen_runner` | assets مباشرة عبر `flutter_svg` / `Image.asset` |
| `http` | `dio` |

المشاريع القديمة لا تُعاد كتابتها، لكن لا تُضاف هذه الحزم إلى أي مشروع جديد.

## 6. قواعد الالتزام

- **مصدر واحد لكل وظيفة:** لا مكتبة HTTP ثانية، لا DI ثانية، لا Router ثاني، لا State Management ثاني.
- **الإصدارات:** caret `^` دائماً، ونفس إصدارات الجدول أعلاه حتى يوجد سبب مكتوب للترقية.
- **الأسماء في `pubspec.yaml`:** أبجدي داخل قسم `dependencies`، و`sdk: flutter` أولاً.
- `publish_to: "none"` و`environment` بنفس صيغة القالب المعتمد.
- عند إضافة حزمة جديدة لم تكن في هذا الملف، أضفها هنا في نفس الـ commit.

```yaml
name: <project_name>
description: <project_name>
publish_to: "none"
environment:
  sdk: ^3.13.5
  flutter: 3.47.7
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  # ... بقية حزم القسم 1
```
