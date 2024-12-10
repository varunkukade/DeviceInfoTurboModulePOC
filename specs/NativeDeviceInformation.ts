import type {TurboModule} from 'react-native';
import {Platform, TurboModuleRegistry} from 'react-native';

export const isAndroid = Platform.OS === 'android';
export const isIOS = Platform.OS === 'ios';

export interface Spec extends TurboModule {
  getIsBatteryCharging: () => boolean;
  getIsUSBBatteryCharge: () => boolean;
  getIsACBatteryCharge: () => boolean;
  getIsLowMemory: () => boolean;
  getBatteryPercentage: () => number;
  getAvailableMemory: () => string;
  getTotalMemory: () => string;
  getReadableVersion: () => string;
  getDeviceBrand: () => string;
  getDevice: () => string;
  getDeviceModel: () => string;
  getDeviceManufacturer: () => string;
  getProduct: () => string;
  getOsName: () => string;
  getOsVersion: () => string;
  getHardware: () => string;
}

export default TurboModuleRegistry.getEnforcing<Spec>(
  'NativeDeviceInformation',
);
