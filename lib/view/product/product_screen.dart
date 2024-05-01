import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:web_task1/constants/app_break_points.dart';
import 'package:web_task1/constants/colors.dart';
import 'package:web_task1/constants/model/table_dummy_data.dart';
import 'package:web_task1/services/responsive.dart';
import 'package:web_task1/view/product/widgets/hover_to_zoom.dart';
import 'package:web_task1/view/widgets/core/desktop_appbar.dart';
import 'package:web_task1/view/widgets/core/mobile_appbar.dart';
part 'screens/_desktop.dart';
part 'screens/_mobile.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: _Mobile(),
      tablet: _Desktop(),
      desktop: _Desktop(),
    );
  }
}
