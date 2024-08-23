import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Nunito'),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pageController;
  int totalPage = 5;

  void onScroll() {}

  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
    )..addListener(onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          makePage(
              page: 1,
              image: 'assets/one.jpg',
              title: 'Grand Canyon, Arizona',
              description:
              "One of the most iconic natural wonders in the USA, the Grand Canyon is a steep-sided canyon carved by the Colorado River. It's a must-visit destination for hikers, campers, and nature lovers. The canyon's vast expanse and stunning vistas will leave you awestruck."),
          makePage(
              page: 2,
              image: 'assets/two.jpg',
              title: 'Yellowstone National Park, Wyoming',
              description:
              "America's first national park is home to geysers, hot springs, and an incredible array of wildlife. From grizzly bears to wolves, and elk to bison, Yellowstone is a nature enthusiast's paradise. The park's unique geothermal features will fascinate and delight you."),
          makePage(
              page: 3,
              image: 'assets/three.jpg',
              title: 'Yosemite National Park, California',
              description:
              "Known for its granite cliffs, waterfalls, and giant sequoia groves, Yosemite is a hiker's dream destination. The park's picturesque valleys, meadows, and lakes offer breathtaking scenery and endless opportunities for outdoor adventure. From rock climbing to birdwatching, Yosemite has something for everyone."),
          makePage(
              page: 4,
              image: 'assets/four.jpg',
              title: 'Zion National Park, Utah',
              description:
              "With its red rock canyons, unique rock formations, and diverse wildlife, Zion is a nature lover's haven. Hike through the Narrows, explore the Emerald Pools, or take in the breathtaking views from Angels Landing – Zion's beauty will leave you speechless."),
          makePage(
              page: 5,
              image: 'assets/five.jpg',
              title: 'Maui, Hawaii',
              description:
              "With its stunning beaches, lush rainforests, and volcanic landscapes, Maui is a tropical paradise. Watch the sunrise from Haleakala National Park, drive the scenic Road to Hana, or simply relax on Ka'anapali Beach – Maui's natural beauty will captivate and inspire you."),
        ],
      ),
    );
  }

  Widget makePage({required String image, required String title, required String description, required int page}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(image),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: const [0.3, 0.9],
            colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.2),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(page.toString(), style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),
                  Text('/$totalPage', style: const TextStyle(fontSize: 15, color: Colors.white),)
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoopAnimationBuilder<double>(
                      tween: Tween(begin: 0.8, end: 1.0), // Scale animation
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeInOut,
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: child,
                        );
                      },
                      child: Text(
                        title,
                        style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const Icon(Icons.star, color: Colors.grey, size: 15,),
                        ),
                        const Text('4.0', style: TextStyle(fontSize: 12, color: Colors.white70),),
                        const Text('(2300)', style: TextStyle(fontSize: 12, color: Colors.white38),),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(right: 50.0),
                      child: Text(description, style: TextStyle(color: Colors.white.withOpacity(.7), height: 1.9, fontSize: 15),),
                    ),
                    const SizedBox(height: 20,),
                    const Text('READMORE', style: TextStyle(fontSize: 12, color: Colors.white),),
                    const SizedBox(height: 30,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
