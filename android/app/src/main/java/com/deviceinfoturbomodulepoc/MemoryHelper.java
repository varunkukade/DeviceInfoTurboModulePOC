package com.deviceinfoturbomodulepoc;

import static android.content.Context.ACTIVITY_SERVICE;
import android.app.ActivityManager;
import android.content.Context;

public class MemoryHelper {

    private final Context context;

    public MemoryHelper(Context context) {
        this.context = context;
    }

    // Get a MemoryInfo object for the device's current memory status.
    private ActivityManager.MemoryInfo getMemoryObject() {
        ActivityManager activityManager = null;
        activityManager = (ActivityManager) context.getSystemService(ACTIVITY_SERVICE);
        ActivityManager.MemoryInfo memoryInfo = new ActivityManager.MemoryInfo();
        assert activityManager != null;
        activityManager.getMemoryInfo(memoryInfo);
        return memoryInfo;
    }

    private ActivityManager.MemoryInfo getMemoryInfo() {
        return getMemoryObject();
    }

    public Boolean isLowMemory() {
        return getMemoryInfo().lowMemory;
    }

    public Long getTotalMemory() {
        return getMemoryInfo().totalMem;
    }

    public Long getAvailableMemory() {
        return getMemoryInfo().availMem;
    }
}