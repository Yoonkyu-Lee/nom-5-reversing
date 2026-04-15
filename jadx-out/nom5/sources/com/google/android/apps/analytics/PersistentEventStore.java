package com.google.android.apps.analytics;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteStatement;
import android.util.Log;
import java.security.SecureRandom;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
class PersistentEventStore implements EventStore {
    private static final String ACCOUNT_ID = "account_id";
    private static final String ACTION = "action";
    private static final String CATEGORY = "category";
    private static final String CUSTOMVAR_ID = "cv_id";
    private static final String CUSTOMVAR_INDEX = "cv_index";
    private static final String CUSTOMVAR_NAME = "cv_name";
    private static final String CUSTOMVAR_SCOPE = "cv_scope";
    private static final String CUSTOMVAR_VALUE = "cv_value";
    private static final String CUSTOM_VARIABLE_COLUMN_TYPE = "CHAR(64) NOT NULL";
    private static final String DATABASE_NAME = "google_analytics.db";
    private static final int DATABASE_VERSION = 2;
    private static final String EVENT_ID = "event_id";
    private static final String LABEL = "label";
    private static final int MAX_EVENTS = 1000;
    private static final String RANDOM_VAL = "random_val";
    private static final String REFERRER = "referrer";
    private static final String SCREEN_HEIGHT = "screen_height";
    private static final String SCREEN_WIDTH = "screen_width";
    private static final String STORE_ID = "store_id";
    private static final String TIMESTAMP_CURRENT = "timestamp_current";
    private static final String TIMESTAMP_FIRST = "timestamp_first";
    private static final String TIMESTAMP_PREVIOUS = "timestamp_previous";
    private static final String USER_ID = "user_id";
    private static final String VALUE = "value";
    private static final String VISITS = "visits";
    private SQLiteStatement compiledCountStatement = null;
    private DataBaseHelper databaseHelper;
    private int numStoredEvents;
    private boolean sessionUpdated;
    private int storeId;
    private long timestampCurrent;
    private long timestampFirst;
    private long timestampPrevious;
    private boolean useStoredVisitorVars;
    private int visits;

    static class DataBaseHelper extends SQLiteOpenHelper {
        public DataBaseHelper(Context context) {
            super(context, PersistentEventStore.DATABASE_NAME, (SQLiteDatabase.CursorFactory) null, 2);
        }

        public DataBaseHelper(Context context, String str) {
            super(context, str, (SQLiteDatabase.CursorFactory) null, 2);
        }

