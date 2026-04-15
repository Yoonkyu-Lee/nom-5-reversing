package com.kaf.display;

import com.kaf.GeneralException;
import com.kaf.KafManager;
import com.kaf.NotSupportException;

/* JADX INFO: loaded from: classes.dex */
public class DisplayManager {

    /* JADX INFO: renamed from: dm */
    private IDisplayManager f11dm;

    public DisplayManager() {
        this.f11dm = null;
        try {
            this.f11dm = KafManager.getInstance().getDisplayManager();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getMainLCDWidth() throws IllegalAccessException, GeneralException {
        if (!KafManager.getInstance().isKafLibraryInit()) {
            throw new GeneralException(KafManager.ERR_LIB_NOT_LOADED_CODE, KafManager.ERR_LIB_NOT_LOADED_MESG);
        }
        if (this.f11dm == null) {
            throw new GeneralException(KafManager.ERR_INVALID_OBJECT_CODE, KafManager.ERR_INVALID_OBJECT_MESG);
        }
        return this.f11dm.getMainLCDWidth();
    }

    public int getMainLCDHeight() throws IllegalAccessException, GeneralException {
        if (!KafManager.getInstance().isKafLibraryInit()) {
            throw new GeneralException(KafManager.ERR_LIB_NOT_LOADED_CODE, KafManager.ERR_LIB_NOT_LOADED_MESG);
        }
        if (this.f11dm == null) {
            throw new GeneralException(KafManager.ERR_INVALID_OBJECT_CODE, KafManager.ERR_INVALID_OBJECT_MESG);
        }
        return this.f11dm.getMainLCDHeight();
    }

    public int getMainLCDColorDepth() throws IllegalAccessException, GeneralException {
        if (!KafManager.getInstance().isKafLibraryInit()) {
            throw new GeneralException(KafManager.ERR_LIB_NOT_LOADED_CODE, KafManager.ERR_LIB_NOT_LOADED_MESG);
        }
        if (this.f11dm == null) {
            throw new GeneralException(KafManager.ERR_INVALID_OBJECT_CODE, KafManager.ERR_INVALID_OBJECT_MESG);
        }
        return this.f11dm.getMainLCDColorDepth();
    }

    public int getSubLCDWidth() throws IllegalAccessException, GeneralException, NotSupportException {
        if (!KafManager.getInstance().isKafLibraryInit()) {
            throw new GeneralException(KafManager.ERR_LIB_NOT_LOADED_CODE, KafManager.ERR_LIB_NOT_LOADED_MESG);
        }
        if (this.f11dm == null) {
            throw new GeneralException(KafManager.ERR_INVALID_OBJECT_CODE, KafManager.ERR_INVALID_OBJECT_MESG);
        }
        return this.f11dm.getSubLCDWidth();
    }

    public int getSubLCDHeight() throws IllegalAccessException, GeneralException, NotSupportException {
        if (!KafManager.getInstance().isKafLibraryInit()) {
            throw new GeneralException(KafManager.ERR_LIB_NOT_LOADED_CODE, KafManager.ERR_LIB_NOT_LOADED_MESG);
        }
        if (this.f11dm == null) {
            throw new GeneralException(KafManager.ERR_INVALID_OBJECT_CODE, KafManager.ERR_INVALID_OBJECT_MESG);
        }
        return this.f11dm.getSubLCDHeight();
    }

    public int getSubLCDColorDepth() throws IllegalAccessException, GeneralException, NotSupportException {
        if (!KafManager.getInstance().isKafLibraryInit()) {
            throw new GeneralException(KafManager.ERR_LIB_NOT_LOADED_CODE, KafManager.ERR_LIB_NOT_LOADED_MESG);
        }
        if (this.f11dm == null) {
            throw new GeneralException(KafManager.ERR_INVALID_OBJECT_CODE, KafManager.ERR_INVALID_OBJECT_MESG);
        }
        return this.f11dm.getSubLCDColorDepth();
    }

    public boolean isSupportTouch() throws IllegalAccessException, GeneralException {
        if (!KafManager.getInstance().isKafLibraryInit()) {
            throw new GeneralException(KafManager.ERR_LIB_NOT_LOADED_CODE, KafManager.ERR_LIB_NOT_LOADED_MESG);
        }
        if (this.f11dm == null) {
            throw new GeneralException(KafManager.ERR_INVALID_OBJECT_CODE, KafManager.ERR_INVALID_OBJECT_MESG);
        }
        return this.f11dm.isSupportTouch();
    }
}
