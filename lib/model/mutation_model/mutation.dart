class Mutation {
  final int id;
  final int userId;
  final String bankName;
  final int accountNumber;
  final String accountName;
  final String debit;
  final String? proof;
  final int isApprove;
  final String createdAt;
  final String updatedAt;

  Mutation({
    required this.id,
    required this.userId,
    required this.bankName,
    required this.accountNumber,
    required this.accountName,
    required this.debit,
    this.proof,
    required this.isApprove,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Mutation.fromJson(Map<String, dynamic> json) {
    return Mutation(
      id: json['id'],
      userId: json['user_id'],
      bankName: json['bank_name'],
      accountNumber: json['account_number'],
      accountName: json['account_name'],
      debit: json['debit'],
      proof: json['proof'],
      isApprove: json['is_approve'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
