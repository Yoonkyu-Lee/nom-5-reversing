package com.kaf.display;

import com.kaf.GeneralException;
import com.kaf.NotSupportException;

/* JADX INFO: loaded from: classes.dex */
public abstract class IDisplayManager {
    public int getMainLCDWidth() throws IllegalAccessException, GeneralException {
        return -1;
    }

    public int getMainLCDHeight() throws IllegalAccessException, GeneralException {
        return -1;
    }

    public int getMainLCDColorDepth() throws IllegalAccessException, GeneralException {
        return -1;
    }

    public int getSubLCDWidth() throws IllegalAccessException, GeneralException, NotSupportException {
        return -1;
    }

    public int getSubLCDHeight() throws IllegalAccessException, GeneralException, NotSupportException {
        return -1;
    }

    public int getSubLCDColorDepth() throws IllegalAccessException, GeneralException, NotSupportException {
        return -1;
    }

    public boolean isSupportTouch() throws IllegalAccessException, GeneralException {
        return false;
    }
}
