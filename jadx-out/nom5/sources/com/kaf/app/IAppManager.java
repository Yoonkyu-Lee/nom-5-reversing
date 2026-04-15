package com.kaf.app;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.os.RemoteException;
import com.kaf.GeneralException;
import com.kaf.NotSupportException;
import java.lang.reflect.Method;

/* JADX INFO: loaded from: classes.dex */
public abstract class IAppManager {

    public interface ServiceConnectionListener {
        void onServiceConnected(String str);

        void onServiceDisconnected();
    }

    public IAppManager() {
    }

    public IAppManager(Context context) {
    }

    public IAppManager(Context context, Object obj, Method func, ServiceConnectionListener sessionKeyListener) {
    }

    public Cursor getApplicationInfo(String[] projection, String selection, String[] selectionArgs, String sortOrder) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return null;
    }

    public Cursor getApplicationInfoFromContentsProvider(String[] projection, String selection, String[] selectionArgs, String sortOrder) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return null;
    }

    public int insertApplicationInfo(ContentValues values) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public int updateApplicationInfo(ContentValues values, String selection, String[] selectionArgs) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public int deleteApplicationInfo(String selection, String[] selectionArgs) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public boolean connect() throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return false;
    }

    public void disconnect() throws IllegalAccessException, RemoteException {
    }

    public int updateAccessLevel(String filePath) throws IllegalAccessException, GeneralException, RemoteException {
        return -1;
    }

    public Cursor getAccessLevel(String[] projection, String selection, String[] selectionArgs, String sortOrder) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return null;
    }

    public Cursor getAccessLevelFromContentsProvider(String[] projection, String selection, String[] selectionArgs, String sortOrder) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return null;
    }
}
