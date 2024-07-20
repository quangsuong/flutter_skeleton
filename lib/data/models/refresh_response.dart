class RefreshResponse {
  String? accessToken;
  String? refreshToken;
  RefreshResponse({
    this.accessToken,
    this.refreshToken,
  });

  factory RefreshResponse.fromJson(Map<String, dynamic> json) =>
      RefreshResponse(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };
}
