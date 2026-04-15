package com.kaf;

import java.io.ByteArrayOutputStream;
import java.io.PrintWriter;

/* JADX INFO: loaded from: classes.dex */
public class GeneralException extends Exception {
    protected String additionalExceptionMessage;
    protected String errorCode;

    public GeneralException(String errorCode) {
        super(errorCode);
        this.errorCode = errorCode;
    }

    public GeneralException(String errorCode, String additionalExceptionMessage) {
        super(String.valueOf(errorCode) + " : " + additionalExceptionMessage);
        this.additionalExceptionMessage = additionalExceptionMessage;
        this.errorCode = errorCode;
    }

    public GeneralException(String errorCode, Throwable e) {
        super(errorCode, e);
        this.errorCode = errorCode;
    }

    public String getErrorCode() {
        return this.errorCode;
    }

    public String getAdditionalExceptionMessage() {
        return this.additionalExceptionMessage;
    }

    public static String getStackTraceString(Throwable e) {
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        PrintWriter writer = new PrintWriter(bos);
        e.printStackTrace(writer);
        writer.flush();
        return bos.toString();
    }

    public String getStackTraceString() {
        return getStackTraceString(this);
    }
}
