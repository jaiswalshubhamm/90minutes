class Countries {
  String get;
  int results;
  Paging paging;
  List<Response> response;

  Countries({this.get, this.results, this.paging, this.response});

  Countries.fromJson(Map<String, dynamic> json) { 
    get = json['get'];
    results = json['results'];
    paging =
        json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
    if (json['response'] != null) {
      response = new List<Response>();
      json['response'].forEach((v) {
        response.add(new Response.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['get'] = this.get;
    data['results'] = this.results;
    if (this.paging != null) {
      data['paging'] = this.paging.toJson();
    }
    if (this.response != null) {
      data['response'] = this.response.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Paging {
  int current;
  int total;

  Paging({this.current, this.total});

  Paging.fromJson(Map<String, dynamic> json) {
    current = json['current'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current'] = this.current;
    data['total'] = this.total;
    return data;
  }
}

class Response {
  String name;
  String code;
  String flag;
  bool isExpanded;

  Response({
    this.name,
    this.code,
    this.flag,
    this.isExpanded = false,
  });

  Response.fromJson(Map<String, dynamic> json) {
    isExpanded = false;
    name = json['name'];
    code = json['code'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    data['flag'] = this.flag;
    return data;
  }
}
