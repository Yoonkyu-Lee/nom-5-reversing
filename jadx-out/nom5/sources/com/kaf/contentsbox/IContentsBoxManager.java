package com.kaf.contentsbox;

import android.content.ComponentName;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.database.Cursor;
import android.net.Uri;
import android.os.IBinder;
import android.os.RemoteException;
import com.kaf.GeneralException;
import com.kaf.NotSupportException;
import java.io.FileDescriptor;

/* JADX INFO: loaded from: classes.dex */
public abstract class IContentsBoxManager {

    public interface ServiceConnectionListener {
        void onServiceConnected(String str);

        void onServiceDisconnected();
    }

    public IContentsBoxManager() {
    }

    public IContentsBoxManager(Context context) {
    }

    public IContentsBoxManager(Context context, ServiceConnectionListener sessionKeyListener) {
    }

    public boolean connectService() throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return false;
    }

    public void disconnectService() throws IllegalAccessException, GeneralException, NotSupportException, RemoteException {
    }

    public IStatContentsBoxFs getStorageCapacity(int type, String contentsBoxName) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return null;
    }

    public String[] getContentsBoxName(int type) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return null;
    }

    public Cursor getContentsInfo(String[] projection, String selection, String[] selectionArgs, String sortOrder) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return null;
    }

    public int insertContentsInfo(ContentValues values) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public int updateContentsInfo(ContentValues values, String selection, String[] selectionArgs) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public boolean reducePlayCount(int id) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return false;
    }

    public int deleteContentsInfo(String selection, String[] selectionArgs) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public FileDescriptor openContentFile(int id, int mode) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return null;
    }

    public FileDescriptor openIconFile(int id, int mode) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return null;
    }

    public void closeContentFile(int id, FileDescriptor fd, int status) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
    }

    public boolean createThumbnail(int id) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return false;
    }

    public FileDescriptor openThumbnail(int id) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return null;
    }

    public FileDescriptor openThumbnail(int id, int mode) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return null;
    }

    public void closeThumbnail(int id, FileDescriptor fd) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
    }

    public void closeIconFile(int id, FileDescriptor fd) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
    }

    public Cursor getMimeType(String[] projection, String selection, String[] selectionArgs, String sortOrder) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return null;
    }

    public Cursor getPlayListInfo(String[] projection, String selection, String[] selectionArgs, String sortOrder) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return null;
    }

    public Cursor getPlayListConts(String[] projection, String selection, String[] selectionArgs, String sortOrder) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return null;
    }

    public Cursor getAppWidgetInfo(String[] projection, String selection, String[] selectionArgs, String sortOrder) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return null;
    }

    public Cursor getCategory(String[] projection, String selection, String[] selectionArgs, String sortOrder) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return null;
    }

    public int insertMimeType(ContentValues values) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public int insertPlayListInfo(ContentValues values) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public int insertPlayListConts(ContentValues values) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public int updateMimeType(ContentValues values, String selection, String[] selectionArgs) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public int updatePlayListInfo(ContentValues values, String selection, String[] selectionArgs) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public String getExternalVolumeSerial(String path) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return null;
    }

    @Deprecated
    public String getExternalVolumnSerial(String path) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return null;
    }

    public int updatePlayListConts(ContentValues values, String selection, String[] selectionArgs) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public int deletePlayListInfo(String selection, String[] selectionArgs) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public int deleteMimeType(String selection, String[] selectionArgs) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public int deletePlayListConts(String selection, String[] selectionArgs) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public int deleteAppWidgetInfo(String selection, String[] selectionArgs) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public Cursor getDownloadUrl(String[] projection, String selection, String[] selectionArgs, String sortOrder) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return null;
    }

    public int insertCategory(ContentValues values) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public int insertAppWidgetInfo(ContentValues values) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public int updateCategory(ContentValues values, String selection, String[] selectionArgs) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public int updateAppWidgetInfo(ContentValues values, String selection, String[] selectionArgs) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public int deleteCategory(String selection, String[] selectionArgs) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public int insertDownloadUrl(ContentValues values) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public int updateDownloadUrl(ContentValues values, String selection, String[] selectionArgs) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public int deleteDownloadUrl(String selection, String[] selectionArgs) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public Cursor updateRingtone(int Id, int type) throws IllegalAccessException, GeneralException, IllegalArgumentException {
        return null;
    }

    public String[] getAudioMetadata(int id) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return null;
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

    public Cursor query(Uri uri, String[] projection, String selection, String[] selectionArgs, String sortOrder) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return null;
    }

    public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public int insert(Uri uri, ContentValues values) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public int delete(Uri uri, String selection, String[] selectionArgs) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return -1;
    }

    public Intent executeCommand(Intent intent) throws IllegalAccessException, GeneralException, NotSupportException, RemoteException, IllegalArgumentException {
        return null;
    }
}
