import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:web_task1/configs/config_space.dart';
import 'package:web_task1/constants/app_break_points.dart';
import 'package:web_task1/constants/colors.dart';
import 'package:web_task1/constants/device_grade.dart';

import 'package:web_task1/model/smartphone.dart';
import 'package:web_task1/services/responsive.dart';
import 'package:web_task1/view/home/home_screen.dart';
import 'package:web_task1/view/product/widgets/hover_to_zoom.dart';
import 'package:web_task1/view/widgets/core/desktop_appbar/desktop_appbar.dart';
import 'package:web_task1/view/widgets/core/mobile_appbar.dart';

part 'screens/_desktop.dart';
part 'screens/_mobile.dart';
part 'widgets/_circular_dropdown.dart';
part 'widgets/_image_slider.dart';
part 'widgets/_table1.dart';
part 'widgets/_table2.dart';

class ProductScreen extends StatelessWidget {
  final Smartphone phoneDetails;
  const ProductScreen({super.key, required this.phoneDetails});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _Mobile(
        phoneDetails: phoneDetails,
      ),
      tablet: _Desktop(phoneDetails: phoneDetails),
      desktop: _Desktop(phoneDetails: phoneDetails),
    );
  }
}
