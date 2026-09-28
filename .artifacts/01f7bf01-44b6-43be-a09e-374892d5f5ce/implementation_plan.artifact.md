# Fix "databaseFactory not initialized" Error

The error occurs because the `sqflite` package requires explicit initialization of the database factory when running on Desktop platforms (Windows, macOS, Linux). The screenshot shows the app running in a browser (Web), where `sqflite` also requires special handling or a different factory.

This plan focuses on fixing the initialization for Desktop platforms, which is the most common cause of this specific error message in a Flutter development environment on Windows.

## Proposed Changes

### [folio](file:///C:/Flutter Projects/folio)

#### [MODIFY] [pubspec.yaml](file:///C:/Flutter Projects/folio/pubspec.yaml)
- Add `sqflite_common_ffi` to the dependencies to provide the database factory for Desktop.

#### [MODIFY] [main.dart](file:///C:/Flutter Projects/folio/lib/main.dart)
- Import `dart:io`, `package:flutter/foundation.dart`, and `package:sqflite_common_ffi/sqflite_ffi.dart`.
- Initialize `sqfliteFfiInit()` and set `databaseFactory = databaseFactoryFfi` for Desktop platforms in the `main()` function.

## User Review Required

> [!IMPORTANT]
> The screenshot shows the app running on **Web** (`localhost`). Standard `sqflite` does not support Web out of the box. The proposed fix will resolve the error for **Windows/Desktop**.
>
> If you intend to support **Web**, please let me know, as it requires additional setup (like `sqflite_common_ffi_web`) or a different database solution (like `drift` or `indexeddb`). For now, I recommend running the app as a **Windows Desktop app** to verify the fix.

## Verification Plan

### Manual Verification
1. Run `flutter pub get` to install the new dependency.
2. Run the app on **Windows Desktop** (not Chrome).
3. Verify that the "Bad state: databaseFactory not initialized" error no longer appears and the database opens successfully.
