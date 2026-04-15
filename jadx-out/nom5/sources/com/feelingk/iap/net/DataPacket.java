package com.feelingk.iap.net;

/* JADX INFO: loaded from: classes.dex */
public class DataPacket extends Confirm {
    private byte[] data;

    @Override // com.feelingk.iap.net.Confirm, com.feelingk.iap.net.Header
    protected void parse(byte[] v) {
        super.parse(v);
        int len = v.length - 12;
        this.data = new byte[len];
        System.arraycopy(v, 12, this.data, 0, len);
    }

    public void setHeader(byte[] v) {
        super.parse(v);
    }

    public byte[] getData() {
        return this.data;
    }
}
