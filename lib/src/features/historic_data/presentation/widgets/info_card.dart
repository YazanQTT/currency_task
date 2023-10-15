import '../../../../src.export.dart';

class InfoCard extends StatelessWidget {
  final String date;
  final String flag;
  final double rate;

  const InfoCard({
    super.key,
    required this.date,
    required this.flag,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.black,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          title: getTitle(),
        ),
      ),
    );
  }

  Widget getTitle() {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
            child: Text(date),
          ),
          const VerticalDivider(),
          CachedImage(imageUrl: flag),
          const VerticalDivider(),
          FittedBox(
            child: Text(
              rate.toStringAsFixed(4),
            ),
          ),
        ],
      ),
    );
  }
}
