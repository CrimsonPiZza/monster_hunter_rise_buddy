import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: subTitle != ''
          ? ListTileWithSubtitle(title: title, subTitle: subTitle)
          : ListTileWithNoSubtitle(title: title),
    );
  }
}

class ListTileWithSubtitle extends StatelessWidget {
  const ListTileWithSubtitle({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).backgroundColor,
          boxShadow: const [
            BoxShadow(
              blurRadius: 0.8,
              color: Color.fromRGBO(0, 0, 0, 0.5),
              spreadRadius: 0.1,
            )
          ],
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
      subtitle: Text(
        subTitle,
        style: const TextStyle(fontSize: 8),
      ),
    );
  }
}

class ListTileWithNoSubtitle extends StatelessWidget {
  const ListTileWithNoSubtitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).backgroundColor,
          boxShadow: const [
            BoxShadow(
              blurRadius: 0.8,
              color: Color.fromRGBO(0, 0, 0, 0.5),
              spreadRadius: 0.1,
            )
          ],
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
