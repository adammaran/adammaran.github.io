class CompanyResponse {
  String name;
  String id;
  CompanyStyling styling;

  CompanyResponse(this.name, this.id, this.styling);

  factory CompanyResponse.fromJson(Map<String, dynamic> json) =>
      CompanyResponse(
          json['name'], json['id'], CompanyStyling.fromJson(json['styling']));
}

class CompanyStyling {
  String fontColor;
  double fontSize;
  String fontFamily;

  CompanyStyling(this.fontColor, this.fontSize, this.fontFamily);

  factory CompanyStyling.fromJson(Map<String, dynamic> json) =>
      CompanyStyling(json['font-color'], json['font-size'], json['font-family']);
}
