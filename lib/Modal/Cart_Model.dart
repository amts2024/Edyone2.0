import 'dart:convert'; // Import for jsonDecode

class CartModel {
  final String message;
  final CartData data;
  final bool status;

  CartModel({
    required this.message,
    required this.data,
    required this.status,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      message: json['message'] ?? '',
      data: CartData.fromJson(json['data'] ?? {}),
      status: json['status'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data.toJson(),
      'status': status,
    };
  }
}

class CartData {
  final CartOriginal original;
  final Map<String, dynamic> headers;

  CartData({
    required this.original,
    required this.headers,
  });

  factory CartData.fromJson(Map<String, dynamic> json) {
    return CartData(
      original: CartOriginal.fromJson(json['original'] ?? {}),
      headers: json['headers'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'original': original.toJson(),
      'headers': headers,
    };
  }
}

class CartOriginal {
  final List<CourseDetail> courseDetails;
  final List<dynamic> batchDetails;
  final PriceSummary priceSummary;
  final bool status;

  CartOriginal({
    required this.courseDetails,
    required this.batchDetails,
    required this.priceSummary,
    required this.status,
  });

  factory CartOriginal.fromJson(Map<String, dynamic> json) {
    return CartOriginal(
      courseDetails: (json['course_details'] as List<dynamic>? ?? [])
          .map((e) => CourseDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      batchDetails: json['batch_details'] ?? [],
      priceSummary: PriceSummary.fromJson(json['price_summary'] ?? {}),
      status: json['status'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'course_details': courseDetails.map((e) => e.toJson()).toList(),
      'batch_details': batchDetails,
      'price_summary': priceSummary.toJson(),
      'status': status,
    };
  }
}

class CourseDetail {
  final int cartId;
  final int courseId;
  final String courseName;
  final String coursePrice;
  final String teacherName;
  final String teacherImage;
  final int totalChapters;

  CourseDetail({
    required this.cartId,
    required this.courseId,
    required this.courseName,
    required this.coursePrice,
    required this.teacherName,
    required this.teacherImage,
    required this.totalChapters,
  });

  factory CourseDetail.fromJson(Map<String, dynamic> json) {
    return CourseDetail(
      cartId: json['cart_id'] ?? 0,
      courseId: json['course_id'] ?? 0,
      courseName: json['course_name'] ?? '',
      coursePrice: json['course_price'] ?? '',
      teacherName: json['teacher_name'] ?? '',
      teacherImage: json['teacher_image'] ?? '',
      totalChapters: json['total_chapters'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cart_id': cartId,
      'course_id': courseId,
      'course_name': courseName,
      'course_price': coursePrice,
      'teacher_name': teacherName,
      'teacher_image': teacherImage,
      'total_chapters': totalChapters,
    };
  }
}

class PriceSummary {
  final int subtotal;
  final int gst;
  final dynamic promoCode;
  final int totalAmount;
  final int discountsApplied;

  PriceSummary({
    required this.subtotal,
    required this.gst,
    required this.promoCode,
    required this.totalAmount,
    required this.discountsApplied,
  });

  factory PriceSummary.fromJson(Map<String, dynamic> json) {
    return PriceSummary(
      subtotal: json['subtotal'] ?? 0,
      gst: json['gst'] ?? 0,
      promoCode: json['promo_code'],
      totalAmount: json['total_amount'] ?? 0,
      discountsApplied: json['discounts_applied'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subtotal': subtotal,
      'gst': gst,
      'promo_code': promoCode,
      'total_amount': totalAmount,
      'discounts_applied': discountsApplied,
    };
  }
}
