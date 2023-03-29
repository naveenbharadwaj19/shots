import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shots/controllers/new_controller.dart';
import 'package:shots/models/launch_url.dart';
import 'package:swipe_to/swipe_to.dart';

class TechNewsScreen extends StatelessWidget {
  static const routeName = "/tech-news";
  final NewsController _ = Get.put<NewsController>(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          elevation: 20,
          backgroundColor: Theme.of(context).backgroundColor,
          title: Text(
            "Tech Shots",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            IconButton(
                onPressed: () => _.refreshTechNews(),
                icon: Icon(
                  Icons.refresh_rounded,
                  size: 26,
                  color: Theme.of(context).colorScheme.secondary,
                ))
          ],
        ),
        body: GetBuilder<NewsController>(
            init: NewsController(),
            builder: (_) => _.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  )
                : PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: ((context, index) => SwipeTo(
                          iconColor: Colors.transparent,
                          onLeftSwipe: () => openUrl(
                              Uri.parse(_.articles[index]["url"] as String)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _Image(index),
                              _Title(index),
                              Expanded(child: _Content(index)),
                              Flexible(child: _Info(index)),
                            ],
                          ),
                        )),
                    itemCount: _.articles.length,
                  )));
  }
}

class _Image extends GetWidget<NewsController> {
  final int index;
  _Image(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: CachedNetworkImage(
        imageUrl: controller.articles[index]["urlToImage"] as String,
        fit: BoxFit.cover,
        placeholder: (context, url) => Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        errorWidget: (context, url, error) => Center(
          child: Text(error.toString()),
        ),
      ),
    );
  }
}

class _Title extends GetWidget<NewsController> {
  final int index;
  _Title(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Text(
        controller.articles[index]["title"] as String,
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            color: const Color(0xffb8b9c5), fontWeight: FontWeight.w400),
      ),
    );
  }
}

class _Content extends GetWidget<NewsController> {
  final int index;
  _Content(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Text(
        controller.articles[index]["description"] as String,
        // overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: const Color(0xff9c9ca3),
            ),
      ),
    );
  }
}

class _Info extends GetWidget<NewsController> {
  final int index;
  _Info(this.index);

  String sourceName() => controller.articles[index]["source"]["name"] as String;
  String authorName() => controller.articles[index]["author"] as String;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      alignment: Alignment.bottomLeft,
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: const Color(0xff5d5d63),
            ),
        textAlign: TextAlign.left,
        child: Wrap(
          children: [
            const Text(
              "Swipe left for more ",
              // overflow: TextOverflow.ellipsis,
            ),
            Text(
              sourceName(),
              // overflow: TextOverflow.ellipsis,
            ),
            const Text(
              ",",
              // overflow: TextOverflow.ellipsis,
            ),
            Text(
              authorName(),
              // overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
