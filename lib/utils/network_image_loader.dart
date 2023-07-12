import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class NetworkImageLoader extends StatefulWidget {
  final String imageUrl;
  final Widget loader;

  const NetworkImageLoader({
    Key? key,
    required this.imageUrl,
    required this.loader,
  }) : super(key: key);

  @override
  _NetworkImageLoaderState createState() => _NetworkImageLoaderState();
}

class _NetworkImageLoaderState extends State<NetworkImageLoader> {
  bool _isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(NetworkImage(widget.imageUrl), context)
        .then((_) => setState(() {
              _isLoading = false;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Material(
            color: Colors.black38,
            child: Center(
                child: Container(
                    width: 40,
                    height: 40,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: widget.loader)),
          ) // Display the loader widget while image is loading
        : ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
            ),
          );
  }
}
