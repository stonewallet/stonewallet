import 'package:get/get.dart';
import 'package:stone_wallet_main/API/portfolio_api/api_services.dart';
import 'package:stone_wallet_main/UI/Model/portfolio/portfolio_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PortfolioController extends GetxController {
  final portfolios = <Portfolio>[].obs;
  RxDouble totalValue = 0.0.obs;
  RxMap<String, double> dataMap = <String, double>{}.obs;
  TooltipBehavior? tooltipBehavior;
  @override
  void onInit() {
    super.onInit();
    fetchData();
    tooltipBehavior = TooltipBehavior(enable: true);
  }

  void fetchData() async {
    try {
      final apiService = ApiService();
      final data = await apiService.getData();
      portfolios.assignAll(data);
      totalValue.value = calculateTotalValue();

      // Call the instance method with the portfolios instance variable
      dataMap.value = getDataMap();
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  double calculateTotalValue() {
    // Use the fold function to sum up the 'value' field in each portfolio
    return portfolios.fold(0.0, (sum, portfolio) => sum + portfolio.value);
  }

  Map<String, double> getDataMap() {
    return portfolios.fold<Map<String, double>>({}, (map, portfolio) {
      map[portfolio.coinName] = portfolio.quantity;
      return map;
    });
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = portfolios.map((portfolio) {
      return GDPData(portfolio.coinName, portfolio.quantity);
    }).toList();
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final double gdp;
}
