import 'package:flutter/material.dart';

class AnimeScreen extends StatefulWidget {
  AnimeScreen({Key? key}) : super(key: key);

  @override
  State<AnimeScreen> createState() => _AnimeScreenState();
}

class _AnimeScreenState extends State<AnimeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controllerOneSec;
  late Animation<double> _opacityAnimation;
  late Animation<Size> _resizeAnimation;
  late Animation<Color?> _colorAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    _controllerOneSec = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(1.0, -2.0),
    ).animate(
      CurvedAnimation(
        parent: _controllerOneSec,
        curve: Interval(
          0.7,
          1.0,
          curve: Curves.ease,
        ),
      ),
    );

    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(_controllerOneSec);

    _colorAnimation =
        ColorTween(begin: Colors.blue, end: Color.fromARGB(255, 131, 1, 190))
            .animate(CurvedAnimation(
                parent: _controllerOneSec, curve: Interval(0.5, 1.0)));

    _resizeAnimation = Tween<Size>(begin: Size(50, 50), end: Size(20, 20))
        .animate(
            CurvedAnimation(parent: _controllerOneSec, curve: Curves.bounceIn));
    super.initState();
  }

  bool tap = false;
  bool doubleTap = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllerOneSec.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _opacityAnimation,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                setState(() {
                  tap
                      ? _controllerOneSec.stop()
                      : _controllerOneSec.repeat(reverse: true);
                  tap = !tap;
                });
              },
              child: AnimatedBuilder(
                animation: _resizeAnimation,
                builder: (context, ch) => Container(
                  height: _resizeAnimation.value.width,
                  width: _resizeAnimation.value.width,
                  decoration: BoxDecoration(
                      color: _colorAnimation.value,
                      borderRadius: BorderRadius.circular(10)),
                  child: tap
                      ? const Icon(
                          Icons.pause_circle,
                          color: Colors.white,
                          size: 20,
                        )
                      : const Icon(
                          Icons.play_circle,
                          color: Colors.white,
                          size: 20,
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