        private void createCustomVariableTables(SQLiteDatabase sQLiteDatabase) {
            sQLiteDatabase.execSQL("DROP TABLE IF EXISTS custom_variables");
            sQLiteDatabase.execSQL("CREATE TABLE custom_variables (" + String.format(" '%s' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,", PersistentEventStore.CUSTOMVAR_ID) + String.format(" '%s' INTEGER NOT NULL,", PersistentEventStore.EVENT_ID) + String.format(" '%s' INTEGER NOT NULL,", PersistentEventStore.CUSTOMVAR_INDEX) + String.format(" '%s' CHAR(64) NOT NULL,", PersistentEventStore.CUSTOMVAR_NAME) + String.format(" '%s' CHAR(64) NOT NULL,", PersistentEventStore.CUSTOMVAR_VALUE) + String.format(" '%s' INTEGER NOT NULL);", PersistentEventStore.CUSTOMVAR_SCOPE));
            sQLiteDatabase.execSQL("DROP TABLE IF EXISTS custom_var_cache");
            sQLiteDatabase.execSQL("CREATE TABLE custom_var_cache (" + String.format(" '%s' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,", PersistentEventStore.CUSTOMVAR_ID) + String.format(" '%s' INTEGER NOT NULL,", PersistentEventStore.EVENT_ID) + String.format(" '%s' INTEGER NOT NULL,", PersistentEventStore.CUSTOMVAR_INDEX) + String.format(" '%s' CHAR(64) NOT NULL,", PersistentEventStore.CUSTOMVAR_NAME) + String.format(" '%s' CHAR(64) NOT NULL,", PersistentEventStore.CUSTOMVAR_VALUE) + String.format(" '%s' INTEGER NOT NULL);", PersistentEventStore.CUSTOMVAR_SCOPE));
            for (int i = 1; i <= 5; i++) {
                ContentValues contentValues = new ContentValues();
                contentValues.put(PersistentEventStore.EVENT_ID, (Integer) 0);
                contentValues.put(PersistentEventStore.CUSTOMVAR_INDEX, Integer.valueOf(i));
                contentValues.put(PersistentEventStore.CUSTOMVAR_NAME, "");
                contentValues.put(PersistentEventStore.CUSTOMVAR_SCOPE, (Integer) 3);
                contentValues.put(PersistentEventStore.CUSTOMVAR_VALUE, "");
                sQLiteDatabase.insert("custom_var_cache", PersistentEventStore.EVENT_ID, contentValues);
            }
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onCreate(SQLiteDatabase sQLiteDatabase) {
            sQLiteDatabase.execSQL("CREATE TABLE events (" + String.format(" '%s' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,", PersistentEventStore.EVENT_ID) + String.format(" '%s' INTEGER NOT NULL,", PersistentEventStore.USER_ID) + String.format(" '%s' CHAR(256) NOT NULL,", PersistentEventStore.ACCOUNT_ID) + String.format(" '%s' INTEGER NOT NULL,", PersistentEventStore.RANDOM_VAL) + String.format(" '%s' INTEGER NOT NULL,", PersistentEventStore.TIMESTAMP_FIRST) + String.format(" '%s' INTEGER NOT NULL,", PersistentEventStore.TIMESTAMP_PREVIOUS) + String.format(" '%s' INTEGER NOT NULL,", PersistentEventStore.TIMESTAMP_CURRENT) + String.format(" '%s' INTEGER NOT NULL,", PersistentEventStore.VISITS) + String.format(" '%s' CHAR(256) NOT NULL,", PersistentEventStore.CATEGORY) + String.format(" '%s' CHAR(256) NOT NULL,", PersistentEventStore.ACTION) + String.format(" '%s' CHAR(256), ", PersistentEventStore.LABEL) + String.format(" '%s' INTEGER,", PersistentEventStore.VALUE) + String.format(" '%s' INTEGER,", PersistentEventStore.SCREEN_WIDTH) + String.format(" '%s' INTEGER);", PersistentEventStore.SCREEN_HEIGHT));
            sQLiteDatabase.execSQL("CREATE TABLE session (" + String.format(" '%s' INTEGER PRIMARY KEY,", PersistentEventStore.TIMESTAMP_FIRST) + String.format(" '%s' INTEGER NOT NULL,", PersistentEventStore.TIMESTAMP_PREVIOUS) + String.format(" '%s' INTEGER NOT NULL,", PersistentEventStore.TIMESTAMP_CURRENT) + String.format(" '%s' INTEGER NOT NULL,", PersistentEventStore.VISITS) + String.format(" '%s' INTEGER NOT NULL);", PersistentEventStore.STORE_ID));
            sQLiteDatabase.execSQL("CREATE TABLE install_referrer (referrer TEXT PRIMARY KEY NOT NULL);");
            createCustomVariableTables(sQLiteDatabase);
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
            if (i2 == 2) {
                createCustomVariableTables(sQLiteDatabase);
            }
        }
    }

    PersistentEventStore(DataBaseHelper dataBaseHelper) {
        this.databaseHelper = dataBaseHelper;
        try {
            dataBaseHelper.getWritableDatabase().close();
        } catch (SQLiteException e) {
            Log.e(GoogleAnalyticsTracker.TRACKER_TAG, e.toString());
        }
    }

