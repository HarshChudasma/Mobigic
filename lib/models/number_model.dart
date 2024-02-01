class NumberModel{
  int m;
  int n;
  String alphabet;

  NumberModel({required this.m,required this.n,required this.alphabet});

  factory NumberModel.fromJson(Map<String, dynamic> json) => NumberModel(
    m: json["m"],
    n: json["n"],
    alphabet: json["alphabet"],
  );

  Map<String, dynamic> toJson() => {
    "m": m,
    "n": n,
    "alphabet":alphabet,
  };

}