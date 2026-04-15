.class public Lcom/kaf/KafManager;
.super Ljava/lang/Object;
.source "KafManager.java"


# static fields
.field private static ACTION_APP_INSTALL_HISTORY_UPDATE:Ljava/lang/String; = null

.field private static ACTION_KAF_LIB_INSTALL:Ljava/lang/String; = null

.field private static CN_NAME:Ljava/lang/String; = null

.field private static CN_NAME_KAF_INIT_PROC_TIME:Ljava/lang/String; = null

.field private static CN_NAME_KAF_INIT_STATUS:Ljava/lang/String; = null

.field private static CN_NAME_KAF_LIB_VERSION:Ljava/lang/String; = null

.field private static CN_VALUE:Ljava/lang/String; = null

.field public static final ERR_INVALID_OBJECT_CODE:Ljava/lang/String; = "F00000004"

.field public static final ERR_INVALID_OBJECT_MESG:Ljava/lang/String; = "Object is null"

.field public static final ERR_LIB_LOAD_FAILED_CODE:Ljava/lang/String; = "F00000003"

.field public static final ERR_LIB_LOAD_FAILED_MESG:Ljava/lang/String; = "Library Load Failed."

.field public static final ERR_LIB_NOT_INIT_CODE:Ljava/lang/String; = "F00000002"

.field public static final ERR_LIB_NOT_INIT_MESG:Ljava/lang/String; = "KAF is not initialzed."

.field public static final ERR_LIB_NOT_LOADED_CODE:Ljava/lang/String; = "F00000001"

.field public static final ERR_LIB_NOT_LOADED_MESG:Ljava/lang/String; = "KAF Library is not loaded."

.field private static IKAF_VERSION:Ljava/lang/String; = null

.field public static final INIT_COPYLEFT:I = 0x0

.field public static final INIT_COPYRIGHT:I = 0x1

.field private static KAFMANAGER_CLASS_NAME:Ljava/lang/String;

.field public static final KAF_INSTALL_STATUS_INIT_REINSTALL:I

.field private static KAF_MANAGER_CONTENT_URI:Ljava/lang/String;

.field private static MSG_SHOW_STORE_INSTALL:Ljava/lang/String;

.field private static MSG_SHOW_STORE_REINSTALL:Ljava/lang/String;

.field private static SHOW_STORE_DOWNLOAD_URL:Ljava/lang/String;

.field private static SHOW_STORE_PACKAGE_NAME:Ljava/lang/String;

.field private static TEXT_CONFIRM:Ljava/lang/String;

.field private static TEXT_NO:Ljava/lang/String;

.field private static TEXT_YES:Ljava/lang/String;

.field private static kafManager:Lcom/kaf/KafManager;


# instance fields
.field private adStatus:I

.field private appContext:Landroid/content/Context;

.field private cacheDir:Ljava/io/File;

.field private cl:Ldalvik/system/DexClassLoader;

.field clsDeviceControl:Ljava/lang/Class;

.field private devInfoFile:Ljava/io/File;

.field iKafManager:Lcom/kaf/IKafManager;

.field private isLibraryInit:Z

.field private jarDir:Ljava/io/File;

.field private jarFile:Ljava/io/File;

.field private kafConfFile:Ljava/io/File;

.field progressDialog:Landroid/app/ProgressDialog;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 74
    const/4 v0, 0x0

    sput-object v0, Lcom/kaf/KafManager;->kafManager:Lcom/kaf/KafManager;

    .line 88
    const-string v0, "ikaf_public_r04_101104"

    sput-object v0, Lcom/kaf/KafManager;->IKAF_VERSION:Ljava/lang/String;

    .line 89
    const-string v0, "http://appstoresupport.show.co.kr:8080/store.html"

    sput-object v0, Lcom/kaf/KafManager;->SHOW_STORE_DOWNLOAD_URL:Ljava/lang/String;

    .line 90
    const-string v0, "content://com.kaf.kafmanagerprovider"

    sput-object v0, Lcom/kaf/KafManager;->KAF_MANAGER_CONTENT_URI:Ljava/lang/String;

    .line 91
    const-string v0, "com.kaf.action.KAF_LIB_INSTALL"

    sput-object v0, Lcom/kaf/KafManager;->ACTION_KAF_LIB_INSTALL:Ljava/lang/String;

    .line 92
    const-string v0, "com.kaf.action.APP_INSTALL_HISTORY_UPDATE"

    sput-object v0, Lcom/kaf/KafManager;->ACTION_APP_INSTALL_HISTORY_UPDATE:Ljava/lang/String;

    .line 93
    const-string v0, "com.kt.olleh.istore"

    sput-object v0, Lcom/kaf/KafManager;->SHOW_STORE_PACKAGE_NAME:Ljava/lang/String;

    .line 94
    const-string v0, "\uc5b4\ud50c\ub9ac\ucf00\uc774\uc158 \uad6c\ub3d9\uc744 \uc704\ud574\uc11c olleh \ub9c8\ucf13\uc774 \ud544\uc694\ud569\ub2c8\ub2e4. \uc124\uce58\ud558\uc2dc\uaca0\uc2b5\ub2c8\uae4c?"

    sput-object v0, Lcom/kaf/KafManager;->MSG_SHOW_STORE_INSTALL:Ljava/lang/String;

    .line 95
    const-string v0, "olleh \ub9c8\ucf13\uc744 \ub2e4\uc2dc \uc124\uce58\ud569\ub2c8\ub2e4. \uc124\uce58\ud558\uaca0\uc2b5\ub2c8\uae4c?"

    sput-object v0, Lcom/kaf/KafManager;->MSG_SHOW_STORE_REINSTALL:Ljava/lang/String;

    .line 96
    const-string v0, "\uc608"

    sput-object v0, Lcom/kaf/KafManager;->TEXT_YES:Ljava/lang/String;

    .line 97
    const-string v0, "\uc544\ub2c8\uc694"

    sput-object v0, Lcom/kaf/KafManager;->TEXT_NO:Ljava/lang/String;

    .line 98
    const-string v0, "\ud655\uc778"

    sput-object v0, Lcom/kaf/KafManager;->TEXT_CONFIRM:Ljava/lang/String;

    .line 99
    const-string v0, "com.kt.ikaf.KafManager"

    sput-object v0, Lcom/kaf/KafManager;->KAFMANAGER_CLASS_NAME:Ljava/lang/String;

    .line 100
    const-string v0, "name"

    sput-object v0, Lcom/kaf/KafManager;->CN_NAME:Ljava/lang/String;

    .line 101
    const-string v0, "value"

    sput-object v0, Lcom/kaf/KafManager;->CN_VALUE:Ljava/lang/String;

    .line 102
    const-string v0, "kaf_version"

    sput-object v0, Lcom/kaf/KafManager;->CN_NAME_KAF_LIB_VERSION:Ljava/lang/String;

    .line 103
    const-string v0, "kaf_init_status"

    sput-object v0, Lcom/kaf/KafManager;->CN_NAME_KAF_INIT_STATUS:Ljava/lang/String;

    .line 104
    const-string v0, "kaf_init_process_time"

    sput-object v0, Lcom/kaf/KafManager;->CN_NAME_KAF_INIT_PROC_TIME:Ljava/lang/String;

    .line 48
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 109
    iput-boolean v1, p0, Lcom/kaf/KafManager;->isLibraryInit:Z

    .line 123
    iput-object v0, p0, Lcom/kaf/KafManager;->clsDeviceControl:Ljava/lang/Class;

    .line 125
    iput-object v0, p0, Lcom/kaf/KafManager;->iKafManager:Lcom/kaf/IKafManager;

    .line 146
    iput-object v0, p0, Lcom/kaf/KafManager;->appContext:Landroid/content/Context;

    .line 163
    iput v1, p0, Lcom/kaf/KafManager;->adStatus:I

    .line 48
    return-void
