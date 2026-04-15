package com.android.vending.licensing;

/* JADX INFO: loaded from: classes.dex */
public interface Policy {

    public enum LicenseResponse {
        LICENSED,
        NOT_LICENSED,
        RETRY;

        /* JADX INFO: renamed from: values, reason: to resolve conflict with enum method */
        public static LicenseResponse[] valuesCustom() {
            LicenseResponse[] licenseResponseArrValuesCustom = values();
            int length = licenseResponseArrValuesCustom.length;
            LicenseResponse[] licenseResponseArr = new LicenseResponse[length];
            System.arraycopy(licenseResponseArrValuesCustom, 0, licenseResponseArr, 0, length);
            return licenseResponseArr;
        }
    }

    boolean allowAccess();

    void processServerResponse(LicenseResponse licenseResponse, ResponseData responseData);
}
