/// pinpin_1037 - basic_swiper
/// Created by xhz on 2022/1/23
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

typedef TabChangeCallBack = void Function(int state);

class Swiper extends StatefulWidget {
  const Swiper({
    Key? key,
    this.onChange,
    required this.children,
  }) : super(key: key);
  final List<Widget> children;

  final TabChangeCallBack? onChange; //通知回调
  @override
  _SwiperState createState() => _SwiperState();
}

class _SwiperState extends State<Swiper> {
  var _index = 0.0;
  final PageController _controller = PageController(viewportFraction: 3 / 7);
  late final int len = widget.children.length;

  @override
  void initState() {
    _controller.addListener(() {
      _index = _controller.page ?? 0;
      (context as Element).markNeedsBuild();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: len,
      onPageChanged: widget.onChange,
      allowImplicitScrolling: true,
      itemBuilder: (ctx, index) {
        return LayoutBuilder(
            builder: (_, cons) => _itemTransCard(cons.maxHeight, index));
      },
    );
  }

  _itemCard(int i) => GestureDetector(
    child: widget.children[i],
    onTap: () {
      animateTo(i);
    },
  );
  static const _scaleFactor = 2 / 3;

  Widget _itemTransCard(double height, int index) {
    late double currScale;

    double originX = (_index - index) * height / 5;
    double originY = (_index - index) * height / 5;
    //左右的相对原点的Y值不一样
    if (index == _index.floor()) {
      // The Current Page Item
      currScale = 1 - (_index - index) * (1 - _scaleFactor);
    } else if (index == _index.floor() + 1) {
      // The Right Page Item
      currScale = _scaleFactor + (_index - index + 1) * (1 - _scaleFactor);
      originY = -originY;
    } else if (index == _index.floor() - 1) {
      // The Left Page Item
      currScale = 1 - (_index - index) * (1 - _scaleFactor);
    } else {
      currScale = _scaleFactor;
      originY = -originY;
    }
    //在x，y上应用变换
    Matrix4 _matrix = Matrix4.diagonal3Values(currScale, currScale, 1)
      ..rotateZ(-(_index - index) / 2)
      ..scale(0.7);

    return Transform(
        alignment: Alignment.center,
        origin: Offset(originX, originY),
        transform: _matrix,
        child: _itemCard(index));
  }

  void animateTo(int index) {
    _controller.animateToPage(index,
        duration: const Duration(milliseconds: 400), curve: Curves.ease);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}