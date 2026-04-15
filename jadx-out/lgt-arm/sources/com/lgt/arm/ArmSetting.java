package com.lgt.arm;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import java.util.StringTokenizer;

/* JADX INFO: loaded from: classes.dex */
public class ArmSetting extends Activity {
    private static final String TAG = "Lgt_Verify_Tool";
    public static int nTestCase;
    public static String strPhoneNum;
    public String DeviceInfo;
    public String LicenseInfo;
    private boolean bEmul;
    private String dlgMsg;
    private EditText editPhone;
    private Button executeBtn;
    private Spinner mSpinner;
    private TextView txtProcess;
    private VerifyUser verify;
    private String[] strTestOption = {"1", "0xF0000008", "0xF0000009", "0xF000000A", "0xF000000E", "0xF00000011", "0xF00000012", "0xF00000013", "0xF00000014"};
    private View.OnClickListener mExecuteListener = new View.OnClickListener() { // from class: com.lgt.arm.ArmSetting.1
        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            Log.d(ArmSetting.TAG, String.valueOf(toString()) + " onClick");
            ArmSetting.this.verify = new VerifyUser(ArmSetting.this);
            ArmSetting.nTestCase = ArmSetting.this.mSpinner.getLastVisiblePosition();
            try {
                Util.writeOpenFile(ArmSetting.this, "verifyData", String.valueOf(Util.getTelNumber(ArmSetting.this)) + "|" + Integer.toString(ArmSetting.nTestCase));
            } catch (Exception e) {
                e.printStackTrace();
            }
            ArmSetting.this.dlgMsg = String.valueOf(ArmSetting.nTestCase + 1) + "번 케이스로 설정되었습니다.";
            ArmSetting.this.showDialog(0);
        }
    };

    @Override // android.app.Activity
    public void onCreate(Bundle icicle) {
        Log.d(TAG, String.valueOf(toString()) + " onCreate");
        super.onCreate(icicle);
        setContentView(C0003R.layout.main);
        ArrayAdapter<String> adapter = new ArrayAdapter<>(this, android.R.layout.simple_spinner_item, this.strTestOption);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        this.mSpinner = (Spinner) findViewById(C0003R.id.spnTest);
        this.mSpinner.setAdapter((SpinnerAdapter) adapter);
        this.txtProcess = (TextView) findViewById(C0003R.id.txtProcess);
        this.executeBtn = (Button) findViewById(C0003R.id.saveBtn);
        this.executeBtn.setOnClickListener(this.mExecuteListener);
        setInitData();
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        Log.d(TAG, String.valueOf(toString()) + " onDestroy");
        super.onDestroy();
    }

    @Override // android.app.Activity
    protected Dialog onCreateDialog(final int id) {
        return new AlertDialog.Builder(this).setTitle("알 림").setMessage(this.dlgMsg).setPositiveButton("확인", new DialogInterface.OnClickListener() { // from class: com.lgt.arm.ArmSetting.2
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int whichButton) {
                if (id == 0) {
                    ArmSetting.this.finish();
                }
            }
        }).create();
    }

    private void setInitData() {
        this.bEmul = Util.getEmul(this);
        Util.existFile("verifyData");
        try {
            String data = Util.readOpenFile(this, "verifyData");
            Log.d(TAG, String.valueOf(toString()) + " data : " + data);
            StringTokenizer strTocken = new StringTokenizer(data, "|");
            nTestCase = Integer.parseInt(strTocken.nextToken().trim());
        } catch (Exception e) {
            Log.d(TAG, String.valueOf(toString()) + " " + e.toString());
            nTestCase = 0;
        }
        if (this.bEmul) {
            this.mSpinner.setSelection(nTestCase);
        } else {
            this.dlgMsg = "에뮬레이터가 아닌 경우 사용할 수 없습니다.";
            showDialog(0);
        }
    }

    private void setProcess(String msg) {
        this.txtProcess.setText(msg);
    }

    private boolean verifyMDN(String phoneNum) {
        if (phoneNum == null) {
            return false;
        }
        if (phoneNum.length() < 10 || phoneNum.length() > 11) {
            return false;
        }
        String index = phoneNum.substring(0, 3);
        return index.equals("010") || index.equals("011") || index.equals("016") || index.equals("017") || index.equals("018") || index.equals("019");
    }
}
