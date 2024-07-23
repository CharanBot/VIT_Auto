import 'package:flutter/material.dart';

class suggetions extends StatelessWidget {
  const suggetions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = (screenWidth - 32 - 16 * 2) / 3;

    final categories = [
      {
        'title': 'Railway Station',
        'image': 'assets/icons/Railway Station.png',
      },
      {
        'title': 'Bus Stand',
        'image': 'assets/icons/Bus Stop.png',
      },
      {
        'title': 'Vijayawada',
        'image': 'assets/icons/City.png',
      },
    ];

    return SizedBox(
      height: 130,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: categories.map((category) {
            return TVerticalImageText(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey.withOpacity(0.2)
                  : Colors.white.withOpacity(0.12),
              title: category['title'] as String,
              width: imageWidth,
              assetImage: category['image'] as String,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class TVerticalImageText extends StatelessWidget {
  final Color color;
  final String title;
  final double width;
  final String? assetImage;

  const TVerticalImageText({
    Key? key,
    required this.color,
    required this.title,
    required this.width,
    this.assetImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              width: width - 5.39,
              height: 80,
              color: color,
              child: assetImage != null
                  ? Padding(
                      padding:
                          const EdgeInsets.all(8.0), // padding here for image
                      child: Image.asset(
                        assetImage!,
                        fit: BoxFit.contain,
                      ),
                    )
                  : null,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Raleway',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
