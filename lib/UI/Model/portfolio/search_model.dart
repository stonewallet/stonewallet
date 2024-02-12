class SearchData {
  double? bitcoin;
  double? ethereum;
  double? tether;
  double? solana;
  double? xRP;
  double? uSDCoin;
  double? cardano;
  double? stakedEther;
  double? chainlink;
  double? celestia;

  SearchData(
      {this.bitcoin,
      this.ethereum,
      this.tether,
      this.solana,
      this.xRP,
      this.uSDCoin,
      this.cardano,
      this.stakedEther,
      this.chainlink,
      this.celestia});

  SearchData.fromJson(Map<String, dynamic> json) {
    bitcoin = json['Bitcoin'];
    ethereum = json['Ethereum'];
    tether = json['Tether'];
    solana = json['Solana'];
    xRP = json['XRP'];
    uSDCoin = json['USD Coin'];
    cardano = json['Cardano'];
    stakedEther = json['Staked Ether'];
    chainlink = json['Chainlink'];
    celestia = json['Celestia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Bitcoin'] = bitcoin;
    data['Ethereum'] = ethereum;
    data['Tether'] = tether;
    data['Solana'] = solana;
    data['XRP'] = xRP;
    data['USD Coin'] = uSDCoin;
    data['Cardano'] = cardano;
    data['Staked Ether'] = stakedEther;
    data['Chainlink'] = chainlink;
    data['Celestia'] = celestia;
    return data;
  }
   bool matchesQuery(String query) {
    // Convert all values to lowercase for case-insensitive matching
    String queryLower = query.toLowerCase();
    return bitcoin.toString().toLowerCase().contains(queryLower) ||
        ethereum.toString().toLowerCase().contains(queryLower) ||
        tether.toString().toLowerCase().contains(queryLower) ||
        solana.toString().toLowerCase().contains(queryLower) ||
        xRP.toString().toLowerCase().contains(queryLower) ||
        uSDCoin.toString().toLowerCase().contains(queryLower) ||
        cardano.toString().toLowerCase().contains(queryLower) ||
        stakedEther.toString().toLowerCase().contains(queryLower) ||
        chainlink.toString().toLowerCase().contains(queryLower) ||
        celestia.toString().toLowerCase().contains(queryLower);
  }
}