package com.android.vending.licensing;

import android.text.TextUtils;
import java.util.Iterator;
import java.util.regex.Pattern;

/* JADX INFO: loaded from: classes.dex */
class ResponseData {
    public String extra;
    public int nonce;
    public String packageName;
    public int responseCode;
    public long timestamp;
    public String userId;
    public String versionCode;

    ResponseData() {
    }

    public static ResponseData parse(String responseData) {
        TextUtils.StringSplitter splitter = new TextUtils.SimpleStringSplitter(':');
        splitter.setString(responseData);
        Iterator<String> it = splitter.iterator();
        if (!it.hasNext()) {
            throw new IllegalArgumentException("Blank response.");
        }
        String mainData = it.next();
        String extraData = "";
        if (it.hasNext()) {
            String extraData2 = it.next();
            extraData = extraData2;
        }
        String[] fields = TextUtils.split(mainData, Pattern.quote("|"));
        if (fields.length < 6) {
            throw new IllegalArgumentException("Wrong number of fields.");
        }
        ResponseData data = new ResponseData();
        data.extra = extraData;
        data.responseCode = Integer.parseInt(fields[0]);
        data.nonce = Integer.parseInt(fields[1]);
        data.packageName = fields[2];
        data.versionCode = fields[3];
        data.userId = fields[4];
        data.timestamp = Long.parseLong(fields[5]);
        return data;
    }

    public String toString() {
        return TextUtils.join("|", new Object[]{Integer.valueOf(this.responseCode), Integer.valueOf(this.nonce), this.packageName, this.versionCode, this.userId, Long.valueOf(this.timestamp)});
    }
}