.end method

.method static synthetic access$0()Ljava/lang/String;
    .locals 1

    .prologue
    .line 89
    sget-object v0, Lcom/kaf/KafManager;->SHOW_STORE_DOWNLOAD_URL:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1(Lcom/kaf/KafManager;)Landroid/content/Context;
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lcom/kaf/KafManager;->appContext:Landroid/content/Context;

    return-object v0
.end method

.method private createDocument(Ljava/io/InputStream;)Lorg/w3c/dom/Document;
    .locals 7
    .param p1, "is"    # Ljava/io/InputStream;

    .prologue
    const/4 v4, 0x1

    .line 443
    const/4 v1, 0x0

    .line 445
    .local v1, "d":Lorg/w3c/dom/Document;
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v3

    .line 447
    .local v3, "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    invoke-virtual {v3, v4}, Ljavax/xml/parsers/DocumentBuilderFactory;->setCoalescing(Z)V

    .line 448
    invoke-virtual {v3, v4}, Ljavax/xml/parsers/DocumentBuilderFactory;->setIgnoringComments(Z)V

    .line 451
    :try_start_0
    invoke-virtual {v3}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 453
    .local v0, "builder":Ljavax/xml/parsers/DocumentBuilder;
    invoke-virtual {v0, p1}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/InputStream;)Lorg/w3c/dom/Document;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    move-object v4, v1

    .line 459
    .end local v0    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    :goto_0
    return-object v4

    .line 454
    :catch_0
    move-exception v4

    move-object v2, v4

    .line 455
    .local v2, "e":Ljava/lang/Exception;
    const-string v4, "KAF"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "[KafManager.createDocument] "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 456
    const/4 v4, 0x0

    goto :goto_0
.end method

