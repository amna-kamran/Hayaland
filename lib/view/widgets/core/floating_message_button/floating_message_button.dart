import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web_task1/bloc/floating_button/floating_button_bloc.dart';
import 'package:web_task1/constants/colors.dart';

class FloatingMessageButton extends StatefulWidget {
  const FloatingMessageButton({super.key});

  @override
  State<FloatingMessageButton> createState() => _FloatingMessageButtonState();
}

class _FloatingMessageButtonState extends State<FloatingMessageButton> {
  bool isTapped = false;
  late OverlayEntry _overlayEntry;

  @override
  void initState() {
    super.initState();
    _overlayEntry = OverlayEntry(
      builder: (context) => buildChatOverlay(),
    );
  }

  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _overlayEntry.remove();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 10),
      child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            setState(
              () {
                isTapped = !isTapped;
                if (isTapped) {
                  Overlay.of(context).insert(_overlayEntry);
                } else {
                  _overlayEntry.remove();
                }
              },
            );
          },
          backgroundColor: const Color(darkblue),
          child: isTapped
              ? const Icon(
                  Icons.close_rounded,
                  size: 30,
                  color: Colors.white,
                )
              : SvgPicture.asset(
                  'lib/assets/svgs/message.svg',
                  width: 60,
                  height: 60,
                  color: Colors.white,
                )),
    );
  }

  Widget buildChatOverlay() {
    return Positioned(
      bottom: 90,
      right: 25,
      child: SizedBox(
        height: 350,
        width: 350,
        child: Card(
          surfaceTintColor: Colors.white,
          shadowColor: Colors.black,
          elevation: 4,
          child: Stack(
            children: [
              FractionallySizedBox(
                alignment: Alignment.topCenter,
                heightFactor: 1 / 1.8,
                widthFactor: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(darkblue),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "チャットで問い合わせる",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "👋こんにちは、ご質問等ございましたら、メッセージを送信してください。私たちが喜んでサポートいたします。",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: _controller,
                      maxLines: 2,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.5),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                        ),
                        hoverColor: Colors.transparent,
                        focusColor: Colors.white,
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "ご連絡ください",
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        suffixIcon: IconButton(
                          disabledColor: Colors.grey,
                          color: Colors.black,
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
                          onPressed: _controller.text.isNotEmpty ? () {} : null,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Center(
                      child: Text(
                        "クイック回答",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onHover: (value) => {
                        context
                            .read<FloatingButtonBloc>()
                            .add(ButtonHover(isButtonHover: value)),
                      },
                      onTap: () {},
                      child:
                          BlocBuilder<FloatingButtonBloc, FloatingButtonState>(
                        builder: (context, state) {
                          return Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: state.isButtonHover
                                  ? const Color(darkblue)
                                  : Colors.white,
                              border:
                                  Border.all(color: Colors.grey, width: 0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "注文を追跡する",
                                style: TextStyle(
                                  color: state.isButtonHover
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
