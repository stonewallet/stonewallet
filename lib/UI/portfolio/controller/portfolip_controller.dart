import 'package:get/get.dart';
import 'package:stone_wallet_main/API/portfolio_api/api_services.dart';
import 'package:stone_wallet_main/UI/Model/portfolio/portfolio_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PortfolioController extends GetxController {
  final portfolios = <Portfolio>[].obs;
  Stream<List<Portfolio>> get portfoliosStream => portfolios.stream;
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
      final data = await apiService.getData();
      portfolios.assignAll(data);
      totalValue.value = calculateTotalValue();
      portfolios.refresh();
      dataMap.value = getDataMap();
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  fetchDataForCart() async {
    try {
      final apiService = ApiService();
      final data = await apiService.getDataForChart();
      portfolios.assignAll(data);
      totalValue.value = calculateTotalValue();
      portfolios.refresh();
      dataMap.value = getDataMap();
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  double calculateTotalValue() {
    return portfolios.fold(0.0, (sum, portfolio) => sum + portfolio.value);
  }

  Map<String, double> getDataMap() {
    return portfolios.fold<Map<String, double>>({}, (map, portfolio) {
      map[portfolio.coinName] = portfolio.quantity;
      return map;
    });
  }

  Stream<List<GDPData>> getChartData() async* {
    try {
      await fetchDataForCart();

      final List<GDPData> chartData = portfolios.map((portfolio) {
        return GDPData(portfolio.coinName, portfolio.value);
      }).toList();

      yield chartData;
    } catch (e) {
      print('Error fetching chart data: $e');
      yield [];
    }
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final double gdp;
}
