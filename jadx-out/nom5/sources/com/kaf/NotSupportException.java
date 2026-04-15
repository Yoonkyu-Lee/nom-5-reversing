package com.kaf;

/* JADX INFO: loaded from: classes.dex */
public class NotSupportException extends Exception {
    public NotSupportException(String errorCode) {
        super(errorCode);
    }

    public NotSupportException(String errorCode, String additionalExceptionMessage) {
        super(String.valueOf(errorCode) + " : " + additionalExceptionMessage);
    }

    public NotSupportException(String errorCode, Throwable e) {
        super(errorCode, e);
    }
}
