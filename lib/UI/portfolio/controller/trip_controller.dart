import 'package:get/get.dart';
import 'package:stone_wallet_main/API/portfolio_api/api_services.dart';
import 'package:stone_wallet_main/UI/Model/portfolio/portfolio_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PortfolioControllerTrip extends GetxController {
  final tripPortfolios = <Portfolio>[].obs;
  Stream<List<Portfolio>> get portfoliosStream => tripPortfolios.stream;
  RxDouble totalValue = 0.0.obs;
  RxMap<String, double> dataMap = <String, double>{}.obs;
  TooltipBehavior? tooltipBehavior;
  @override
  void onInit() {
    super.onInit();
    fetchData();
    tooltipBehavior = TooltipBehavior(enable: true);
  }

  fetchData() async {
    try {
      final apiService = ApiService();
      final data = await apiService.getDataForLoan();
      tripPortfolios.assignAll(data);
      totalValue.value = calculateTotalValue();
      tripPortfolios.refresh();
      dataMap.value = getDataMap();
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  double calculateTotalValue() {
    return tripPortfolios.fold(0.0, (sum, portfolio) => sum + portfolio.value);
  }

  Map<String, double> getDataMap() {
    return tripPortfolios.fold<Map<String, double>>({}, (map, portfolio) {
      map[portfolio.coinName] = portfolio.quantity;
      return map;
    });
  }

  Stream<List<GDPData>> getChartData() async* {
    try {
      // Wait for the portfolios data to be fetched
      await fetchData();

      // Map the portfolio data to GDPData objects
      final List<GDPData> chartData = tripPortfolios.map((portfolio) {
        return GDPData(portfolio.coinName, portfolio.value);
      }).toList();

      yield chartData;
    } catch (e) {
      print('Error fetching chart data: $e');
      yield []; // Return an empty list if there's an error
    }
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final double gdp;
}
