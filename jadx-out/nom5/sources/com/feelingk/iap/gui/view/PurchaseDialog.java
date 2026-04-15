package com.feelingk.iap.gui.view;

import android.R;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.view.View;
import com.feelingk.iap.gui.data.PurchaseItem;
import com.feelingk.iap.gui.parser.ParserXML;

/* JADX INFO: loaded from: classes.dex */
public class PurchaseDialog extends Dialog {
    private ParserXML mGUIParser;
    private ParserXML.ParserResultCallback mRetCallback;

    public PurchaseDialog(Context context, ParserXML.ParserResultCallback callback) {
        super(context, R.style.Theme.Translucent.NoTitleBar);
        this.mGUIParser = null;
        this.mRetCallback = null;
        this.mGUIParser = new ParserXML(context, callback);
        this.mRetCallback = callback;
        setOnCancelListener(new DialogInterface.OnCancelListener() { // from class: com.feelingk.iap.gui.view.PurchaseDialog.1
            @Override // android.content.DialogInterface.OnCancelListener
            public void onCancel(DialogInterface dialog) {
                PurchaseDialog.this.mRetCallback.onPurchaseCancelButtonClick();
            }
        });
    }

    public PurchaseDialog(Context context, int themeStyle, ParserXML.ParserResultCallback callback, int isTelecomCarrier, boolean bIsDeviceTab) {
        super(context, themeStyle);
        this.mGUIParser = null;
        this.mRetCallback = null;
        this.mGUIParser = new ParserXML(context, callback, isTelecomCarrier, bIsDeviceTab);
        this.mRetCallback = callback;
        setOnCancelListener(new DialogInterface.OnCancelListener() { // from class: com.feelingk.iap.gui.view.PurchaseDialog.2
            @Override // android.content.DialogInterface.OnCancelListener
            public void onCancel(DialogInterface dialog) {
                PurchaseDialog.this.mRetCallback.onPurchaseCancelButtonClick();
            }
        });
    }

    public void InflateParserDialog(int orientation, PurchaseItem itemInfo) {
        View view = this.mGUIParser.Start(orientation, itemInfo);
        setContentView(view);
    }

    public void ShowPurchaseDialog() {
        show();
    }

    public void ClosePurchaseDialog() {
        dismiss();
    }
}
