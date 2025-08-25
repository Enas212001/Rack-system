class ApiKey {
  static const String name = 'name';
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
  static const String switchIds = 'switch_ids';
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
  static const String rackName = 'rack_name';
  static const String rackSize = 'rack_size';
  static const String rackModel = 'rack_model';
  static const String serialNumber = 'serial_number';
  static const String macAdd = 'mac_add';
  static const String ipAdd = 'ip_add';
  static const String upLinkCore1 = 'up_link_core1';
  static const String upLinkCore2 = 'up_link_core2';
  static const String portNumber = 'port_number';
  static const String model = 'model';
  static const String apRoom = 'ap_room';
  static const String apOut = 'ap_out';
  static const String cctvIn = 'cctv_in';
  static const String cctvOut = 'cctv_out';
}

class Endpoints {
  static const String baseUrl = 'https://rack.powersmtp.solutions/api';
  static const String baseUrlImage = 'https://rack.powersmtp.solutions';
  static const String login = '$baseUrl/login.php';
  static const String getHotels = '$baseUrl/get_hotels.php';
  static const String addHotel = '$baseUrl/add_hotel.php';
  static String addRack(String buildingId) =>
      '$baseUrl/racks/add_rack.php?building_id=$buildingId';

  static String getRacksInfo(String buildingId) =>
      '$baseUrl/racks/get_racks.php?building_id=$buildingId';

  static String editRack(String rackId) =>
      '$baseUrl/racks/edit_rack.php?id=$rackId';

  static String deleteRack(String rackId) =>
      '$baseUrl/racks/delete_rack.php?id=$rackId';

  static String getBuildings(String hotelId) =>
      '$baseUrl/buildings/get_building.php?hotel_id=$hotelId';

  static String addBuilding(String hotelId) =>
      '$baseUrl/buildings/add_building.php?hotel_id=$hotelId';

  static String editBuilding(String buildingId) =>
      '$baseUrl/buildings/edit_building.php?id=$buildingId';

  static String deleteBuilding(String buildingId) =>
      '$baseUrl/buildings/delete_building.php?id=$buildingId';

  static String deleteUser(String userId) =>
      '$baseUrl/users/delete_user.php?id=$userId';

  static String getUsers = '$baseUrl/users/get_users.php';
  static String addUser = '$baseUrl/users/add_user.php';
  static String getAllSwitchs = '$baseUrl/switchs/get_switchs.php';
  static String getSwitchs(String hotelId) =>
      '$baseUrl/switchs/get_switchs.php?hotel_id=$hotelId';
  static String addSwitch(String hotelId) =>
      '$baseUrl/switchs/add_switch.php?hotel_id=$hotelId';
  static String addSummary = '$baseUrl/summaries/add_summary.php';
  static String getDevices(String switchId) =>
      '$baseUrl/devices/get_devices.php?switch_id=$switchId';
  static String addDevice = '$baseUrl/devices/add_device.php';
  static String editDevice(String deviceId) =>
      '$baseUrl/devices/edit_device.php?id=$deviceId';
  static String deleteDevice(String deviceId) =>
      '$baseUrl/devices/delete_device.php?id=$deviceId';
}
