import 'package:delivery_app/components/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletons/skeletons.dart';

class CustomSvg extends StatelessWidget {
  const CustomSvg({
    Key? key, required this.svgName, this.color,
  }) : super(key: key);
  final String svgName;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(Constant.imgAsset('$svgName.svg'),
    
    color: color,
    );
  }
}

class CustomeNetworkImage extends StatelessWidget {
  const CustomeNetworkImage({
    Key? key, required this.url, this.height, this.width, this.fit,
  }) : super(key: key);

  final String url;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(url,
    width: width,
    height: height,
    fit: fit,
     loadingBuilder:(context, child, loadingProgress) {
      if(loadingProgress==null) return child;

      return const SkeletonAvatar(
        style:SkeletonAvatarStyle(
          width: double.infinity,
          height: double.infinity
          
          )
      );
    
      } );
  }
}