import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:stone_wallet_main/API/portfolio_api/api_services.dart';
import 'package:stone_wallet_main/UI/Model/portfolio/portfolio_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PortfolioController2 extends GetxController {
  final assetsPortfolios = <Portfolio>[].obs;
  Stream<List<Portfolio>> get portfoliosStream => assetsPortfolios.stream;
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
      final data = await apiService.getData1();
      assetsPortfolios.assignAll(data);
      totalValue.value = calculateTotalValue();
      assetsPortfolios.refresh();
      dataMap.value = getDataMap();
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  double calculateTotalValue() {
    return assetsPortfolios.fold(
        0.0, (sum, portfolio) => sum + portfolio.value);
  }

  Map<String, double> getDataMap() {
    return assetsPortfolios.fold<Map<String, double>>({}, (map, portfolio) {
      map[portfolio.coinName] = portfolio.quantity;
      return map;
    });
  }

  Stream<List<GDPData>> getChartData() async* {
    try {
      // Wait for the portfolios data to be fetched
      await fetchData();

      // Map the portfolio data to GDPData objects
      final List<GDPData> chartData = assetsPortfolios.map((portfolio) {
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
