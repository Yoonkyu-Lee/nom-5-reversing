.class public Lcom/gamevil/nexus2/NexusGLActivity;
.super Landroid/app/Activity;
.source "NexusGLActivity.java"


# static fields
.field private static final PREFS_NAME:Ljava/lang/String; = "MyDeviceId"

.field public static armPassed:Z

.field public static beforePage:Ljava/lang/String;

.field public static displayHeight:I

.field public static displayWidth:I

.field public static gameScreenHeight:I

.field public static gameScreenWidth:I

.field public static isShownAlert:Z

.field public static m_timeout:I

.field public static m_timerIndex:I

.field public static myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

.field public static task:Lcom/gamevil/nexus2/NativesAsyncTask;

.field public static tracker:Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

.field public static uiViewControll:Lcom/gamevil/nexus2/ui/NeoUIControllerView;


# instance fields
.field public glSurfaceview:Lcom/gamevil/nexus2/NexusGLSurfaceView;

.field private handler:Landroid/os/Handler;

.field public imgDefault:Landroid/widget/ImageView;

.field public imgTitle:Landroid/widget/ImageView;

.field public isNoDeviceID:Z

.field private loadingBar:Landroid/widget/ProgressBar;

.field public mockDeviceID:Ljava/lang/String;

.field public packageInfo:Ljava/lang/String;

.field random:Ljava/util/Random;

.field public txtVersion:Landroid/widget/TextView;

.field public version:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 70
    const/16 v0, 0x190

    sput v0, Lcom/gamevil/nexus2/NexusGLActivity;->gameScreenWidth:I

    .line 71
    const/16 v0, 0xf0

    sput v0, Lcom/gamevil/nexus2/NexusGLActivity;->gameScreenHeight:I

    .line 413
    const-string v0, "gameDSO"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 60
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 60
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 78
    const-string v0, "1.0.0"

    iput-object v0, p0, Lcom/gamevil/nexus2/NexusGLActivity;->version:Ljava/lang/String;

    .line 79
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/gamevil/nexus2/NexusGLActivity;->isNoDeviceID:Z

    .line 323
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/gamevil/nexus2/NexusGLActivity;->handler:Landroid/os/Handler;

    .line 60
    return-void
.end method

.method public static AnalyticsInitialize(Ljava/lang/String;Landroid/content/Context;)V
    .locals 3
    .param p0, "_uaID"    # Ljava/lang/String;
    .param p1, "_context"    # Landroid/content/Context;

    .prologue
    .line 100
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "*************************************************** "

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 101
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "**\t\t\t"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 102
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "**\t\t\tAnalyticsInitialize "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 103
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "**\t\t\t"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 104
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "*************************************************** "

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 105
    const/4 v0, 0x0

    sput-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->tracker:Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    .line 107
    if-nez p0, :cond_0

    .line 112
    :goto_0
    return-void

    .line 110
    :cond_0
    invoke-static {}, Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;->getInstance()Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    move-result-object v0

    sput-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->tracker:Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    .line 111
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->tracker:Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    invoke-virtual {v0, p0, p1}, Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;->start(Ljava/lang/String;Landroid/content/Context;)V

    goto :goto_0
.end method

.method public static AnalyticsTrackEvent(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p0, "_action"    # Ljava/lang/String;
    .param p1, "_lable"    # Ljava/lang/String;

    .prologue
    .line 133
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "*************************************************** "

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 134
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "**\t\t\t"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 135
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "**\t\t\tAnalyticsTrackEvent "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 136
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "**\t\t\t"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 137
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "*************************************************** "

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 139
    if-eqz p1, :cond_0

    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->tracker:Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    if-nez v0, :cond_1

    .line 146
    :cond_0
    :goto_0
    return-void

    .line 141
    :cond_1
    if-nez p0, :cond_2

    .line 142
    const-string p0, "Action"

    .line 144
    :cond_2
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->tracker:Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    const-string v1, "Event"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, p0, p1, v2}, Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;->trackEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 145
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->tracker:Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    invoke-virtual {v0}, Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;->dispatch()Z

    goto :goto_0
.end method

