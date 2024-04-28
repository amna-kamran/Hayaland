import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:web_task1/configs/config_space.dart';
import 'package:web_task1/constants/app_break_points.dart';
import 'package:web_task1/constants/colors.dart';
import 'package:web_task1/constants/drop_down_values.dart';
import 'package:web_task1/constants/expansion_tile_items.dart';
import 'package:web_task1/constants/icons_paths.dart';
import 'package:web_task1/constants/items.dart';
import 'package:web_task1/services/responsive.dart';
import 'package:web_task1/view/home/widgets/design/custom_drop_down.dart';
import 'package:web_task1/view/home/widgets/design/search_field.dart';
part 'screens/_desktop.dart';
part 'screens/_mobile.dart';
part 'screens/widgets/_info_tile.dart';
part 'screens/widgets/_expanded_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: _Mobile(),
      tablet: _Desktop(),
      desktop: _Desktop(),
    );
  }
}