class TransactionModel {
  final int id;
  final String transactionCode;
  final int userId;
  final int productCategoryId;
  final String longitude;
  final String latitude;
  final String address;
  final int transactionStatus;
  final String createdAt;
  final String updatedAt;
  final Category? category;
  final Schedule? schedule;

  TransactionModel({
    required this.id,
    required this.transactionCode,
    required this.userId,
    required this.productCategoryId,
    required this.longitude,
    required this.latitude,
    required this.address,
    required this.transactionStatus,
    required this.createdAt,
    required this.updatedAt,
    this.category,
    this.schedule,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      transactionCode: json['transaction_code'],
      userId: json['user_id'],
      productCategoryId: json['product_category_id'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      address: json['address'],
      transactionStatus: json['transaction_status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      category:
          json['category'] != null ? Category.fromJson(json['category']) : null,
      schedule:
          json['schedule'] != null ? Schedule.fromJson(json['schedule']) : null,
    );
  }
}

class Category {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Schedule {
  final int id;
  final int userId;
  final int transactionId;
  final String date;
  final int pickupStatus;
  final String createdAt;
  final String updatedAt;

  Schedule({
    required this.id,
    required this.userId,
    required this.transactionId,
    required this.date,
    required this.pickupStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      id: json['id'],
      userId: json['user_id'],
      transactionId: json['transaction_id'],
      date: json['date'],
      pickupStatus: json['pickup_status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