.method public static AnalyticsTrackPageView(Ljava/lang/String;)V
    .locals 3
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 116
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "*************************************************** "

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 117
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "**\t\t\t"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 118
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "**\t\t\tAnalyticsTrackPageView "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 119
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "**\t\t\t"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 120
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "*************************************************** "

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 122
    if-eqz p0, :cond_0

    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->tracker:Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    if-nez v0, :cond_1

    .line 128
    :cond_0
    :goto_0
    return-void

    .line 125
    :cond_1
    sput-object p0, Lcom/gamevil/nexus2/NexusGLActivity;->beforePage:Ljava/lang/String;

    .line 126
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->tracker:Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    invoke-virtual {v0, p0}, Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;->trackPageView(Ljava/lang/String;)V

    .line 127
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->tracker:Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    invoke-virtual {v0}, Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;->dispatch()Z

    goto :goto_0
.end method

.method public static AnalyticsTrackStop()V
    .locals 1

    .prologue
    .line 150
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->tracker:Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    if-eqz v0, :cond_0

    .line 152
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->tracker:Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    invoke-virtual {v0}, Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;->stop()V

    .line 153
    const/4 v0, 0x0

    sput-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->tracker:Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    .line 155
    :cond_0
    return-void
.end method

.method private checkDeviceID()V
    .locals 8

    .prologue
    .line 190
    const-string v6, "phone"

    invoke-virtual {p0, v6}, Lcom/gamevil/nexus2/NexusGLActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/telephony/TelephonyManager;

    invoke-virtual {v6}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v0

    .line 191
    .local v0, "deviceID":Ljava/lang/String;
    if-nez v0, :cond_1

    .line 197
    const-string v6, "MyDeviceId"

    const/4 v7, 0x0

    invoke-virtual {p0, v6, v7}, Lcom/gamevil/nexus2/NexusGLActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 198
    .local v3, "settings":Landroid/content/SharedPreferences;
    const-string v6, "myDeviceID"

    const-string v7, "NONE"

    invoke-interface {v3, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/gamevil/nexus2/NexusGLActivity;->mockDeviceID:Ljava/lang/String;

    .line 199
    iget-object v6, p0, Lcom/gamevil/nexus2/NexusGLActivity;->mockDeviceID:Ljava/lang/String;

    const-string v7, "NONE"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 202
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 203
    .local v4, "time":J
    const/16 v6, 0x64

    invoke-virtual {p0, v6}, Lcom/gamevil/nexus2/NexusGLActivity;->random(I)I

    move-result v2

    .line 204
    .local v2, "randomID":I
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "id"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "r"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/gamevil/nexus2/NexusGLActivity;->mockDeviceID:Ljava/lang/String;

    .line 208
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 209
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v6, "myDeviceID"

    iget-object v7, p0, Lcom/gamevil/nexus2/NexusGLActivity;->mockDeviceID:Ljava/lang/String;

    invoke-interface {v1, v6, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 210
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 217
    .end local v1    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v2    # "randomID":I
    .end local v4    # "time":J
    :cond_0
    const/4 v6, 0x1

    iput-boolean v6, p0, Lcom/gamevil/nexus2/NexusGLActivity;->isNoDeviceID:Z

    .line 222
    .end local v3    # "settings":Landroid/content/SharedPreferences;
    :cond_1
    return-void
.end method


# virtual methods
.method public OnAsyncTimerSet(II)V
    .locals 2
    .param p1, "timeOut"    # I
    .param p2, "timerIndex"    # I

    .prologue
    .line 333
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->task:Lcom/gamevil/nexus2/NativesAsyncTask;

    if-eqz v0, :cond_0

    .line 335
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->task:Lcom/gamevil/nexus2/NativesAsyncTask;

    iget v0, v0, Lcom/gamevil/nexus2/NativesAsyncTask;->m_nTimerIndex:I

    if-ne v0, p2, :cond_0

    .line 336
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->task:Lcom/gamevil/nexus2/NativesAsyncTask;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/gamevil/nexus2/NativesAsyncTask;->cancel(Z)Z

    .line 339
    :cond_0
    sput p1, Lcom/gamevil/nexus2/NexusGLActivity;->m_timeout:I

    .line 340
    sput p2, Lcom/gamevil/nexus2/NexusGLActivity;->m_timerIndex:I

    .line 341
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLActivity;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/gamevil/nexus2/NexusGLActivity$1;

    invoke-direct {v1, p0}, Lcom/gamevil/nexus2/NexusGLActivity$1;-><init>(Lcom/gamevil/nexus2/NexusGLActivity;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 349
    return-void
.end method

.method public finishApp()V
    .locals 0

    .prologue
    .line 355
    invoke-virtual {p0}, Lcom/gamevil/nexus2/NexusGLActivity;->finish()V

    .line 357
    return-void
.end method

.method public hideLoadingDialog()V
    .locals 2

    .prologue
    .line 374
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLActivity;->loadingBar:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_0

    .line 376
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLActivity;->loadingBar:Landroid/widget/ProgressBar;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 378
    :cond_0
    return-void
.end method

.method public hideTitleComponent()V
    .locals 2

    .prologue
    const/4 v1, 0x4

    .line 400
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLActivity;->imgTitle:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    .line 402
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLActivity;->imgTitle:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 405
    :cond_0
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLActivity;->txtVersion:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    .line 407
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLActivity;->txtVersion:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 409
    :cond_1
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 227
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 228
    sput-object p0, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    .line 231
    invoke-direct {p0}, Lcom/gamevil/nexus2/NexusGLActivity;->checkDeviceID()V

    .line 235
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 236
    .local v0, "metrics":Landroid/util/DisplayMetrics;
    invoke-virtual {p0}, Lcom/gamevil/nexus2/NexusGLActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 237
    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    sput v1, Lcom/gamevil/nexus2/NexusGLActivity;->gameScreenWidth:I

    .line 238
    iget v1, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    sput v1, Lcom/gamevil/nexus2/NexusGLActivity;->gameScreenHeight:I

    .line 240
    return-void
.end method

.method protected onDestroy()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 279
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 280
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "----------------------------------------------------"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 281
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "|\t\tActivity onDestroy "

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 282
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "----------------------------------------------------"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 284
    invoke-static {}, Lcom/gamevil/nexus2/ui/NexusSound;->stopAllSound()V

    .line 285
    invoke-static {}, Lcom/gamevil/nexus2/ui/NexusSound;->releaseAll()V

    .line 287
    invoke-static {}, Lcom/gamevil/nexus2/Natives;->NativeDestroyClet()V

    .line 289
    iget-object v1, p0, Lcom/gamevil/nexus2/NexusGLActivity;->glSurfaceview:Lcom/gamevil/nexus2/NexusGLSurfaceView;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/gamevil/nexus2/NexusGLActivity;->glSurfaceview:Lcom/gamevil/nexus2/NexusGLSurfaceView;

    invoke-virtual {v1}, Lcom/gamevil/nexus2/NexusGLSurfaceView;->onDetachedFromWindow()V

    .line 291
    :cond_0
    sget-object v1, Lcom/gamevil/nexus2/NexusGLActivity;->uiViewControll:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    if-eqz v1, :cond_1

    .line 293
    sget-object v1, Lcom/gamevil/nexus2/NexusGLActivity;->uiViewControll:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    invoke-virtual {v1}, Lcom/gamevil/nexus2/ui/NeoUIControllerView;->releaseAll()V

    .line 294
    sput-object v3, Lcom/gamevil/nexus2/NexusGLActivity;->uiViewControll:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    .line 297
    :cond_1
    iget-object v1, p0, Lcom/gamevil/nexus2/NexusGLActivity;->glSurfaceview:Lcom/gamevil/nexus2/NexusGLSurfaceView;

    if-eqz v1, :cond_2

    .line 299
    iget-object v1, p0, Lcom/gamevil/nexus2/NexusGLActivity;->glSurfaceview:Lcom/gamevil/nexus2/NexusGLSurfaceView;

    invoke-virtual {v1}, Lcom/gamevil/nexus2/NexusGLSurfaceView;->releaseAll()V

    .line 300
    iput-object v3, p0, Lcom/gamevil/nexus2/NexusGLActivity;->glSurfaceview:Lcom/gamevil/nexus2/NexusGLSurfaceView;

    .line 302
    :cond_2
    sput-object v3, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    .line 303
    iput-object v3, p0, Lcom/gamevil/nexus2/NexusGLActivity;->version:Ljava/lang/String;

    .line 312
    const-string v1, "activity"

    invoke-virtual {p0, v1}, Lcom/gamevil/nexus2/NexusGLActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 313
    .local v0, "am":Landroid/app/ActivityManager;
    invoke-virtual {p0}, Lcom/gamevil/nexus2/NexusGLActivity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ActivityManager;->restartPackage(Ljava/lang/String;)V

    .line 315
    return-void
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 250
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 254
    invoke-static {}, Lcom/gamevil/nexus2/ui/NexusSound;->stopAllSound()V

    .line 255
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLActivity;->glSurfaceview:Lcom/gamevil/nexus2/NexusGLSurfaceView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLActivity;->glSurfaceview:Lcom/gamevil/nexus2/NexusGLSurfaceView;

    invoke-virtual {v0}, Lcom/gamevil/nexus2/NexusGLSurfaceView;->onPause()V

    .line 256
    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 1

    .prologue
    .line 265
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 269
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLActivity;->glSurfaceview:Lcom/gamevil/nexus2/NexusGLSurfaceView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLActivity;->glSurfaceview:Lcom/gamevil/nexus2/NexusGLSurfaceView;

    invoke-virtual {v0}, Lcom/gamevil/nexus2/NexusGLSurfaceView;->onResume()V

    .line 270
    :cond_0
    invoke-static {}, Lcom/gamevil/nexus2/Natives;->InitializeJNIGlobalRef()V

    .line 271
    return-void
.end method

.method random(I)I
    .locals 1
    .param p1, "max"    # I

    .prologue
    .line 182
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLActivity;->random:Ljava/util/Random;

    if-nez v0, :cond_0

    .line 183
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    iput-object v0, p0, Lcom/gamevil/nexus2/NexusGLActivity;->random:Ljava/util/Random;

    .line 184
    :cond_0
    if-nez p1, :cond_1

    const/4 p1, 0x1

    .line 185
    :cond_1
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLActivity;->random:Ljava/util/Random;

    invoke-virtual {v0}, Ljava/util/Random;->nextInt()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    rem-int/2addr v0, p1

    return v0
.end method

.method public setImgDefault(Landroid/widget/ImageView;)V
    .locals 0
    .param p1, "imgDefault"    # Landroid/widget/ImageView;

    .prologue
    .line 172
    iput-object p1, p0, Lcom/gamevil/nexus2/NexusGLActivity;->imgDefault:Landroid/widget/ImageView;

    .line 173
    return-void
.end method

.method public setImgTitle(Landroid/widget/ImageView;)V
    .locals 0
    .param p1, "imgTitle"    # Landroid/widget/ImageView;

    .prologue
    .line 168
    iput-object p1, p0, Lcom/gamevil/nexus2/NexusGLActivity;->imgTitle:Landroid/widget/ImageView;

    .line 169
    return-void
.end method

.method public setLoagdingProgressBar(Landroid/widget/ProgressBar;)V
    .locals 0
    .param p1, "_loadingBar"    # Landroid/widget/ProgressBar;

    .prologue
    .line 362
    return-void
.end method

.method public setNexusGLSurfaceView(Lcom/gamevil/nexus2/NexusGLSurfaceView;)V
    .locals 0
    .param p1, "_surfaceView"    # Lcom/gamevil/nexus2/NexusGLSurfaceView;

    .prologue
    .line 177
    iput-object p1, p0, Lcom/gamevil/nexus2/NexusGLActivity;->glSurfaceview:Lcom/gamevil/nexus2/NexusGLSurfaceView;

    .line 178
    return-void
.end method

.method public setVerionView(Landroid/widget/TextView;)V
    .locals 0
    .param p1, "_txtVersionView"    # Landroid/widget/TextView;

    .prologue
    .line 165
    iput-object p1, p0, Lcom/gamevil/nexus2/NexusGLActivity;->txtVersion:Landroid/widget/TextView;

    .line 166
    return-void
.end method

.method public setVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "version"    # Ljava/lang/String;

    .prologue
    .line 160
    iput-object p1, p0, Lcom/gamevil/nexus2/NexusGLActivity;->version:Ljava/lang/String;

    .line 161
    return-void
.end method

.method public showLoadingDialog()V
    .locals 2

    .prologue
    .line 366
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLActivity;->loadingBar:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_0

    .line 368
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLActivity;->loadingBar:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 370
    :cond_0
    return-void
.end method

.method public showTitleComponent()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 382
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLActivity;->imgTitle:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    .line 384
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLActivity;->imgTitle:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 387
    :cond_0
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLActivity;->txtVersion:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    .line 389
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLActivity;->txtVersion:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 392
    :cond_1
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLActivity;->imgDefault:Landroid/widget/ImageView;

    if-eqz v0, :cond_2

    .line 394
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLActivity;->imgDefault:Landroid/widget/ImageView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 396
    :cond_2
    return-void
.end method
