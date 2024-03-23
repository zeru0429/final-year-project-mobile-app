// ignore_for_file: use_super_parameters

import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';

class PostCarousel extends StatefulWidget {
  const PostCarousel({Key? key, required this.images}) : super(key: key);
  final List<dynamic> images;

  @override
  State<PostCarousel> createState() => _PostCarouselState();
}

class _PostCarouselState extends State<PostCarousel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: BannerCarousel(
        banners: _buildBannerModels(),
        customizedIndicators: const IndicatorModel.animation(
          width: 15,
          height: 4,
          spaceBetween: 2,
          widthAnimation: 40,
        ),
        height: 285,
        width: MediaQuery.of(context).size.width * 1,
        activeColor: const Color.fromARGB(255, 255, 102, 64),
        disableColor: Colors.white,
        animation: true,
        borderRadius: 20,
        indicatorBottom: false,
      ),
    );
  }

  List<BannerModel> _buildBannerModels() {
    return widget.images
        .map(
          (image) => BannerModel(
            imagePath: image,
            id: image.toString(),
          ),
        )
        .toList();
  }
}
