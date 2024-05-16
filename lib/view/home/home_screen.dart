import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_task1/bloc/appbar/appbar_bloc.dart';
import 'package:web_task1/bloc/smartphone/smartphone_bloc.dart';
import 'package:web_task1/configs/config_space.dart';
import 'package:web_task1/constants/app_break_points.dart';
import 'package:web_task1/constants/colors.dart';
import 'package:web_task1/constants/drop_down_values.dart';
import 'package:web_task1/constants/icons_paths.dart';
import 'package:web_task1/constants/items.dart';
import 'package:web_task1/model/smartphone.dart';
import 'package:web_task1/services/responsive.dart';
import 'package:web_task1/view/product/product_screen.dart';
import 'package:web_task1/view/widgets/core/desktop_appbar/bottom_app_bar.dart';
import 'package:web_task1/view/widgets/core/desktop_appbar/expanded_app_bar.dart';
import 'package:web_task1/view/widgets/core/floating_message_button/floating_message_button.dart';
import 'package:web_task1/view/widgets/core/info_tile/info_tile.dart';
import 'package:web_task1/view/widgets/design/drop_down.dart';
import 'package:web_task1/view/widgets/core/mobile_appbar.dart';
import 'package:web_task1/view/widgets/design/search_field.dart';
import '../widgets/core/desktop_appbar/animated_app_bar.dart';

part 'screens/_desktop.dart';
part 'screens/_mobile.dart';
part 'screens/widgets/_expanded_container.dart';
part 'screens/widgets/_category.dart';

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
