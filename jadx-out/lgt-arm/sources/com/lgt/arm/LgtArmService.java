package com.lgt.arm;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import com.lgt.arm.ArmInterface;
import java.util.StringTokenizer;

/* JADX INFO: loaded from: classes.dex */
public class LgtArmService extends Service {
    private static final String TAG = "Lgt_Verify_Tool";
    private String AID;
    private String IMEI;
    private String MDN;
    private boolean bEmul;
    private boolean bVerifyError;
    private int nResultCode;
    private String[] strErrMsg = {"정상", "사용권한을 확인할 수 없습니다. 다시 시도해 주세요 (8)", "구매이력이 확인되지 않았습니다. 고객센터(019114)로 문의하세요(9)", "OZ 스토어 사용권한이 등록되지 않았습니다 가입 후 이용해 주세요(A)", "사용권한을 확인할 수 없습니다. 다시 시도해 주세요 (E)", "단말의 사용권한을 확인할 수 없습니다.(11)", "어플리케이션의 사용권한을 확인할 수 없습니다. 고객센터(019114)로 문의하세요(12)", "서비스 연결이 어렵습니다. 네트워크 설정을  WiFi또는 3G로 설정하시고  잠시 후 다시 시도해 주세요(13)", "OZ 스토어 전용프로그램을 설치 후 다시 시도해 주세요(14)"};
    private String strErrorMsg;
    private VerifyUser verify;

    @Override // android.app.Service
    public void onCreate() {
        Log.d(TAG, String.valueOf(toString()) + " onCreate");
        super.onCreate();
        getInstance();
        getInitData();
    }

    @Override // android.app.Service
    public void onDestroy() {
        Log.d(TAG, String.valueOf(toString()) + " onDestroy");
        super.onDestroy();
    }

    @Override // android.app.Service, android.content.ComponentCallbacks
    public void onLowMemory() {
        Log.d(TAG, String.valueOf(toString()) + " onLowMemory");
        super.onLowMemory();
    }

    private void getInstance() {
        this.verify = new VerifyUser(this);
    }

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        return new ArmInterface.Stub() { // from class: com.lgt.arm.LgtArmService.1
            @Override // com.lgt.arm.ArmInterface
            public int executeArm(String aid) throws RemoteException {
                LgtArmService.this.AID = aid;
                LgtArmService.this.nResultCode = -1;
                LgtArmService.this.bVerifyError = false;
                if (LgtArmService.this.AID != null && !LgtArmService.this.AID.equals("") && LgtArmService.this.AID.length() == 10) {
                    if (LgtArmService.this.verify.MDN == null || LgtArmService.this.verify.MDN.equals("")) {
                        LgtArmService.this.MDN = Util.getTelNumber(LgtArmService.this);
                    } else {
                        LgtArmService.this.MDN = LgtArmService.this.verify.MDN;
                    }
                    LgtArmService.this.IMEI = Util.getIMEINumber(LgtArmService.this);
                    Log.d(LgtArmService.TAG, String.valueOf(toString()) + " MDN [" + LgtArmService.this.MDN + "] AID [" + LgtArmService.this.AID + "] IMEI [" + LgtArmService.this.IMEI + "]");
                    if (LgtArmService.this.MDN == null || LgtArmService.this.MDN.equals("") || LgtArmService.this.MDN.length() > 11) {
                        Log.d(LgtArmService.TAG, String.valueOf(toString()) + " - MDN_OBTAIN_FAIL");
                        ArmSetting.nTestCase = 7;
                        LgtArmService.this.nResultCode = ResultArm.MDN_OBTAIN_FAIL;
                        return LgtArmService.this.nResultCode;
                    }
                    LgtArmService.this.nResultCode = LgtArmService.this.getResult(ArmSetting.nTestCase);
                    return LgtArmService.this.nResultCode;
                }
                Log.d(LgtArmService.TAG, String.valueOf(toString()) + " - AID_OBTAIN_FAIL");
                ArmSetting.nTestCase = 8;
                LgtArmService.this.nResultCode = ResultArm.AID_OBTAIN_FAIL;
                return LgtArmService.this.nResultCode;
            }
        };
    }

    @Override // android.app.Service
    public boolean onUnbind(Intent intent) {
        Log.d(TAG, String.valueOf(toString()) + " onUnbind");
        System.gc();
        return super.onUnbind(intent);
    }

    private void getInitData() {
        this.bEmul = Util.getEmul(this);
        try {
            String data = Util.readOpenFile(this, "verifyData");
            StringTokenizer strTocken = new StringTokenizer(data, "|");
            this.verify.MDN = strTocken.nextToken().trim();
            ArmSetting.nTestCase = Integer.parseInt(strTocken.nextToken().trim());
        } catch (Exception e) {
            Log.d(TAG, String.valueOf(toString()) + " " + e.toString());
            ArmSetting.nTestCase = 0;
            this.verify.MDN = "";
        }
        if (!this.bEmul) {
            this.verify.MDN = "";
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int getResult(int nCase) {
        switch (nCase) {
            case 0:
                return 1;
            case ResultArm.ARM_SUCCESS /* 1 */:
            default:
                return -268435448;
            case 2:
                return ResultArm.QLICENSE_NOT_PURCHASE;
            case 3:
                return ResultArm.QLICENSE_NOT_FIND_USER;
            case 4:
                return ResultArm.QLICENSE_FAIL_1;
            case 5:
                return ResultArm.MDN_OBTAIN_FAIL;
            case 6:
                return ResultArm.AID_OBTAIN_FAIL;
            case 7:
                return ResultArm.NETWORK_OPEN_FAIL;
            case 8:
                return ResultArm.SO_CALL_FAIL;
        }
    }
}
