//
//  NativeDeviceInformation.mm
//  DeviceInfoTurboModulePOC
//
//  Created by Varun Kukade on 02/01/25.
//

#import "NativeDeviceInformation.h"

@implementation NativeDeviceInformation

RCT_EXPORT_MODULE()

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeDeviceInformationSpecJSI>(params);
}

- (NSString *)getAvailableMemory {
    return @"1024MB"; // Static available memory
}

- (NSNumber *)getBatteryPercentage {
    return @(85); // Static battery percentage
}

- (NSString *)getDevice {
    return @"iPhone14,2"; // Static device identifier
}

- (NSString *)getDeviceBrand {
    return @"Apple"; // Static device brand
}

- (NSString *)getDeviceManufacturer {
    return @"Apple Inc."; // Static device manufacturer
}

- (NSString *)getDeviceModel {
    return @"iPhone 13 Pro"; // Static device model
}

- (NSString *)getHardware {
    return @"A15 Bionic"; // Static hardware identifier
}

- (NSNumber *)getIsACBatteryCharge {
    return @(1); // Static value indicating AC charging (true)
}

- (NSNumber *)getIsBatteryCharging {
    return @(1); // Static value indicating battery is charging (true)
}

- (NSNumber *)getIsLowMemory {
    return @(0); // Static value indicating low memory (false)
}

- (NSNumber *)getIsUSBBatteryCharge {
    return @(0); // Static value indicating USB charging (false)
}

- (NSString *)getOsName {
    return @"iOS"; // Static OS name
}

- (NSString *)getOsVersion {
    return @"16.1"; // Static OS version
}

- (NSString *)getProduct {
    return @"iPhone"; // Static product name
}

- (NSString *)getReadableVersion {
    return @"1.0.0 (Build 10)"; // Static readable version
}

- (NSString *)getTotalMemory {
    return @"4096MB"; // Static total memory
}

@end
