package com.kaf.device;

import com.kaf.GeneralException;
import com.kaf.KafManager;
import com.kaf.NotSupportException;

/* JADX INFO: loaded from: classes.dex */
public class DeviceControl {

    /* JADX INFO: renamed from: dc */
    private IDeviceControl f10dc;

    public DeviceControl() {
        try {
            this.f10dc = KafManager.getInstance().getDeviceControl();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean vibrate(long[] pattern, int strength) throws IllegalAccessException, GeneralException, IllegalArgumentException {
        if (!KafManager.getInstance().isKafLibraryInit()) {
            throw new GeneralException(KafManager.ERR_LIB_NOT_LOADED_CODE, KafManager.ERR_LIB_NOT_LOADED_MESG);
        }
        if (this.f10dc == null) {
            throw new GeneralException(KafManager.ERR_INVALID_OBJECT_CODE, KafManager.ERR_INVALID_OBJECT_MESG);
        }
        return this.f10dc.vibrate(pattern, strength);
    }

    public int getMountedVolumeCount() throws IllegalAccessException, GeneralException, NotSupportException {
        if (!KafManager.getInstance().isKafLibraryInit()) {
            throw new GeneralException(KafManager.ERR_LIB_NOT_LOADED_CODE, KafManager.ERR_LIB_NOT_LOADED_MESG);
        }
        if (this.f10dc == null) {
            throw new GeneralException(KafManager.ERR_INVALID_OBJECT_CODE, KafManager.ERR_INVALID_OBJECT_MESG);
        }
        return this.f10dc.getMountedVolumeCount();
    }

    public String[] getExternalStorageVolumes() throws IllegalAccessException, GeneralException {
        if (!KafManager.getInstance().isKafLibraryInit()) {
            throw new GeneralException(KafManager.ERR_LIB_NOT_LOADED_CODE, KafManager.ERR_LIB_NOT_LOADED_MESG);
        }
        if (this.f10dc == null) {
            throw new GeneralException(KafManager.ERR_INVALID_OBJECT_CODE, KafManager.ERR_INVALID_OBJECT_MESG);
        }
        return this.f10dc.getExternalStorageVolumes();
    }

    public int getBatteryStatus() throws IllegalAccessException, GeneralException, NotSupportException {
        if (!KafManager.getInstance().isKafLibraryInit()) {
            throw new GeneralException(KafManager.ERR_LIB_NOT_LOADED_CODE, KafManager.ERR_LIB_NOT_LOADED_MESG);
        }
        if (this.f10dc == null) {
            throw new GeneralException(KafManager.ERR_INVALID_OBJECT_CODE, KafManager.ERR_INVALID_OBJECT_MESG);
        }
        return this.f10dc.getBatteryStatus();
    }
}
