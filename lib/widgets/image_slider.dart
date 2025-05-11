import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  final int length;
  final bool autoPlay;
  final bool showPageIndicator;
  final double? height;
  final bool infiniteScroll;
  final Widget Function(BuildContext context, int index) builder;

  const ImageSlider({
    super.key,
    required this.length,
    this.autoPlay = true,
    this.showPageIndicator = true,
    this.height,
    this.infiniteScroll = true,
    required this.builder,
  });

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  ValueNotifier<int> indexNotifier = ValueNotifier<int>(0);
  late final PageController controller;
  final imageController = CarouselSliderController();

  @override
  void initState() {
    super.initState();
    controller = PageController(viewportFraction: 1, keepPage: true, initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: widget.length,
          carouselController: imageController,
          itemBuilder: (c, i, a) => widget.builder(c, i),
          options: CarouselOptions(
              height: widget.height,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlay: widget.length > 1 ? widget.autoPlay : false,
              enableInfiniteScroll: widget.length > 1 ? widget.infiniteScroll : false,
              viewportFraction: 1,
              initialPage: 0,
              onPageChanged: widget.showPageIndicator
                  ? (i, r) {
                      indexNotifier.value = i;
                    }
                  : null),
        ),
        if (widget.showPageIndicator && widget.length > 1)
          Positioned(
            bottom: 11,
            right: 0,
            left: 0,
            child: Align(
              alignment: Alignment.center,
              child: ValueListenableBuilder<int>(
                  valueListenable: indexNotifier,
                  builder: (BuildContext context, int index, Widget? child) {
                    return AnimatedSmoothIndicator(
                      activeIndex: indexNotifier.value,
                      count: widget.length,
                      onDotClicked: (index) {
                        imageController.animateToPage(index);
                      },
                      effect: ScrollingDotsEffect(
                        spacing: 5.w,
                        dotColor: const Color(0xff9494A9),
                        activeDotColor: Colors.white,
                        dotHeight: 8.sp,
                        maxVisibleDots: 5,
                        dotWidth: 8.sp,
                      ),
                    );
                  }),
            ),
          ),
      ],
    );
  }
}
