package com.feelingk.iap.gui.view;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import com.feelingk.iap.gui.parser.ParserXML;

/* JADX INFO: loaded from: classes.dex */
public class PopJuminNumberAuth extends Dialog {
    private ParserXML mGUIParser;
    private ParserXML.ParserAuthResultCallback onResultCallback;

    public PopJuminNumberAuth(Context context, int themeSytle, ParserXML.ParserAuthResultCallback cb, boolean isDeviceTab) {
        super(context, themeSytle);
        this.mGUIParser = null;
        this.onResultCallback = null;
        this.mGUIParser = new ParserXML(context, cb, true);
        this.onResultCallback = cb;
    }

    public void InflateView() {
        setContentView(this.mGUIParser.Start("/xml_kt_lg/pop_Juminnumber.xml", null, null));
        setOnCancelListener(new DialogInterface.OnCancelListener() { // from class: com.feelingk.iap.gui.view.PopJuminNumberAuth.1
            @Override // android.content.DialogInterface.OnCancelListener
            public void onCancel(DialogInterface dialog) {
                PopJuminNumberAuth.this.onResultCallback.onAuthDialogCancelButtonClick();
            }
        });
    }

    public void ShowPopupAuthDialog() {
        show();
    }

    public void ClosePopupAuthDialog() {
        dismiss();
    }
}
