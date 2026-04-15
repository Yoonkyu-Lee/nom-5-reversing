package com.kaf.device;

import com.kaf.GeneralException;
import com.kaf.NotSupportException;

/* JADX INFO: loaded from: classes.dex */
public abstract class IDeviceControl {
    public boolean vibrate(long[] pattern, int strength) throws IllegalAccessException, GeneralException, IllegalArgumentException {
        return false;
    }

    public int getMountedVolumeCount() throws IllegalAccessException, GeneralException, NotSupportException {
        return -1;
    }

    public String[] getExternalStorageVolumes() throws IllegalAccessException, GeneralException {
        return null;
    }

    public int getBatteryStatus() throws IllegalAccessException, GeneralException, NotSupportException {
        return -1;
    }
}
