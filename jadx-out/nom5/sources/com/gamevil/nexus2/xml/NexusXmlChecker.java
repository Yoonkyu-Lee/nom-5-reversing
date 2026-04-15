package com.gamevil.nexus2.xml;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.os.AsyncTask;
import android.os.Handler;
import com.gamevil.nexus2.Natives;
import com.gamevil.nexus2.NexusGLActivity;
import com.gamevil.nom5.lgu.C0046R;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

/* JADX INFO: loaded from: classes.dex */
public class NexusXmlChecker extends AsyncTask<String, String, String> {
    private static final String APPID = "appId";
    private static final String CALLBACK_URL = "callback_url";
    private static final String CARRIER = "profile_carrier";
    private static final int MAX_TIME_BLOCK = 15;
    private static final String MESSAGE = "message";
    private static final String NEWS_URL = "newsBanner_url";
    private static final String PACKAGE = "profile_package";
    private static final String START_TAG = "profile";
    private static final String TITLE = "title";
    private static final String TYPE = "profile_type";
    private static final String VERSION = "profile_version";
    private String actionType;
    private String carrier;
    private String currentVersion;
    private boolean isNewVersion;
    NewsViewTask task;
    private String version;
    private final String ACTION_TYYPE_ALERT = "ALERT";
    private final String ACTION_TYYPE_NEWS = "NEWS";
    private final String ACTION_TYYPE_UPDATE = "UPDATE";
    private final String CARRIER_SKT = "SKT";
    private final String CARRIER_KTF = "KTF";
    private final String CARRIER_LGT = "LGT";
    private final String CARRIER_GLOBAL = "GLOBAL";
    private final String CARRIER_IOS = "IOS";
    private String productID = null;
    private String title = null;
    private String message = null;
    private String newsBannerUrl = null;
    private String callbackUrl = null;
    private Handler mHandler = new Handler();

    public NexusXmlChecker() {
        this.isNewVersion = false;
        this.isNewVersion = false;
        PackageManager pm = NexusGLActivity.myActivity.getPackageManager();
        this.currentVersion = "1.0.0";
        try {
            this.currentVersion = pm.getPackageInfo(NexusGLActivity.myActivity.getPackageName(), 0).versionName;
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }
        loadSavedData();
    }

    public void releaseAll() {
        this.isNewVersion = false;
        this.productID = null;
        this.title = null;
        this.message = null;
        this.newsBannerUrl = null;
        this.callbackUrl = null;
        this.mHandler = null;
        if (this.task != null) {
            NewsViewTask.releaseAll();
            this.task = null;
        }
    }

