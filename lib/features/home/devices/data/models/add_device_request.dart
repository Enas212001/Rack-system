class Device {
  int portNumber;
  String deviceName;
  String deviceSerial;
  String macAddress;
  String ipAddress;
  String patchPanel;
  String productNumber;
  String deviceModel;

  Device({
    required this.portNumber,
    required this.deviceName,
    required this.deviceSerial,
    required this.macAddress,
    required this.ipAddress,
    required this.patchPanel,
    required this.productNumber,
    required this.deviceModel,
  });

  Map<String, dynamic> toJson() => {
    "port_number": portNumber,
    "device_name": deviceName,
    "device_serial": deviceSerial,
    "mac_address": macAddress,
    "ip_address": ipAddress,
    "patch_panel": patchPanel,
    "product_number": productNumber,
    "device_model": deviceModel,
  };
}
