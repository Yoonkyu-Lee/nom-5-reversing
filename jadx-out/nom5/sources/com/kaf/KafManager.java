package com.kaf;

import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.ActivityNotFoundException;
import android.content.ContentValues;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.Process;
import android.util.Log;
import com.kaf.device.IDeviceControl;
import com.kaf.display.IDisplayManager;
import com.kaf.log.IDebug;
import com.kaf.media.IMediaManager;
import com.kaf.net.IBcmSocket;
import com.kaf.net.INetwork;
import com.kaf.net.Network;
import com.kaf.sound.ISound;
import com.kaf.sys.IProperty;
import dalvik.system.DexClassLoader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.net.InetAddress;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/* JADX INFO: loaded from: classes.dex */
public class KafManager {
    public static final String ERR_INVALID_OBJECT_CODE = "F00000004";
    public static final String ERR_INVALID_OBJECT_MESG = "Object is null";
    public static final String ERR_LIB_LOAD_FAILED_CODE = "F00000003";
    public static final String ERR_LIB_LOAD_FAILED_MESG = "Library Load Failed.";
    public static final String ERR_LIB_NOT_INIT_CODE = "F00000002";
    public static final String ERR_LIB_NOT_INIT_MESG = "KAF is not initialzed.";
    public static final String ERR_LIB_NOT_LOADED_CODE = "F00000001";
    public static final String ERR_LIB_NOT_LOADED_MESG = "KAF Library is not loaded.";
    public static final int INIT_COPYLEFT = 0;
    public static final int INIT_COPYRIGHT = 1;
    public static final int KAF_INSTALL_STATUS_INIT_REINSTALL = 0;
    private File cacheDir;

    /* JADX INFO: renamed from: cl */
    private DexClassLoader f9cl;
    private File devInfoFile;
    private File jarDir;
    private File jarFile;
    private File kafConfFile;
    ProgressDialog progressDialog;
    private static KafManager kafManager = null;
    private static String IKAF_VERSION = "ikaf_public_r04_101104";
    private static String SHOW_STORE_DOWNLOAD_URL = "http://appstoresupport.show.co.kr:8080/store.html";
    private static String KAF_MANAGER_CONTENT_URI = "content://com.kaf.kafmanagerprovider";
    private static String ACTION_KAF_LIB_INSTALL = "com.kaf.action.KAF_LIB_INSTALL";
    private static String ACTION_APP_INSTALL_HISTORY_UPDATE = "com.kaf.action.APP_INSTALL_HISTORY_UPDATE";
    private static String SHOW_STORE_PACKAGE_NAME = "com.kt.olleh.istore";
    private static String MSG_SHOW_STORE_INSTALL = "어플리케이션 구동을 위해서 olleh 마켓이 필요합니다. 설치하시겠습니까?";
    private static String MSG_SHOW_STORE_REINSTALL = "olleh 마켓을 다시 설치합니다. 설치하겠습니까?";
    private static String TEXT_YES = "예";
    private static String TEXT_NO = "아니요";
    private static String TEXT_CONFIRM = "확인";
    private static String KAFMANAGER_CLASS_NAME = "com.kt.ikaf.KafManager";
    private static String CN_NAME = "name";
    private static String CN_VALUE = "value";
    private static String CN_NAME_KAF_LIB_VERSION = "kaf_version";
    private static String CN_NAME_KAF_INIT_STATUS = "kaf_init_status";
    private static String CN_NAME_KAF_INIT_PROC_TIME = "kaf_init_process_time";
    private boolean isLibraryInit = false;
    Class clsDeviceControl = null;
    IKafManager iKafManager = null;
    private Context appContext = null;
    private int adStatus = 0;

    public static KafManager getInstance() {
        return kafManager == null ? getSingletoneInstance() : kafManager;
    }

    private static synchronized KafManager getSingletoneInstance() {
        if (kafManager == null) {
            kafManager = new KafManager();
        }
        return kafManager;
    }

    @Deprecated
    public void checkInit(int apiLevel) throws IllegalAccessException, GeneralException {
        if (!isKafLibraryInit()) {
            throw new GeneralException(ERR_LIB_NOT_LOADED_CODE, ERR_LIB_NOT_LOADED_MESG);
        }
        this.iKafManager.checkInit(apiLevel);
    }

