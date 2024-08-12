class Course {
  final int id;
  final String name;
  final String? image;
  final String language;
  final String courseClass;
  final String description;
  final String duration;
  final int totalChapters;
  final String rating;
  final int totalRating;
  final String teacherName;
  final String teacherImage;
  final String teacherRating;
  final int teacherTotalRating;
  final String price;

  Course({
    required this.id,
    required this.name,
    this.image,
    required this.language,
    required this.courseClass,
    required this.description,
    required this.duration,
    required this.totalChapters,
    required this.rating,
    required this.totalRating,
    required this.teacherName,
    required this.teacherImage,
    required this.teacherRating,
    required this.teacherTotalRating,
    required this.price,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['course_id'],
      name: json['name'],
      image: json['course_image'],
      language: json['language'],
      courseClass: json['class'],
      description: json['description'],
      duration: json['duration_in_hours'],
      totalChapters: json['total_chapters'],
      rating: json['course_rating'],
      totalRating: json['course_total_rating'],
      teacherName: json['teacher_name'],
      teacherImage: json['teacher_image'],
      teacherRating: json['teacher_rating'],
      teacherTotalRating: json['teacher_total_rating'],
      price: json['price'],
    );
  }
}
