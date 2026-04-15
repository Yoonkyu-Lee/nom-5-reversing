package com.kaf.sound;

import com.kaf.GeneralException;
import com.kaf.KafManager;

/* JADX INFO: loaded from: classes.dex */
public class Sound {
    private ISound sound;

    public Sound() {
        this.sound = null;
        try {
            this.sound = KafManager.getInstance().getSound();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean setBeepSound(int frequency, int duration) throws IllegalAccessException, GeneralException, IllegalArgumentException {
        if (!KafManager.getInstance().isKafLibraryInit()) {
            throw new GeneralException(KafManager.ERR_LIB_NOT_LOADED_CODE, KafManager.ERR_LIB_NOT_LOADED_MESG);
        }
        if (this.sound == null) {
            throw new GeneralException(KafManager.ERR_INVALID_OBJECT_CODE, KafManager.ERR_INVALID_OBJECT_MESG);
        }
        return this.sound.setBeepSound(frequency, duration);
    }
}
