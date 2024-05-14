import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:web_task1/configs/config_space.dart';
import 'package:web_task1/constants/app_break_points.dart';
import 'package:web_task1/constants/colors.dart';
import 'package:web_task1/constants/device_grade.dart';

import 'package:web_task1/model/smartphone.dart';
import 'package:web_task1/services/products/apple_provider.dart';
import 'package:web_task1/services/responsive.dart';
import 'package:web_task1/view/home/home_screen.dart';
import 'package:web_task1/view/product/widgets/hover_to_zoom.dart';
import 'package:web_task1/view/widgets/core/desktop_appbar/desktop_appbar.dart';
import 'package:web_task1/view/widgets/core/floating_message_button/floating_message_button.dart';
import 'package:web_task1/view/widgets/core/mobile_appbar.dart';
import 'package:web_task1/view/widgets/design/custom_slider.dart';

import '../../constants/garde_color.dart';

import 'widgets/dropdown_table1.dart';
import 'widgets/expandable_container.dart';

part 'screens/_desktop.dart';
part 'screens/_mobile.dart';
part 'widgets/_circular_dropdown.dart';
part 'widgets/_image_slider.dart';
part 'widgets/_table1.dart';
part 'widgets/_table2.dart';
part 'widgets/_add_to_cart_dialog.dart';

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
