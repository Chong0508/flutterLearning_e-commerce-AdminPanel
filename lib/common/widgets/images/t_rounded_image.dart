
import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_admin_panel/common/widgets/shimmers/shimmer.dart';
import 'package:e_commerce_admin_panel/utils/constants/enums.dart';
import 'package:e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.image,
    this.file,
    this.border,
    this.width = 56,
    this.height = 56,
    this.memoryImage,
    this.overlayColor,
    required this.imageType,
    this.backgroundColor,
    this.padding = TSizes.sm,
    this.margin,
    this.fit = BoxFit.contain,
    this.applyImageRadius = true,
    this.borderRadius = TSizes.md
  });

  final bool applyImageRadius;
  final BoxBorder? border;
  final double borderRadius;
  final BoxFit? fit;
  final String? image;
  final File? file;
  final ImageType imageType;
  final Color? overlayColor;
  final Color? backgroundColor;
  final Uint8List? memoryImage;
  final double width, height, padding;
  final double? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin != null ? EdgeInsets.all(margin!) : null,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(border: border, color: backgroundColor, borderRadius: BorderRadius.circular(borderRadius)),
      child: _buildImageWidget(),
    );
  }

  Widget _buildImageWidget() {
    Widget? imageWidget;

    // Function to build the network iamge widget
    // ignore: no_leading_underscores_for_local_identifiers
    Widget _buildNetworkImage() {
      if(image != null) {
        // Use CachedNetworkImage for efficient loading and caching of network images // Not working in Web but just for laoding
        return CachedNetworkImage(
          fit: fit,
          color: overlayColor,
          imageUrl: image!,
          errorWidget: (context, url, error) => const Icon(Icons.error),
          progressIndicatorBuilder: (context, url, downloadProgress) => TShimmerEffect(width: width, height: height),
        );
      } else {
        // Return an empty container if no mage is provided
        return Container();
      }
    }

    // Function to build the memory image widget
    // ignore: no_leading_underscores_for_local_identifiers
    Widget _buildMemoryImage() {
      if(memoryImage != null) {
        // Display image from memory using Image widget
        return Image(fit: fit, image: MemoryImage(memoryImage!), color: overlayColor);
      } else {
        // Return an empty container if no image is provided
        return Container();
      }
    }

    // Function to build the asset widget
    // ignore: unused_element, no_leading_underscores_for_local_identifiers
    Widget _buildFileImage() {
      if(file != null) {
        // Display image from assets usng Image widget
        return Image(fit: fit, image: FileImage(file!), color: overlayColor);
      } else {
          
        // Return an empty container if no image is provided
        return Container();
      }
      
    }

    // Functionto build the asset image widget
    // ignore: no_leading_underscores_for_local_identifiers
    Widget _buildAssetImage() {
      if(image != null) {
        // Display image from assets using Image widget
        return Image(fit: fit, image: AssetImage(image!), color: overlayColor);
      } else {
        // Return an empty container if no image is provided
        return Container();
      }
    }

    switch(imageType) {
      case ImageType.network:
        imageWidget = _buildNetworkImage();
        break;
      case ImageType.memory:
        imageWidget = _buildMemoryImage();
        break;
      case ImageType.file:
        imageWidget = _buildFileImage();
        break;
      case ImageType.asset:
        imageWidget = _buildAssetImage();
        break;
    }

    // Apply ClipRRect directly to the image widget
    return ClipRRect(
      borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
      child: imageWidget,
    );
  }
}