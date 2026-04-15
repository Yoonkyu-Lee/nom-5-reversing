package com.kaf.net;

import com.kaf.GeneralException;
import com.kaf.NotSupportException;

/* JADX INFO: loaded from: classes.dex */
public abstract class INetwork {
    public int netConnect(int type, int timeout) throws IllegalAccessException, GeneralException, IllegalArgumentException {
        return -1;
    }

    public boolean netClose() throws IllegalAccessException, GeneralException {
        return false;
    }

    public int getStatus() throws IllegalAccessException, GeneralException {
        return 0;
    }

    public String getIWLANIP() throws IllegalAccessException, GeneralException, NotSupportException {
        return null;
    }
}
