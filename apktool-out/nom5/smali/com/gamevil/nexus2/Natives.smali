.class public Lcom/gamevil/nexus2/Natives;
.super Ljava/lang/Object;
.source "Natives.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gamevil/nexus2/Natives$EventListener;,
        Lcom/gamevil/nexus2/Natives$UIListener;
    }
.end annotation


# static fields
.field public static bCanConn:Z

.field public static billSock:Lcom/lguplus/common/bill/IBillSocket;

.field private static eventListener:Lcom/gamevil/nexus2/Natives$EventListener;

.field private static mHandler:Landroid/os/Handler;

.field private static mHandler2:Landroid/os/Handler;

.field public static rcvData:[B

.field private static recvLength:I

.field private static strAID:Ljava/lang/String;

.field private static uiListener:Lcom/gamevil/nexus2/Natives$UIListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 773
    const/4 v0, 0x0

    sput v0, Lcom/gamevil/nexus2/Natives;->recvLength:I

    .line 784
    const-string v0, "0003572B"

    sput-object v0, Lcom/gamevil/nexus2/Natives;->strAID:Ljava/lang/String;

    .line 977
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    sput-object v0, Lcom/gamevil/nexus2/Natives;->mHandler:Landroid/os/Handler;

    .line 978
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    sput-object v0, Lcom/gamevil/nexus2/Natives;->mHandler2:Landroid/os/Handler;

    .line 82
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static GWSwapBuffers()V
    .locals 1

    .prologue
    .line 112
    sget-object v0, Lcom/gamevil/nexus2/Natives;->eventListener:Lcom/gamevil/nexus2/Natives$EventListener;

    if-eqz v0, :cond_0

    .line 113
    sget-object v0, Lcom/gamevil/nexus2/Natives;->eventListener:Lcom/gamevil/nexus2/Natives$EventListener;

    invoke-interface {v0}, Lcom/gamevil/nexus2/Natives$EventListener;->GWSwapBuffers()V

    .line 115
    :cond_0
    return-void
.end method

.method public static native InitializeJNIGlobalRef()V
.end method

.method public static native NativeAsyncTimerCallBack(I)V
.end method

.method public static native NativeDestroyClet()V
.end method

.method public static native NativeGetPlayerName(Ljava/lang/String;)V
.end method

.method public static native NativeInitDeviceInfo(II)V
.end method

.method public static native NativeInitWithBufferSize(II)V
.end method

.method public static native NativeIsNexusOne(Z)V
.end method

.method public static native NativeNetTimeOut()V
.end method

.method public static native NativePauseClet()V
.end method

.method public static native NativeRender()V
.end method

.method public static native NativeResize(II)V
.end method

.method public static native NativeResponseIAP(Ljava/lang/String;I)V
.end method

.method public static native NativeResumeClet()V
.end method

.method private static OnAsyncTimerSet(II)V
    .locals 1
    .param p0, "timeOut"    # I
    .param p1, "timerIndex"    # I

    .prologue
    .line 163
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    invoke-virtual {v0, p0, p1}, Lcom/gamevil/nexus2/NexusGLActivity;->OnAsyncTimerSet(II)V

    .line 164
    return-void
.end method

.method private static OnEvent(I)V
    .locals 1
    .param p0, "_event"    # I

    .prologue
    .line 157
    sget-object v0, Lcom/gamevil/nexus2/Natives;->uiListener:Lcom/gamevil/nexus2/Natives$UIListener;

    invoke-interface {v0, p0}, Lcom/gamevil/nexus2/Natives$UIListener;->OnEvent(I)V

    .line 158
    return-void
.end method

.method private static OnMessage(Ljava/lang/String;)V
    .locals 1
    .param p0, "_msg"    # Ljava/lang/String;

    .prologue
    .line 106
    sget-object v0, Lcom/gamevil/nexus2/Natives;->eventListener:Lcom/gamevil/nexus2/Natives$EventListener;

    if-eqz v0, :cond_0

    .line 107
    sget-object v0, Lcom/gamevil/nexus2/Natives;->eventListener:Lcom/gamevil/nexus2/Natives$EventListener;

    invoke-interface {v0, p0}, Lcom/gamevil/nexus2/Natives$EventListener;->OnMessage(Ljava/lang/String;)V

    .line 109
    :cond_0
    return-void
.end method

.method private static OnSoundPlay(IIZ)V
    .locals 1
    .param p0, "sndID"    # I
    .param p1, "vol"    # I
    .param p2, "isLoop"    # Z

    .prologue
    .line 145
    sget-object v0, Lcom/gamevil/nexus2/Natives;->uiListener:Lcom/gamevil/nexus2/Natives$UIListener;

    invoke-interface {v0, p0, p1, p2}, Lcom/gamevil/nexus2/Natives$UIListener;->OnSoundPlay(IIZ)V

    .line 146
    return-void
.end method

.method private static OnStopSound()V
    .locals 1

    .prologue
    .line 149
    sget-object v0, Lcom/gamevil/nexus2/Natives;->uiListener:Lcom/gamevil/nexus2/Natives$UIListener;

    invoke-interface {v0}, Lcom/gamevil/nexus2/Natives$UIListener;->OnStopSound()V

    .line 150
    return-void
.end method

.method private static OnUIStatusChange(I)V
    .locals 1
    .param p0, "_status"    # I

    .prologue
    .line 141
    sget-object v0, Lcom/gamevil/nexus2/Natives;->uiListener:Lcom/gamevil/nexus2/Natives$UIListener;

    invoke-interface {v0, p0}, Lcom/gamevil/nexus2/Natives$UIListener;->OnUIStatusChange(I)V

    .line 142
    return-void
.end method

.method private static OnVibrate(I)V
    .locals 1
    .param p0, "_time"    # I

    .prologue
    .line 153
    sget-object v0, Lcom/gamevil/nexus2/Natives;->uiListener:Lcom/gamevil/nexus2/Natives$UIListener;

    invoke-interface {v0, p0}, Lcom/gamevil/nexus2/Natives$UIListener;->OnVibrate(I)V

    .line 154
    return-void
.end method

.method public static Read()[B
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 867
    const-class v3, Lcom/gamevil/nexus2/Natives;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Read() : billSock.readBytes(readData) - START"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 868
    const/high16 v3, 0x10000

    new-array v1, v3, [B

    .line 870
    .local v1, "readData":[B
    :try_start_0
    sget-object v3, Lcom/gamevil/nexus2/Natives;->billSock:Lcom/lguplus/common/bill/IBillSocket;

    invoke-interface {v3, v1}, Lcom/lguplus/common/bill/IBillSocket;->readBytes([B)I

    move-result v2

    .line 871
    .local v2, "result":I
    const-class v3, Lcom/gamevil/nexus2/Natives;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Read() : billSock.readBytes(readData) - result = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 872
    if-gez v2, :cond_0

    .line 873
    new-instance v3, Landroid/os/RemoteException;

    invoke-direct {v3}, Landroid/os/RemoteException;-><init>()V

    throw v3
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 875
    .end local v2    # "result":I
    :catch_0
    move-exception v3

    move-object v0, v3

    .line 876
    .local v0, "e":Landroid/os/RemoteException;
    const-class v3, Lcom/gamevil/nexus2/Natives;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Read() : Error : billSock.getLastErrorMsg() : "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v5, Lcom/gamevil/nexus2/Natives;->billSock:Lcom/lguplus/common/bill/IBillSocket;

    invoke-interface {v5}, Lcom/lguplus/common/bill/IBillSocket;->getLastErrorMsg()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 877
    throw v0

    .line 879
    .end local v0    # "e":Landroid/os/RemoteException;
    .restart local v2    # "result":I
    :cond_0
    const-class v3, Lcom/gamevil/nexus2/Natives;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Read() : billSock.writeBytes(sendData) - END"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 881
    return-object v1
.end method

.method private static SetSpeed(I)V
    .locals 0
    .param p0, "_speed"    # I

    .prologue
    .line 349
    invoke-static {p0}, Lcom/gamevil/nexus2/NexusGLThread;->SetFPS(I)V

    .line 350
    return-void
.end method

.method private static changeUIStatus(I)V
    .locals 1
    .param p0, "_status"    # I

    .prologue
    .line 353
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->uiViewControll:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    invoke-virtual {v0, p0}, Lcom/gamevil/nexus2/ui/NeoUIControllerView;->changeUIStatus(I)V

    .line 354
    return-void
.end method

.method private static clearPlayerName()V
    .locals 2

    .prologue
    .line 374
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->uiViewControll:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    const-string v1, ""

    iput-object v1, v0, Lcom/gamevil/nexus2/ui/NeoUIControllerView;->textInputed:Ljava/lang/String;

    .line 375
    return-void
.end method

.method private static finishApp()V
    .locals 0

    .prologue
    .line 346
    return-void
.end method

.method private static getAbsolueFilePath()Ljava/lang/String;
    .locals 2

    .prologue
    .line 329
    sget-object v1, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    invoke-virtual {v1}, Lcom/gamevil/nexus2/NexusGLActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    .line 330
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 332
    .local v0, "filePath":Ljava/lang/String;
    return-object v0
.end method

.method private static getGLOptionLinear()I
    .locals 4

    .prologue
    .line 1045
    sget-object v1, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    const-string v2, "glOptions"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/gamevil/nexus2/NexusGLActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1047
    .local v0, "settings":Landroid/content/SharedPreferences;
    const-string v1, "glQuality"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    return v1
.end method

.method private static getNetState()I
    .locals 1

    .prologue
    .line 790
    sget-boolean v0, Lcom/gamevil/nexus2/Natives;->bCanConn:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static getPhoneModel()[B
    .locals 1

    .prologue
    .line 421
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    return-object v0
.end method

.method private static getPhoneNumber()[B
    .locals 5

    .prologue
    .line 379
    const/4 v1, 0x0

    check-cast v1, [B

    .line 380
    .local v1, "num":[B
    const/4 v2, 0x0

    .line 383
    .local v2, "str":Ljava/lang/String;
    sget-object v3, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Lcom/gamevil/nexus2/NexusGLActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v2

    .line 384
    if-nez v2, :cond_0

    .line 385
    const-string v2, "01012341234"

    .line 387
    :cond_0
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v0

    .line 390
    .local v0, "length":I
    const/16 v3, 0xa

    if-lt v0, v3, :cond_1

    const/4 v3, 0x0

    const/4 v4, 0x2

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    const-string v4, "01"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 392
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "01"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v4, 0x9

    sub-int v4, v0, v4

    invoke-virtual {v2, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 394
    :cond_1
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    .line 415
    return-object v1
.end method

.method private static getPlayerName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 357
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->uiViewControll:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    iget-object v0, v0, Lcom/gamevil/nexus2/ui/NeoUIControllerView;->textInputed:Ljava/lang/String;

    return-object v0
.end method

.method private static getPlayerNameByte()[B
    .locals 6

    .prologue
    const/4 v3, 0x0

    .line 361
    move-object v0, v3

    check-cast v0, [B

    move-object v2, v0

    .line 363
    .local v2, "rtnByte":[B
    :try_start_0
    sget-object v4, Lcom/gamevil/nexus2/NexusGLActivity;->uiViewControll:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    iget-object v4, v4, Lcom/gamevil/nexus2/ui/NeoUIControllerView;->textInputed:Ljava/lang/String;

    .line 364
    const-string v5, "KSC5601"

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    move-object v3, v2

    .line 370
    :goto_0
    return-object v3

    .line 365
    :catch_0
    move-exception v4

    move-object v1, v4

    .line 367
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0
.end method

.method private static getVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1001
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    iget-object v0, v0, Lcom/gamevil/nexus2/NexusGLActivity;->version:Ljava/lang/String;

    return-object v0
.end method

.method public static native handleCletEvent(IIII)V
.end method

.method public static hideLoadingDialog()V
    .locals 2

    .prologue
    .line 990
    sget-object v0, Lcom/gamevil/nexus2/Natives;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/gamevil/nexus2/Natives$2;

    invoke-direct {v1}, Lcom/gamevil/nexus2/Natives$2;-><init>()V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 998
    return-void
.end method

.method private static hideTitleComponent()V
    .locals 2

    .prologue
    .line 1029
    sget-object v0, Lcom/gamevil/nexus2/Natives;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/gamevil/nexus2/Natives$4;

    invoke-direct {v1}, Lcom/gamevil/nexus2/Natives$4;-><init>()V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1034
    return-void
.end method

.method private static isAssetExist(Ljava/lang/String;)I
    .locals 6
    .param p0, "_fileName"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 181
    const/4 v2, 0x0

    .line 185
    .local v2, "is":Ljava/io/InputStream;
    :try_start_0
    sget-object v4, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    invoke-virtual {v4}, Lcom/gamevil/nexus2/NexusGLActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    invoke-virtual {v4, p0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 186
    invoke-virtual {v2}, Ljava/io/InputStream;->available()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 187
    .local v3, "readLen":I
    const/4 p0, 0x0

    move v4, v3

    .line 197
    .end local v3    # "readLen":I
    :goto_0
    return v4

    .line 189
    :catch_0
    move-exception v4

    move-object v0, v4

    .line 191
    .local v0, "e":Ljava/lang/Exception;
    const/4 p0, 0x0

    .line 192
    if-eqz v2, :cond_0

    .line 193
    :try_start_1
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :cond_0
    move v4, v5

    .line 197
    goto :goto_0

    .line 194
    :catch_1
    move-exception v1

    .local v1, "e1":Ljava/lang/Exception;
    move v4, v5

    .line 195
    goto :goto_0
.end method

.method private static isFileExist(Ljava/lang/String;)I
    .locals 4
    .param p0, "_name"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 250
    const/4 v1, 0x0

    .line 252
    .local v1, "is":Ljava/io/InputStream;
    :try_start_0
    sget-object v2, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    invoke-virtual {v2, p0}, Lcom/gamevil/nexus2/NexusGLActivity;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v1

    .line 253
    invoke-virtual {v1}, Ljava/io/InputStream;->available()I
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v2

    .line 265
    :goto_0
    return v2

    .line 254
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 256
    .local v0, "e":Ljava/io/FileNotFoundException;
    if-eqz v1, :cond_0

    .line 257
    :try_start_1
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    :cond_0
    :goto_1
    move v2, v3

    .line 262
    goto :goto_0

    .line 263
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v2

    move-object v0, v2

    .local v0, "e":Ljava/io/IOException;
    move v2, v3

    .line 265
    goto :goto_0

    .line 258
    .local v0, "e":Ljava/io/FileNotFoundException;
    :catch_2
    move-exception v2

    goto :goto_1
.end method

.method public static isNetAvailable()I
    .locals 5

    .prologue
    .line 426
    const/4 v0, 0x0

    .line 427
    .local v0, "_reachable":Z
    sget-object v3, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    .line 428
    const-string v4, "connectivity"

    invoke-virtual {v3, v4}, Lcom/gamevil/nexus2/NexusGLActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 427
    check-cast v1, Landroid/net/ConnectivityManager;

    .line 430
    .local v1, "conn_manager":Landroid/net/ConnectivityManager;
    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v2

    .line 431
    .local v2, "network_info":Landroid/net/NetworkInfo;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 432
    const/4 v0, 0x1

    .line 439
    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getType()I

    move-result v3

    :goto_1
    return v3

    .line 436
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 439
    :cond_1
    const/4 v3, -0x1

    goto :goto_1
.end method

.method private static loadFile(Ljava/lang/String;)[B
    .locals 8
    .param p0, "_name"    # Ljava/lang/String;

    .prologue
    .line 297
    const/4 v5, 0x0

    .line 298
    .local v5, "is":Ljava/io/InputStream;
    const/4 v0, 0x0

    .line 300
    .local v0, "bo":Ljava/io/ByteArrayOutputStream;
    :try_start_0
    sget-object v7, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    invoke-virtual {v7, p0}, Lcom/gamevil/nexus2/NexusGLActivity;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v5

    .line 302
    const/16 v7, 0x400

    new-array v2, v7, [B

    .line 303
    .local v2, "buffer":[B
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 306
    .end local v0    # "bo":Ljava/io/ByteArrayOutputStream;
    .local v1, "bo":Ljava/io/ByteArrayOutputStream;
    :goto_0
    :try_start_1
    invoke-virtual {v5, v2}, Ljava/io/InputStream;->read([B)I

    move-result v6

    .local v6, "readLen":I
    const/4 v7, -0x1

    if-ne v6, v7, :cond_0

    .line 310
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 311
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    .line 312
    .local v3, "data":[B
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V

    move-object v0, v1

    .end local v1    # "bo":Ljava/io/ByteArrayOutputStream;
    .restart local v0    # "bo":Ljava/io/ByteArrayOutputStream;
    move-object v7, v3

    .line 325
    .end local v2    # "buffer":[B
    .end local v3    # "data":[B
    .end local v6    # "readLen":I
    :goto_1
    return-object v7

    .line 307
    .end local v0    # "bo":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "bo":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "buffer":[B
    .restart local v6    # "readLen":I
    :cond_0
    const/4 v7, 0x0

    invoke-virtual {v1, v2, v7, v6}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 315
    .end local v6    # "readLen":I
    :catch_0
    move-exception v7

    move-object v4, v7

    move-object v0, v1

    .line 317
    .end local v1    # "bo":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "buffer":[B
    .restart local v0    # "bo":Ljava/io/ByteArrayOutputStream;
    .local v4, "e":Ljava/lang/Exception;
    :goto_2
    if-eqz v5, :cond_1

    .line 318
    :try_start_2
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 319
    :cond_1
    if-eqz v0, :cond_2

    .line 320
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 325
    :cond_2
    :goto_3
    const/4 v7, 0x0

    goto :goto_1

    .line 321
    :catch_1
    move-exception v7

    goto :goto_3

    .line 315
    .end local v4    # "e":Ljava/lang/Exception;
    :catch_2
    move-exception v7

    move-object v4, v7

    goto :goto_2
.end method

.method private static netBillcomSocketClose()I
    .locals 4

    .prologue
    .line 943
    const-class v1, Lcom/gamevil/nexus2/Natives;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "netBillcomSocketClose() START"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 945
    :try_start_0
    sget-object v1, Lcom/gamevil/nexus2/Natives;->billSock:Lcom/lguplus/common/bill/IBillSocket;

    if-eqz v1, :cond_0

    .line 946
    sget-object v1, Lcom/gamevil/nexus2/Natives;->billSock:Lcom/lguplus/common/bill/IBillSocket;

    invoke-interface {v1}, Lcom/lguplus/common/bill/IBillSocket;->close()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 953
    :cond_0
    const-class v1, Lcom/gamevil/nexus2/Natives;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "netBillcomSocketClose() END"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 954
    const/4 v1, 0x1

    :goto_0
    return v1

    .line 948
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 949
    .local v0, "e":Landroid/os/RemoteException;
    const-class v1, Lcom/gamevil/nexus2/Natives;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "netBillcomSocketClose() : "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 950
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 951
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static netBillcomSocketConnect(Ljava/lang/String;I)I
    .locals 10
    .param p0, "_ip"    # Ljava/lang/String;
    .param p1, "_port"    # I

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 806
    const/4 v1, 0x0

    .line 808
    .local v1, "rtn":I
    :try_start_0
    sget-object v2, Lcom/gamevil/nexus2/Natives;->billSock:Lcom/lguplus/common/bill/IBillSocket;

    if-eqz v2, :cond_0

    .line 809
    sget-object v2, Lcom/gamevil/nexus2/Natives;->billSock:Lcom/lguplus/common/bill/IBillSocket;

    sget-object v3, Lcom/gamevil/nexus2/Natives;->strAID:Ljava/lang/String;

    invoke-interface {v2, v3, p0, p1}, Lcom/lguplus/common/bill/IBillSocket;->connect(Ljava/lang/String;Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_1

    move v1, v8

    .line 810
    :goto_0
    const-class v2, Lcom/gamevil/nexus2/Natives;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "netBillcomSocketConnect(IP : %s, PORT : %d)"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p0, v4, v5

    const/4 v5, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 817
    :cond_0
    :goto_1
    return v1

    :cond_1
    move v1, v7

    .line 809
    goto :goto_0

    .line 812
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 813
    .local v0, "e":Landroid/os/RemoteException;
    const-class v2, Lcom/gamevil/nexus2/Natives;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "netBillcomSocketConnect(IP : %s, PORT : %d)"

    new-array v4, v9, [Ljava/lang/Object;

    aput-object p0, v4, v7

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 814
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 815
    const/4 v1, 0x0

    goto :goto_1
.end method

.method private static netBillcomSocketRead(I)[B
    .locals 7
    .param p0, "_length"    # I

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 897
    const-class v1, Lcom/gamevil/nexus2/Natives;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "netBillcomSocketRead(_length : %d) START"

    new-array v3, v6, [Ljava/lang/Object;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 898
    new-array v0, p0, [B

    .line 899
    .local v0, "readData":[B
    sget-object v1, Lcom/gamevil/nexus2/Natives;->rcvData:[B

    sget v2, Lcom/gamevil/nexus2/Natives;->recvLength:I

    invoke-static {v1, v2, v0, v5, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 900
    sget v1, Lcom/gamevil/nexus2/Natives;->recvLength:I

    array-length v2, v0

    add-int/2addr v1, v2

    sput v1, Lcom/gamevil/nexus2/Natives;->recvLength:I

    .line 915
    const-class v1, Lcom/gamevil/nexus2/Natives;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "netBillcomSocketRead(recvLength : %d) END"

    new-array v3, v6, [Ljava/lang/Object;

    sget v4, Lcom/gamevil/nexus2/Natives;->recvLength:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 916
    return-object v0
.end method

.method private static netBillcomSocketWrite([B)I
    .locals 5
    .param p0, "sendData"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v4, -0x1

    .line 842
    const-class v1, Lcom/gamevil/nexus2/Natives;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "netBillcomSocketWrite(...) START"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 844
    :try_start_0
    sget-object v1, Lcom/gamevil/nexus2/Natives;->billSock:Lcom/lguplus/common/bill/IBillSocket;

    invoke-interface {v1, p0}, Lcom/lguplus/common/bill/IBillSocket;->writeBytes([B)Z

    move-result v1

    if-nez v1, :cond_0

    .line 845
    const-class v1, Lcom/gamevil/nexus2/Natives;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "netBillcomSocketWrite(...) billSock.writeBytes(sendData) ERROR"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v1, v4

    .line 858
    :goto_0
    return v1

    .line 848
    :cond_0
    const/4 v1, 0x0

    sput-object v1, Lcom/gamevil/nexus2/Natives;->rcvData:[B

    .line 849
    const/4 v1, 0x0

    sput v1, Lcom/gamevil/nexus2/Natives;->recvLength:I

    .line 850
    invoke-static {}, Lcom/gamevil/nexus2/Natives;->Read()[B

    move-result-object v1

    sput-object v1, Lcom/gamevil/nexus2/Natives;->rcvData:[B
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 857
    const-class v1, Lcom/gamevil/nexus2/Natives;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "netBillcomSocketWrite(...) END"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 858
    array-length v1, p0

    goto :goto_0

    .line 851
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 852
    .local v0, "e":Landroid/os/RemoteException;
    const-class v1, Lcom/gamevil/nexus2/Natives;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "netBillcomSocketWrite(...) : Exception : "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Lcom/gamevil/nexus2/Natives;->billSock:Lcom/lguplus/common/bill/IBillSocket;

    invoke-interface {v3}, Lcom/lguplus/common/bill/IBillSocket;->getLastErrorMsg()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 853
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    move v1, v4

    .line 854
    goto :goto_0
.end method

.method private static netConnect()I
    .locals 1

    .prologue
    .line 797
    sget-boolean v0, Lcom/gamevil/nexus2/Natives;->bCanConn:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method private static netSocket()I
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 801
    sget-object v0, Lcom/gamevil/nexus2/Natives;->billSock:Lcom/lguplus/common/bill/IBillSocket;

    if-nez v0, :cond_0

    sput-boolean v1, Lcom/gamevil/nexus2/Natives;->bCanConn:Z

    .line 802
    :cond_0
    sget-boolean v0, Lcom/gamevil/nexus2/Natives;->bCanConn:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method public static openStoreWithProductId(Ljava/lang/String;)V
    .locals 0
    .param p0, "_pid"    # Ljava/lang/String;

    .prologue
    .line 1187
    return-void
.end method

.method public static openUrl(Ljava/lang/String;)V
    .locals 4
    .param p0, "_query"    # Ljava/lang/String;

    .prologue
    .line 1149
    :try_start_0
    sget-object v1, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    invoke-static {p0}, Landroid/content/Intent;->getIntent(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    const-string v3, "android.intent.action.VIEW"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/gamevil/nexus2/NexusGLActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1153
    :goto_0
    return-void

    .line 1150
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 1151
    .local v0, "e":Ljava/net/URISyntaxException;
    invoke-virtual {v0}, Ljava/net/URISyntaxException;->printStackTrace()V

    goto :goto_0
.end method

.method private static readAssete(Ljava/lang/String;)[B
    .locals 10
    .param p0, "_fileName"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x0

    .line 209
    const/4 v5, 0x0

    .line 210
    .local v5, "is":Ljava/io/InputStream;
    const/4 v1, 0x0

    .line 214
    .local v1, "bo":Ljava/io/ByteArrayOutputStream;
    move-object v0, v8

    check-cast v0, [B

    move-object v7, v0

    .line 216
    .local v7, "rtnBytes":[B
    :try_start_0
    sget-object v9, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    invoke-virtual {v9}, Lcom/gamevil/nexus2/NexusGLActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v9

    invoke-virtual {v9, p0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v5

    .line 218
    invoke-virtual {v5}, Ljava/io/InputStream;->available()I

    move-result v9

    new-array v3, v9, [B

    .line 219
    .local v3, "buffer":[B
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3

    .line 222
    .end local v1    # "bo":Ljava/io/ByteArrayOutputStream;
    .local v2, "bo":Ljava/io/ByteArrayOutputStream;
    :goto_0
    :try_start_1
    invoke-virtual {v5, v3}, Ljava/io/InputStream;->read([B)I

    move-result v6

    .local v6, "readLen":I
    const/4 v9, -0x1

    if-ne v6, v9, :cond_1

    .line 226
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 227
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v7

    .line 228
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V

    move-object v1, v2

    .end local v2    # "bo":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "bo":Ljava/io/ByteArrayOutputStream;
    move-object v8, v7

    .line 243
    .end local v3    # "buffer":[B
    .end local v6    # "readLen":I
    :cond_0
    :goto_1
    return-object v8

    .line 223
    .end local v1    # "bo":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "bo":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "buffer":[B
    .restart local v6    # "readLen":I
    :cond_1
    const/4 v9, 0x0

    invoke-virtual {v2, v3, v9, v6}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 231
    .end local v6    # "readLen":I
    :catch_0
    move-exception v9

    move-object v4, v9

    move-object v1, v2

    .line 234
    .end local v2    # "bo":Ljava/io/ByteArrayOutputStream;
    .end local v3    # "buffer":[B
    .restart local v1    # "bo":Ljava/io/ByteArrayOutputStream;
    .local v4, "e":Ljava/io/IOException;
    :goto_2
    if-eqz v5, :cond_2

    .line 235
    :try_start_2
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 239
    :cond_2
    :goto_3
    if-eqz v1, :cond_0

    .line 240
    :try_start_3
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1

    .line 241
    :catch_1
    move-exception v9

    goto :goto_1

    .line 236
    :catch_2
    move-exception v9

    goto :goto_3

    .line 231
    .end local v4    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v9

    move-object v4, v9

    goto :goto_2
.end method

.method private static requestIAP(ILjava/lang/String;[B)V
    .locals 0
    .param p0, "_idx"    # I
    .param p1, "_pID"    # Ljava/lang/String;
    .param p2, "_itemName"    # [B

    .prologue
    .line 1097
    return-void
.end method

.method private static saveFile(Ljava/lang/String;[B)V
    .locals 4
    .param p0, "_name"    # Ljava/lang/String;
    .param p1, "pData"    # [B

    .prologue
    .line 276
    const/4 v0, 0x0

    .line 278
    .local v0, "bos":Ljava/io/BufferedOutputStream;
    :try_start_0
    new-instance v1, Ljava/io/BufferedOutputStream;

    .line 279
    sget-object v2, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    .line 280
    const/4 v3, 0x0

    .line 279
    invoke-virtual {v2, p0, v3}, Lcom/gamevil/nexus2/NexusGLActivity;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v2

    .line 278
    invoke-direct {v1, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 281
    .end local v0    # "bos":Ljava/io/BufferedOutputStream;
    .local v1, "bos":Ljava/io/BufferedOutputStream;
    const/4 v2, 0x0

    :try_start_1
    array-length v3, p1

    invoke-virtual {v1, p1, v2, v3}, Ljava/io/BufferedOutputStream;->write([BII)V

    .line 282
    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->flush()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 287
    if-eqz v1, :cond_2

    .line 289
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    move-object v0, v1

    .line 294
    .end local v1    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v0    # "bos":Ljava/io/BufferedOutputStream;
    :cond_0
    :goto_0
    return-void

    .line 284
    :catch_0
    move-exception v2

    .line 287
    :goto_1
    if-eqz v0, :cond_0

    .line 289
    :try_start_3
    invoke-virtual {v0}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0

    .line 290
    :catch_1
    move-exception v2

    goto :goto_0

    .line 286
    :catchall_0
    move-exception v2

    .line 287
    :goto_2
    if-eqz v0, :cond_1

    .line 289
    :try_start_4
    invoke-virtual {v0}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 293
    :cond_1
    :goto_3
    throw v2

    .line 290
    .end local v0    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v1    # "bos":Ljava/io/BufferedOutputStream;
    :catch_2
    move-exception v2

    move-object v0, v1

    .end local v1    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v0    # "bos":Ljava/io/BufferedOutputStream;
    goto :goto_0

    :catch_3
    move-exception v3

    goto :goto_3

    .line 286
    .end local v0    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v1    # "bos":Ljava/io/BufferedOutputStream;
    :catchall_1
    move-exception v2

    move-object v0, v1

    .end local v1    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v0    # "bos":Ljava/io/BufferedOutputStream;
    goto :goto_2

    .line 284
    .end local v0    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v1    # "bos":Ljava/io/BufferedOutputStream;
    :catch_4
    move-exception v2

    move-object v0, v1

    .end local v1    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v0    # "bos":Ljava/io/BufferedOutputStream;
    goto :goto_1

    .end local v0    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v1    # "bos":Ljava/io/BufferedOutputStream;
    :cond_2
    move-object v0, v1

    .end local v1    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v0    # "bos":Ljava/io/BufferedOutputStream;
    goto :goto_0
.end method

.method public static saveGLOptionLinear(I)V
    .locals 5
    .param p0, "_mode"    # I

    .prologue
    .line 1057
    sget-object v2, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    const-string v3, "glOptions"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lcom/gamevil/nexus2/NexusGLActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1058
    .local v1, "settings":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1059
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v2, "glQuality"

    invoke-interface {v0, v2, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 1062
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1063
    return-void
.end method

.method public static setEventListener(Lcom/gamevil/nexus2/Natives$EventListener;)V
    .locals 0
    .param p0, "_listener"    # Lcom/gamevil/nexus2/Natives$EventListener;

    .prologue
    .line 102
    sput-object p0, Lcom/gamevil/nexus2/Natives;->eventListener:Lcom/gamevil/nexus2/Natives$EventListener;

    .line 103
    return-void
.end method

.method public static setUIListener(Lcom/gamevil/nexus2/Natives$UIListener;)V
    .locals 0
    .param p0, "_listener"    # Lcom/gamevil/nexus2/Natives$UIListener;

    .prologue
    .line 137
    sput-object p0, Lcom/gamevil/nexus2/Natives;->uiListener:Lcom/gamevil/nexus2/Natives$UIListener;

    .line 138
    return-void
.end method

.method public static showLoadingDialog()V
    .locals 2

    .prologue
    .line 981
    sget-object v0, Lcom/gamevil/nexus2/Natives;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/gamevil/nexus2/Natives$1;

    invoke-direct {v1}, Lcom/gamevil/nexus2/Natives$1;-><init>()V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 987
    return-void
.end method

.method private static showTitleComponent()V
    .locals 2

    .prologue
    .line 1021
    sget-object v0, Lcom/gamevil/nexus2/Natives;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/gamevil/nexus2/Natives$3;

    invoke-direct {v1}, Lcom/gamevil/nexus2/Natives$3;-><init>()V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1026
    return-void
.end method

.method private static stopAndroidSound()V
    .locals 0

    .prologue
    .line 336
    invoke-static {}, Lcom/gamevil/nexus2/ui/NexusSound;->stopAllSound()V

    .line 337
    return-void
.end method

.method public static trackEventDispatch(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "_action"    # Ljava/lang/String;
    .param p1, "_lable"    # Ljava/lang/String;

    .prologue
    .line 1014
    invoke-static {p0, p1}, Lcom/gamevil/nexus2/NexusGLActivity;->AnalyticsTrackEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 1015
    return-void
.end method

.method public static trackPageViewDispatch(Ljava/lang/String;)V
    .locals 0
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 1009
    invoke-static {p0}, Lcom/gamevil/nexus2/NexusGLActivity;->AnalyticsTrackPageView(Ljava/lang/String;)V

    .line 1010
    return-void
.end method

.method private static vibrateAndroid(I)V
    .locals 0
    .param p0, "_time"    # I

    .prologue
    .line 340
    invoke-static {p0}, Lcom/gamevil/nexus2/ui/NexusSound;->Vibrator(I)V

    .line 341
    return-void
.end method


# virtual methods
.method public availableSize(Ljava/lang/String;)J
    .locals 8
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 1227
    new-instance v1, Landroid/os/StatFs;

    invoke-direct {v1, p1}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 1228
    .local v1, "stat":Landroid/os/StatFs;
    invoke-virtual {v1}, Landroid/os/StatFs;->getBlockSize()I

    move-result v0

    .line 1229
    .local v0, "blockSize":I
    int-to-long v2, v0

    invoke-virtual {v1}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v4

    int-to-long v4, v4

    const-wide/16 v6, 0x4

    sub-long/2addr v4, v6

    mul-long/2addr v2, v4

    return-wide v2
.end method
