import '../../src.export.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  const CachedImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      filterQuality: FilterQuality.high,
      placeholder: (_, __) {
        return const CenterProgressIndicator();
      },
      errorWidget: (_, __, error) {
        return const Icon(Icons.image_not_supported_outlined);
      },
    );
  }
}
