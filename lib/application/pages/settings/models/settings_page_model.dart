class SettingsModel {
    SettingsModel({
        required this.title,
        required this.options,
    });

    final String title;
    final List<Option> options;
}

class Option {
    Option({
        required this.opt,
    });

    final String opt;
}
