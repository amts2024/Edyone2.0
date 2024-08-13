class Course {
  final int id;
  final String name;
  final String? courseImage;
  final String language;
  final String courseClass;
  final String description;
  final String durationInHours;
  final int totalChapters;
  final String courseRating;
  final int courseTotalRating;
  final String teacherName;
  final String teacherImage;
  final String teacherRating;
  final int teacherTotalRating;
  final String price;

  Course({
    required this.id,
    required this.name,
    this.courseImage,
    required this.language,
    required this.courseClass,
    required this.description,
    required this.durationInHours,
    required this.totalChapters,
    required this.courseRating,
    required this.courseTotalRating,
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
      courseImage: json['course_image'],
      language: json['language'],
      courseClass: json['class'],
      description: json['description'],
      durationInHours: json['duration_in_hours'],
      totalChapters: json['total_chapters'],
      courseRating: json['course_rating'],
      courseTotalRating: json['course_total_rating'],
      teacherName: json['teacher_name'],
      teacherImage: json['teacher_image'],
      teacherRating: json['teacher_rating'],
      teacherTotalRating: json['teacher_total_rating'],
      price: json['price'],
    );
  }
}
