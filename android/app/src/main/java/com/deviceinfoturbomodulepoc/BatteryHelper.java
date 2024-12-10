package com.deviceinfoturbomodulepoc;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;

public class BatteryHelper {
    private Context context;

    public BatteryHelper(Context context) {
        this.context = context;
    }

    public Intent getBatteryStatus() {
        IntentFilter intentfilter = new IntentFilter(Intent.ACTION_BATTERY_CHANGED);
        return context.registerReceiver(null, intentfilter);
    }
}