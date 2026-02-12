import 'package:flutter/material.dart';

class CarouselViewDemo extends StatefulWidget {
  const CarouselViewDemo({super.key});

  @override
  State<CarouselViewDemo> createState() => _CarouselViewDemoState();
}

class _CarouselViewDemoState extends State<CarouselViewDemo> {
  final CarouselController controller = CarouselController(initialItem: 1);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 300),
          child: CarouselView.weighted(
            controller: controller,
            itemSnapping: true,
            flexWeights: const <int>[2, 7, 2],
            children:
                ImageInfo.values.map((ImageInfo image) {
                  return HeroLayoutCard(imageInfo: image);
                }).toList(),
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 160),
          child: CarouselView.weighted(
            flexWeights: const <int>[3, 3, 3, 2, 1],
            consumeMaxWeight: false,
            children:
                CardInfo.values.map((CardInfo info) {
                  return ColoredBox(
                    color: info.backgroundColor,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(info.icon, color: info.color, size: 32.0),
                          Text(
                            info.label,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.clip,
                            softWrap: false,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}

class HeroLayoutCard extends StatelessWidget {
  const HeroLayoutCard({super.key, required this.imageInfo});

  final ImageInfo imageInfo;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: OverflowBox(
            maxWidth: width * 7 / 8,
            minWidth: width * 7 / 8,
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://flutter.github.io/assets-for-api-docs/assets/material/${imageInfo.url}',
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: <Widget>[
              Text(
                imageInfo.title,
                overflow: TextOverflow.clip,
                softWrap: false,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 5.0,
                      color: Color.fromARGB(180, 0, 0, 0),
                    ),
                  ],
                ),
              ),
              Text(
                imageInfo.subtitle,
                overflow: TextOverflow.clip,
                softWrap: false,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 5.0,
                      color: Color.fromARGB(180, 0, 0, 0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

enum CardInfo {
  camera('Cameras', Icons.video_call, Color(0xff2354C7), Color(0xffECEFFD)),
  lighting('Lighting', Icons.lightbulb, Color(0xff806C2A), Color(0xffFAEEDF)),
  climate('Climate', Icons.thermostat, Color(0xffA44D2A), Color(0xffFAEDE7)),
  wifi('Wifi', Icons.wifi, Color(0xff417345), Color(0xffE5F4E0)),
  media('Media', Icons.library_music, Color(0xff2556C8), Color(0xffECEFFD)),
  security(
    'Security',
    Icons.crisis_alert,
    Color(0xff794C01),
    Color(0xffFAEEDF),
  ),
  safety(
    'Safety',
    Icons.medical_services,
    Color(0xff2251C5),
    Color(0xffECEFFD),
  ),
  more('', Icons.add, Color(0xff201D1C), Color(0xffE3DFD8));

  const CardInfo(this.label, this.icon, this.color, this.backgroundColor);

  final String label;
  final IconData icon;
  final Color color;
  final Color backgroundColor;
}

enum ImageInfo {
  image1(
    'Through the Pane',
    'Sponsored | Season 1 Now Streaming',
    'content_based_color_scheme_1.png',
  ),
  image2(
    'Iridescence',
    'Sponsored | Season 1 Now Streaming',
    'content_based_color_scheme_3.png',
  ),
  image3(
    'Sea Change',
    'Sponsored | Season 1 Now Streaming',
    'content_based_color_scheme_4.png',
  ),
  image4(
    'Blue Symphony',
    'Sponsored | Season 1 Now Streaming',
    'content_based_color_scheme_5.png',
  ),
  image5(
    'When It Rains',
    'Sponsored | Season 1 Now Streaming',
    'content_based_color_scheme_6.png',
  );

  const ImageInfo(this.title, this.subtitle, this.url);

  final String title;
  final String subtitle;
  final String url;
}
