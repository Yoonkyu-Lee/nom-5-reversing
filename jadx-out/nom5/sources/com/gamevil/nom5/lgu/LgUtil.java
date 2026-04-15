package com.gamevil.nom5.lgu;

import android.app.AlertDialog;
import android.content.ComponentName;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Handler;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import com.gamevil.nexus2.Natives;
import com.gamevil.nexus2.NexusGLActivity;
import com.lgt.arm.ArmInterface;
import com.lguplus.common.bill.IBillSocket;

/* JADX INFO: loaded from: classes.dex */
public class LgUtil {
    private NexusGLActivity activity;
    private boolean isArmServiceBinding = false;
    private boolean isIapServiceBinding = false;
    private String strArmId = null;
    private Handler handler = new Handler();
    private ServiceConnection iapServiceConnection = new ServiceConnection() { // from class: com.gamevil.nom5.lgu.LgUtil.1
        @Override // android.content.ServiceConnection
        public void onServiceConnected(ComponentName name, IBinder service) {
            Log.d(getClass().getName(), "IAP ServiceConnection.onServiceConnected()");
            if (Natives.billSock != null) {
                Natives.billSock = null;
            }
            Natives.billSock = IBillSocket.Stub.asInterface(service);
            Natives.bCanConn = true;
        }

        @Override // android.content.ServiceConnection
        public void onServiceDisconnected(ComponentName p_name) {
            Log.d(getClass().getName(), "IAP ServiceConnection.onServiceDisconnected ()");
            Natives.billSock = null;
            Natives.bCanConn = false;
        }
    };
    private ServiceConnection armServiceConnection = new ServiceConnection() { // from class: com.gamevil.nom5.lgu.LgUtil.2
        @Override // android.content.ServiceConnection
        public void onServiceConnected(ComponentName name, IBinder service) {
            Log.d(getClass().getName(), "ARM ServiceConnection.onServiceConnected()");
            ArmInterface armInterface = ArmInterface.Stub.asInterface(service);
            try {
                int result = armInterface.executeArm(LgUtil.this.strArmId);
                if (result == 1) {
                    Nom5Launcher.setArmPassed(true);
                } else {
                    Nom5Launcher.setArmPassed(false);
                    LgUtil.this.showAlertNShutdown("ARM ALERT", Integer.valueOf(result), Constants.LGU.INT_LGU_IAP_GENERAL_ERROR);
                }
            } catch (RemoteException e) {
                Log.d(getClass().getName(), "ARM ServiceConnection.onServiceConnected () : " + e.getMessage());
                e.printStackTrace();
                Nom5Launcher.setArmPassed(false);
                LgUtil.this.showAlertNShutdown("ARM ALERT", Constants.LGU.INT_LGU_IAP_GENERAL_ERROR, Constants.LGU.INT_LGU_IAP_GENERAL_ERROR);
            }
        }

        @Override // android.content.ServiceConnection
        public void onServiceDisconnected(ComponentName name) {
            Log.d(getClass().getName(), "ARM ServiceConnection.onServiceDisconnected ()");
        }
    };

    public LgUtil(NexusGLActivity _activity) {
        this.activity = _activity;
    }

    public boolean runArmService(String armId) {
        this.strArmId = armId;
        this.isArmServiceBinding = this.activity.bindService(new Intent(ArmInterface.class.getName()), this.armServiceConnection, 1);
        return this.isArmServiceBinding;
    }

    public void releaseArmService() {
        if (this.isArmServiceBinding && this.armServiceConnection != null) {
            this.activity.unbindService(this.armServiceConnection);
        }
    }

    public boolean bindIAPService() {
        if (this.iapServiceConnection == null) {
            showAlertNShutdown("IAP ALERT", Constants.LGU.INT_LGU_IAP_NOT_INSTALLED, Constants.LGU.INT_LGU_IAP_GENERAL_ERROR);
            return false;
        }
        this.isIapServiceBinding = this.activity.bindService(new Intent(IBillSocket.class.getName()), this.iapServiceConnection, 1);
        if (!this.isIapServiceBinding) {
            showAlertNShutdown("IAP ALERT", Constants.LGU.INT_LGU_IAP_GENERAL_ERROR, Constants.LGU.INT_LGU_IAP_GENERAL_ERROR);
        }
        return this.isIapServiceBinding;
    }

    public void unbindIAPService() {
        if (this.isIapServiceBinding && this.iapServiceConnection != null) {
            this.activity.unbindService(this.iapServiceConnection);
        }
    }

    public void showAlertNShutdown(final String title, final Integer errorCode, final Integer elseCode) {
        this.handler.post(new Runnable() { // from class: com.gamevil.nom5.lgu.LgUtil.3
            @Override // java.lang.Runnable
            public void run() {
                AlertDialog.Builder builder = new AlertDialog.Builder(LgUtil.this.activity);
                if (title != null) {
                    builder.setTitle(title);
                }
                builder.setMessage(Constants.LGU.getMessage(errorCode, elseCode));
                builder.setPositiveButton("OK", new DialogInterface.OnClickListener() { // from class: com.gamevil.nom5.lgu.LgUtil.3.1
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int whichButton) {
                        LgUtil.this.activity.finishApp();
                    }
                });
                builder.create();
                builder.show();
            }
        });
    }
}
