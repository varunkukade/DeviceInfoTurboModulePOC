# POC: Device Info Turbo Module
A Turbo Module implementation for React Native's new architecture providing device information.

# Android: 

<img width="344" alt="Screenshot 2025-01-02 at 7 32 46 PM" src="https://github.com/user-attachments/assets/d13cb894-d32d-4fb3-bbfc-965e7cec7550" />

# IOS: 

<img width="332" alt="Screenshot 2025-01-02 at 7 26 59 PM" src="https://github.com/user-attachments/assets/14ae0449-7953-491b-9365-06383b07baff" />

## Technical Specifications
- React Native Version: 0.76.5
- Architecture: New Architecture (Turbo Modules)
- Code Generation: Using React Native Codegen
- Android Implementation: Java
- iOS Implementation: Swift with Bridging Header

## Features
- Battery status monitoring
- Memory usage information
- Device specifications
- Operating system details

## Available Properties
| Property | Type | Description |
|----------|------|-------------|
| `isBatteryCharging` | `boolean` | Indicates if device is currently charging |
| `isACBatteryCharge` | `boolean` | True if charging via AC adapter (Android only) |
| `isUSBBatteryCharge` | `boolean` | True if charging via USB (Android only) |
| `batteryPercentage` | `number` | Current battery level (0-100) |
| `isLowMemory` | `boolean` | Android: RAM status, iOS: Storage status |
| `availableMemory` | `string` | Android: Available RAM, iOS: Available Storage |
| `totalMemory` | `string` | Android: Total RAM, iOS: Total Storage |
| `appVersion` | `string` | Current application version |
| `deviceBrand` | `string` | Brand name of the device |
| `device` | `string` | Device name |
| `deviceModel` | `string` | Model name of the device |
| `deviceManufacturer` | `string` | Device manufacturer |
| `product` | `string` | Product name |
| `osName` | `string` | Operating system name |
| `osVersion` | `string` | Operating system version |
| `hardware` | `string` | Hardware information |

## License
MIT
