package com.kaf.app;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
public abstract class IPackageManager {
    public IPackageManager() {
    }

    public IPackageManager(Context context) {
    }

    public int installPackage(String packagePath, String packageName, boolean mode, String appName) {
        return 0;
    }

    public int uninstallPackage(String packageName, boolean mode, String appName) {
        return 0;
    }

    public int installPackage(String packagePath, String packageName, boolean mode) {
        return 0;
    }

    public int uninstallPackage(String packageName, boolean mode) {
        return 0;
    }

    public int installPackage(String packagePath, String packageName, int installFlag, String nPackage, String nClass, String nExtras, boolean mode, String appName) {
        return 0;
    }

    public int uninstallPackage(String packageName, int installFlag, String nPackage, String nClass, String nExtras, boolean mode, String appName) {
        return 0;
    }
}
