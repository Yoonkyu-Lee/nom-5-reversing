package com.kaf.contentsbox;

import android.content.ComponentName;
import android.content.ContentValues;
import android.content.Context;
import android.content.ServiceConnection;
import android.database.Cursor;
import android.os.IBinder;
import android.os.RemoteException;
import com.kaf.GeneralException;
import com.kaf.NotSupportException;
import java.io.FileDescriptor;

/* JADX INFO: loaded from: classes.dex */
public abstract class ICertificateRepositoryManager {

    public interface ServiceConnectionListener {
        void onServiceConnected(String str);

        void onServiceDisconnected();
    }

    public ICertificateRepositoryManager() {
    }

    public ICertificateRepositoryManager(Context context) {
    }

    public ICertificateRepositoryManager(Context context, ServiceConnectionListener sessionKeyListener) {
    }

    public void closeCertFile(int id, FileDescriptor fd, int status) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
    }

    public Cursor getCertInfo(String[] projection, String selection, String[] selectionArgs, String sortOrder) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return null;
    }

    public int insertCertInfo(ContentValues values) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public boolean connect() throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return false;
    }

    public FileDescriptor openCertFile(int id, int mode) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return null;
    }

    public int updateCertInfo(ContentValues values, String selection, String[] selectionArgs) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public int deleteCertInfo(String selection, String[] selectionArgs) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    class ContentsBoxConnection implements ServiceConnection {
        ContentsBoxConnection() {
        }

        @Override // android.content.ServiceConnection
        public void onServiceConnected(ComponentName className, IBinder boundService) {
        }

        @Override // android.content.ServiceConnection
        public void onServiceDisconnected(ComponentName className) {
        }
    }

    public void disconnect() throws IllegalAccessException, RemoteException {
    }
}