    public int Initialize(Context context, int copyright) throws IllegalAccessException, GeneralException, IllegalArgumentException {
        ApplicationInfo ai;
        this.isLibraryInit = false;
        if (context == null) {
            throw new IllegalArgumentException("Context value is null");
        }
        if (copyright != 0 && copyright != 1) {
            throw new IllegalArgumentException("Invalid copyright");
        }
        this.appContext = context;
        Log.i("KAF", " **** Inf KafManager.Initialize(" + IKAF_VERSION + ") ****");
        try {
            try {
                ai = context.getPackageManager().getApplicationInfo(SHOW_STORE_PACKAGE_NAME, Network.NETSTATUS_WIFI_NESPOT_Private_IP_CONNECT);
            } catch (PackageManager.NameNotFoundException ex) {
                ex.printStackTrace();
                try {
                    Intent intent = new Intent(context.getApplicationContext(), (Class<?>) KafInstallAlertActivity.class);
                    intent.addFlags(268435456);
                    context.startActivity(intent);
                } catch (ActivityNotFoundException e) {
                    new AlertDialog.Builder(context).setMessage(MSG_SHOW_STORE_INSTALL).setPositiveButton(TEXT_YES, new DialogInterface.OnClickListener() { // from class: com.kaf.KafManager.1
                        @Override // android.content.DialogInterface.OnClickListener
                        public void onClick(DialogInterface dialog, int whichButton) {
                            Uri uri = Uri.parse(KafManager.SHOW_STORE_DOWNLOAD_URL);
                            Intent intent2 = new Intent("android.intent.action.VIEW", uri);
                            intent2.addFlags(268435456);
                            KafManager.this.appContext.startActivity(intent2);
                            try {
                                Thread.sleep(200L);
                            } catch (InterruptedException e2) {
                                e2.printStackTrace();
                            }
                            Process.killProcess(Process.myPid());
                        }
                    }).setNegativeButton(TEXT_NO, new DialogInterface.OnClickListener() { // from class: com.kaf.KafManager.2
                        @Override // android.content.DialogInterface.OnClickListener
                        public void onClick(DialogInterface dialog, int which) {
                            try {
                                Thread.sleep(200L);
                            } catch (InterruptedException e2) {
                                e2.printStackTrace();
                            }
                            Process.killProcess(Process.myPid());
                        }
                    }).show();
                }
                return -4;
            }
        } catch (Exception e2) {
            e2.printStackTrace();
        }
        if (ai == null) {
            return -1;
        }
        String dataDir = ai.dataDir;
        this.jarDir = new File(String.valueOf(dataDir) + "/lib");
        this.cacheDir = new File(String.valueOf(dataDir) + "/kafcache");
        this.jarFile = new File(String.valueOf(dataDir) + "/lib/libkafdex.so");
        this.devInfoFile = new File(String.valueOf(dataDir) + "/kafcache/device_info.xml");
        this.kafConfFile = new File(String.valueOf(dataDir) + "/kafcache/kaf_conf.xml");
        File libKafFile = new File(String.valueOf(dataDir) + "/lib/libkaf.so");
        File libKafDexFile = new File(String.valueOf(dataDir) + "/lib/libkafdex.so");
        File libKafUcaFile = new File(String.valueOf(dataDir) + "/lib/libktuca-lite.so");
        File libKafMediaFile = new File(String.valueOf(dataDir) + "/lib/libmedia_jni_kaf.so");
        int initStatus = getInitializeStatus(context);
        String packageName = context.getPackageName();
        if (this.appContext.getPackageName().equals(SHOW_STORE_PACKAGE_NAME)) {
            if (isDifferenceVersion() && this.cacheDir.exists()) {
                deleteDir(this.cacheDir);
                ContentValues values = new ContentValues();
                values.put(CN_NAME, "kaf_init_status");
                values.put(CN_VALUE, (Integer) 0);
                context.getContentResolver().update(Uri.parse(String.valueOf(KAF_MANAGER_CONTENT_URI) + "/kaf_info"), values, "name=?", new String[]{"kaf_init_status"});
            }
            if (!libKafFile.exists() || !libKafDexFile.exists() || !libKafUcaFile.exists() || !libKafMediaFile.exists()) {
                return -6;
            }
            if (!this.cacheDir.exists() || !this.jarFile.exists() || !this.devInfoFile.exists() || !this.kafConfFile.exists()) {
                Intent intent2 = new Intent();
                intent2.setAction(ACTION_KAF_LIB_INSTALL);
                if (initStatus != 3) {
                    intent2.putExtra("initialize_command", "1");
                } else {
                    intent2.putExtra("initialize_command", "2");
                }
                intent2.putExtra("package_name", packageName);
                this.appContext.startService(intent2);
                return -5;
            }
        } else {
            if (initStatus == 9) {
                return -1;
            }
            if (initStatus != 3 || !this.cacheDir.exists() || !this.jarFile.exists()) {
                Intent intent3 = new Intent();
                intent3.setAction(ACTION_KAF_LIB_INSTALL);
                if (initStatus != 3) {
                    intent3.putExtra("initialize_command", "1");
                } else {
                    intent3.putExtra("initialize_command", "2");
                }
                intent3.putExtra("package_name", packageName);
                this.appContext.startService(intent3);
                return -5;
            }
        }
        if (kafManager == null || kafManager.iKafManager == null) {
            this.f9cl = new DexClassLoader(this.jarFile.getPath(), this.cacheDir.getPath(), null, kafManager.getClass().getClassLoader());
            Class clazz = this.f9cl.loadClass(KAFMANAGER_CLASS_NAME);
            Object o = clazz.newInstance();
            Method method = clazz.getMethod("getInstance", null);
            kafManager.iKafManager = (IKafManager) method.invoke(o, new Object[0]);
            Log.i("class loader *****", new StringBuilder().append(this.f9cl).toString());
        }
        this.isLibraryInit = true;
        return this.iKafManager.Initialize(context, copyright);
    }

