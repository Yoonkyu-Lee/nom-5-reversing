package com.kaf.media;

import com.kaf.GeneralException;
import com.kaf.KafManager;

/* JADX INFO: loaded from: classes.dex */
public class MediaManager {

    /* JADX INFO: renamed from: mm */
    private IMediaManager f12mm;

    public MediaManager() {
        this.f12mm = null;
        try {
            this.f12mm = KafManager.getInstance().getMediaManager();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String[] getAbleImageFormats() throws IllegalAccessException, GeneralException {
        if (!KafManager.getInstance().isKafLibraryInit()) {
            throw new GeneralException(KafManager.ERR_LIB_NOT_LOADED_CODE, KafManager.ERR_LIB_NOT_LOADED_MESG);
        }
        if (this.f12mm == null) {
            throw new GeneralException(KafManager.ERR_INVALID_OBJECT_CODE, KafManager.ERR_INVALID_OBJECT_MESG);
        }
        return this.f12mm.getAbleImageFormats();
    }

    public String[] getAbleSoundFormats() throws IllegalAccessException, GeneralException {
        if (!KafManager.getInstance().isKafLibraryInit()) {
            throw new GeneralException(KafManager.ERR_LIB_NOT_LOADED_CODE, KafManager.ERR_LIB_NOT_LOADED_MESG);
        }
        if (this.f12mm == null) {
            throw new GeneralException(KafManager.ERR_INVALID_OBJECT_CODE, KafManager.ERR_INVALID_OBJECT_MESG);
        }
        return this.f12mm.getAbleSoundFormats();
    }

    public String[] getAbleVODFormats() throws IllegalAccessException, GeneralException {
        if (!KafManager.getInstance().isKafLibraryInit()) {
            throw new GeneralException(KafManager.ERR_LIB_NOT_LOADED_CODE, KafManager.ERR_LIB_NOT_LOADED_MESG);
        }
        if (this.f12mm == null) {
            throw new GeneralException(KafManager.ERR_INVALID_OBJECT_CODE, KafManager.ERR_INVALID_OBJECT_MESG);
        }
        return this.f12mm.getAbleVODFormats();
    }

    public String[] getAbleAODFormats() throws IllegalAccessException, GeneralException {
        if (!KafManager.getInstance().isKafLibraryInit()) {
            throw new GeneralException(KafManager.ERR_LIB_NOT_LOADED_CODE, KafManager.ERR_LIB_NOT_LOADED_MESG);
        }
        if (this.f12mm == null) {
            throw new GeneralException(KafManager.ERR_INVALID_OBJECT_CODE, KafManager.ERR_INVALID_OBJECT_MESG);
        }
        return this.f12mm.getAbleAODFormats();
    }

    public String getVideoInfo(String id) throws IllegalAccessException, GeneralException, IllegalArgumentException {
        if (!KafManager.getInstance().isKafLibraryInit()) {
            throw new GeneralException(KafManager.ERR_LIB_NOT_LOADED_CODE, KafManager.ERR_LIB_NOT_LOADED_MESG);
        }
        if (this.f12mm == null) {
            throw new GeneralException(KafManager.ERR_INVALID_OBJECT_CODE, KafManager.ERR_INVALID_OBJECT_MESG);
        }
        return this.f12mm.getVideoInfo(id);
    }

    public String[] getVODServices() throws IllegalAccessException, GeneralException {
        if (!KafManager.getInstance().isKafLibraryInit()) {
            throw new GeneralException(KafManager.ERR_LIB_NOT_LOADED_CODE, KafManager.ERR_LIB_NOT_LOADED_MESG);
        }
        if (this.f12mm == null) {
            throw new GeneralException(KafManager.ERR_INVALID_OBJECT_CODE, KafManager.ERR_INVALID_OBJECT_MESG);
        }
        return this.f12mm.getVODServices();
    }
}
