package com.deviceinfoturbomodulepoc;

import com.facebook.react.TurboReactPackage;
import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.module.model.ReactModuleInfo;
import com.facebook.react.module.model.ReactModuleInfoProvider;

import java.util.HashMap;
import java.util.Map;

public class NativeDeviceInfoPackage extends TurboReactPackage {

    @Override
    public NativeModule getModule(String name, ReactApplicationContext reactContext) {
        if (name.equals(NativeDeviceInfoModule.NAME)) {
            return new NativeDeviceInfoModule(reactContext);
        } else {
            return null;
        }
    }

    @Override
    public ReactModuleInfoProvider getReactModuleInfoProvider() {
        return () -> {
            final Map<String, ReactModuleInfo> moduleInfos = new HashMap<>();
            moduleInfos.put(
                    NativeDeviceInfoModule.NAME,
                    new ReactModuleInfo(
                            NativeDeviceInfoModule.NAME,
                            NativeDeviceInfoModule.NAME,
                            false, // canOverrideExistingModule
                            false, // needsEagerInit
                            false, // hasConstants
                            false, // isCxxModule
                            true // isTurboModule
                    ));
            return moduleInfos;
        };
    }
}
