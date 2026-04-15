package com.kaf.log;

import com.kaf.KafManager;

/* JADX INFO: loaded from: classes.dex */
public class Debug {
    private IDebug debug;

    public Debug() {
        this.debug = null;
        try {
            this.debug = KafManager.getInstance().getDebug();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int log(String func, String stat, String arg1) {
        if (KafManager.getInstance().isKafLibraryInit()) {
            return this.debug.log(func, stat, arg1);
        }
        return -1;
    }
}
