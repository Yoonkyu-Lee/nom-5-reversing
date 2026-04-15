package com.feelingk.iap.gui.view;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.view.View;
import com.feelingk.iap.gui.parser.ParserXML;

/* JADX INFO: loaded from: classes.dex */
public class PopupDialog extends Dialog {
    private View.OnClickListener mClickListener;
    private ParserXML mGUIParser;

    public PopupDialog(Context context, int themeStyle, boolean isDeviceTab) {
        super(context, themeStyle);
        this.mGUIParser = null;
        this.mClickListener = null;
        this.mGUIParser = new ParserXML(context);
    }

    public void InflateView(int state, String message, View.OnClickListener clickListener) {
        this.mClickListener = clickListener;
        setContentView(this.mGUIParser.Start("/xml/commonPopup.xml", message, clickListener));
        if (state == 105) {
            setOnCancelListener(new DialogInterface.OnCancelListener() { // from class: com.feelingk.iap.gui.view.PopupDialog.1
                @Override // android.content.DialogInterface.OnCancelListener
                public void onCancel(DialogInterface dialog) {
                    PopupDialog.this.mClickListener.onClick(null);
                }
            });
        }
    }

    public void ShowPopupDialog() {
        show();
    }

    public void ClosePopupDialog() {
        dismiss();
    }
}
