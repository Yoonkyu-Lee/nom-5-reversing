package com.lgt.arm;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
public class VerifyUser {
    private static final String TAG = "CP_Arm_Tool";
    public String AID;
    public String LicenseInfo;
    public String MDN;
    private Context ctx;
    public int nResultCode;

    public native int getLicenseStatus();

    public VerifyUser(Context ctx) {
        this.ctx = ctx;
    }

    public boolean getFileInfo() {
        return true;
    }

    public String getFileValue() {
        switch (this.nResultCode) {
            case ResultArm.DLICENSE_RESPONSE_VER_NOT_MATCHED /* -268435407 */:
                return "라이선스 버전 오류[" + Integer.toHexString(this.nResultCode) + "]";
            case ResultArm.DLICENSE_RESPONSE_MAC_NOT_MATCHED /* -268435406 */:
                return "라이선스 MAC값이 틀림[" + Integer.toHexString(this.nResultCode) + "]";
            case ResultArm.DLICENSE_RESPONSE_MDN_NOT_EXIST /* -268435405 */:
                return " 라이선스 MDN값 미존재[" + Integer.toHexString(this.nResultCode) + "]";
            case ResultArm.DLICENSE_RESPONSE_MDN_NOT_MATCHED /* -268435404 */:
                return "라이선스 MDN 매칭 실패[" + Integer.toHexString(this.nResultCode) + "]";
            case ResultArm.DLICENSE_AID_NOT_MATCHED /* -268435403 */:
                return "라이선스 AID 매칭 실패[" + Integer.toHexString(this.nResultCode) + "]";
            default:
                return "인증서 READ ERROR[" + Integer.toHexString(this.nResultCode) + "]";
        }
    }
}