    public void reinstallKTAppStore() {
        File apkFile = new File(this.appContext.getApplicationInfo().sourceDir);
        if (this.appContext.getPackageName().equals(SHOW_STORE_PACKAGE_NAME)) {
            if (apkFile.exists()) {
                Intent intent = new Intent("android.intent.action.VIEW");
                intent.setDataAndType(Uri.fromFile(apkFile), "application/vnd.android.package-archive");
                intent.addFlags(268435456);
                this.appContext.startActivity(intent);
                return;
            }
            Uri uri = Uri.parse(SHOW_STORE_DOWNLOAD_URL);
            Intent intent2 = new Intent("android.intent.action.VIEW", uri);
            intent2.addFlags(268435456);
            this.appContext.startActivity(intent2);
            return;
        }
        Log.e("KAF", "is not KTAppStore");
    }

    private boolean isDifferenceVersion() throws Throwable {
        Exception e;
        boolean z;
        InputStream assetsIn = null;
        InputStream cacheIn = null;
        try {
            try {
                assetsIn = this.appContext.getAssets().open("kaf_conf.xml");
                Document assetsDocument = createDocument(assetsIn);
                String assetsKafVersion = getKafVersion(assetsDocument.getDocumentElement());
                if (this.kafConfFile.exists()) {
                    InputStream cacheIn2 = new FileInputStream(this.kafConfFile);
                    try {
                        Document cacheDocument = createDocument(cacheIn2);
                        String cacheKafVersion = getKafVersion(cacheDocument.getDocumentElement());
                        if (cacheKafVersion.equals(assetsKafVersion)) {
                            if (assetsIn != null) {
                                try {
                                    assetsIn.close();
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }
                            }
                            if (cacheIn2 != null) {
                                cacheIn2.close();
                            }
                            cacheIn = cacheIn2;
                            z = false;
                        } else {
                            Log.d("KAF", "[KafManager.isDifferenceVersion] newKafVersion = " + assetsKafVersion);
                            Log.d("KAF", "[KafManager.isDifferenceVersion] preKafVersion = " + cacheKafVersion);
                            if (assetsIn != null) {
                                try {
                                    assetsIn.close();
                                } catch (Exception ex2) {
                                    ex2.printStackTrace();
                                }
                            }
                            if (cacheIn2 != null) {
                                cacheIn2.close();
                            }
                            z = true;
                            cacheIn = cacheIn2;
                        }
                    } catch (Exception e2) {
                        e = e2;
                        cacheIn = cacheIn2;
                        e.printStackTrace();
                        if (assetsIn != null) {
                            try {
                                assetsIn.close();
                            } catch (Exception ex3) {
                                ex3.printStackTrace();
                                z = false;
                                return z;
                            }
                        }
                        if (cacheIn != null) {
                            cacheIn.close();
                        }
                        z = false;
                    } catch (Throwable th) {
                        th = th;
                        cacheIn = cacheIn2;
                        if (assetsIn != null) {
                            try {
                                assetsIn.close();
                            } catch (Exception ex4) {
                                ex4.printStackTrace();
                                throw th;
                            }
                        }
                        if (cacheIn != null) {
                            cacheIn.close();
                        }
                        throw th;
                    }
                } else {
                    if (assetsIn != null) {
                        try {
                            assetsIn.close();
                        } catch (Exception ex5) {
                            ex5.printStackTrace();
                        }
                    }
                    if (0 != 0) {
                        cacheIn.close();
                    }
                    z = false;
                }
            } catch (Throwable th2) {
                th = th2;
            }
        } catch (Exception e3) {
            e = e3;
        }
        return z;
    }

