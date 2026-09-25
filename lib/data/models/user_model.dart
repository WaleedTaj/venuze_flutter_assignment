class UserModel {
  const UserModel({
    required this.id,
    required this.email,
    this.name,
    this.firstName,
    this.lastName,
    this.phone,
    this.profileImage,
    this.role,
    this.businessName,
  });

  final String id;
  final String email;
  final String? name;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? profileImage;
  final String? role;
  final String? businessName;

  String get displayName {
    final full = [
      firstName,
      lastName,
    ].whereType<String>().where((s) => s.isNotEmpty).join(' ');
    if (full.isNotEmpty) return full;
    if (name != null && name!.isNotEmpty) return name!;
    return email;
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final profile = json['profile'];
    return UserModel(
      id: json['id'] as String? ?? '',
      email: json['email'] as String? ?? '',
      name: json['name'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      phone: json['phone'] as String?,
      profileImage: json['profile_image'] as String?,
      role: json['role'] as String?,
      businessName: profile is Map
          ? profile['business_name'] as String?
          : json['business_name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'name': name,
    'first_name': firstName,
    'last_name': lastName,
    'phone': phone,
    'profile_image': profileImage,
    'role': role,
    'business_name': businessName,
  };
}
