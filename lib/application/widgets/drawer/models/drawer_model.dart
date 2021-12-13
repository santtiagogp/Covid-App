class DrawerModel {
    DrawerModel({
        required this.options,
    });

    final List<Option> options;
}

class Option {
    Option({
        required this.title,
        required this.route,
    });

    final String title;
    final String route;

}
