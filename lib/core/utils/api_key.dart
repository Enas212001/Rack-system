class ApiKey {
  static const String email = 'email';
  static const String password = 'password';
  static const String rememberMe = 'remember_me';
  static const String isLogin = 'isLogin';
  static const passwordsMap = 'passwordsMap';
  static const emailList = 'emailList';
  static const String loginName = 'name';
  static const String roleId = 'role_id';
  static const String hotelId = 'hotel_id';
  static const String buildingName = 'building_name';
  static const String rackId = 'rack_id';
  static const String buildingRackId = 'building_r_id';
  static const String switchId = 'switch_id';
  static const String productPanel = 'product_panal';
  static const String productSerial = 'product_serial';
  static const String productMac = 'product_mac';
  static const String productModel = 'product_model';
  static const String productPort = 'product_port';
  static const String deviceName = 'device_name';
  static const String siteName = 'site_name';
  static const String image = 'logo';
  static const String buildingNumber = 'building_id';
  static const String hotelName = 'name';
}

class Endpoints {
  static const String baseUrl = 'https://rack.powersmtp.solutions/api';
  static const String baseUrlImage = 'https://rack.powersmtp.solutions';
  static const String login = '$baseUrl/login.php';
  static const String getHotels = '$baseUrl/get_hotels.php';
  static const String addRack = '$baseUrl/add_rack.php';
  static const String addHotel = '$baseUrl/add_hotel.php';
  static String getBuildings(String hotelId) {
    return '$baseUrl/buildings/get_building.php?hotel_id=$hotelId';
  }

  static String getRacksInfo(String buildingId) {
    return '$baseUrl/get_rack_info.php?building_r_id=$buildingId';
  }

  static String addBuilding(String hotelId) {
    return '$baseUrl/buildings/add_building.php?hotel_id=$hotelId';
  }

  static String editBuilding(String buildingId) {
    return '$baseUrl/buildings/edit_building.php?id=$buildingId';
  }

  static String deleteBuilding(String buildingId) {
    return '$baseUrl/buildings/delete_building.php?id=$buildingId';
  }
}
