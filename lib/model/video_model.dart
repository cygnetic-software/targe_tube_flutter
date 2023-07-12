import 'package:cloud_firestore/cloud_firestore.dart';

class VideoModel {
  DateTime dateUploaded;
  bool isPending;
  int views;
  List<dynamic> reports;
  Map<String, dynamic> uploaderDetails;
  String uploaderId;
  String title;
  String description;
  String category;
  String subcategory;
  String url;
  String? thumbnail;
  VideoModel({
    required this.dateUploaded,
    required this.isPending,
    required this.views,
    required this.reports,
    required this.uploaderDetails,
    required this.uploaderId,
    required this.title,
    required this.description,
    required this.category,
    required this.subcategory,
    required this.url,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    final data = VideoModel(
      dateUploaded: (json['date_uploaded'] as Timestamp).toDate(),
      isPending: json['is_pending'],
      views: json['views'],
      reports: json['reports'],
      uploaderDetails: json['uploader_details'],
      uploaderId: json['uploader_id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      subcategory: json['subcategory'],
      url: json["url"],
    );
    data.thumbnail = json['thumbnail'];
    return data;
  }

  Map<String, dynamic> toJson() {
    return {
      'date_uploaded': dateUploaded,
      'is_pending': isPending,
      'views': views,
      'reports': reports,
      'uploader_details': uploaderDetails,
      'uploader_id': uploaderId,
      'title': title,
      'description': description,
      'category': category,
      'subcategory': subcategory,
      'url': url,
      'thumbnail': thumbnail
    };
  }
}
