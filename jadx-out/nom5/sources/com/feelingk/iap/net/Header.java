package com.feelingk.iap.net;

/* JADX INFO: loaded from: classes.dex */
public class Header {
    private int mHeaderDataLength;
    public final int HEADER_SIZE = 12;
    private byte[] mHeaderSpecifier = new byte[2];

    protected void parse(byte[] v) {
        System.arraycopy(v, 0, this.mHeaderSpecifier, 0, 2);
        byte[] buf = new byte[10];
        System.arraycopy(v, 2, buf, 0, 10);
        this.mHeaderDataLength = Integer.parseInt(new String(buf).trim()) - 1;
    }

    public byte[] getSpecifier() {
        return this.mHeaderSpecifier;
    }

    public int getDataLength() {
        return this.mHeaderDataLength;
    }
}
