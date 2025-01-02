//
//  NativeDeviceInformation.mm
//  DeviceInfoTurboModulePOC
//
//  Created by Varun Kukade on 02/01/25.
//

#import "NativeDeviceInformation.h"
#import "DeviceInfoTurboModulePOC-Swift.h" //imports swift implementation class

@implementation NativeDeviceInformation

RCT_EXPORT_MODULE() //export module to obj-c runtime.

//create instance of swift class
NativeDeviceInformationImpl *nativedeviceinformation = [[NativeDeviceInformationImpl alloc] init];

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeDeviceInformationSpecJSI>(params);
}

- (NSString *)getAvailableMemory {
    return [nativedeviceinformation getAvailableMemory];
}

- (NSNumber *)getBatteryPercentage {
    return [nativedeviceinformation getBatteryPercentage];
}

- (NSString *)getDevice {
    return [nativedeviceinformation getDevice];
}

- (NSString *)getDeviceBrand {
    return [nativedeviceinformation getDeviceBrand];
}

- (NSString *)getDeviceManufacturer {
    return [nativedeviceinformation getDeviceManufacturer];
}

- (NSString *)getDeviceModel {
    return [nativedeviceinformation getDeviceModel];
}

- (NSString *)getHardware {
    return [nativedeviceinformation getHardware];
}

- (NSNumber *)getIsACBatteryCharge {
    return [nativedeviceinformation getIsACBatteryCharge];
}

- (NSNumber *)getIsBatteryCharging {
    return [nativedeviceinformation getIsBatteryCharging];
}

- (NSNumber *)getIsLowMemory {
    return [nativedeviceinformation getIsLowMemory];
}

- (NSNumber *)getIsUSBBatteryCharge {
    return [nativedeviceinformation getIsUSBBatteryCharge];
}

- (NSString *)getOsName {
    return [nativedeviceinformation getOsName];
}

- (NSString *)getOsVersion {
    return [nativedeviceinformation getOsVersion];
}

- (NSString *)getProduct {
    return [nativedeviceinformation getProduct];
}

- (NSString *)getReadableVersion {
    return [nativedeviceinformation getReadableVersion];
}

- (NSString *)getTotalMemory {
    return [nativedeviceinformation getTotalMemory];
}

@end
