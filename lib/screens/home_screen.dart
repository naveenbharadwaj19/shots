import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shots/screens/tech_news_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
                child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text("Shots",
                  style: Theme.of(context).textTheme.headlineLarge),
            )),
            const SizedBox(height: 30),
            _Buttons()
          ],
        ),
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myFeed = Container(
      margin: const EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, TechNewsScreen.routeName),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                "assets/svg/feeds.svg",
                color: Theme.of(context).colorScheme.secondary,
                height: 80,
                width: 50,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Tech Feed",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
    var allNews = Container(
      margin: const EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                "assets/svg/news.svg",
                color: Theme.of(context).colorScheme.secondary,
                height: 80,
                width: 50,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "All News",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
    var topStories = Container(
      margin: const EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                "assets/svg/star.svg",
                color: Theme.of(context).colorScheme.secondary,
                height: 80,
                width: 50,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Top Stories",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
    var settings = Container(
      margin: const EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                "assets/svg/settings.svg",
                color: Theme.of(context).colorScheme.secondary,
                height: 80,
                width: 50,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Settings",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      mainAxisSpacing: 10,
      crossAxisSpacing: 20,
      children: [
        myFeed,
        allNews,
        topStories,
        settings,
      ],
    );
  }
}
