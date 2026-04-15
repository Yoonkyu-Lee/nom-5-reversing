package com.android.vending.licensing;

import com.android.vending.licensing.Policy;

/* JADX INFO: loaded from: classes.dex */
public class StrictPolicy implements Policy {
    private static final String TAG = "StrictPolicy";
    private Policy.LicenseResponse mLastResponse = Policy.LicenseResponse.RETRY;
    private PreferenceObfuscator mPreferences;

    @Override // com.android.vending.licensing.Policy
    public void processServerResponse(Policy.LicenseResponse response, ResponseData rawData) {
        this.mLastResponse = response;
    }

    @Override // com.android.vending.licensing.Policy
    public boolean allowAccess() {
        return this.mLastResponse == Policy.LicenseResponse.LICENSED;
    }
}
