class Sizes {
  bool s;
  bool m;
  bool l;
  bool xs;
  bool xl;

  Sizes({
    required this.s,
    required this.m,
    required this.l,
    required this.xs,
    required this.xl,
  });

  Sizes copyWith({
    bool? s,
    bool? m,
    bool? l,
    bool? xs,
    bool? xl,
  }) {
    return Sizes(
      s: s ?? this.s,
      m: m ?? this.m,
      l: l ?? this.l,
      xs:xs ?? this.xs,
      xl: xl ?? this.xl,
    );
  }
}
