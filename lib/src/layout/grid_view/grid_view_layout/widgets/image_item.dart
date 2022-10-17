import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ImageItem extends StatefulWidget {
  final String url;
  final String currentSelectedUrl;

  final void Function()? onTapped;

  const ImageItem(this.url, this.currentSelectedUrl, {this.onTapped});

  @override
  State<ImageItem> createState() => _ImageItemState();
}

class _ImageItemState extends State<ImageItem> {
  @override
  Widget build(BuildContext context) => InkWell(
      onTap: widget.onTapped,
      borderRadius: BorderRadius.circular(5),
      child: Stack(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              width: 240,
              height: 320,
              placeholder: (context, url) =>
                  LayoutBuilder(builder: (context, constraints) {
                    print(constraints);
                    return Center(
                      child: LoadingAnimationWidget.beat(
                        color: Colors.white,
                        size: 100,
                      ),
                    );
                  }),
              imageUrl: widget.url,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              alignment: Alignment.center,
              fit: BoxFit.cover,
            )),
        Visibility(
          visible: widget.url == widget.currentSelectedUrl,
          child: Positioned(
              bottom: 0,
              child: Container(
                width: 135,
                height: 27,
                alignment: Alignment.center,
                color: Colors.lightGreen.withOpacity(0.8),
                child: const Icon(Icons.check_sharp, color: Colors.white),
              )),
        ),
      ]));
}
