class AppMenuItem {
  const AppMenuItem(this.name, this.route, this.icon, {this.size = 128});

  final String name;
  final String route;
  final String icon;
  final double size;
}
