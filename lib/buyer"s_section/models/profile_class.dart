class ProfileClass {
  final String username;
  final String email;
  final String whatsappNumber;
  final bool infoLoading;
  final bool isMessageSending;
  final bool isDisputeReportSending;
  final bool isAdReporting;
  final bool isLoggingOutUser;
  final bool isAccountDeleting;
  final bool isDoneDeleted;

  // ✅ Constructor
  ProfileClass({
    required this.username,
    required this.email,
    required this.whatsappNumber,
    this.infoLoading = false,
    this.isMessageSending = false,
    this.isDisputeReportSending = false,
    this.isAdReporting = false,
    this.isLoggingOutUser = false,
    this.isAccountDeleting = false,   // ✅ added
    this.isDoneDeleted=false,
  });

  // ✅ From JSON (Map)
  factory ProfileClass.fromJson(Map<String, dynamic> json) {
    return ProfileClass(
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      whatsappNumber: json['whatsappNumber'] ?? '',
    );
  }

  // ✅ To JSON (Map)
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'whatsappNumber': whatsappNumber,
    };
  }

  // ✅ CopyWith
  ProfileClass copyWith({
    String? username,
    String? email,
    String? whatsappNumber,
    bool? infoLoading,
    bool? isMessageSending,
    bool? isDisputeReportSending,
    bool? isAdReporting,
    bool? isLoggingOutUser,
    bool? isAccountDeleting, // ✅ added
    bool? isDoneDeleted,
  }) {
    return ProfileClass(
      username: username ?? this.username,
      email: email ?? this.email,
      whatsappNumber: whatsappNumber ?? this.whatsappNumber,
      infoLoading: infoLoading ?? this.infoLoading,
      isMessageSending: isMessageSending ?? this.isMessageSending,
      isDisputeReportSending:
      isDisputeReportSending ?? this.isDisputeReportSending,
      isAdReporting: isAdReporting ?? this.isAdReporting,
      isLoggingOutUser: isLoggingOutUser ?? this.isLoggingOutUser,
      isAccountDeleting: isAccountDeleting ?? this.isAccountDeleting, // ✅ added
      isDoneDeleted: isDoneDeleted?? this.isDoneDeleted,
    );
  }
}
