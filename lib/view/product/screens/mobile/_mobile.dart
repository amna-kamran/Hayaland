part of '../../product_screen.dart';

class _Mobile extends StatelessWidget {
  final Smartphone phoneDetails;
  const _Mobile({required this.phoneDetails});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _ScreenState(),
      child: _BodyMobile(phoneDetails: phoneDetails),
    );
  }
}
