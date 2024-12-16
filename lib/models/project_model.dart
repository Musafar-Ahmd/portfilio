class Projects {
  String? project;
  String? image;
  String? description;
  String? androidUrl;
  String? iosUrl;

  Projects(
      {this.project,
        this.image,
        this.description,
        this.androidUrl,
        this.iosUrl});

  Projects.fromJson(Map<String, dynamic> json) {
    project = json['project'];
    image = json['image'];
    description = json['description'];
    androidUrl = json['androidUrl'];
    iosUrl = json['iosUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['project'] = this.project;
    data['image'] = this.image;
    data['description'] = this.description;
    data['androidUrl'] = this.androidUrl;
    data['iosUrl'] = this.iosUrl;
    return data;
  }
}
