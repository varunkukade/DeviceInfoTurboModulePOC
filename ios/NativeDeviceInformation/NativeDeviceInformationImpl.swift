//
//  NativeDeviceInformationImpl.swift
//  DeviceInfoTurboModulePOC
//
//  Created by Varun Kukade on 02/01/25.
//

import Foundation
import DeviceKit

@objcMembers class NativeDeviceInformationImpl: NSObject {
  
    let device = Device.current
  
    func bytesToGigabytes(_ bytes: Int) -> String {
        let gigabytes = Double(bytes) / (1024 * 1024 * 1024)
        return String(format: "%.2f", gigabytes) + " GB"
    }
    
    func getAvailableMemory() -> String {
      if let availableSpaceinBytes = Device.volumeAvailableCapacity {
        return bytesToGigabytes(availableSpaceinBytes);
      } else {
        return "NA"
      }
    }
    
    func getBatteryPercentage() -> NSNumber {
      let batteryLevel = device.batteryLevel;
      if let batteryLevel {
        return NSNumber(value: batteryLevel);
      } else {
        return -1;
      }
    }
    
    func getDevice() -> String {
        return device.safeDescription
    }
    
    func getDeviceBrand() -> String {
        return "Apple" // Static device brand
    }
    
    func getDeviceManufacturer() -> String {
        return "Apple Inc." // Static device manufacturer
    }
    
    func getDeviceModel() -> String {
        return device.model ?? "NA"
    }
    
    func getHardware() -> String {
      return device.cpu.description;
    }
    
    func getIsACBatteryCharge() -> NSNumber {
        return 1 // Static value indicating AC charging (true)
    }
    
    func getIsBatteryCharging() -> NSNumber {
      let batteryState = device.batteryState;
      if let batteryState {
        let isBatteryCharging = batteryState == .full || batteryState >= .charging(0);
        return NSNumber(value: isBatteryCharging);
      } else {
        return 0;
      }
    }
    
    func getIsLowMemory() -> NSNumber {
      if Device.volumeAvailableCapacityForOpportunisticUsage ?? 0 > Int64(1_000_000) {
        return 0;
      } else if Device.volumeAvailableCapacityForImportantUsage ?? 0 > Int64(1_000) {
        return 1;
      } else {
        return 0;
      }
    }
    
    func getIsUSBBatteryCharge() -> NSNumber {
        return 1 // Static value indicating USB charging (false)
    }
    
    func getOsName() -> String {
        return device.systemName ?? "NA"
    }
    
    func getOsVersion() -> String {
        return device.systemVersion ?? "NA"
    }
    
    func getProduct() -> String {
        return device.isSimulator ? "Simulator" : device.isPad ? "iPad" : device.isPhone ? "iPhone" : "Unknown"
    }
    
    func getReadableVersion() -> String {
      if var appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
        if let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
          appVersion += " (\(buildNumber))"
          return appVersion;
        } else {
          return "NA";
        }
      } else {
        return "NA";
      }
    }
    
    func getTotalMemory() -> String {
      if let totalSpaceinBytes = Device.volumeTotalCapacity {
        return bytesToGigabytes(totalSpaceinBytes)
      } else {
        return "NA";
      }
    }
}

