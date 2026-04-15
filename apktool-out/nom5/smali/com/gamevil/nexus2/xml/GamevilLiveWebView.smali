.class public Lcom/gamevil/nexus2/xml/GamevilLiveWebView;
.super Landroid/webkit/WebView;
.source "GamevilLiveWebView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gamevil/nexus2/xml/GamevilLiveWebView$HelloWebViewClient;
    }
.end annotation


# static fields
.field private static final LIVE_DATE:Ljava/lang/String; = "gamevilLiveData"

.field private static final LIVE_UPDATE_TIME:Ljava/lang/String; = "updateTime"

.field private static isNewEvent:Z

.field private static mHandler:Landroid/os/Handler;


# instance fields
.field private final GAME_ID:I

.field private backListener:Landroid/view/View$OnClickListener;

.field private closeListener:Landroid/view/View$OnClickListener;

.field private liveButtonListener:Landroid/view/View$OnClickListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 66
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    sput-object v0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->mHandler:Landroid/os/Handler;

    .line 60
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 118
    invoke-direct {p0, p1, p2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 65
    const/16 v0, 0xb

    iput v0, p0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->GAME_ID:I

    .line 231
    new-instance v0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$1;

    invoke-direct {v0, p0}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$1;-><init>(Lcom/gamevil/nexus2/xml/GamevilLiveWebView;)V

    iput-object v0, p0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->backListener:Landroid/view/View$OnClickListener;

    .line 240
    new-instance v0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$2;

    invoke-direct {v0, p0}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$2;-><init>(Lcom/gamevil/nexus2/xml/GamevilLiveWebView;)V

    iput-object v0, p0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->closeListener:Landroid/view/View$OnClickListener;

    .line 255
    new-instance v0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$3;

    invoke-direct {v0, p0}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$3;-><init>(Lcom/gamevil/nexus2/xml/GamevilLiveWebView;)V

    iput-object v0, p0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->liveButtonListener:Landroid/view/View$OnClickListener;

    .line 121
    return-void
.end method

.method static synthetic access$0()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 66
    sget-object v0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1(Z)V
    .locals 0

    .prologue
    .line 68
    sput-boolean p0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->isNewEvent:Z

    return-void
.end method

.method static synthetic access$2()V
    .locals 0

    .prologue
    .line 332
    invoke-static {}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->stopButtonAnimation()V

    return-void
.end method

.method static synthetic access$3(Lcom/gamevil/nexus2/xml/GamevilLiveWebView;)Landroid/view/View$OnClickListener;
    .locals 1

    .prologue
    .line 231
    iget-object v0, p0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->backListener:Landroid/view/View$OnClickListener;

    return-object v0
.end method

.method static synthetic access$4(Lcom/gamevil/nexus2/xml/GamevilLiveWebView;)Landroid/view/View$OnClickListener;
    .locals 1

    .prologue
    .line 240
    iget-object v0, p0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->closeListener:Landroid/view/View$OnClickListener;

    return-object v0
.end method

.method public static hideLiveButton()V
    .locals 0

    .prologue
    .line 318
    return-void
.end method

.method public static showLiveButton()V
    .locals 0

    .prologue
    .line 307
    return-void
.end method

.method private static startButtonAnimation()V
    .locals 0

    .prologue
    .line 330
    return-void
.end method

.method private static stopButtonAnimation()V
    .locals 0

    .prologue
    .line 339
    return-void
.end method


# virtual methods
.method public checkNewEvent()V
    .locals 12

    .prologue
    .line 150
    :try_start_0
    new-instance v7, Ljava/net/URL;

    const-string v9, "http://android.gamevil.com/LiveCheck.php?game_id=11"

    invoke-direct {v7, v9}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 151
    .local v7, "text":Ljava/net/URL;
    invoke-virtual {v7}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v3

    .line 152
    .local v3, "isText":Ljava/io/InputStream;
    const/16 v9, 0x80

    new-array v0, v9, [B

    .line 153
    .local v0, "bText":[B
    invoke-virtual {v3, v0}, Ljava/io/InputStream;->read([B)I

    move-result v4

    .line 154
    .local v4, "readSize":I
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v0}, Ljava/lang/String;-><init>([B)V

    .line 155
    .local v5, "response":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 158
    sget-object v9, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    const-string v10, "gamevilLiveData"

    const/4 v11, 0x0

    invoke-virtual {v9, v10, v11}, Lcom/gamevil/nexus2/NexusGLActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 159
    .local v6, "settings":Landroid/content/SharedPreferences;
    const-string v9, "updateTime"

    const/4 v10, 0x0

    invoke-interface {v6, v9, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 161
    .local v8, "time":Ljava/lang/String;
    if-eqz v8, :cond_0

    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 163
    :cond_0
    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 164
    .local v2, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v9, "updateTime"

    invoke-interface {v2, v9, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 165
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 166
    const/4 v9, 0x1

    sput-boolean v9, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->isNewEvent:Z

    .line 174
    .end local v2    # "editor":Landroid/content/SharedPreferences$Editor;
    :goto_0
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 182
    .end local v0    # "bText":[B
    .end local v3    # "isText":Ljava/io/InputStream;
    .end local v4    # "readSize":I
    .end local v5    # "response":Ljava/lang/String;
    .end local v6    # "settings":Landroid/content/SharedPreferences;
    .end local v7    # "text":Ljava/net/URL;
    .end local v8    # "time":Ljava/lang/String;
    :goto_1
    return-void

    .line 170
    .restart local v0    # "bText":[B
    .restart local v3    # "isText":Ljava/io/InputStream;
    .restart local v4    # "readSize":I
    .restart local v5    # "response":Ljava/lang/String;
    .restart local v6    # "settings":Landroid/content/SharedPreferences;
    .restart local v7    # "text":Ljava/net/URL;
    .restart local v8    # "time":Ljava/lang/String;
    :cond_1
    const/4 v9, 0x0

    sput-boolean v9, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->isNewEvent:Z
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 175
    .end local v0    # "bText":[B
    .end local v3    # "isText":Ljava/io/InputStream;
    .end local v4    # "readSize":I
    .end local v5    # "response":Ljava/lang/String;
    .end local v6    # "settings":Landroid/content/SharedPreferences;
    .end local v7    # "text":Ljava/net/URL;
    .end local v8    # "time":Ljava/lang/String;
    :catch_0
    move-exception v9

    move-object v1, v9

    .line 177
    .local v1, "e":Ljava/net/MalformedURLException;
    invoke-virtual {v1}, Ljava/net/MalformedURLException;->printStackTrace()V

    goto :goto_1

    .line 178
    .end local v1    # "e":Ljava/net/MalformedURLException;
    :catch_1
    move-exception v9

    move-object v1, v9

    .line 180
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method

.method public hidePrograssBar()V
    .locals 2

    .prologue
    .line 287
    sget-object v0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$6;

    invoke-direct {v1, p0}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$6;-><init>(Lcom/gamevil/nexus2/xml/GamevilLiveWebView;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 294
    return-void
.end method

.method public initialize()V
    .locals 2

    .prologue
    .line 125
    new-instance v0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$HelloWebViewClient;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$HelloWebViewClient;-><init>(Lcom/gamevil/nexus2/xml/GamevilLiveWebView;Lcom/gamevil/nexus2/xml/GamevilLiveWebView$HelloWebViewClient;)V

    invoke-virtual {p0, v0}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 127
    sget-object v0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$4;

    invoke-direct {v1, p0}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$4;-><init>(Lcom/gamevil/nexus2/xml/GamevilLiveWebView;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 143
    return-void
.end method

.method public loadLivePage()V
    .locals 8

    .prologue
    .line 188
    invoke-static {}, Lcom/gamevil/nexus2/Natives;->isNetAvailable()I

    move-result v6

    const/4 v7, 0x1

    if-eq v6, v7, :cond_0

    .line 190
    invoke-virtual {p0}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->loadLocalErrorPage()V

    .line 218
    :goto_0
    return-void

    .line 198
    :cond_0
    :try_start_0
    new-instance v5, Ljava/net/URL;

    const-string v6, "http://android.gamevil.com/LiveLog.php?game_id=11"

    invoke-direct {v5, v6}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 199
    .local v5, "text":Ljava/net/URL;
    invoke-virtual {v5}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v2

    .line 200
    .local v2, "isText":Ljava/io/InputStream;
    const/16 v6, 0x80

    new-array v0, v6, [B

    .line 201
    .local v0, "bText":[B
    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .line 202
    .local v3, "readSize":I
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v0}, Ljava/lang/String;-><init>([B)V

    .line 204
    .local v4, "response":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->loadUrl(Ljava/lang/String;)V

    .line 205
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 206
    .end local v0    # "bText":[B
    .end local v2    # "isText":Ljava/io/InputStream;
    .end local v3    # "readSize":I
    .end local v4    # "response":Ljava/lang/String;
    .end local v5    # "text":Ljava/net/URL;
    :catch_0
    move-exception v6

    move-object v1, v6

    .line 208
    .local v1, "e":Ljava/net/MalformedURLException;
    invoke-virtual {p0}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->loadLocalErrorPage()V

    .line 209
    invoke-virtual {v1}, Ljava/net/MalformedURLException;->printStackTrace()V

    goto :goto_0

    .line 210
    .end local v1    # "e":Ljava/net/MalformedURLException;
    :catch_1
    move-exception v6

    move-object v1, v6

    .line 212
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {p0}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->loadLocalErrorPage()V

    .line 213
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public loadLocalErrorPage()V
    .locals 1

    .prologue
    .line 222
    const-string v0, "file:///android_asset/live.html"

    invoke-virtual {p0, v0}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->loadUrl(Ljava/lang/String;)V

    .line 223
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 228
    const/4 v0, 0x1

    return v0
.end method

.method public showPrograssBar()V
    .locals 2

    .prologue
    .line 273
    sget-object v0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$5;

    invoke-direct {v1, p0}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$5;-><init>(Lcom/gamevil/nexus2/xml/GamevilLiveWebView;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 282
    return-void
.end method
