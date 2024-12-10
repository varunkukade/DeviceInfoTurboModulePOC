package com.deviceinfoturbomodulepoc;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.os.BatteryManager;
import android.os.Build;

import com.nativedeviceinformation.NativeDeviceInformationSpec;
import com.facebook.react.bridge.ReactApplicationContext;

public class NativeDeviceInfoModule extends NativeDeviceInformationSpec {

    static final String NAME = "NativeDeviceInformation";
    String unknown = "unknown";

    private final MemoryHelper memoryHelper;
    private final Intent batteryStatus;
    int chargePlug;

    public NativeDeviceInfoModule(ReactApplicationContext reactContext) {
        super(reactContext);
        BatteryHelper batteryHelper = new BatteryHelper(reactContext.getApplicationContext());
        this.batteryStatus = batteryHelper.getBatteryStatus();
        this.chargePlug = this.batteryStatus.getIntExtra(BatteryManager.EXTRA_PLUGGED, -1);
        this.memoryHelper = new MemoryHelper(reactContext.getApplicationContext());
    }

    @Override
    public String getName() {
        return NAME;
    }

    private PackageInfo getPackageInfo() throws Exception {
        return getReactApplicationContext().getPackageManager().getPackageInfo(getReactApplicationContext().getPackageName(), 0);
    }

    @Override
    public boolean getIsBatteryCharging() {
        // Are we charging / charged?
        int status = this.batteryStatus.getIntExtra(BatteryManager.EXTRA_STATUS, -1);
        return status == BatteryManager.BATTERY_STATUS_CHARGING ||
                status == BatteryManager.BATTERY_STATUS_FULL;
    }

    @Override
    public boolean getIsUSBBatteryCharge() {
        // Replace with the actual implementation
        return chargePlug == BatteryManager.BATTERY_PLUGGED_USB;
    }

    @Override
    public boolean getIsACBatteryCharge() {
        // Replace with the actual implementation
        return chargePlug == BatteryManager.BATTERY_PLUGGED_AC;
    }

    @Override
    public boolean getIsLowMemory() {
        // Replace with the actual implementation
        return this.memoryHelper.isLowMemory();
    }

    @Override
    public double getBatteryPercentage() {
        // Replace with the actual implementation
        int level = this.batteryStatus.getIntExtra(BatteryManager.EXTRA_LEVEL, -1);
        int scale = this.batteryStatus.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        return(level * 100 / (float)scale);
    }

    public String formatMemoryInGB(long bytes) {
        double gb = bytes / (1024.0 * 1024.0 * 1024.0);
        return String.format("%.2f GB", gb);
    }

    @Override
    public String getAvailableMemory() {
        // Replace with the actual implementation
        return formatMemoryInGB(this.memoryHelper.getAvailableMemory());
    }

    @Override
    public String getTotalMemory() {
        // Replace with the actual implementation
        return formatMemoryInGB(this.memoryHelper.getTotalMemory());
    }

    public String getVersionName() throws Exception {
        return getPackageInfo().versionName;
    }

    public int getVersionCode() throws Exception {
        return getPackageInfo().versionCode;
    }

    @Override
    public String getReadableVersion() {
        // Replace with the actual implementation
        try {
            int versionCode = getVersionCode();
            String versionName = getVersionName();
            return versionName + '.' + versionCode;
        } catch (Exception e) {
            // Handle the exception
            System.err.println("An error occurred while fetching readableVersion: " + e.getMessage());
            return unknown;
        }
    }

    @Override
    public String getDeviceBrand() {
        // Replace with the actual implementation
        return Build.BRAND;
    }

    @Override
    public String getDevice() {
        // Replace with the actual implementation
        return Build.DEVICE;
    }

    @Override
    public String getDeviceModel() {
        // Replace with the actual implementation
        return Build.MODEL;
    }

    @Override
    public String getDeviceManufacturer() {
        // Replace with the actual implementation
        return Build.MANUFACTURER;
    }

    @Override
    public String getProduct() {
        // Replace with the actual implementation
        return Build.PRODUCT;
    }

    @Override
    public String getOsName() {
        // Replace with the actual implementation
        return System.getProperty("os.name");
    }

    @Override
    public String getOsVersion() {
        // Replace with the actual implementation
        return System.getProperty("os.version");
    }

    @Override
    public String getHardware() {
        // Replace with the actual implementation
        return Build.HARDWARE;
    }
}
