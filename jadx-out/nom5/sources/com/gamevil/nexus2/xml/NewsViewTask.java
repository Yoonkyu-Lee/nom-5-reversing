package com.gamevil.nexus2.xml;

import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.os.Handler;
import android.util.Log;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import com.gamevil.nexus2.Natives;
import com.gamevil.nexus2.NexusGLActivity;
import com.gamevil.nom5.lgu.C0046R;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

/* JADX INFO: loaded from: classes.dex */
public class NewsViewTask extends AsyncTask<String, String, String> {
    private static final String BANNER_URL = "bannerUrl";
    private static final String IS_NEW_STR = "isNew";
    private static final String LAST_CHECK_STR = "lastCheck";
    private static final String LAST_TIME_STR = "lastTime";
    private static final String NEWS_DATA_STR = "NewsData";
    private static final String NEWS_IMG = "newsImage";
    private static final long ONE_DAY = 86400000;

    /* JADX INFO: renamed from: f */
    private static FrameLayout f6f;
    private static View.OnClickListener imageListener = new View.OnClickListener() { // from class: com.gamevil.nexus2.xml.NewsViewTask.1
        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            Natives.openUrl(NewsViewTask.marketSubfix);
        }
    };
    private static Bitmap imgDrawable;
    private static boolean isNewNews;
    private static boolean isNewsViewReady;
    private static Handler mHandler;
    private static String marketSubfix;

    /* JADX INFO: renamed from: pl */
    private static FrameLayout.LayoutParams f7pl;
    HttpURLConnection http;
    private View.OnClickListener newsListener = new View.OnClickListener() { // from class: com.gamevil.nexus2.xml.NewsViewTask.2
        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            if (NewsViewTask.f7pl.topMargin != 0) {
                NewsViewTask.this.showNewsBanner();
            } else {
                NewsViewTask.this.hideNewsBanner();
            }
        }
    };
    private View.OnClickListener cancleListener = new View.OnClickListener() { // from class: com.gamevil.nexus2.xml.NewsViewTask.3
        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            NewsViewTask.this.hideNewsBanner();
        }
    };

    public NewsViewTask() {
        mHandler = null;
        mHandler = new Handler();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public String doInBackground(String... params) {
        try {
            Log.i("#Java#", "URL = " + params[0]);
            URL text = new URL(params[0]);
            this.http = (HttpURLConnection) text.openConnection();
            Log.i("#Java#", "length = " + this.http.getContentLength());
            Log.i("#Java#", "respCode = " + this.http.getResponseCode());
            Log.i("#Java#", "contentType = " + this.http.getContentType());
            Log.i("#Java#", "LastModified = " + this.http.getLastModified());
            Log.i("#Java#", "String = " + this.http.getResponseMessage());
            SharedPreferences settings = NexusGLActivity.myActivity.getSharedPreferences(NEWS_DATA_STR, 0);
            isNewNews = settings.getBoolean(IS_NEW_STR, false);
            long savedModify = settings.getLong(LAST_TIME_STR, 0L);
            long savedTime = settings.getLong(LAST_CHECK_STR, 0L);
            long lastModified = this.http.getLastModified();
            String _bannerUrl = settings.getString(BANNER_URL, null);
            long currentTime = System.currentTimeMillis();
            long oneDay = currentTime - savedTime;
            boolean needToCheck = oneDay > ONE_DAY;
            if (_bannerUrl == null || !_bannerUrl.equals(params[0]) || savedModify != lastModified) {
                isNewNews = true;
            }
            if (!isPngExist(NEWS_IMG)) {
                needToCheck = true;
            }
            if (needToCheck || isNewNews) {
                imgDrawable = getNewsImage(params[0]);
                if (imgDrawable != null && savePngFileToSdCard(imgDrawable, NEWS_IMG) == 0) {
                    SharedPreferences.Editor editor = settings.edit();
                    editor.putBoolean(IS_NEW_STR, isNewNews);
                    editor.putLong(LAST_TIME_STR, lastModified);
                    editor.putLong(LAST_CHECK_STR, currentTime);
                    editor.putString(BANNER_URL, params[0]);
                    editor.commit();
                }
            } else {
                imgDrawable = loadPngFileFromSdCard(NEWS_IMG);
            }
            isNewsViewReady = imgDrawable != null;
            marketSubfix = params[1];
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            isNewsViewReady = false;
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public void onPostExecute(String result) {
        Log.i("#Java#", "onPostExecute");
        if (mHandler != null && isNewsViewReady) {
            mHandler.post(new Runnable() { // from class: com.gamevil.nexus2.xml.NewsViewTask.4
                @Override // java.lang.Runnable
                public void run() {
                    NewsViewTask.f6f = (FrameLayout) NexusGLActivity.myActivity.findViewById(C0046R.id.FrameNews);
                    NewsViewTask.f6f.setBackgroundColor(0);
                    ImageButton image = (ImageButton) NexusGLActivity.myActivity.findViewById(C0046R.id.button_go);
                    image.setBackgroundColor(0);
                    ImageButton news = (ImageButton) NexusGLActivity.myActivity.findViewById(C0046R.id.button_news);
                    news.setBackgroundColor(0);
                    Button cancle = (Button) NexusGLActivity.myActivity.findViewById(C0046R.id.button_cancle);
                    cancle.setBackgroundColor(0);
                    image.setOnClickListener(NewsViewTask.imageListener);
                    news.setOnClickListener(NewsViewTask.this.newsListener);
                    cancle.setOnClickListener(NewsViewTask.this.cancleListener);
                    image.setImageBitmap(NewsViewTask.imgDrawable);
                    if (NewsViewTask.isNewNews) {
                        NewsViewTask.f7pl = (FrameLayout.LayoutParams) NewsViewTask.f6f.getLayoutParams();
                        NewsViewTask.f7pl.topMargin = 0;
                        NewsViewTask.f6f.setLayoutParams(NewsViewTask.f7pl);
                    } else {
                        NewsViewTask.f7pl = (FrameLayout.LayoutParams) NewsViewTask.f6f.getLayoutParams();
                        NewsViewTask.f7pl.topMargin = -110;
                        NewsViewTask.f6f.setLayoutParams(NewsViewTask.f7pl);
                    }
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showNewsBanner() {
        if (f6f != null) {
            Log.i("#Java#", " === showNewsBanner");
            f7pl = (FrameLayout.LayoutParams) f6f.getLayoutParams();
            f7pl.topMargin = 0;
            f6f.setLayoutParams(f7pl);
            Animation shake = AnimationUtils.loadAnimation(NexusGLActivity.myActivity, C0046R.anim.slide_down);
            f6f.startAnimation(shake);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void hideNewsBanner() {
        if (f6f != null) {
            Log.i("#Java#", " === hideNewsBanner");
            f7pl = (FrameLayout.LayoutParams) f6f.getLayoutParams();
            f7pl.topMargin = -110;
            f6f.setLayoutParams(f7pl);
            Animation shake = AnimationUtils.loadAnimation(NexusGLActivity.myActivity, C0046R.anim.slide_up);
            f6f.startAnimation(shake);
            isNewNews = false;
            SharedPreferences settings = NexusGLActivity.myActivity.getSharedPreferences(NEWS_DATA_STR, 0);
            SharedPreferences.Editor editor = settings.edit();
            editor.putBoolean(IS_NEW_STR, isNewNews);
            editor.commit();
        }
    }

    private static Bitmap getNewsImage(String url) {
        try {
            InputStream in = new URL(url).openStream();
            Bitmap img = BitmapFactory.decodeStream(in);
            return img;
        } catch (MalformedURLException e) {
            return null;
        } catch (IOException e2) {
            return null;
        }
    }

    public static void showNewsView() {
        if (isNewsViewReady && mHandler != null) {
            mHandler.post(new Runnable() { // from class: com.gamevil.nexus2.xml.NewsViewTask.5
                @Override // java.lang.Runnable
                public void run() {
                    if (NewsViewTask.f6f != null) {
                        NewsViewTask.f6f.setVisibility(0);
                    }
                }
            });
        }
    }

    public static void hideNewsView() {
        if (mHandler != null) {
            mHandler.post(new Runnable() { // from class: com.gamevil.nexus2.xml.NewsViewTask.6
                @Override // java.lang.Runnable
                public void run() {
                    if (NewsViewTask.f6f != null) {
                        NewsViewTask.f6f.setVisibility(4);
                    }
                }
            });
        }
    }

    public static void releaseAll() {
        f7pl = null;
        f6f = null;
        imgDrawable = null;
    }

    private static boolean isPngExist(String name) {
        File path = NexusGLActivity.myActivity.getFilesDir();
        if (path == null) {
            return false;
        }
        File file = new File(path, name);
        return file.exists();
    }

    private static int savePngFileToSdCard(Bitmap imageData, String name) {
        IOException e;
        FileNotFoundException e2;
        FileOutputStream fos;
        BufferedOutputStream bos;
        try {
            fos = NexusGLActivity.myActivity.openFileOutput(name, 0);
            bos = new BufferedOutputStream(fos);
        } catch (FileNotFoundException e3) {
            e2 = e3;
        } catch (IOException e4) {
            e = e4;
        }
        try {
            imageData.compress(Bitmap.CompressFormat.PNG, 90, bos);
            bos.flush();
            bos.close();
            fos.close();
            return 0;
        } catch (FileNotFoundException e5) {
            e2 = e5;
            e2.printStackTrace();
            return -99;
        } catch (IOException e6) {
            e = e6;
            e.printStackTrace();
            return -99;
        }
    }

    private static Bitmap loadPngFileFromSdCard(String name) {
        Log.i("#Java#", "####loadPngFileFromSdCard####");
        File path = NexusGLActivity.myActivity.getFilesDir();
        if (path == null) {
            return null;
        }
        File file = new File(path, name);
        if (!file.exists()) {
            return null;
        }
        Log.i("#Java#", "####loadPngFileFromSdCard####" + file.getPath());
        Bitmap myBitmap = BitmapFactory.decodeFile(file.getPath());
        return myBitmap;
    }
}
