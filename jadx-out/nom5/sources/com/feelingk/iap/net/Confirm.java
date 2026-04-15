package com.feelingk.iap.net;

/* JADX INFO: loaded from: classes.dex */
public class Confirm extends Header {
    private byte resultCode;

    @Override // com.feelingk.iap.net.Header
    protected void parse(byte[] v) {
        super.parse(v);
        this.resultCode = v[12];
    }

    public byte getResultCode() {
        return this.resultCode;
    }

    public void setResultCode(byte code) {
        this.resultCode = code;
    }
}
