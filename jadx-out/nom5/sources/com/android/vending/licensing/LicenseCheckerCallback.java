package com.android.vending.licensing;

/* JADX INFO: loaded from: classes.dex */
public interface LicenseCheckerCallback {

    public enum ApplicationErrorCode {
        INVALID_PACKAGE_NAME,
        NON_MATCHING_UID,
        NOT_MARKET_MANAGED,
        CHECK_IN_PROGRESS,
        INVALID_PUBLIC_KEY,
        MISSING_PERMISSION,
        NETWORK_ERROR;

        /* JADX INFO: renamed from: values, reason: to resolve conflict with enum method */
        public static ApplicationErrorCode[] valuesCustom() {
            ApplicationErrorCode[] applicationErrorCodeArrValuesCustom = values();
            int length = applicationErrorCodeArrValuesCustom.length;
            ApplicationErrorCode[] applicationErrorCodeArr = new ApplicationErrorCode[length];
            System.arraycopy(applicationErrorCodeArrValuesCustom, 0, applicationErrorCodeArr, 0, length);
            return applicationErrorCodeArr;
        }
    }

    void allow();

    void applicationError(ApplicationErrorCode applicationErrorCode);

    void dontAllow();
}
