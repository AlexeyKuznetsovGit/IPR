import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class AnimeScreen extends StatefulWidget {
  AnimeScreen({Key? key}) : super(key: key);

  @override
  State<AnimeScreen> createState() => _AnimeScreenState();
}

class _AnimeScreenState extends State<AnimeScreen>
    with TickerProviderStateMixin {
  late Animation<double> _opacityAnimation;
  late Animation<Size> _resizeAnimation;
  late Animation<Offset> _slideAnimation;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<AlignmentGeometry> _animationAlign =
      Tween<AlignmentGeometry>(
    begin: Alignment.topLeft,
    end: Alignment.bottomCenter,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    ),
  );

  late final AnimationController _controller3 = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<double> _opacityAnimation1 =
      Tween(begin: 0.0, end: 1.0).animate(_controller3);
  late final Animation<Offset> _slideAnimation1 = Tween<Offset>(
    begin: Offset.zero,
    end: Offset(0.5, -0.5),
  ).animate(
    CurvedAnimation(
      parent: _controller4,
      curve: Interval(
        0.1,
        1.0,
        curve: Curves.ease,
      ),
    ),
  );
  late final Animation<AlignmentGeometry> _animationAlign1 =
      Tween<AlignmentGeometry>(
    begin: Alignment.topLeft,
    end: Alignment.bottomCenter,
  ).animate(
    CurvedAnimation(
      parent: _controller3,
      curve: Curves.decelerate,
    ),
  );

  late final AnimationController _controller4 = AnimationController(
    duration: const Duration(milliseconds: 2400),
    vsync: this,
  );
  late final Animation<double> _opacityAnimation2 =
      Tween(begin: 0.0, end: 1.0).animate(_controller4);
  late final Animation<Offset> _slideAnimation2 = Tween<Offset>(
    begin: Offset.zero,
    end: Offset(0.5, -0.5),
  ).animate(
    CurvedAnimation(
      parent: _controller3,
      curve: Interval(
        0.1,
        1.0,
        curve: Curves.ease,
      ),
    ),
  );
  late final Animation<AlignmentGeometry> _animationAlign2 =
      Tween<AlignmentGeometry>(
    begin: Alignment.topLeft,
    end: Alignment.bottomCenter,
  ).animate(
    CurvedAnimation(
      parent: _controller4,
      curve: Curves.decelerate,
    ),
  );

  late final AnimationController _controller5 = AnimationController(
    duration: const Duration(milliseconds: 2800),
    vsync: this,
  );
  late final Animation<double> _opacityAnimation3 =
      Tween(begin: 0.0, end: 1.0).animate(_controller5);
  late final Animation<Offset> _slideAnimation3 = Tween<Offset>(
    begin: Offset.zero,
    end: Offset(0.5, -0.5),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.1,
        1.0,
        curve: Curves.ease,
      ),
    ),
  );
  late final Animation<AlignmentGeometry> _animationAlign3 =
      Tween<AlignmentGeometry>(
    begin: Alignment.topLeft,
    end: Alignment.bottomCenter,
  ).animate(
    CurvedAnimation(
      parent: _controller5,
      curve: Curves.decelerate,
    ),
  );

  AnimationController? controller2;
  @override
  void initState() {
    controller2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0.5, -0.5),
    ).animate(
      CurvedAnimation(
        parent: controller2!,
        curve: Interval(
          0.1,
          1.0,
          curve: Curves.ease,
        ),
      ),
    );

    _opacityAnimation = Tween(begin: 1.0, end: 0.0).animate(_controller);

    _resizeAnimation = Tween<Size>(begin: Size(100, 100), end: Size(20, 20))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    controller2!.dispose();
  }

  int milisec = 2000;
  bool tap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Align(
          alignment: Alignment.topLeft,
          child: Stack(
            children: [
              AnimeStar(
                slideAnimation1: _slideAnimation3,
                point: 7,
                animationAlign1: _animationAlign3,
                opacityAnimation1: _opacityAnimation3,
                color: Colors.purpleAccent,
              ),
              AnimeStar(
                point: 4,
                slideAnimation1: _slideAnimation2,
                animationAlign1: _animationAlign2,
                opacityAnimation1: _opacityAnimation2,
                color: Colors.red,
              ),
              AnimeStar(
                point: 10,
                slideAnimation1: _slideAnimation1,
                animationAlign1: _animationAlign1,
                opacityAnimation1: _opacityAnimation1,
                color: Colors.blue,
              ),
              SlideTransition(
                position: _slideAnimation,
                child: AlignTransition(
                  alignment: _animationAlign,
                  child: FadeTransition(
                    opacity: _opacityAnimation,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          tap
                              ? _controller4.stop()
                              : _controller4.repeat(reverse: true);
                          tap
                              ? _controller5.stop()
                              : _controller5.repeat(reverse: true);
                          tap
                              ? _controller3.stop()
                              : _controller3.repeat(reverse: true);
                          tap
                              ? _controller.stop()
                              : _controller.repeat(reverse: true);
                          tap
                              ? controller2!.stop()
                              : controller2!.repeat(reverse: true);
                          tap = !tap;
                        });
                      },
                      behavior: HitTestBehavior.translucent,
                      child: AnimatedBuilder(
                        animation: _resizeAnimation,
                        builder: (context, ch) => CustomPaint(
                          size: Size(_resizeAnimation.value.width,
                              _resizeAnimation.value.height),
                          painter: StarPainter(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimeStar extends StatelessWidget {
  const AnimeStar(
      {Key? key,
      required Animation<Offset> slideAnimation1,
      required Animation<AlignmentGeometry> animationAlign1,
      required Animation<double> opacityAnimation1,
      required this.point,
      required this.color})
      : _slideAnimation1 = slideAnimation1,
        _animationAlign1 = animationAlign1,
        _opacityAnimation1 = opacityAnimation1,
        super(key: key);

  final Animation<Offset> _slideAnimation1;
  final Animation<AlignmentGeometry> _animationAlign1;
  final Animation<double> _opacityAnimation1;
  final Color color;
  final int point;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation1,
      child: AlignTransition(
        alignment: _animationAlign1,
        child: FadeTransition(
          opacity: _opacityAnimation1,
          child: SizedBox(
            height: 100,
            width: 100,
            child: StarWidget(
              color: color,
              point: point,
            ),
          ),
        ),
      ),
    );
  }
}

class StarWidget extends StatelessWidget {
  const StarWidget({Key? key, required this.color, required this.point})
      : super(key: key);
  final Color color;
  final int point;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: ClipPath(
        clipper: StarClipper(point),
        child: Container(
          color: color,
        ),
      ),
    );
  }
}

class StarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint();
    paint
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4;

    Paint paint1 = Paint();
    paint1
      ..color = Colors.yellow
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;
    double width = size.width;
    double height = size.height;

    Path path = Path();

    path.moveTo(width, height / 2);
    path.lineTo(width / 1.6, height / 2.5);
    path.lineTo(width / 2, height / 20);
    path.lineTo(width / 2.7, height / 2.5);
    path.lineTo(0, height / 2);
    path.lineTo(width / 3, height / 1.5);
    path.lineTo(width / 4, height);
    path.lineTo(width / 2, height / 1.3);
    path.lineTo(width / 1.35, height);
    path.lineTo(width / 1.5, height / 1.5);
    path.lineTo(width, height / 2);
    path.lineTo(width / 1.6, height / 2.5);
    canvas.drawPath(path, paint1);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
