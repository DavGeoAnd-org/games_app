import 'package:flutter/material.dart';

class RecordId {
  static String stringValueFromId(String id) {
    return id.substring(id.indexOf(":") + 1);
  }

  static int intValueFromId(String id) {
    return int.parse(id.substring(id.indexOf(":") + 1));
  }
}

class ElevatedButtonDefault {
  static Size minimumSize() {
    return const Size.fromHeight(100);
  }

  static Color? backgroundColor() {
    return Colors.blueGrey[400];
  }

  static double textFontSize() {
    return 50;
  }

  static Color? textColor() {
    return Colors.black;
  }

  static int textMaxLines() {
    return 1;
  }
}

class ColumnDefault {
  static CrossAxisAlignment crossAxisAlignment() {
    return CrossAxisAlignment.start;
  }

  static double spacing() {
    return 20;
  }
}

class SafeAreaDefault {
  static EdgeInsets minimum() {
    return const EdgeInsets.all(20);
  }
}

class ScaffoldDefault {
  static bool resizeToAvoidBottomInset() {
    return false;
  }

  static int textMaxLines() {
    return 1;
  }
}

class FutureBuilderDefault {}

class SearchableListDefault {
  static int textMaxLines() {
    return 2;
  }

  static EdgeInsets listViewPadding() {
    return const EdgeInsets.symmetric(vertical: 20);
  }
}

class RowDefault {
  static double spacing() {
    return 10;
  }
}