.method private deleteDir(Ljava/io/File;)V
    .locals 5
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 464
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    .line 479
    :cond_0
    :goto_0
    return-void

    .line 466
    :cond_1
    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v2

    if-nez v2, :cond_0

    .line 469
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 470
    .local v0, "files":[Ljava/io/File;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v2, v0

    if-lt v1, v2, :cond_2

    .line 478
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    goto :goto_0

    .line 471
    :cond_2
    aget-object v2, v0, v1

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 472
    aget-object v2, v0, v1

    invoke-direct {p0, v2}, Lcom/kaf/KafManager;->deleteDir(Ljava/io/File;)V

    .line 470
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 474
    :cond_3
    const-string v2, "KAF"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "[KafManager.deleteDir] "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-object v4, v0, v1

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " delete"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 475
    aget-object v2, v0, v1

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    goto :goto_2
.end method

.method private getInitializeStatus(Landroid/content/Context;)I
    .locals 10
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v9, 0x0

    .line 488
    const/4 v6, 0x0

    .line 490
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v2, Lcom/kaf/KafManager;->CN_NAME:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "= \'kaf_init_status\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 491
    .local v3, "whereClause":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v2, Lcom/kaf/KafManager;->KAF_MANAGER_CONTENT_URI:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "/kaf_info"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 492
    .local v1, "uri":Landroid/net/Uri;
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v4, 0x0

    sget-object v5, Lcom/kaf/KafManager;->CN_VALUE:Ljava/lang/String;

    aput-object v5, v2, v4

    .line 494
    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 492
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 496
    if-eqz v6, :cond_5

    .line 497
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 498
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-gtz v0, :cond_1

    .line 505
    if-eqz v6, :cond_0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_0
    const/4 v6, 0x0

    move v0, v9

    .line 507
    .end local v1    # "uri":Landroid/net/Uri;
    .end local v3    # "whereClause":Ljava/lang/String;
    :goto_0
    return v0

    .line 499
    .restart local v1    # "uri":Landroid/net/Uri;
    .restart local v3    # "whereClause":Ljava/lang/String;
    :cond_1
    const/4 v0, 0x0

    :try_start_1
    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 500
    .local v8, "status":Ljava/lang/String;
    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    .line 505
    if-eqz v6, :cond_2

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_2
    const/4 v6, 0x0

    .line 500
    goto :goto_0

    .line 502
    .end local v1    # "uri":Landroid/net/Uri;
    .end local v3    # "whereClause":Ljava/lang/String;
    .end local v8    # "status":Ljava/lang/String;
    :catch_0
    move-exception v0

    move-object v7, v0

    .line 503
    .local v7, "ex":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 505
    if-eqz v6, :cond_3

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_3
    const/4 v6, 0x0

    .end local v7    # "ex":Ljava/lang/Exception;
    :goto_1
    move v0, v9

    .line 507
    goto :goto_0

    .line 504
    :catchall_0
    move-exception v0

    .line 505
    if-eqz v6, :cond_4

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_4
    const/4 v6, 0x0

    .line 506
    throw v0

    .line 505
    .restart local v1    # "uri":Landroid/net/Uri;
    .restart local v3    # "whereClause":Ljava/lang/String;
    :cond_5
    if-eqz v6, :cond_6

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_6
    const/4 v6, 0x0

    goto :goto_1
.end method

.method public static getInstance()Lcom/kaf/KafManager;
    .locals 1

    .prologue
    .line 117
    sget-object v0, Lcom/kaf/KafManager;->kafManager:Lcom/kaf/KafManager;

    if-nez v0, :cond_0

    .line 118
    invoke-static {}, Lcom/kaf/KafManager;->getSingletoneInstance()Lcom/kaf/KafManager;

    move-result-object v0

    .line 120
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/kaf/KafManager;->kafManager:Lcom/kaf/KafManager;

    goto :goto_0
.end method

.method private getKafVersion(Lorg/w3c/dom/Node;)Ljava/lang/String;
    .locals 6
    .param p1, "root"    # Lorg/w3c/dom/Node;

    .prologue
    .line 412
    const-string v3, ""

    .line 414
    .local v3, "result":Ljava/lang/String;
    const/4 v0, 0x0

    .line 416
    .local v0, "childs":Lorg/w3c/dom/NodeList;
    :try_start_0
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 417
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    if-lt v2, v4, :cond_0

    move-object v4, v3

    .line 427
    .end local v2    # "i":I
    :goto_1
    return-object v4

    .line 418
    .restart local v2    # "i":I
    :cond_0
    invoke-interface {v0, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "kafVersion"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 419
    invoke-interface {v0, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/kaf/KafManager;->getTEXT(Lorg/w3c/dom/Node;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 417
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 422
    .end local v2    # "i":I
    :catch_0
    move-exception v4

    move-object v1, v4

    .line 423
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 424
    const-string v4, ""

    goto :goto_1
.end method

.method private static declared-synchronized getSingletoneInstance()Lcom/kaf/KafManager;
    .locals 2

    .prologue
    .line 127
    const-class v0, Lcom/kaf/KafManager;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/kaf/KafManager;->kafManager:Lcom/kaf/KafManager;

    if-nez v1, :cond_0

    .line 128
    new-instance v1, Lcom/kaf/KafManager;

    invoke-direct {v1}, Lcom/kaf/KafManager;-><init>()V

    sput-object v1, Lcom/kaf/KafManager;->kafManager:Lcom/kaf/KafManager;

    .line 130
    :cond_0
    sget-object v1, Lcom/kaf/KafManager;->kafManager:Lcom/kaf/KafManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    .line 127
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private getTEXT(Lorg/w3c/dom/Node;)Ljava/lang/String;
    .locals 4
    .param p1, "parent"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NullPointerException;
        }
    .end annotation

    .prologue
    .line 431
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 433
    .local v0, "childs":Lorg/w3c/dom/NodeList;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    if-lt v1, v2, :cond_0

    .line 439
    const-string v2, ""

    :goto_1
    return-object v2

    .line 434
    :cond_0
    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v2

    const/4 v3, 0x3

    if-ne v2, v3, :cond_1

    .line 435
    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 433
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private isDifferenceVersion()Z
    .locals 13

    .prologue
    const/4 v12, 0x0

    .line 369
    const/4 v1, 0x0

    .line 370
    .local v1, "assetsIn":Ljava/io/InputStream;
    const/4 v4, 0x0

    .line 373
    .local v4, "cacheIn":Ljava/io/InputStream;
    :try_start_0
    iget-object v9, p0, Lcom/kaf/KafManager;->appContext:Landroid/content/Context;

    invoke-virtual {v9}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v9

    const-string v10, "kaf_conf.xml"

    invoke-virtual {v9, v10}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 374
    invoke-direct {p0, v1}, Lcom/kaf/KafManager;->createDocument(Ljava/io/InputStream;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 375
    .local v0, "assetsDocument":Lorg/w3c/dom/Document;
    invoke-interface {v0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/kaf/KafManager;->getKafVersion(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v2

    .line 378
    .local v2, "assetsKafVersion":Ljava/lang/String;
    iget-object v9, p0, Lcom/kaf/KafManager;->kafConfFile:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_5

    .line 379
    new-instance v5, Ljava/io/FileInputStream;

    iget-object v9, p0, Lcom/kaf/KafManager;->kafConfFile:Ljava/io/File;

    invoke-direct {v5, v9}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 380
    .end local v4    # "cacheIn":Ljava/io/InputStream;
    .local v5, "cacheIn":Ljava/io/InputStream;
    :try_start_1
    invoke-direct {p0, v5}, Lcom/kaf/KafManager;->createDocument(Ljava/io/InputStream;)Lorg/w3c/dom/Document;

    move-result-object v3

    .line 381
    .local v3, "cacheDocument":Lorg/w3c/dom/Document;
    invoke-interface {v3}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/kaf/KafManager;->getKafVersion(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v6

    .line 383
    .local v6, "cacheKafVersion":Ljava/lang/String;
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_6
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result v9

    if-eqz v9, :cond_2

    .line 401
    if-eqz v1, :cond_0

    .line 402
    :try_start_2
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 404
    :cond_0
    if-eqz v5, :cond_1

    .line 405
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :cond_1
    :goto_0
    move-object v4, v5

    .end local v5    # "cacheIn":Ljava/io/InputStream;
    .restart local v4    # "cacheIn":Ljava/io/InputStream;
    move v9, v12

    .line 398
    .end local v0    # "assetsDocument":Lorg/w3c/dom/Document;
    .end local v2    # "assetsKafVersion":Ljava/lang/String;
    .end local v3    # "cacheDocument":Lorg/w3c/dom/Document;
    .end local v6    # "cacheKafVersion":Ljava/lang/String;
    :goto_1
    return v9

    .line 407
    .end local v4    # "cacheIn":Ljava/io/InputStream;
    .restart local v0    # "assetsDocument":Lorg/w3c/dom/Document;
    .restart local v2    # "assetsKafVersion":Ljava/lang/String;
    .restart local v3    # "cacheDocument":Lorg/w3c/dom/Document;
    .restart local v5    # "cacheIn":Ljava/io/InputStream;
    .restart local v6    # "cacheKafVersion":Ljava/lang/String;
    :catch_0
    move-exception v9

    move-object v8, v9

    .local v8, "ex":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 388
    .end local v8    # "ex":Ljava/lang/Exception;
    :cond_2
    :try_start_3
    const-string v9, "KAF"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "[KafManager.isDifferenceVersion] newKafVersion = "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 389
    const-string v9, "KAF"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "[KafManager.isDifferenceVersion] preKafVersion = "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_6
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 401
    if-eqz v1, :cond_3

    .line 402
    :try_start_4
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 404
    :cond_3
    if-eqz v5, :cond_4

    .line 405
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 390
    :cond_4
    :goto_2
    const/4 v9, 0x1

    move-object v4, v5

    .end local v5    # "cacheIn":Ljava/io/InputStream;
    .restart local v4    # "cacheIn":Ljava/io/InputStream;
    goto :goto_1

    .line 407
    .end local v4    # "cacheIn":Ljava/io/InputStream;
    .restart local v5    # "cacheIn":Ljava/io/InputStream;
    :catch_1
    move-exception v9

    move-object v8, v9

    .restart local v8    # "ex":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2

    .line 401
    .end local v3    # "cacheDocument":Lorg/w3c/dom/Document;
    .end local v5    # "cacheIn":Ljava/io/InputStream;
    .end local v6    # "cacheKafVersion":Ljava/lang/String;
    .end local v8    # "ex":Ljava/lang/Exception;
    .restart local v4    # "cacheIn":Ljava/io/InputStream;
    :cond_5
    if-eqz v1, :cond_6

    .line 402
    :try_start_5
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 404
    :cond_6
    if-eqz v4, :cond_7

    .line 405
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    :cond_7
    :goto_3
    move v9, v12

    .line 394
    goto :goto_1

    .line 407
    :catch_2
    move-exception v9

    move-object v8, v9

    .restart local v8    # "ex":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3

    .line 396
    .end local v0    # "assetsDocument":Lorg/w3c/dom/Document;
    .end local v2    # "assetsKafVersion":Ljava/lang/String;
    .end local v8    # "ex":Ljava/lang/Exception;
    :catch_3
    move-exception v9

    move-object v7, v9

    .line 397
    .local v7, "e":Ljava/lang/Exception;
    :goto_4
    :try_start_6
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 401
    if-eqz v1, :cond_8

    .line 402
    :try_start_7
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 404
    :cond_8
    if-eqz v4, :cond_9

    .line 405
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4

    :cond_9
    :goto_5
    move v9, v12

    .line 398
    goto :goto_1

    .line 407
    :catch_4
    move-exception v9

    move-object v8, v9

    .restart local v8    # "ex":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_5

    .line 399
    .end local v7    # "e":Ljava/lang/Exception;
    .end local v8    # "ex":Ljava/lang/Exception;
    :catchall_0
    move-exception v9

    .line 401
    :goto_6
    if-eqz v1, :cond_a

    .line 402
    :try_start_8
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 404
    :cond_a
    if-eqz v4, :cond_b

    .line 405
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_5

    .line 408
    :cond_b
    :goto_7
    throw v9

    .line 407
    :catch_5
    move-exception v10

    move-object v8, v10

    .restart local v8    # "ex":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_7

    .line 399
    .end local v4    # "cacheIn":Ljava/io/InputStream;
    .end local v8    # "ex":Ljava/lang/Exception;
    .restart local v0    # "assetsDocument":Lorg/w3c/dom/Document;
    .restart local v2    # "assetsKafVersion":Ljava/lang/String;
    .restart local v5    # "cacheIn":Ljava/io/InputStream;
    :catchall_1
    move-exception v9

    move-object v4, v5

    .end local v5    # "cacheIn":Ljava/io/InputStream;
    .restart local v4    # "cacheIn":Ljava/io/InputStream;
    goto :goto_6

    .line 396
    .end local v4    # "cacheIn":Ljava/io/InputStream;
    .restart local v5    # "cacheIn":Ljava/io/InputStream;
    :catch_6
    move-exception v9

    move-object v7, v9

    move-object v4, v5

    .end local v5    # "cacheIn":Ljava/io/InputStream;
    .restart local v4    # "cacheIn":Ljava/io/InputStream;
    goto :goto_4
.end method


# virtual methods
.method public Initialize(Landroid/content/Context;I)I
    .locals 26
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "copyright"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 167
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/kaf/KafManager;->isLibraryInit:Z

    .line 168
    if-nez p1, :cond_0

    new-instance v20, Ljava/lang/IllegalArgumentException;

    const-string v21, "Context value is null"

    invoke-direct/range {v20 .. v21}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 169
    :cond_0
    if-eqz p2, :cond_1

    const/16 v20, 0x1

    move/from16 v0, p2

    move/from16 v1, v20

    if-eq v0, v1, :cond_1

    new-instance v20, Ljava/lang/IllegalArgumentException;

    const-string v21, "Invalid copyright"

    invoke-direct/range {v20 .. v21}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 171
    :cond_1
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/kaf/KafManager;->appContext:Landroid/content/Context;

    .line 172
    const-string v20, "KAF"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string v22, " **** Inf KafManager.Initialize("

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v22, Lcom/kaf/KafManager;->IKAF_VERSION:Ljava/lang/String;

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, ") ****"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v20

    sget-object v21, Lcom/kaf/KafManager;->SHOW_STORE_PACKAGE_NAME:Ljava/lang/String;

    const/16 v22, 0x80

    invoke-virtual/range {v20 .. v22}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v5

    .line 183
    .local v5, "ai":Landroid/content/pm/ApplicationInfo;
    if-nez v5, :cond_2

    .line 184
    const/16 v20, -0x1

    .line 345
    .end local v5    # "ai":Landroid/content/pm/ApplicationInfo;
    :goto_0
    return v20

    .line 186
    .restart local v5    # "ai":Landroid/content/pm/ApplicationInfo;
    :cond_2
    iget-object v7, v5, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    .line 187
    .local v7, "dataDir":Ljava/lang/String;
    new-instance v20, Ljava/io/File;

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v22, "/lib"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/kaf/KafManager;->jarDir:Ljava/io/File;

    .line 188
    new-instance v20, Ljava/io/File;

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v22, "/kafcache"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/kaf/KafManager;->cacheDir:Ljava/io/File;

    .line 189
    new-instance v20, Ljava/io/File;

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v22, "/lib/libkafdex.so"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/kaf/KafManager;->jarFile:Ljava/io/File;

    .line 190
    new-instance v20, Ljava/io/File;

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v22, "/kafcache/device_info.xml"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/kaf/KafManager;->devInfoFile:Ljava/io/File;

    .line 191
    new-instance v20, Ljava/io/File;

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v22, "/kafcache/kaf_conf.xml"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/kaf/KafManager;->kafConfFile:Ljava/io/File;

    .line 192
    new-instance v13, Ljava/io/File;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v21, "/lib/libkaf.so"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object v0, v13

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 193
    .local v13, "libKafFile":Ljava/io/File;
    new-instance v12, Ljava/io/File;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v21, "/lib/libkafdex.so"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object v0, v12

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 194
    .local v12, "libKafDexFile":Ljava/io/File;
    new-instance v15, Ljava/io/File;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v21, "/lib/libktuca-lite.so"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object v0, v15

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 195
    .local v15, "libKafUcaFile":Ljava/io/File;
    new-instance v14, Ljava/io/File;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v21, "/lib/libmedia_jni_kaf.so"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object v0, v14

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 197
    .local v14, "libKafMediaFile":Ljava/io/File;
    invoke-direct/range {p0 .. p1}, Lcom/kaf/KafManager;->getInitializeStatus(Landroid/content/Context;)I

    move-result v10

    .line 198
    .local v10, "initStatus":I
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v18

    .line 199
    .local v18, "packageName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/kaf/KafManager;->appContext:Landroid/content/Context;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v20

    sget-object v21, Lcom/kaf/KafManager;->SHOW_STORE_PACKAGE_NAME:Ljava/lang/String;

    invoke-virtual/range {v20 .. v21}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_8

    .line 201
    invoke-direct/range {p0 .. p0}, Lcom/kaf/KafManager;->isDifferenceVersion()Z

    move-result v20

    if-eqz v20, :cond_3

    .line 203
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/kaf/KafManager;->cacheDir:Ljava/io/File;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->exists()Z

    move-result v20

    if-eqz v20, :cond_3

    .line 205
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/kaf/KafManager;->cacheDir:Ljava/io/File;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/kaf/KafManager;->deleteDir(Ljava/io/File;)V

    .line 207
    new-instance v19, Landroid/content/ContentValues;

    invoke-direct/range {v19 .. v19}, Landroid/content/ContentValues;-><init>()V

    .line 208
    .local v19, "values":Landroid/content/ContentValues;
    sget-object v20, Lcom/kaf/KafManager;->CN_NAME:Ljava/lang/String;

    const-string v21, "kaf_init_status"

    invoke-virtual/range {v19 .. v21}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 209
    sget-object v20, Lcom/kaf/KafManager;->CN_VALUE:Ljava/lang/String;

    const/16 v21, 0x0

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    invoke-virtual/range {v19 .. v21}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 210
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v20

    new-instance v21, Ljava/lang/StringBuilder;

    sget-object v22, Lcom/kaf/KafManager;->KAF_MANAGER_CONTENT_URI:Ljava/lang/String;

    invoke-static/range {v22 .. v22}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v22, "/kaf_info"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v21

    const-string v22, "name=?"

    const/16 v23, 0x1

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    const-string v25, "kaf_init_status"

    aput-object v25, v23, v24

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    move-object/from16 v2, v19

    move-object/from16 v3, v22

    move-object/from16 v4, v23

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 213
    .end local v19    # "values":Landroid/content/ContentValues;
    :cond_3
    invoke-virtual {v13}, Ljava/io/File;->exists()Z

    move-result v20

    if-eqz v20, :cond_4

    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    move-result v20

    if-eqz v20, :cond_4

    invoke-virtual {v15}, Ljava/io/File;->exists()Z

    move-result v20

    if-eqz v20, :cond_4

    invoke-virtual {v14}, Ljava/io/File;->exists()Z

    move-result v20

    if-nez v20, :cond_5

    .line 245
    :cond_4
    const/16 v20, -0x6

    goto/16 :goto_0

    .line 247
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/kaf/KafManager;->cacheDir:Ljava/io/File;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->exists()Z

    move-result v20

    if-eqz v20, :cond_6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/kaf/KafManager;->jarFile:Ljava/io/File;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->exists()Z

    move-result v20

    if-eqz v20, :cond_6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/kaf/KafManager;->devInfoFile:Ljava/io/File;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->exists()Z

    move-result v20

    if-eqz v20, :cond_6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/kaf/KafManager;->kafConfFile:Ljava/io/File;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->exists()Z

    move-result v20

    if-nez v20, :cond_d

    .line 248
    :cond_6
    new-instance v11, Landroid/content/Intent;

    invoke-direct {v11}, Landroid/content/Intent;-><init>()V

    .line 249
    .local v11, "intent":Landroid/content/Intent;
    sget-object v20, Lcom/kaf/KafManager;->ACTION_KAF_LIB_INSTALL:Ljava/lang/String;

    move-object v0, v11

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 250
    const/16 v20, 0x3

    move v0, v10

    move/from16 v1, v20

    if-eq v0, v1, :cond_7

    .line 252
    const-string v20, "initialize_command"

    const-string v21, "1"

    move-object v0, v11

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 258
    :goto_1
    const-string v20, "package_name"

    move-object v0, v11

    move-object/from16 v1, v20

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 259
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/kaf/KafManager;->appContext:Landroid/content/Context;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object v1, v11

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 261
    const/16 v20, -0x5

    goto/16 :goto_0

    .line 255
    :cond_7
    const-string v20, "initialize_command"

    const-string v21, "2"

    move-object v0, v11

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    .line 282
    .end local v5    # "ai":Landroid/content/pm/ApplicationInfo;
    .end local v7    # "dataDir":Ljava/lang/String;
    .end local v10    # "initStatus":I
    .end local v11    # "intent":Landroid/content/Intent;
    .end local v12    # "libKafDexFile":Ljava/io/File;
    .end local v13    # "libKafFile":Ljava/io/File;
    .end local v14    # "libKafMediaFile":Ljava/io/File;
    .end local v15    # "libKafUcaFile":Ljava/io/File;
    .end local v18    # "packageName":Ljava/lang/String;
    :catch_0
    move-exception v20

    move-object/from16 v9, v20

    .line 283
    .local v9, "ex":Landroid/content/pm/PackageManager$NameNotFoundException;
    :try_start_1
    invoke-virtual {v9}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 285
    :try_start_2
    new-instance v11, Landroid/content/Intent;

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v20

    const-class v21, Lcom/kaf/KafInstallAlertActivity;

    move-object v0, v11

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 286
    .restart local v11    # "intent":Landroid/content/Intent;
    const/high16 v20, 0x10000000

    move-object v0, v11

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 287
    move-object/from16 v0, p1

    move-object v1, v11

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_2
    .catch Landroid/content/ActivityNotFoundException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 324
    .end local v11    # "intent":Landroid/content/Intent;
    :goto_2
    const/16 v20, -0x4

    goto/16 :goto_0

    .line 264
    .end local v9    # "ex":Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v5    # "ai":Landroid/content/pm/ApplicationInfo;
    .restart local v7    # "dataDir":Ljava/lang/String;
    .restart local v10    # "initStatus":I
    .restart local v12    # "libKafDexFile":Ljava/io/File;
    .restart local v13    # "libKafFile":Ljava/io/File;
    .restart local v14    # "libKafMediaFile":Ljava/io/File;
    .restart local v15    # "libKafUcaFile":Ljava/io/File;
    .restart local v18    # "packageName":Ljava/lang/String;
    :cond_8
    const/16 v20, 0x9

    move v0, v10

    move/from16 v1, v20

    if-ne v0, v1, :cond_9

    const/16 v20, -0x1

    goto/16 :goto_0

    .line 265
    :cond_9
    const/16 v20, 0x3

    move v0, v10

    move/from16 v1, v20

    if-ne v0, v1, :cond_a

    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/kaf/KafManager;->cacheDir:Ljava/io/File;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->exists()Z

    move-result v20

    if-eqz v20, :cond_a

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/kaf/KafManager;->jarFile:Ljava/io/File;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->exists()Z

    move-result v20

    if-nez v20, :cond_d

    .line 266
    :cond_a
    new-instance v11, Landroid/content/Intent;

    invoke-direct {v11}, Landroid/content/Intent;-><init>()V

    .line 267
    .restart local v11    # "intent":Landroid/content/Intent;
    sget-object v20, Lcom/kaf/KafManager;->ACTION_KAF_LIB_INSTALL:Ljava/lang/String;

    move-object v0, v11

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 268
    const/16 v20, 0x3

    move v0, v10

    move/from16 v1, v20

    if-eq v0, v1, :cond_b

    .line 270
    const-string v20, "initialize_command"

    const-string v21, "1"

    move-object v0, v11

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 276
    :goto_3
    const-string v20, "package_name"

    move-object v0, v11

    move-object/from16 v1, v20

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 277
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/kaf/KafManager;->appContext:Landroid/content/Context;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object v1, v11

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 279
    const/16 v20, -0x5

    goto/16 :goto_0

    .line 273
    :cond_b
    const-string v20, "initialize_command"

    const-string v21, "2"

    move-object v0, v11

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    :try_end_3
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_3

    .line 338
    .end local v5    # "ai":Landroid/content/pm/ApplicationInfo;
    .end local v7    # "dataDir":Ljava/lang/String;
    .end local v10    # "initStatus":I
    .end local v11    # "intent":Landroid/content/Intent;
    .end local v12    # "libKafDexFile":Ljava/io/File;
    .end local v13    # "libKafFile":Ljava/io/File;
    .end local v14    # "libKafMediaFile":Ljava/io/File;
    .end local v15    # "libKafUcaFile":Ljava/io/File;
    .end local v18    # "packageName":Ljava/lang/String;
    :catch_1
    move-exception v20

    move-object/from16 v8, v20

    .line 339
    .local v8, "e":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    .line 343
    .end local v8    # "e":Ljava/lang/Exception;
    :cond_c
    :goto_4
    const/16 v20, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/kaf/KafManager;->isLibraryInit:Z

    .line 345
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/kaf/KafManager;->iKafManager:Lcom/kaf/IKafManager;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    move/from16 v2, p2

    invoke-virtual {v0, v1, v2}, Lcom/kaf/IKafManager;->Initialize(Landroid/content/Context;I)I

    move-result v20

    goto/16 :goto_0

    .line 288
    .restart local v9    # "ex":Landroid/content/pm/PackageManager$NameNotFoundException;
    :catch_2
    move-exception v20

    move-object/from16 v8, v20

    .line 289
    .local v8, "e":Landroid/content/ActivityNotFoundException;
    :try_start_4
    new-instance v20, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 291
    sget-object v21, Lcom/kaf/KafManager;->MSG_SHOW_STORE_INSTALL:Ljava/lang/String;

    invoke-virtual/range {v20 .. v21}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v20

    .line 292
    sget-object v21, Lcom/kaf/KafManager;->TEXT_YES:Ljava/lang/String;

    new-instance v22, Lcom/kaf/KafManager$1;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/kaf/KafManager$1;-><init>(Lcom/kaf/KafManager;)V

    invoke-virtual/range {v20 .. v22}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v20

    .line 311
    sget-object v21, Lcom/kaf/KafManager;->TEXT_NO:Ljava/lang/String;

    new-instance v22, Lcom/kaf/KafManager$2;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/kaf/KafManager$2;-><init>(Lcom/kaf/KafManager;)V

    invoke-virtual/range {v20 .. v22}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v20

    .line 322
    invoke-virtual/range {v20 .. v20}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto/16 :goto_2

    .line 327
    .end local v8    # "e":Landroid/content/ActivityNotFoundException;
    .end local v9    # "ex":Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v5    # "ai":Landroid/content/pm/ApplicationInfo;
    .restart local v7    # "dataDir":Ljava/lang/String;
    .restart local v10    # "initStatus":I
    .restart local v12    # "libKafDexFile":Ljava/io/File;
    .restart local v13    # "libKafFile":Ljava/io/File;
    .restart local v14    # "libKafMediaFile":Ljava/io/File;
    .restart local v15    # "libKafUcaFile":Ljava/io/File;
    .restart local v18    # "packageName":Ljava/lang/String;
    :cond_d
    sget-object v20, Lcom/kaf/KafManager;->kafManager:Lcom/kaf/KafManager;

    if-eqz v20, :cond_e

    sget-object v20, Lcom/kaf/KafManager;->kafManager:Lcom/kaf/KafManager;

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/kaf/KafManager;->iKafManager:Lcom/kaf/IKafManager;

    move-object/from16 v20, v0

    if-nez v20, :cond_c

    .line 328
    :cond_e
    new-instance v20, Ldalvik/system/DexClassLoader;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/kaf/KafManager;->jarFile:Ljava/io/File;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/kaf/KafManager;->cacheDir:Ljava/io/File;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v22

    const/16 v23, 0x0

    sget-object v24, Lcom/kaf/KafManager;->kafManager:Lcom/kaf/KafManager;

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v24

    invoke-direct/range {v20 .. v24}, Ldalvik/system/DexClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/kaf/KafManager;->cl:Ldalvik/system/DexClassLoader;

    .line 329
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/kaf/KafManager;->cl:Ldalvik/system/DexClassLoader;

    move-object/from16 v20, v0

    sget-object v21, Lcom/kaf/KafManager;->KAFMANAGER_CLASS_NAME:Ljava/lang/String;

    invoke-virtual/range {v20 .. v21}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    .line 330
    .local v6, "clazz":Ljava/lang/Class;
    invoke-virtual {v6}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v17

    .line 332
    .local v17, "o":Ljava/lang/Object;
    const-string v20, "getInstance"

    const/16 v21, 0x0

    move-object v0, v6

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v16

    .line 333
    .local v16, "method":Ljava/lang/reflect/Method;
    sget-object v20, Lcom/kaf/KafManager;->kafManager:Lcom/kaf/KafManager;

    const/16 v21, 0x0

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .end local v5    # "ai":Landroid/content/pm/ApplicationInfo;
    check-cast v5, Lcom/kaf/IKafManager;

    move-object v0, v5

    move-object/from16 v1, v20

    iput-object v0, v1, Lcom/kaf/KafManager;->iKafManager:Lcom/kaf/IKafManager;

    .line 336
    const-string v20, "class loader *****"

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/kaf/KafManager;->cl:Ldalvik/system/DexClassLoader;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_4
.end method

.method public checkInit(I)V
    .locals 3
    .param p1, "apiLevel"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 142
    invoke-virtual {p0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    const-string v2, "KAF Library is not loaded."

    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 143
    :cond_0
    iget-object v0, p0, Lcom/kaf/KafManager;->iKafManager:Lcom/kaf/IKafManager;

    invoke-virtual {v0, p1}, Lcom/kaf/IKafManager;->checkInit(I)V

    .line 144
    return-void
.end method

.method public getAppId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 515
    iget-object v0, p0, Lcom/kaf/KafManager;->iKafManager:Lcom/kaf/IKafManager;

    invoke-virtual {v0}, Lcom/kaf/IKafManager;->getAppId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getBcmSocket()Lcom/kaf/net/IBcmSocket;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 583
    iget-object v0, p0, Lcom/kaf/KafManager;->iKafManager:Lcom/kaf/IKafManager;

    invoke-virtual {v0}, Lcom/kaf/IKafManager;->getBcmSocket()Lcom/kaf/net/IBcmSocket;

    move-result-object v0

    return-object v0
.end method

.method public getBcmSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;ILjava/lang/String;Ljava/lang/String;CZ)Lcom/kaf/net/IBcmSocket;
    .locals 9
    .param p1, "dstAddress"    # Ljava/net/InetAddress;
    .param p2, "dstPort"    # I
    .param p3, "localAddress"    # Ljava/net/InetAddress;
    .param p4, "localPort"    # I
    .param p5, "appid"    # Ljava/lang/String;
    .param p6, "billKind"    # Ljava/lang/String;
    .param p7, "connectKind"    # C
    .param p8, "isTestMode"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/SecurityException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 589
    iget-object v0, p0, Lcom/kaf/KafManager;->iKafManager:Lcom/kaf/IKafManager;

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    move-object v5, p5

    move-object v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-virtual/range {v0 .. v8}, Lcom/kaf/IKafManager;->getBcmSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;ILjava/lang/String;Ljava/lang/String;CZ)Lcom/kaf/net/IBcmSocket;

    move-result-object v0

    return-object v0
.end method

.method public getDebug()Lcom/kaf/log/IDebug;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 596
    iget-object v0, p0, Lcom/kaf/KafManager;->iKafManager:Lcom/kaf/IKafManager;

    invoke-virtual {v0}, Lcom/kaf/IKafManager;->getDebug()Lcom/kaf/log/IDebug;

    move-result-object v0

    return-object v0
.end method

.method public getDeviceControl()Lcom/kaf/device/IDeviceControl;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 538
    iget-object v0, p0, Lcom/kaf/KafManager;->iKafManager:Lcom/kaf/IKafManager;

    invoke-virtual {v0}, Lcom/kaf/IKafManager;->getDeviceControl()Lcom/kaf/device/IDeviceControl;

    move-result-object v0

    return-object v0
.end method

.method public getDexClassLoader()Ldalvik/system/DexClassLoader;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 524
    iget-object v0, p0, Lcom/kaf/KafManager;->cl:Ldalvik/system/DexClassLoader;

    return-object v0
.end method

.method public getDisplayManager()Lcom/kaf/display/IDisplayManager;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 544
    iget-object v0, p0, Lcom/kaf/KafManager;->iKafManager:Lcom/kaf/IKafManager;

    invoke-virtual {v0}, Lcom/kaf/IKafManager;->getDisplayManager()Lcom/kaf/display/IDisplayManager;

    move-result-object v0

    return-object v0
.end method

.method public getMediaManager()Lcom/kaf/media/IMediaManager;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 556
    iget-object v0, p0, Lcom/kaf/KafManager;->iKafManager:Lcom/kaf/IKafManager;

    invoke-virtual {v0}, Lcom/kaf/IKafManager;->getMediaManager()Lcom/kaf/media/IMediaManager;

    move-result-object v0

    return-object v0
.end method

.method public getNetwork()Lcom/kaf/net/Network;
    .locals 1

    .prologue
    .line 571
    new-instance v0, Lcom/kaf/net/Network;

    invoke-direct {v0}, Lcom/kaf/net/Network;-><init>()V

    return-object v0
.end method

.method public getNetworkInstance()Lcom/kaf/net/INetwork;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 577
    iget-object v0, p0, Lcom/kaf/KafManager;->iKafManager:Lcom/kaf/IKafManager;

    invoke-virtual {v0}, Lcom/kaf/IKafManager;->getNetworkInstance()Lcom/kaf/net/INetwork;

    move-result-object v0

    return-object v0
.end method

.method public getProperty()Lcom/kaf/sys/IProperty;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 550
    iget-object v0, p0, Lcom/kaf/KafManager;->iKafManager:Lcom/kaf/IKafManager;

    invoke-virtual {v0}, Lcom/kaf/IKafManager;->getProperty()Lcom/kaf/sys/IProperty;

    move-result-object v0

    return-object v0
.end method

.method public getSound()Lcom/kaf/sound/ISound;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 562
    iget-object v0, p0, Lcom/kaf/KafManager;->iKafManager:Lcom/kaf/IKafManager;

    invoke-virtual {v0}, Lcom/kaf/IKafManager;->getSound()Lcom/kaf/sound/ISound;

    move-result-object v0

    return-object v0
.end method

.method public isKafLibraryInit()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 532
    iget-boolean v0, p0, Lcom/kaf/KafManager;->isLibraryInit:Z

    return v0
.end method

.method public reinstallKTAppStore()V
    .locals 6

    .prologue
    const/high16 v5, 0x10000000

    .line 349
    new-instance v0, Ljava/io/File;

    iget-object v3, p0, Lcom/kaf/KafManager;->appContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 351
    .local v0, "apkFile":Ljava/io/File;
    iget-object v3, p0, Lcom/kaf/KafManager;->appContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/kaf/KafManager;->SHOW_STORE_PACKAGE_NAME:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 352
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 353
    new-instance v1, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 354
    .local v1, "intent":Landroid/content/Intent;
    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    const-string v4, "application/vnd.android.package-archive"

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 355
    invoke-virtual {v1, v5}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 356
    iget-object v3, p0, Lcom/kaf/KafManager;->appContext:Landroid/content/Context;

    invoke-virtual {v3, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 366
    .end local v1    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 358
    :cond_0
    sget-object v3, Lcom/kaf/KafManager;->SHOW_STORE_DOWNLOAD_URL:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 359
    .local v2, "uri":Landroid/net/Uri;
    new-instance v1, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-direct {v1, v3, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 360
    .restart local v1    # "intent":Landroid/content/Intent;
    invoke-virtual {v1, v5}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 361
    iget-object v3, p0, Lcom/kaf/KafManager;->appContext:Landroid/content/Context;

    invoke-virtual {v3, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 364
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "uri":Landroid/net/Uri;
    :cond_1
    const-string v3, "KAF"

    const-string v4, "is not KTAppStore"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