    private String getKafVersion(Node root) {
        String result = "";
        try {
            NodeList childs = root.getChildNodes();
            for (int i = 0; i < childs.getLength(); i++) {
                if (childs.item(i).getNodeName().equals("kafVersion")) {
                    result = getTEXT(childs.item(i));
                }
            }
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    private String getTEXT(Node parent) throws NullPointerException {
        NodeList childs = parent.getChildNodes();
        for (int i = 0; i < childs.getLength(); i++) {
            if (childs.item(i).getNodeType() == 3) {
                return childs.item(i).getNodeValue();
            }
        }
        return "";
    }

    private Document createDocument(InputStream is) {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setCoalescing(true);
        factory.setIgnoringComments(true);
        try {
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document d = builder.parse(is);
            return d;
        } catch (Exception e) {
            Log.e("KAF", "[KafManager.createDocument] " + e.toString());
            return null;
        }
    }

    private void deleteDir(File file) {
        if (file.exists() && !file.isFile()) {
            File[] files = file.listFiles();
            for (int i = 0; i < files.length; i++) {
                if (files[i].isDirectory()) {
                    deleteDir(files[i]);
                } else {
                    Log.d("KAF", "[KafManager.deleteDir] " + files[i].getName() + " delete");
                    files[i].delete();
                }
            }
            file.delete();
        }
    }

    private int getInitializeStatus(Context context) {
        Cursor cursor = null;
        try {
            try {
                String whereClause = String.valueOf(CN_NAME) + "= 'kaf_init_status'";
                Uri uri = Uri.parse(String.valueOf(KAF_MANAGER_CONTENT_URI) + "/kaf_info");
                cursor = context.getContentResolver().query(uri, new String[]{CN_VALUE}, whereClause, null, null);
            } catch (Exception ex) {
                ex.printStackTrace();
                if (cursor != null) {
                    cursor.close();
                }
            }
            if (cursor == null) {
                if (cursor != null) {
                    cursor.close();
                }
                return 0;
            }
            cursor.moveToFirst();
            if (cursor.getCount() <= 0) {
                if (cursor != null) {
                    cursor.close();
                }
                return 0;
            }
            String status = cursor.getString(0);
            int i = Integer.parseInt(status);
            if (cursor != null) {
                cursor.close();
            }
            return i;
        } catch (Throwable th) {
            if (cursor != null) {
                cursor.close();
            }
            throw th;
        }
    }

    public String getAppId() {
        return this.iKafManager.getAppId();
    }

    @Deprecated
    public DexClassLoader getDexClassLoader() {
        return this.f9cl;
    }

    @Deprecated
    public boolean isKafLibraryInit() {
        return this.isLibraryInit;
    }

    @Deprecated
    public IDeviceControl getDeviceControl() throws IllegalAccessException, InstantiationException {
        return this.iKafManager.getDeviceControl();
    }

    @Deprecated
    public IDisplayManager getDisplayManager() throws IllegalAccessException, InstantiationException {
        return this.iKafManager.getDisplayManager();
    }

    @Deprecated
    public IProperty getProperty() throws IllegalAccessException, InstantiationException {
        return this.iKafManager.getProperty();
    }

    @Deprecated
    public IMediaManager getMediaManager() throws IllegalAccessException, InstantiationException {
        return this.iKafManager.getMediaManager();
    }

    @Deprecated
    public ISound getSound() throws IllegalAccessException, InstantiationException {
        return this.iKafManager.getSound();
    }

    public Network getNetwork() {
        return new Network();
    }

    @Deprecated
    public INetwork getNetworkInstance() {
        return this.iKafManager.getNetworkInstance();
    }

    @Deprecated
    public IBcmSocket getBcmSocket() {
        return this.iKafManager.getBcmSocket();
    }

    @Deprecated
    public IBcmSocket getBcmSocket(InetAddress dstAddress, int dstPort, InetAddress localAddress, int localPort, String appid, String billKind, char connectKind, boolean isTestMode) throws IOException, SecurityException, IllegalArgumentException {
        return this.iKafManager.getBcmSocket(dstAddress, dstPort, localAddress, localPort, appid, billKind, connectKind, isTestMode);
    }

    @Deprecated
    public IDebug getDebug() {
        return this.iKafManager.getDebug();
    }
}
