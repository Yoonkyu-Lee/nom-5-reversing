package com.google.android.apps.analytics;

/* JADX INFO: loaded from: classes.dex */
interface EventStore {
    void deleteEvent(long j);

    int getNumStoredEvents();

    String getReferrer();

    int getStoreId();

    String getVisitorCustomVar(int i);

    Event[] peekEvents();

    Event[] peekEvents(int i);

    void putEvent(Event event);

    void setReferrer(String str);

    void startNewVisit();
}
