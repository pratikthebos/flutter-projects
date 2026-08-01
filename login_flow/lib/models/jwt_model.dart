class JwtModel {
  final String header;
  final String payload;
  final String signature;
  final String token;

  const JwtModel({
    required this.header,
    required this.payload,
    required this.signature,
    required this.token,
  });

  factory JwtModel.demo() {
    return const JwtModel(
      header: "HS256",
      payload: "{id:101, role:'Developer'}",
      signature: "8X7ASD9KJ29DKS0A...",
      token:
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.demo.payload.signature",
    );
  }
}