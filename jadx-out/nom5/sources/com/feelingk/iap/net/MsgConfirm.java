package com.feelingk.iap.net;

import com.feelingk.iap.util.CommonF;

/* JADX INFO: loaded from: classes.dex */
public class MsgConfirm extends Confirm {
    private byte[] mMessage;
    private int mMessageLength = 0;
    private String mUserMessage = null;
    private String mSWDumpMessage = null;

    @Override // com.feelingk.iap.net.Confirm, com.feelingk.iap.net.Header
    protected void parse(byte[] v) {
        super.parse(v);
        this.mMessageLength = v[13];
        this.mMessage = new byte[this.mMessageLength];
        try {
            System.arraycopy(v, 14, this.mMessage, 0, this.mMessageLength);
        } catch (Exception e) {
            CommonF.LOGGER.m2i("IAPNet", "[MsgConfirm] :" + e.toString());
        }
    }

    public byte[] getMsg() {
        return this.mMessage;
    }

    public int getMsgLength() {
        return this.mMessageLength;
    }

    public void SetUserMessage(String s) {
        this.mUserMessage = s;
    }

    public String GetUserMessage() {
        return this.mUserMessage;
    }

    public void SetDumpMessage(String s) {
        this.mSWDumpMessage = s;
    }

    public String GetDumpMessage() {
        return this.mSWDumpMessage;
    }
}
