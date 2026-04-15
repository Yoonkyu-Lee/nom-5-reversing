package com.gamevil.nexus2.xml;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.os.Handler;
import android.os.Message;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.View;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ProgressBar;
import com.gamevil.nexus2.Natives;
import com.gamevil.nexus2.NexusGLActivity;
import com.gamevil.nom5.lgu.C0046R;
import com.kaf.net.Network;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;

/* JADX INFO: loaded from: classes.dex */
public class GamevilLiveWebView extends WebView {
    private static final String LIVE_DATE = "gamevilLiveData";
    private static final String LIVE_UPDATE_TIME = "updateTime";
    private static boolean isNewEvent;
    private static Handler mHandler = new Handler();
    private final int GAME_ID;
    private View.OnClickListener backListener;
    private View.OnClickListener closeListener;
    private View.OnClickListener liveButtonListener;

    private class HelloWebViewClient extends WebViewClient {
        private HelloWebViewClient() {
        }

        /* synthetic */ HelloWebViewClient(GamevilLiveWebView gamevilLiveWebView, HelloWebViewClient helloWebViewClient) {
            this();
        }

        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            view.loadUrl(url);
            return true;
        }

        @Override // android.webkit.WebViewClient
        public void onPageFinished(WebView view, String url) {
            GamevilLiveWebView.this.hidePrograssBar();
            GamevilLiveWebView.isNewEvent = false;
            GamevilLiveWebView.stopButtonAnimation();
        }

        @Override // android.webkit.WebViewClient
        public void onPageStarted(WebView view, String url, Bitmap favicon) {
        }

        @Override // android.webkit.WebViewClient
        public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
            GamevilLiveWebView.this.loadUrl("file:///android_asset/live.html");
        }

        @Override // android.webkit.WebViewClient
        public void onLoadResource(WebView view, String url) {
            GamevilLiveWebView.this.showPrograssBar();
        }

        @Override // android.webkit.WebViewClient
        public void onFormResubmission(WebView view, Message dontResend, Message resend) {
        }
    }

    public GamevilLiveWebView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.GAME_ID = 11;
        this.backListener = new View.OnClickListener() { // from class: com.gamevil.nexus2.xml.GamevilLiveWebView.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (GamevilLiveWebView.this.canGoBack()) {
                    GamevilLiveWebView.this.goBack();
                }
            }
        };
        this.closeListener = new View.OnClickListener() { // from class: com.gamevil.nexus2.xml.GamevilLiveWebView.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                GamevilLiveWebView.mHandler.post(new Runnable() { // from class: com.gamevil.nexus2.xml.GamevilLiveWebView.2.1
                    @Override // java.lang.Runnable
                    public void run() {
                        GamevilLiveWebView.this.stopLoading();
                        GamevilLiveWebView.this.clearHistory();
                        GamevilLiveWebView.this.clearCache(true);
                        FrameLayout f = (FrameLayout) NexusGLActivity.myActivity.findViewById(C0046R.id.gamevilLive);
                        f.setVisibility(4);
                    }
                });
            }
        };
        this.liveButtonListener = new View.OnClickListener() { // from class: com.gamevil.nexus2.xml.GamevilLiveWebView.3
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                GamevilLiveWebView.mHandler.post(new Runnable() { // from class: com.gamevil.nexus2.xml.GamevilLiveWebView.3.1
                    @Override // java.lang.Runnable
                    public void run() {
                        GamevilLiveWebView.this.clearHistory();
                        GamevilLiveWebView.this.clearCache(true);
                        GamevilLiveWebView.this.loadLivePage();
                        FrameLayout f = (FrameLayout) NexusGLActivity.myActivity.findViewById(C0046R.id.gamevilLive);
                        f.setVisibility(0);
                    }
                });
            }
        };
    }

    public void initialize() {
        setWebViewClient(new HelloWebViewClient(this, null));
        mHandler.post(new Runnable() { // from class: com.gamevil.nexus2.xml.GamevilLiveWebView.4
            @Override // java.lang.Runnable
            public void run() {
                ImageButton back = (ImageButton) NexusGLActivity.myActivity.findViewById(C0046R.id.button_back);
                back.setBackgroundColor(0);
                ImageButton close = (ImageButton) NexusGLActivity.myActivity.findViewById(C0046R.id.button_close);
                close.setBackgroundColor(0);
                back.setOnClickListener(GamevilLiveWebView.this.backListener);
                close.setOnClickListener(GamevilLiveWebView.this.closeListener);
            }
        });
    }

    public void checkNewEvent() {
        try {
            URL text = new URL("http://android.gamevil.com/LiveCheck.php?game_id=11");
            InputStream isText = text.openStream();
            byte[] bText = new byte[Network.NETSTATUS_WIFI_NESPOT_Private_IP_CONNECT];
            isText.read(bText);
            String response = new String(bText).trim();
            SharedPreferences settings = NexusGLActivity.myActivity.getSharedPreferences(LIVE_DATE, 0);
            String time = settings.getString(LIVE_UPDATE_TIME, null);
            if (time == null || !time.equals(response)) {
                SharedPreferences.Editor editor = settings.edit();
                editor.putString(LIVE_UPDATE_TIME, response);
                editor.commit();
                isNewEvent = true;
            } else {
                isNewEvent = false;
            }
            isText.close();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e2) {
            e2.printStackTrace();
        }
    }

    public void loadLivePage() {
        if (Natives.isNetAvailable() != 1) {
            loadLocalErrorPage();
            return;
        }
        try {
            URL text = new URL("http://android.gamevil.com/LiveLog.php?game_id=11");
            InputStream isText = text.openStream();
            byte[] bText = new byte[Network.NETSTATUS_WIFI_NESPOT_Private_IP_CONNECT];
            isText.read(bText);
            String response = new String(bText);
            loadUrl(response.trim());
            isText.close();
        } catch (MalformedURLException e) {
            loadLocalErrorPage();
            e.printStackTrace();
        } catch (IOException e2) {
            loadLocalErrorPage();
            e2.printStackTrace();
        }
    }

    public void loadLocalErrorPage() {
        loadUrl("file:///android_asset/live.html");
    }

    @Override // android.webkit.WebView, android.view.View, android.view.KeyEvent.Callback
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        return true;
    }

    public void showPrograssBar() {
        mHandler.post(new Runnable() { // from class: com.gamevil.nexus2.xml.GamevilLiveWebView.5
            @Override // java.lang.Runnable
            public void run() {
                ProgressBar bar = (ProgressBar) NexusGLActivity.myActivity.findViewById(C0046R.id.web_progress);
                bar.setVisibility(0);
            }
        });
    }

    public void hidePrograssBar() {
        mHandler.post(new Runnable() { // from class: com.gamevil.nexus2.xml.GamevilLiveWebView.6
            @Override // java.lang.Runnable
            public void run() {
                ProgressBar bar = (ProgressBar) NexusGLActivity.myActivity.findViewById(C0046R.id.web_progress);
                bar.setVisibility(4);
            }
        });
    }

    public static void showLiveButton() {
    }

    public static void hideLiveButton() {
    }

    private static void startButtonAnimation() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void stopButtonAnimation() {
    }
}
