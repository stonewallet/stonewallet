import 'package:get/get.dart';
import 'package:stone_wallet_main/API/portfolio_api/api_services.dart';
import 'package:stone_wallet_main/UI/Model/portfolio/portfolio_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PortfolioController extends GetxController {
  final portfolios = <Portfolio>[].obs;

  Stream<List<Portfolio>> get portfoliosStream => portfolios.stream;
  final RxMap<int, List<Portfolio>> portfoliosMap =
      RxMap<int, List<Portfolio>>();

  RxDouble totalValue = 0.0.obs;
  TooltipBehavior? tooltipBehavior;

  @override
  void onInit() {
    super.onInit();
    fetchData();
    fetchDataForCart();
    tooltipBehavior = TooltipBehavior(enable: true);
  }

  // Future<void> fetchDataForChart() async {
  //   try {
  //     final Map<int, List<Portfolio>> categorizedData =
  //         await _apiService.getDataForChart();
  //     categorizeData(categorizedData);
  //   } catch (e) {
  //     print('Error fetching data for chart: $e');
  //   }
  // }

  // void categorizeData(Map<int, List<Portfolio>> categorizedData) {
  //   // Clear existing data
  //   portfoliosMap.clear();

  //   // Assign categorized data to the portfoliosMap
  //   for (var entry in categorizedData.entries) {
  //     portfoliosMap[entry.key] = entry.value;
  //   }
  // }

  // List<GDPData> getChartData(int subCategory) {
  //   final List<Portfolio>? portfolios = portfoliosMap[subCategory];
  //   if (portfolios == null || portfolios.isEmpty) {
  //     return [];
  //   }
  //   final totalValue =
  //       portfolios.fold(0.0, (sum, portfolio) => sum + portfolio.value);
  //   return portfolios
  //       .map((portfolio) =>
  //           GDPData(portfolio.coinName, portfolio.value / totalValue))
  //       .toList();
  // }

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

  fetchDataForCart() async {
    try {
      final apiService = ApiService();
      final data = await apiService.getDataForChart();
      portfolios.assignAll(data);
      totalValue.value = calculateTotalValue();
      portfolios.refresh();
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  double calculateTotalValue() {
    return portfolios.fold(0.0, (sum, portfolio) => sum + portfolio.value);
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

  Future<Map<int, double>> getTotalValuesBySubCat() async {
    final apiService = ApiService();
    final data = await apiService.getDataForChart();

    final Map<int, double> totalValues = {};

    for (var portfolio in data) {
      final subCat = portfolio.subCat;

      // Check if the subcategory is 0, 1, or 2
      if (subCat == 0 || subCat == 1 || subCat == 2) {
        if (totalValues.containsKey(subCat)) {
          totalValues[subCat] = totalValues[subCat]! + portfolio.value;
        } else {
          totalValues[subCat] = portfolio.value;
        }
      }
    }

    return totalValues;
  }

  Future<List<GDPData>> getPortfolioDataForSubCat(int subCat) async {
    final apiService = ApiService();
    final data = await apiService.getDataForChart();

    final List<Portfolio> filteredData =
        data.where((portfolio) => portfolio.subCat == subCat).toList();

    return filteredData
        .map((portfolio) => GDPData(portfolio.coinName, portfolio.value))
        .toList();
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final double gdp;
}