    @Override // com.google.android.apps.analytics.EventStore
    public void deleteEvent(long j) {
        String str = "event_id=" + j;
        try {
            SQLiteDatabase writableDatabase = this.databaseHelper.getWritableDatabase();
            if (writableDatabase.delete("events", str, null) != 0) {
                this.numStoredEvents--;
                writableDatabase.delete("custom_variables", str, null);
            }
        } catch (SQLiteException e) {
            Log.e(GoogleAnalyticsTracker.TRACKER_TAG, e.toString());
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x007e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    CustomVariableBuffer getCustomVariables(long j) throws Throwable {
        Cursor cursor;
        CustomVariableBuffer customVariableBuffer = new CustomVariableBuffer();
        try {
            Cursor cursorQuery = this.databaseHelper.getReadableDatabase().query("custom_variables", null, "event_id=" + j, null, null, null, null);
            while (cursorQuery.moveToNext()) {
                try {
                    customVariableBuffer.setCustomVariable(new CustomVariable(cursorQuery.getInt(cursorQuery.getColumnIndex(CUSTOMVAR_INDEX)), cursorQuery.getString(cursorQuery.getColumnIndex(CUSTOMVAR_NAME)), cursorQuery.getString(cursorQuery.getColumnIndex(CUSTOMVAR_VALUE)), cursorQuery.getInt(cursorQuery.getColumnIndex(CUSTOMVAR_SCOPE))));
                } catch (SQLiteException e) {
                    cursor = cursorQuery;
                    e = e;
                    try {
                        Log.e(GoogleAnalyticsTracker.TRACKER_TAG, e.toString());
                        if (cursor != null) {
                            cursor.close();
                        }
                    } catch (Throwable th) {
                        th = th;
                        if (cursor != null) {
                            cursor.close();
                        }
                        throw th;
                    }
                } catch (Throwable th2) {
                    cursor = cursorQuery;
                    th = th2;
                    if (cursor != null) {
                    }
                    throw th;
                }
            }
            if (cursorQuery != null) {
                cursorQuery.close();
            }
        } catch (SQLiteException e2) {
            e = e2;
            cursor = null;
        } catch (Throwable th3) {
            th = th3;
            cursor = null;
        }
        return customVariableBuffer;
    }

    @Override // com.google.android.apps.analytics.EventStore
    public int getNumStoredEvents() {
        try {
            if (this.compiledCountStatement == null) {
                this.compiledCountStatement = this.databaseHelper.getReadableDatabase().compileStatement("SELECT COUNT(*) from events");
            }
            return (int) this.compiledCountStatement.simpleQueryForLong();
        } catch (SQLiteException e) {
            Log.e(GoogleAnalyticsTracker.TRACKER_TAG, e.toString());
            return 0;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0042  */
    @Override // com.google.android.apps.analytics.EventStore
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public String getReferrer() throws Throwable {
        Cursor cursor;
        try {
            Cursor cursorQuery = this.databaseHelper.getReadableDatabase().query("install_referrer", new String[]{REFERRER}, null, null, null, null, null);
            try {
                String string = cursorQuery.moveToFirst() ? cursorQuery.getString(0) : null;
                if (cursorQuery != null) {
                    cursorQuery.close();
                }
                return string;
            } catch (SQLiteException e) {
                cursor = cursorQuery;
                e = e;
                try {
                    Log.e(GoogleAnalyticsTracker.TRACKER_TAG, e.toString());
                    if (cursor != null) {
                        cursor.close();
                    }
                    return null;
                } catch (Throwable th) {
                    th = th;
                    if (cursor != null) {
                        cursor.close();
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                cursor = cursorQuery;
                th = th2;
                if (cursor != null) {
                }
                throw th;
            }
        } catch (SQLiteException e2) {
            e = e2;
            cursor = null;
        } catch (Throwable th3) {
            th = th3;
            cursor = null;
        }
    }

    @Override // com.google.android.apps.analytics.EventStore
    public int getStoreId() {
        return this.storeId;
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x005a  */
    @Override // com.google.android.apps.analytics.EventStore
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public String getVisitorCustomVar(int i) throws Throwable {
        Cursor cursorQuery;
        String string;
        try {
            SQLiteDatabase readableDatabase = this.databaseHelper.getReadableDatabase();
            cursorQuery = readableDatabase.query("custom_var_cache", null, "cv_scope = 1 AND cv_index = " + i, null, null, null, null);
            try {
                try {
                    if (cursorQuery.getCount() > 0) {
                        cursorQuery.moveToFirst();
                        string = cursorQuery.getString(cursorQuery.getColumnIndex(CUSTOMVAR_VALUE));
                    } else {
                        string = null;
                    }
                    readableDatabase.close();
                    if (cursorQuery != null) {
                        cursorQuery.close();
                    }
                    return string;
                } catch (SQLiteException e) {
                    e = e;
                    Log.e(GoogleAnalyticsTracker.TRACKER_TAG, e.toString());
                    if (cursorQuery != null) {
                        cursorQuery.close();
                    }
                    return null;
                }
            } catch (Throwable th) {
                th = th;
                if (cursorQuery != null) {
                    cursorQuery.close();
                }
                throw th;
            }
        } catch (SQLiteException e2) {
            e = e2;
            cursorQuery = null;
        } catch (Throwable th2) {
            th = th2;
            cursorQuery = null;
            if (cursorQuery != null) {
            }
            throw th;
        }
    }

    CustomVariableBuffer getVisitorVarBuffer() {
        CustomVariableBuffer customVariableBuffer = new CustomVariableBuffer();
        try {
            Cursor cursorQuery = this.databaseHelper.getReadableDatabase().query("custom_var_cache", null, "cv_scope=1", null, null, null, null);
            while (cursorQuery.moveToNext()) {
                customVariableBuffer.setCustomVariable(new CustomVariable(cursorQuery.getInt(cursorQuery.getColumnIndex(CUSTOMVAR_INDEX)), cursorQuery.getString(cursorQuery.getColumnIndex(CUSTOMVAR_NAME)), cursorQuery.getString(cursorQuery.getColumnIndex(CUSTOMVAR_VALUE)), cursorQuery.getInt(cursorQuery.getColumnIndex(CUSTOMVAR_SCOPE))));
            }
            cursorQuery.close();
        } catch (SQLiteException e) {
            Log.e(GoogleAnalyticsTracker.TRACKER_TAG, e.toString());
        }
        return customVariableBuffer;
    }

    @Override // com.google.android.apps.analytics.EventStore
    public Event[] peekEvents() {
        return peekEvents(MAX_EVENTS);
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x00f6  */
    @Override // com.google.android.apps.analytics.EventStore
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Event[] peekEvents(int i) throws Throwable {
        Cursor cursor;
        ArrayList arrayList = new ArrayList();
        try {
            Cursor cursorQuery = this.databaseHelper.getReadableDatabase().query("events", null, null, null, null, null, EVENT_ID, Integer.toString(i));
            while (cursorQuery.moveToNext()) {
                try {
                    Event event = new Event(cursorQuery.getLong(0), cursorQuery.getInt(1), cursorQuery.getString(2), cursorQuery.getInt(3), cursorQuery.getInt(4), cursorQuery.getInt(5), cursorQuery.getInt(6), cursorQuery.getInt(7), cursorQuery.getString(8), cursorQuery.getString(9), cursorQuery.getString(10), cursorQuery.getInt(11), cursorQuery.getInt(12), cursorQuery.getInt(13));
                    event.setCustomVariableBuffer(getCustomVariables(cursorQuery.getLong(cursorQuery.getColumnIndex(EVENT_ID))));
                    arrayList.add(event);
                } catch (SQLiteException e) {
                    e = e;
                    cursor = cursorQuery;
                    try {
                        Log.e(GoogleAnalyticsTracker.TRACKER_TAG, e.toString());
                        Event[] eventArr = new Event[0];
                        if (cursor == null) {
                            return eventArr;
                        }
                        cursor.close();
                        return eventArr;
                    } catch (Throwable th) {
                        th = th;
                        if (cursor != null) {
                            cursor.close();
                        }
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    cursor = cursorQuery;
                    if (cursor != null) {
                    }
                    throw th;
                }
            }
            if (cursorQuery != null) {
                cursorQuery.close();
            }
            return (Event[]) arrayList.toArray(new Event[arrayList.size()]);
        } catch (SQLiteException e2) {
            e = e2;
            cursor = null;
        } catch (Throwable th3) {
            th = th3;
            cursor = null;
        }
    }

    void putCustomVariables(Event event, long j) {
        try {
            SQLiteDatabase writableDatabase = this.databaseHelper.getWritableDatabase();
            CustomVariableBuffer customVariableBuffer = event.getCustomVariableBuffer();
            if (this.useStoredVisitorVars) {
                if (customVariableBuffer == null) {
                    customVariableBuffer = new CustomVariableBuffer();
                    event.setCustomVariableBuffer(customVariableBuffer);
                }
                CustomVariableBuffer visitorVarBuffer = getVisitorVarBuffer();
                for (int i = 1; i <= 5; i++) {
                    CustomVariable customVariableAt = visitorVarBuffer.getCustomVariableAt(i);
                    CustomVariable customVariableAt2 = customVariableBuffer.getCustomVariableAt(i);
                    if (customVariableAt != null && customVariableAt2 == null) {
                        customVariableBuffer.setCustomVariable(customVariableAt);
                    }
                }
                this.useStoredVisitorVars = false;
            }
            if (customVariableBuffer != null) {
                for (int i2 = 1; i2 <= 5; i2++) {
                    if (!customVariableBuffer.isIndexAvailable(i2)) {
                        CustomVariable customVariableAt3 = customVariableBuffer.getCustomVariableAt(i2);
                        ContentValues contentValues = new ContentValues();
                        contentValues.put(EVENT_ID, Long.valueOf(j));
                        contentValues.put(CUSTOMVAR_INDEX, Integer.valueOf(customVariableAt3.getIndex()));
                        contentValues.put(CUSTOMVAR_NAME, customVariableAt3.getName());
                        contentValues.put(CUSTOMVAR_SCOPE, Integer.valueOf(customVariableAt3.getScope()));
                        contentValues.put(CUSTOMVAR_VALUE, customVariableAt3.getValue());
                        writableDatabase.insert("custom_variables", EVENT_ID, contentValues);
                        writableDatabase.update("custom_var_cache", contentValues, "cv_index=" + customVariableAt3.getIndex(), null);
                    }
                }
            }
        } catch (SQLiteException e) {
            Log.e(GoogleAnalyticsTracker.TRACKER_TAG, e.toString());
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0130  */
    @Override // com.google.android.apps.analytics.EventStore
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void putEvent(Event event) throws Throwable {
        SQLiteDatabase sQLiteDatabase;
        if (this.numStoredEvents >= MAX_EVENTS) {
            Log.w(GoogleAnalyticsTracker.TRACKER_TAG, "Store full. Not storing last event.");
            return;
        }
        if (!this.sessionUpdated) {
            storeUpdatedSession();
        }
        try {
            SQLiteDatabase writableDatabase = this.databaseHelper.getWritableDatabase();
            try {
                writableDatabase.beginTransaction();
                ContentValues contentValues = new ContentValues();
                contentValues.put(USER_ID, Integer.valueOf(event.userId));
                contentValues.put(ACCOUNT_ID, event.accountId);
                contentValues.put(RANDOM_VAL, Integer.valueOf((int) (Math.random() * 2.147483647E9d)));
                contentValues.put(TIMESTAMP_FIRST, Long.valueOf(this.timestampFirst));
                contentValues.put(TIMESTAMP_PREVIOUS, Long.valueOf(this.timestampPrevious));
                contentValues.put(TIMESTAMP_CURRENT, Long.valueOf(this.timestampCurrent));
                contentValues.put(VISITS, Integer.valueOf(this.visits));
                contentValues.put(CATEGORY, event.category);
                contentValues.put(ACTION, event.action);
                contentValues.put(LABEL, event.label);
                contentValues.put(VALUE, Integer.valueOf(event.value));
                contentValues.put(SCREEN_WIDTH, Integer.valueOf(event.screenWidth));
                contentValues.put(SCREEN_HEIGHT, Integer.valueOf(event.screenHeight));
                long jInsert = writableDatabase.insert("events", EVENT_ID, contentValues);
                if (jInsert != -1) {
                    this.numStoredEvents++;
                    Cursor cursorQuery = writableDatabase.query("events", new String[]{EVENT_ID}, null, null, null, null, "event_id DESC", null);
                    cursorQuery.moveToPosition(0);
                    long j = cursorQuery.getLong(0);
                    Log.d("PersistentEventStore/putEvent", "Row ID: " + jInsert + ", Event ID: " + j);
                    cursorQuery.close();
                    putCustomVariables(event, j);
                    writableDatabase.setTransactionSuccessful();
                } else {
                    Log.d("PersistentEventStore/putEvent", "Error when attempting to add event to database.");
                }
                if (writableDatabase != null) {
                    writableDatabase.endTransaction();
                }
            } catch (SQLiteException e) {
                sQLiteDatabase = writableDatabase;
                e = e;
                try {
                    Log.e(GoogleAnalyticsTracker.TRACKER_TAG, e.toString());
                    if (sQLiteDatabase != null) {
                        sQLiteDatabase.endTransaction();
                    }
                } catch (Throwable th) {
                    th = th;
                    if (sQLiteDatabase != null) {
                        sQLiteDatabase.endTransaction();
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                sQLiteDatabase = writableDatabase;
                th = th2;
                if (sQLiteDatabase != null) {
                }
                throw th;
            }
        } catch (SQLiteException e2) {
            e = e2;
            sQLiteDatabase = null;
        } catch (Throwable th3) {
            th = th3;
            sQLiteDatabase = null;
        }
    }

    @Override // com.google.android.apps.analytics.EventStore
    public void setReferrer(String str) {
        try {
            SQLiteDatabase writableDatabase = this.databaseHelper.getWritableDatabase();
            ContentValues contentValues = new ContentValues();
            contentValues.put(REFERRER, str);
            writableDatabase.insert("install_referrer", null, contentValues);
        } catch (SQLiteException e) {
            Log.e(GoogleAnalyticsTracker.TRACKER_TAG, e.toString());
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:20:0x00c9  */
    /* JADX WARN: Type inference failed for: r1v0 */
    /* JADX WARN: Type inference failed for: r1v1 */
    /* JADX WARN: Type inference failed for: r1v3, types: [android.database.Cursor] */
    @Override // com.google.android.apps.analytics.EventStore
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void startNewVisit() throws Throwable {
        Cursor cursorQuery;
        ?? r1 = 1;
        this.sessionUpdated = false;
        this.useStoredVisitorVars = true;
        this.numStoredEvents = getNumStoredEvents();
        try {
            try {
                SQLiteDatabase writableDatabase = this.databaseHelper.getWritableDatabase();
                cursorQuery = writableDatabase.query("session", null, null, null, null, null, null);
                try {
                    if (cursorQuery.moveToFirst()) {
                        this.timestampFirst = cursorQuery.getLong(0);
                        this.timestampPrevious = cursorQuery.getLong(2);
                        this.timestampCurrent = System.currentTimeMillis() / 1000;
                        this.visits = cursorQuery.getInt(3) + 1;
                        this.storeId = cursorQuery.getInt(4);
                    } else {
                        long jCurrentTimeMillis = System.currentTimeMillis() / 1000;
                        this.timestampFirst = jCurrentTimeMillis;
                        this.timestampPrevious = jCurrentTimeMillis;
                        this.timestampCurrent = jCurrentTimeMillis;
                        this.visits = 1;
                        this.storeId = new SecureRandom().nextInt() & Integer.MAX_VALUE;
                        ContentValues contentValues = new ContentValues();
                        contentValues.put(TIMESTAMP_FIRST, Long.valueOf(this.timestampFirst));
                        contentValues.put(TIMESTAMP_PREVIOUS, Long.valueOf(this.timestampPrevious));
                        contentValues.put(TIMESTAMP_CURRENT, Long.valueOf(this.timestampCurrent));
                        contentValues.put(VISITS, Integer.valueOf(this.visits));
                        contentValues.put(STORE_ID, Integer.valueOf(this.storeId));
                        writableDatabase.insert("session", TIMESTAMP_FIRST, contentValues);
                    }
                    if (cursorQuery != null) {
                        cursorQuery.close();
                    }
                } catch (SQLiteException e) {
                    e = e;
                    Log.e(GoogleAnalyticsTracker.TRACKER_TAG, e.toString());
                    if (cursorQuery != null) {
                        cursorQuery.close();
                    }
                }
            } catch (Throwable th) {
                th = th;
                if (r1 != 0) {
                    r1.close();
                }
                throw th;
            }
        } catch (SQLiteException e2) {
            e = e2;
            cursorQuery = null;
        } catch (Throwable th2) {
            th = th2;
            r1 = 0;
            if (r1 != 0) {
            }
            throw th;
        }
    }

    void storeUpdatedSession() {
        try {
            SQLiteDatabase writableDatabase = this.databaseHelper.getWritableDatabase();
            ContentValues contentValues = new ContentValues();
            contentValues.put(TIMESTAMP_PREVIOUS, Long.valueOf(this.timestampPrevious));
            contentValues.put(TIMESTAMP_CURRENT, Long.valueOf(this.timestampCurrent));
            contentValues.put(VISITS, Integer.valueOf(this.visits));
            writableDatabase.update("session", contentValues, "timestamp_first=?", new String[]{Long.toString(this.timestampFirst)});
            this.sessionUpdated = true;
        } catch (SQLiteException e) {
            Log.e(GoogleAnalyticsTracker.TRACKER_TAG, e.toString());
        }
    }
}
