class Gender {
  Gender({
    required this.count,
    required this.name,
    required this.gender,
    required this.probability,
  });
  late final int count;
  late final String name;
  late final String? gender;
  late final double probability;
  
  Gender.fromJson(Map<String, dynamic> json){
    count = json['count'];
    name = json['name'];
    gender = json['gender'];
    probability = json['probability'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;
    _data['name'] = name;
    _data['gender'] = gender;
    _data['probability'] = probability;
    return _data;
  }
}