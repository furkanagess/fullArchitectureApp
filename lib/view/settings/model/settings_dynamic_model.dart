class SettingsDynamicModel {
  final String? url;
  final String title;

  SettingsDynamicModel(this.url, this.title);

  factory SettingsDynamicModel.fakeArc() {
    return SettingsDynamicModel(
        "https://www.youtube.com/watch?v=s9tS8D0vPoU&list=PL1k5oWAuBhgV_XnhMSyu2YLZMZNGuD0Cv&index=25", "Project Contributors");
  }
}
