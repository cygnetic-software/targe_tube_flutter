class VideoModel {
  var title;
  var description;
  var id;
  var imageUrl;
  var isUrl;
  var url;
  var userId;

  VideoModel(
      {required this.title,
      required this.id,
      required this.imageUrl,
      this.description,
      this.url,
      this.isUrl,
      this.userId});
}
