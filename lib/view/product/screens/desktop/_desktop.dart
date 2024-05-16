part of '../../product_screen.dart';

class _Desktop extends StatelessWidget {
  final Smartphone phoneDetails;
  const _Desktop({super.key, required this.phoneDetails});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _ScreenState(),
      child: _BodyDesktop(phoneDetails: phoneDetails),
    );
  }
}