    public void loadSavedData() {
        SharedPreferences _updateCheckData = NexusGLActivity.myActivity.getPreferences(0);
        this.productID = _updateCheckData.getString(APPID, null);
        this.carrier = _updateCheckData.getString(CARRIER, null);
        this.actionType = _updateCheckData.getString(TYPE, null);
        this.title = _updateCheckData.getString(TITLE, null);
        this.message = _updateCheckData.getString(MESSAGE, null);
        this.newsBannerUrl = _updateCheckData.getString(NEWS_URL, null);
        this.callbackUrl = _updateCheckData.getString(CALLBACK_URL, null);
        this.version = _updateCheckData.getString(VERSION, null);
        if (this.version != null && !this.version.equals(this.currentVersion)) {
            this.isNewVersion = true;
        }
        System.out.println("+---------------------------------------------------");
        System.out.println("|\t[XML loadSavedData ]\t ");
        System.out.println("|\tactionType\t: " + this.actionType);
        System.out.println("|\ttitle\t: " + this.title);
        System.out.println("|\tmessage\t: " + this.message);
        System.out.println("|\tnewsBannerUrl\t: " + this.newsBannerUrl);
        System.out.println("|\tcallbackUrl\t: " + this.callbackUrl);
        System.out.println("+---------------------------------------------------");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public String doInBackground(String... params) {
        GamevilLiveWebView wv = (GamevilLiveWebView) NexusGLActivity.myActivity.findViewById(C0046R.id.webView);
        if (wv != null) {
            wv.checkNewEvent();
        }
        if (!isXmlModified(params[1])) {
            return "DATA";
        }
        boolean isTitle = false;
        boolean isMessage = false;
        boolean isAppID = false;
        boolean isNewsUrl = false;
        boolean isCallbackUrl = false;
        System.out.println("@@@@@@@@ Start Parssig XML @@@@@@@");
        SharedPreferences updateCheckData = NexusGLActivity.myActivity.getPreferences(0);
        SharedPreferences.Editor prefEditor = updateCheckData.edit();
        try {
            URL xmlUrl = new URL(params[0]);
            XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
            factory.setNamespaceAware(true);
            XmlPullParser xpp = factory.newPullParser();
            xpp.setInput(xmlUrl.openConnection().getInputStream(), "euc-kr");
            int idx = 0;
            int profileIdx = -1;
            for (int eventType = xpp.getEventType(); eventType != 1; eventType = xpp.next()) {
                if (eventType != 0 && eventType != 1) {
                    if (eventType == 2) {
                        if (xpp.getName().equals(START_TAG)) {
                            int attCount = xpp.getAttributeCount();
                            for (int i = 0; i < attCount; i++) {
                                if (xpp.getAttributeName(i).equals(PACKAGE) && xpp.getAttributeValue(i).equals(NexusGLActivity.myActivity.getPackageName())) {
                                    profileIdx = idx;
                                }
                            }
                            for (int i2 = 0; i2 < attCount; i2++) {
                                System.out.println(String.valueOf(idx) + "::" + xpp.getAttributeName(i2));
                                System.out.println(String.valueOf(idx) + "::" + xpp.getAttributeValue(i2));
                            }
                            if (profileIdx == idx) {
                                for (int i3 = 0; i3 < attCount; i3++) {
                                    if (xpp.getAttributeName(i3).equals(PACKAGE)) {
                                        prefEditor.putString(PACKAGE, xpp.getAttributeValue(i3));
                                    } else if (xpp.getAttributeName(i3).equals(VERSION)) {
                                        if (!xpp.getAttributeValue(i3).equals(this.currentVersion)) {
                                            this.isNewVersion = true;
                                        }
                                        prefEditor.putString(VERSION, xpp.getAttributeValue(i3));
                                    } else if (xpp.getAttributeName(i3).equals(CARRIER)) {
                                        this.carrier = xpp.getAttributeValue(i3);
                                        prefEditor.putString(CARRIER, this.carrier);
                                    } else if (xpp.getAttributeName(i3).equals(TYPE)) {
                                        this.actionType = xpp.getAttributeValue(i3);
                                        prefEditor.putString(TYPE, this.actionType);
                                    } else if (xpp.getAttributeName(i3).equals(APPID)) {
                                        prefEditor.putString(APPID, xpp.getAttributeValue(i3));
                                        this.productID = xpp.getAttributeValue(i3);
                                    }
                                }
                            }
                        } else if (xpp.getName().equals(TITLE)) {
                            isTitle = true;
                        } else if (xpp.getName().equals(MESSAGE)) {
                            isMessage = true;
                        } else if (xpp.getName().equals(APPID)) {
                            isAppID = true;
                        } else if (xpp.getName().equals(NEWS_URL)) {
                            isNewsUrl = true;
                        } else if (xpp.getName().equals(CALLBACK_URL)) {
                            isCallbackUrl = true;
                        }
                    } else if (eventType == 3) {
                        if (xpp.getName().equals(START_TAG)) {
                            idx++;
                        }
                    } else if (eventType == 4 && profileIdx == idx) {
                        if (isTitle) {
                            this.title = xpp.getText();
                            isTitle = false;
                            prefEditor.putString(TITLE, this.title);
                        }
                        if (isMessage) {
                            this.message = xpp.getText();
                            isMessage = false;
                            prefEditor.putString(MESSAGE, this.message);
                        }
                        if (isAppID) {
                            isAppID = false;
                            this.productID = xpp.getText();
                            prefEditor.putString(APPID, this.productID);
                        }
                        if (isNewsUrl) {
                            isNewsUrl = false;
                            this.newsBannerUrl = xpp.getText();
                            prefEditor.putString(NEWS_URL, this.newsBannerUrl);
                        }
                        if (isCallbackUrl) {
                            isCallbackUrl = false;
                            this.callbackUrl = xpp.getText();
                            prefEditor.putString(CALLBACK_URL, this.callbackUrl);
                        }
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (XmlPullParserException e2) {
            e2.printStackTrace();
        }
        prefEditor.putLong("profile_saveTime", System.currentTimeMillis());
        prefEditor.commit();
        System.out.println("@@@@@@@@ End Parssig XML @@@@@@@2");
        return "Data";
    }

    public boolean checkedProfileXML() {
        SharedPreferences updateCheckData = NexusGLActivity.myActivity.getPreferences(0);
        long saveTime = updateCheckData.getLong("profile_saveTime", 0L);
        if (saveTime == 0) {
            return false;
        }
        long timeGap = System.currentTimeMillis() - saveTime;
        return timeGap < 15000;
    }

    public String getProfileAttribute(String _name) {
        SharedPreferences settingsLicense = NexusGLActivity.myActivity.getPreferences(0);
        return settingsLicense.getString(_name, "??");
    }

    public void saveLicensedStatus() {
        SharedPreferences settingsLicense = NexusGLActivity.myActivity.getPreferences(0);
        SharedPreferences.Editor prefEditor = settingsLicense.edit();
        prefEditor.putBoolean("licensed", true);
        prefEditor.commit();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public void onPostExecute(String result) {
        if (this.actionType != null) {
            if (this.actionType.equals("UPDATE") && this.isNewVersion) {
                Dialog alert = new AlertDialog.Builder(NexusGLActivity.myActivity).setTitle(this.title).setMessage(this.message).setPositiveButton("YES", new DialogInterface.OnClickListener() { // from class: com.gamevil.nexus2.xml.NexusXmlChecker.1
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int whichButton) {
                        Natives.openUrl(NexusXmlChecker.this.callbackUrl);
                    }
                }).setNegativeButton("NO", new DialogInterface.OnClickListener() { // from class: com.gamevil.nexus2.xml.NexusXmlChecker.2
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int whichButton) {
                    }
                }).create();
                alert.show();
            } else if (this.actionType.equals("ALERT")) {
                Dialog alert2 = new AlertDialog.Builder(NexusGLActivity.myActivity).setTitle(this.title).setMessage(this.message).setPositiveButton("OK", new DialogInterface.OnClickListener() { // from class: com.gamevil.nexus2.xml.NexusXmlChecker.3
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int whichButton) {
                    }
                }).create();
                alert2.show();
            } else if (this.actionType.equals("NEWS")) {
                this.mHandler.post(new Runnable() { // from class: com.gamevil.nexus2.xml.NexusXmlChecker.4
                    @Override // java.lang.Runnable
                    public void run() {
                        NexusXmlChecker.this.task = new NewsViewTask();
                        NexusXmlChecker.this.task.execute(NexusXmlChecker.this.newsBannerUrl, NexusXmlChecker.this.callbackUrl);
                    }
                });
            }
        }
    }

    public boolean isXmlModified(String _url) {
        SharedPreferences settingsLicense = NexusGLActivity.myActivity.getPreferences(0);
        try {
            URL text = new URL(_url);
            InputStream isText = text.openStream();
            byte[] bText = new byte[64];
            isText.read(bText);
            String response = new String(bText);
            String xmlSaveTime = response.trim();
            String savedTime = settingsLicense.getString("xmlModifed", null);
            System.out.println("### xmlSaveTime = " + xmlSaveTime);
            System.out.println("### savedTime = " + savedTime);
            if (!xmlSaveTime.equals(savedTime)) {
                SharedPreferences.Editor prefEditor = settingsLicense.edit();
                prefEditor.putString("xmlModifed", xmlSaveTime);
                prefEditor.commit();
                return true;
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e2) {
            e2.printStackTrace();
        }
        return false;
    }
}
