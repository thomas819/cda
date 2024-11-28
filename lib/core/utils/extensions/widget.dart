import 'package:flutter/widgets.dart';

import '../automatic_keep_page.dart';

extension WidgetExtension on Widget {
  KeepStateWidget get keepPage => KeepStateWidget(child: this);
}
