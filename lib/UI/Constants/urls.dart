import 'package:stone_wallet_main/API/createWallet/createnewwallet.dart';

const baseUrl = "https://54.234.68.88";

const travelListUrl = "$baseUrl/travel/list/";
const travelPostListUrl = "$baseUrl/travel/list/";
const travelList2Url = "$baseUrl/travel/list";
const travelLoginUrl = "$baseUrl/travel/login/";
const travelRegisterUrl = "$baseUrl/travel/register/";
const getWalletUrl = "$baseUrl/travel/get/wallet/";
const addUserUrl = "$baseUrl/travel/add/user/trip/";
const portfolio = "$baseUrl/travel/add/coins/";
const addPostAssets = "$baseUrl/travel/add/coins/";
const updatePortfolio = "$baseUrl/travel/update/portfolio/";
const createPortfolio = "$baseUrl/travel/add/portfolio/";
const deletePortfolio = "$baseUrl/travel/delete/portfolio/";
const searchPortfolio = "$baseUrl/travel/portfolio/dropdown/";
const getPdf = "$baseUrl/travel/export/trip/pdf/";
const createwallet = "$baseUrl/travel/add/wallet/";
const dropdownasset = "$baseUrl/travel/get/prices/";
const logOutPost = "$baseUrl/travel/logout/";
const keyUrl = "$baseUrl/travel/get/wallet/keys/";
const endTripUrl = "$baseUrl/travel/trip/end/";
const resumeTripUrl = "$baseUrl/travel/trip/resume/";
const iniviteGetUser = "$baseUrl/travel/get/user/";
const createNotification = "$baseUrl/travel/create/notification/";
const getNotification = "$baseUrl/travel/list/notification/";
const readNotification = "$baseUrl/travel/read/notification/";
const deleteNotification = "$baseUrl/travel/notification/";
const getNotificationCount = "$baseUrl/travel/unread/count/notification/";

late WalletResponse walletResponse;
late String tripId;