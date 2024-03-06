import 'package:get/get.dart';
import 'package:stone_wallet_main/API/portfolio_api/api_services.dart';
import 'package:stone_wallet_main/UI/Model/portfolio/portfolio_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PortfolioController extends GetxController {
  final portfolios = <Portfolio>[].obs;
  final ApiService _apiService = ApiService();

  Stream<List<Portfolio>> get portfoliosStream => portfolios.stream;
  final RxMap<int, List<Portfolio>> portfoliosMap =
      RxMap<int, List<Portfolio>>();

  RxDouble totalValue = 0.0.obs;
  TooltipBehavior? tooltipBehavior;

  @override
  void onInit() {
    super.onInit();
    fetchData();
    fetchDataForChart();
    tooltipBehavior = TooltipBehavior(enable: true);
  }

  Future<void> fetchDataForChart() async {
    try {
      final Map<int, List<Portfolio>> categorizedData =
          await _apiService.getDataForChart();
      categorizeData(categorizedData);
    } catch (e) {
      print('Error fetching data for chart: $e');
    }
  }

  void categorizeData(Map<int, List<Portfolio>> categorizedData) {
    // Clear existing data
    portfoliosMap.clear();

    // Assign categorized data to the portfoliosMap
    for (var entry in categorizedData.entries) {
      portfoliosMap[entry.key] = entry.value;
    }
  }

  List<GDPData> getChartData(int subCategory) {
    final List<Portfolio>? portfolios = portfoliosMap[subCategory];
    if (portfolios == null || portfolios.isEmpty) {
      return [];
    }
    final totalValue =
        portfolios.fold(0.0, (sum, portfolio) => sum + portfolio.value);
    return portfolios
        .map((portfolio) =>
            GDPData(portfolio.coinName, portfolio.value / totalValue))
        .toList();
  }

  fetchData() async {
    try {
      final apiService = ApiService();
      final data = await apiService.getData();
      portfolios.assignAll(data);
      totalValue.value = calculateTotalValue();
      portfolios.refresh();
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  // fetchDataForCart() async {
  //   try {
  //     final apiService = ApiService();
  //     final data = await apiService.getDataForChart();
  //     portfolios.assignAll(data);
  //     totalValue.value = calculateTotalValue();
  //     portfolios.refresh();
  //   } catch (e) {
  //     print('Error fetching data: $e');
  //   }
  // }

  double calculateTotalValue() {
    return portfolios.fold(0.0, (sum, portfolio) => sum + portfolio.value);
  }

  // Stream<List<GDPData>> getChartData() async* {
  //   try {
  //     await fetchDataForCart();

  //     final List<GDPData> chartData = portfolios.map((portfolio) {
  //       return GDPData(portfolio.coinName, portfolio.value);
  //     }).toList();

  //     yield chartData;
  //   } catch (e) {
  //     print('Error fetching chart data: $e');
  //     yield [];
  //   }
  // }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final double gdp;
}
