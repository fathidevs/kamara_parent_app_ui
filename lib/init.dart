import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/keys.dart';
import 'package:kamara_parent_app_ui/shared_preferenc_temp.dart';

class Init {
  static app(BuildContext cx) {
    _defaultChildId();
  }

  static _defaultChildId() {
    if (const Sp(key: Keys.childId).get() == null) {
      const Sp(key: Keys.childId, value: 0).int();
    }
  }
}
