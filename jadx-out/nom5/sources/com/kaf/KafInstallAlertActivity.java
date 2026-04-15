package com.kaf;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Process;

/* JADX INFO: loaded from: classes.dex */
public class KafInstallAlertActivity extends Activity {
    private static final int DLG_ALERT = 1;
    private static String MSG_SHOW_STORE_INSTALL = "어플리케이션 구동을 위해 olleh 마켓이 필요합니다. 설치하시겠습니까?";
    private static String SHOW_STORE_DOWNLOAD_URL = "http://appstoresupport.show.co.kr:8080/store.html";
    private static String TEXT_YES = "예";
    private static String TEXT_NO = "아니요";

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        showDialog(1);
    }

    @Override // android.app.Activity
    protected Dialog onCreateDialog(int id) {
        Dialog dlg = null;
        switch (id) {
            case 1:
                AlertDialog.Builder builder = new AlertDialog.Builder(this);
                builder.setMessage(MSG_SHOW_STORE_INSTALL);
                builder.setPositiveButton(TEXT_YES, new DialogInterface.OnClickListener() { // from class: com.kaf.KafInstallAlertActivity.1
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int which) {
                        Uri uri = Uri.parse(KafInstallAlertActivity.SHOW_STORE_DOWNLOAD_URL);
                        Intent intent = new Intent("android.intent.action.VIEW", uri);
                        intent.addFlags(268435456);
                        KafInstallAlertActivity.this.startActivity(intent);
                        try {
                            Thread.sleep(200L);
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }
                        Process.killProcess(Process.myPid());
                    }
                });
                builder.setNegativeButton(TEXT_NO, new DialogInterface.OnClickListener() { // from class: com.kaf.KafInstallAlertActivity.2
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int which) {
                        try {
                            Thread.sleep(200L);
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }
                        Process.killProcess(Process.myPid());
                    }
                });
                if (builder != null) {
                    dlg = builder.create();
                }
                return dlg;
            default:
                return super.onCreateDialog(id);
        }
    }
}
