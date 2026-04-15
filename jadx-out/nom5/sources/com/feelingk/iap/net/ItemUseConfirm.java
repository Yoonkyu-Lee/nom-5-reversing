package com.feelingk.iap.net;

import java.io.UnsupportedEncodingException;

/* JADX INFO: loaded from: classes.dex */
public class ItemUseConfirm extends MsgConfirm {
    private String itemID = null;
    private String itemName = null;
    private int itemCount = 0;

    @Override // com.feelingk.iap.net.MsgConfirm, com.feelingk.iap.net.Confirm, com.feelingk.iap.net.Header
    protected void parse(byte[] v) {
        super.parse(v);
        String tmp = null;
        try {
            String tmp2 = new String(getMsg(), "MS949");
            tmp = tmp2;
        } catch (UnsupportedEncodingException e1) {
            e1.printStackTrace();
        }
        String str = String.valueOf(tmp) + "1";
        int offset = getMsgLength() + 14;
        byte[] _tempID = new byte[10];
        System.arraycopy(v, offset, _tempID, 0, 10);
        this.itemID = new String(_tempID);
        int offset2 = offset + 10;
        byte[] _tempName = new byte[30];
        System.arraycopy(v, offset2, _tempName, 0, 30);
        int offset3 = offset2 + 30;
        try {
            this.itemName = new String(_tempName, "MS949").trim();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        this.itemCount = v[offset3];
        int i = offset3 + 1;
    }

    public int getCount() {
        return this.itemCount;
    }

    public String getItemID() {
        return this.itemID;
    }

    public String getItemName() {
        return this.itemName;
    }
}
