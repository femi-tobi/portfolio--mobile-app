class _WorkCard extends StatelessWidget {
  final String title;
  final String imageAsset;

  const _WorkCard({required this.title, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;

    return Container(
      key: Key('workCard_$title'),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              imageAsset,
              width: double.infinity,
              height: isLargeScreen ? 200.0 : 150.0,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                debugPrint('Failed to load image asset: $imageAsset');
                return Container(
                  width: double.infinity,
                  height: isLargeScreen ? 200.0 : 150.0,
                  color: Colors.grey[300],
                  child: Center(child: Text('Image unavailable')),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(isLargeScreen ? 15.0 : 10.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}