package com.gamevil.nexus2.p000ui;

import android.content.Context;
import android.util.AttributeSet;
import android.webkit.WebView;
import android.webkit.WebViewClient;

/* JADX INFO: loaded from: classes.dex */
public class UIWebView extends WebView {
    public UIWebView(Context context) {
        super(context);
        setWebViewClient();
    }

    public UIWebView(Context context, AttributeSet attrs) {
        super(context, attrs);
        setWebViewClient();
    }

    boolean setWebViewClient() {
        setWebViewClient(new WebViewClient() { // from class: com.gamevil.nexus2.ui.UIWebView.1
            @Override // android.webkit.WebViewClient
            public boolean shouldOverrideUrlLoading(WebView view, String url) {
                view.loadUrl(url);
                return false;
            }
        });
        return true;
    }
}
