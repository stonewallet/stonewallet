class GetWalletResponse {
  String? address;
  String? mnemonic;

  GetWalletResponse({address, mnemonic});

  GetWalletResponse.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    mnemonic = json['mnemonic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['address'] = address;
    data['mnemonic'] = mnemonic;
    return data;
  }
}
