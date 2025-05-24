class ServiceModel {
  final String title;
  final String description;
  final String iconUrl;
  final String backgroundImage;

  ServiceModel({
    required this.title,
    required this.description,
    required this.iconUrl,
    required this.backgroundImage,
  });

  factory ServiceModel.fromMap(Map<String, dynamic> data) {
    return ServiceModel(
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      iconUrl: data['icon'] ?? '',
      backgroundImage: data['background_image'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'icon': iconUrl,
      'background_image': backgroundImage,
    };
  }
}