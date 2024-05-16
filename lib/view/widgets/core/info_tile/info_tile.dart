import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_task1/constants/app_break_points.dart';
import 'package:web_task1/constants/colors.dart';
import 'package:web_task1/constants/garde_color.dart';
import 'package:web_task1/view/widgets/design/visibility_icon.dart';

part 'widget/_body.dart';
part '_state.dart';

class InfoTile extends StatelessWidget {
  final String grade;
  final String label;
  final String desc;
  final String price;
  final String pcl;
  final bool eyeicon;
  final double descFontSize;
  final double priceFontSize;
  final double gradeFontSize;
  final VoidCallback onTap;
  const InfoTile({
    super.key,
    required this.grade,
    required this.label,
    required this.desc,
    required this.price,
    this.pcl = "outlet",
    this.eyeicon = true,
    this.descFontSize = 20,
    this.priceFontSize = 14,
    this.gradeFontSize = 14,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _ScreenState(),
      child: _Body(
        grade: grade,
        label: label,
        desc: desc,
        descFontSize: descFontSize,
        priceFontSize: priceFontSize,
        gradeFontSize: gradeFontSize,
        eyeicon: eyeicon,
        price: price,
        pcl: pcl,
        onTap: onTap,
      ),
    );
  }
}
