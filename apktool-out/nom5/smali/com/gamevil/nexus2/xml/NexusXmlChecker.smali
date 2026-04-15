.class public Lcom/gamevil/nexus2/xml/NexusXmlChecker;
.super Landroid/os/AsyncTask;
.source "NexusXmlChecker.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# static fields
.field private static final APPID:Ljava/lang/String; = "appId"

.field private static final CALLBACK_URL:Ljava/lang/String; = "callback_url"

.field private static final CARRIER:Ljava/lang/String; = "profile_carrier"

.field private static final MAX_TIME_BLOCK:I = 0xf

.field private static final MESSAGE:Ljava/lang/String; = "message"

.field private static final NEWS_URL:Ljava/lang/String; = "newsBanner_url"

.field private static final PACKAGE:Ljava/lang/String; = "profile_package"

.field private static final START_TAG:Ljava/lang/String; = "profile"

.field private static final TITLE:Ljava/lang/String; = "title"

.field private static final TYPE:Ljava/lang/String; = "profile_type"

.field private static final VERSION:Ljava/lang/String; = "profile_version"


# instance fields
.field private final ACTION_TYYPE_ALERT:Ljava/lang/String;

.field private final ACTION_TYYPE_NEWS:Ljava/lang/String;

.field private final ACTION_TYYPE_UPDATE:Ljava/lang/String;

.field private final CARRIER_GLOBAL:Ljava/lang/String;

.field private final CARRIER_IOS:Ljava/lang/String;

.field private final CARRIER_KTF:Ljava/lang/String;

.field private final CARRIER_LGT:Ljava/lang/String;

.field private final CARRIER_SKT:Ljava/lang/String;

.field private actionType:Ljava/lang/String;

.field private callbackUrl:Ljava/lang/String;

.field private carrier:Ljava/lang/String;

.field private currentVersion:Ljava/lang/String;

.field private isNewVersion:Z

.field private mHandler:Landroid/os/Handler;

.field private message:Ljava/lang/String;

.field private newsBannerUrl:Ljava/lang/String;

.field private productID:Ljava/lang/String;

.field task:Lcom/gamevil/nexus2/xml/NewsViewTask;

.field private title:Ljava/lang/String;

.field private version:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 99
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 62
    const-string v2, "ALERT"

    iput-object v2, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->ACTION_TYYPE_ALERT:Ljava/lang/String;

    .line 63
    const-string v2, "NEWS"

    iput-object v2, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->ACTION_TYYPE_NEWS:Ljava/lang/String;

    .line 64
    const-string v2, "UPDATE"

    iput-object v2, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->ACTION_TYYPE_UPDATE:Ljava/lang/String;

    .line 66
    const-string v2, "SKT"

    iput-object v2, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->CARRIER_SKT:Ljava/lang/String;

    .line 67
    const-string v2, "KTF"

    iput-object v2, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->CARRIER_KTF:Ljava/lang/String;

    .line 68
    const-string v2, "LGT"

    iput-object v2, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->CARRIER_LGT:Ljava/lang/String;

    .line 69
    const-string v2, "GLOBAL"

    iput-object v2, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->CARRIER_GLOBAL:Ljava/lang/String;

    .line 70
    const-string v2, "IOS"

    iput-object v2, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->CARRIER_IOS:Ljava/lang/String;

    .line 84
    iput-boolean v4, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->isNewVersion:Z

    .line 100
    iput-boolean v4, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->isNewVersion:Z

    .line 101
    iput-object v3, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->productID:Ljava/lang/String;

    .line 102
    iput-object v3, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->title:Ljava/lang/String;

    .line 103
    iput-object v3, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->message:Ljava/lang/String;

    .line 104
    iput-object v3, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->newsBannerUrl:Ljava/lang/String;

    .line 105
    iput-object v3, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->callbackUrl:Ljava/lang/String;

    .line 106
    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    iput-object v2, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->mHandler:Landroid/os/Handler;

    .line 108
    sget-object v2, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    invoke-virtual {v2}, Lcom/gamevil/nexus2/NexusGLActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 109
    .local v1, "pm":Landroid/content/pm/PackageManager;
    const-string v2, "1.0.0"

    iput-object v2, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->currentVersion:Ljava/lang/String;

    .line 111
    :try_start_0
    sget-object v2, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    invoke-virtual {v2}, Lcom/gamevil/nexus2/NexusGLActivity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    iget-object v2, v2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    iput-object v2, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->currentVersion:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    :goto_0
    invoke-virtual {p0}, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->loadSavedData()V

    .line 118
    return-void

    .line 112
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 114
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0
.end method

.method static synthetic access$2(Lcom/gamevil/nexus2/xml/NexusXmlChecker;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->callbackUrl:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$3(Lcom/gamevil/nexus2/xml/NexusXmlChecker;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->newsBannerUrl:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public checkedProfileXML()Z
    .locals 10

    .prologue
    const-wide/16 v8, 0x0

    const/4 v7, 0x0

    .line 364
    sget-object v5, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    invoke-virtual {v5, v7}, Lcom/gamevil/nexus2/NexusGLActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 365
    .local v4, "updateCheckData":Landroid/content/SharedPreferences;
    const-string v5, "profile_saveTime"

    invoke-interface {v4, v5, v8, v9}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    .line 368
    .local v0, "saveTime":J
    cmp-long v5, v0, v8

    if-nez v5, :cond_0

    move v5, v7

    .line 378
    :goto_0
    return v5

    .line 370
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long v2, v5, v0

    .line 373
    .local v2, "timeGap":J
    const-wide/16 v5, 0x3a98

    cmp-long v5, v2, v5

    if-gez v5, :cond_1

    .line 376
    const/4 v5, 0x1

    goto :goto_0

    :cond_1
    move v5, v7

    .line 378
    goto :goto_0
.end method

.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 24
    .param p1, "params"    # [Ljava/lang/String;

    .prologue
    .line 166
    sget-object v21, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    const v22, 0x7f08000d

    invoke-virtual/range {v21 .. v22}, Lcom/gamevil/nexus2/NexusGLActivity;->findViewById(I)Landroid/view/View;

    move-result-object v18

    check-cast v18, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;

    .line 167
    .local v18, "wv":Lcom/gamevil/nexus2/xml/GamevilLiveWebView;
    if-eqz v18, :cond_0

    invoke-virtual/range {v18 .. v18}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->checkNewEvent()V

    .line 171
    :cond_0
    const/16 v21, 0x1

    aget-object v21, p1, v21

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->isXmlModified(Ljava/lang/String;)Z

    move-result v21

    if-nez v21, :cond_1

    const-string v21, "DATA"

    .line 358
    :goto_0
    return-object v21

    .line 175
    :cond_1
    const/4 v14, 0x0

    .line 176
    .local v14, "isTitle":Z
    const/4 v12, 0x0

    .line 177
    .local v12, "isMessage":Z
    const/4 v10, 0x0

    .line 178
    .local v10, "isAppID":Z
    const/4 v13, 0x0

    .line 179
    .local v13, "isNewsUrl":Z
    const/4 v11, 0x0

    .line 181
    .local v11, "isCallbackUrl":Z
    sget-object v21, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v22, "@@@@@@@@ Start Parssig XML @@@@@@@"

    invoke-virtual/range {v21 .. v22}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 184
    sget-object v21, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    const/16 v22, 0x0

    invoke-virtual/range {v21 .. v22}, Lcom/gamevil/nexus2/NexusGLActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v17

    .line 185
    .local v17, "updateCheckData":Landroid/content/SharedPreferences;
    invoke-interface/range {v17 .. v17}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v15

    .line 189
    .local v15, "prefEditor":Landroid/content/SharedPreferences$Editor;
    :try_start_0
    new-instance v19, Ljava/net/URL;

    const/16 v21, 0x0

    aget-object v21, p1, v21

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 190
    .local v19, "xmlUrl":Ljava/net/URL;
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v7

    .line 191
    .local v7, "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    const/16 v21, 0x1

    move-object v0, v7

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/xmlpull/v1/XmlPullParserFactory;->setNamespaceAware(Z)V

    .line 192
    invoke-virtual {v7}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v20

    .line 193
    .local v20, "xpp":Lorg/xmlpull/v1/XmlPullParser;
    invoke-virtual/range {v19 .. v19}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v21

    const-string v22, "euc-kr"

    invoke-interface/range {v20 .. v22}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 198
    const/4 v9, 0x0

    .line 199
    .local v9, "idx":I
    const/16 v16, -0x1

    .line 200
    .local v16, "profileIdx":I
    invoke-interface/range {v20 .. v20}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v6

    .line 201
    .local v6, "eventType":I
    :goto_1
    const/16 v21, 0x1

    move v0, v6

    move/from16 v1, v21

    if-ne v0, v1, :cond_2

    .line 353
    .end local v6    # "eventType":I
    .end local v7    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v9    # "idx":I
    .end local v16    # "profileIdx":I
    .end local v19    # "xmlUrl":Ljava/net/URL;
    .end local v20    # "xpp":Lorg/xmlpull/v1/XmlPullParser;
    :goto_2
    const-string v21, "profile_saveTime"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v22

    move-object v0, v15

    move-object/from16 v1, v21

    move-wide/from16 v2, v22

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 355
    invoke-interface {v15}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 356
    sget-object v21, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v22, "@@@@@@@@ End Parssig XML @@@@@@@2"

    invoke-virtual/range {v21 .. v22}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 358
    const-string v21, "Data"

    goto :goto_0

    .line 203
    .restart local v6    # "eventType":I
    .restart local v7    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v9    # "idx":I
    .restart local v16    # "profileIdx":I
    .restart local v19    # "xmlUrl":Ljava/net/URL;
    .restart local v20    # "xpp":Lorg/xmlpull/v1/XmlPullParser;
    :cond_2
    if-eqz v6, :cond_3

    .line 205
    const/16 v21, 0x1

    move v0, v6

    move/from16 v1, v21

    if-eq v0, v1, :cond_3

    .line 207
    const/16 v21, 0x2

    move v0, v6

    move/from16 v1, v21

    if-ne v0, v1, :cond_13

    .line 209
    :try_start_1
    invoke-interface/range {v20 .. v20}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v21

    const-string v22, "profile"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_e

    .line 211
    invoke-interface/range {v20 .. v20}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v4

    .line 213
    .local v4, "attCount":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_3
    if-lt v8, v4, :cond_4

    .line 224
    const/4 v8, 0x0

    :goto_4
    if-lt v8, v4, :cond_6

    .line 232
    move/from16 v0, v16

    move v1, v9

    if-ne v0, v1, :cond_3

    .line 235
    const/4 v8, 0x0

    :goto_5
    if-lt v8, v4, :cond_7

    .line 343
    .end local v4    # "attCount":I
    .end local v8    # "i":I
    :cond_3
    :goto_6
    invoke-interface/range {v20 .. v20}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v6

    goto :goto_1

    .line 215
    .restart local v4    # "attCount":I
    .restart local v8    # "i":I
    :cond_4
    move-object/from16 v0, v20

    move v1, v8

    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v21

    const-string v22, "profile_package"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_5

    .line 217
    move-object/from16 v0, v20

    move v1, v8

    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v21

    sget-object v22, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    invoke-virtual/range {v22 .. v22}, Lcom/gamevil/nexus2/NexusGLActivity;->getPackageName()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_5

    .line 219
    move/from16 v16, v9

    .line 213
    :cond_5
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    .line 226
    :cond_6
    sget-object v21, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v23, "::"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v20

    move v1, v8

    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 227
    sget-object v21, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v23, "::"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v20

    move v1, v8

    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 224
    add-int/lit8 v8, v8, 0x1

    goto :goto_4

    .line 237
    :cond_7
    move-object/from16 v0, v20

    move v1, v8

    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v21

    const-string v22, "profile_package"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_9

    .line 239
    const-string v21, "profile_package"

    move-object/from16 v0, v20

    move v1, v8

    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v22

    move-object v0, v15

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 235
    :cond_8
    :goto_7
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_5

    .line 241
    :cond_9
    move-object/from16 v0, v20

    move v1, v8

    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v21

    const-string v22, "profile_version"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_b

    .line 244
    move-object/from16 v0, v20

    move v1, v8

    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->currentVersion:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_a

    .line 246
    const/16 v21, 0x1

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->isNewVersion:Z

    .line 248
    :cond_a
    const-string v21, "profile_version"

    move-object/from16 v0, v20

    move v1, v8

    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v22

    move-object v0, v15

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_7

    .line 345
    .end local v4    # "attCount":I
    .end local v6    # "eventType":I
    .end local v7    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v8    # "i":I
    .end local v9    # "idx":I
    .end local v16    # "profileIdx":I
    .end local v19    # "xmlUrl":Ljava/net/URL;
    .end local v20    # "xpp":Lorg/xmlpull/v1/XmlPullParser;
    :catch_0
    move-exception v21

    move-object/from16 v5, v21

    .line 347
    .local v5, "e":Lorg/xmlpull/v1/XmlPullParserException;
    invoke-virtual {v5}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    goto/16 :goto_2

    .line 250
    .end local v5    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    .restart local v4    # "attCount":I
    .restart local v6    # "eventType":I
    .restart local v7    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v8    # "i":I
    .restart local v9    # "idx":I
    .restart local v16    # "profileIdx":I
    .restart local v19    # "xmlUrl":Ljava/net/URL;
    .restart local v20    # "xpp":Lorg/xmlpull/v1/XmlPullParser;
    :cond_b
    :try_start_2
    move-object/from16 v0, v20

    move v1, v8

    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v21

    const-string v22, "profile_carrier"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_c

    .line 252
    move-object/from16 v0, v20

    move v1, v8

    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->carrier:Ljava/lang/String;

    .line 253
    const-string v21, "profile_carrier"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->carrier:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object v0, v15

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    :try_end_2
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_7

    .line 348
    .end local v4    # "attCount":I
    .end local v6    # "eventType":I
    .end local v7    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v8    # "i":I
    .end local v9    # "idx":I
    .end local v16    # "profileIdx":I
    .end local v19    # "xmlUrl":Ljava/net/URL;
    .end local v20    # "xpp":Lorg/xmlpull/v1/XmlPullParser;
    :catch_1
    move-exception v21

    move-object/from16 v5, v21

    .line 350
    .local v5, "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_2

    .line 255
    .end local v5    # "e":Ljava/io/IOException;
    .restart local v4    # "attCount":I
    .restart local v6    # "eventType":I
    .restart local v7    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v8    # "i":I
    .restart local v9    # "idx":I
    .restart local v16    # "profileIdx":I
    .restart local v19    # "xmlUrl":Ljava/net/URL;
    .restart local v20    # "xpp":Lorg/xmlpull/v1/XmlPullParser;
    :cond_c
    :try_start_3
    move-object/from16 v0, v20

    move v1, v8

    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v21

    const-string v22, "profile_type"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_d

    .line 257
    move-object/from16 v0, v20

    move v1, v8

    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->actionType:Ljava/lang/String;

    .line 258
    const-string v21, "profile_type"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->actionType:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object v0, v15

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto/16 :goto_7

    .line 260
    :cond_d
    move-object/from16 v0, v20

    move v1, v8

    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v21

    const-string v22, "appId"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_8

    .line 262
    const-string v21, "appId"

    move-object/from16 v0, v20

    move v1, v8

    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v22

    move-object v0, v15

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 263
    move-object/from16 v0, v20

    move v1, v8

    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->productID:Ljava/lang/String;

    goto/16 :goto_7

    .line 270
    .end local v4    # "attCount":I
    .end local v8    # "i":I
    :cond_e
    invoke-interface/range {v20 .. v20}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v21

    const-string v22, "title"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_f

    .line 272
    const/4 v14, 0x1

    goto/16 :goto_6

    .line 274
    :cond_f
    invoke-interface/range {v20 .. v20}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v21

    const-string v22, "message"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_10

    .line 276
    const/4 v12, 0x1

    goto/16 :goto_6

    .line 278
    :cond_10
    invoke-interface/range {v20 .. v20}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v21

    const-string v22, "appId"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_11

    .line 280
    const/4 v10, 0x1

    goto/16 :goto_6

    .line 282
    :cond_11
    invoke-interface/range {v20 .. v20}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v21

    const-string v22, "newsBanner_url"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_12

    .line 284
    const/4 v13, 0x1

    goto/16 :goto_6

    .line 286
    :cond_12
    invoke-interface/range {v20 .. v20}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v21

    const-string v22, "callback_url"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_3

    .line 288
    const/4 v11, 0x1

    goto/16 :goto_6

    .line 290
    :cond_13
    const/16 v21, 0x3

    move v0, v6

    move/from16 v1, v21

    if-ne v0, v1, :cond_14

    .line 291
    invoke-interface/range {v20 .. v20}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v21

    const-string v22, "profile"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_3

    .line 293
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_6

    .line 295
    :cond_14
    const/16 v21, 0x4

    move v0, v6

    move/from16 v1, v21

    if-ne v0, v1, :cond_3

    .line 296
    move/from16 v0, v16

    move v1, v9

    if-ne v0, v1, :cond_3

    .line 300
    if-eqz v14, :cond_15

    .line 302
    invoke-interface/range {v20 .. v20}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->title:Ljava/lang/String;

    .line 303
    const/4 v14, 0x0

    .line 304
    const-string v21, "title"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->title:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object v0, v15

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 308
    :cond_15
    if-eqz v12, :cond_16

    .line 310
    invoke-interface/range {v20 .. v20}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->message:Ljava/lang/String;

    .line 311
    const/4 v12, 0x0

    .line 312
    const-string v21, "message"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->message:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object v0, v15

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 316
    :cond_16
    if-eqz v10, :cond_17

    .line 318
    const/4 v10, 0x0

    .line 319
    invoke-interface/range {v20 .. v20}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->productID:Ljava/lang/String;

    .line 320
    const-string v21, "appId"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->productID:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object v0, v15

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 325
    :cond_17
    if-eqz v13, :cond_18

    .line 327
    const/4 v13, 0x0

    .line 328
    invoke-interface/range {v20 .. v20}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->newsBannerUrl:Ljava/lang/String;

    .line 329
    const-string v21, "newsBanner_url"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->newsBannerUrl:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object v0, v15

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 333
    :cond_18
    if-eqz v11, :cond_3

    .line 335
    const/4 v11, 0x0

    .line 336
    invoke-interface/range {v20 .. v20}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->callbackUrl:Ljava/lang/String;

    .line 337
    const-string v21, "callback_url"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->callbackUrl:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object v0, v15

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    :try_end_3
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto/16 :goto_6
.end method

.method public getProfileAttribute(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "_name"    # Ljava/lang/String;

    .prologue
    .line 383
    sget-object v1, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/gamevil/nexus2/NexusGLActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 384
    .local v0, "settingsLicense":Landroid/content/SharedPreferences;
    const-string v1, "??"

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public isXmlModified(Ljava/lang/String;)Z
    .locals 14
    .param p1, "_url"    # Ljava/lang/String;

    .prologue
    const/4 v13, 0x0

    .line 453
    sget-object v10, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    invoke-virtual {v10, v13}, Lcom/gamevil/nexus2/NexusGLActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 455
    .local v7, "settingsLicense":Landroid/content/SharedPreferences;
    :try_start_0
    new-instance v8, Ljava/net/URL;

    invoke-direct {v8, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 456
    .local v8, "text":Ljava/net/URL;
    invoke-virtual {v8}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v2

    .line 457
    .local v2, "isText":Ljava/io/InputStream;
    const/16 v10, 0x40

    new-array v0, v10, [B

    .line 458
    .local v0, "bText":[B
    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I

    move-result v4

    .line 459
    .local v4, "readSize":I
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v0}, Ljava/lang/String;-><init>([B)V

    .line 462
    .local v5, "response":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    .line 463
    .local v9, "xmlSaveTime":Ljava/lang/String;
    const-string v10, "xmlModifed"

    const/4 v11, 0x0

    invoke-interface {v7, v10, v11}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 464
    .local v6, "savedTime":Ljava/lang/String;
    sget-object v10, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "### xmlSaveTime = "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 465
    sget-object v10, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "### savedTime = "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 467
    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_0

    .line 469
    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    .line 470
    .local v3, "prefEditor":Landroid/content/SharedPreferences$Editor;
    const-string v10, "xmlModifed"

    invoke-interface {v3, v10, v9}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 471
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 472
    const/4 v10, 0x1

    .line 483
    .end local v0    # "bText":[B
    .end local v2    # "isText":Ljava/io/InputStream;
    .end local v3    # "prefEditor":Landroid/content/SharedPreferences$Editor;
    .end local v4    # "readSize":I
    .end local v5    # "response":Ljava/lang/String;
    .end local v6    # "savedTime":Ljava/lang/String;
    .end local v8    # "text":Ljava/net/URL;
    .end local v9    # "xmlSaveTime":Ljava/lang/String;
    :goto_0
    return v10

    .line 475
    :catch_0
    move-exception v10

    move-object v1, v10

    .line 477
    .local v1, "e":Ljava/net/MalformedURLException;
    invoke-virtual {v1}, Ljava/net/MalformedURLException;->printStackTrace()V

    .end local v1    # "e":Ljava/net/MalformedURLException;
    :cond_0
    :goto_1
    move v10, v13

    .line 483
    goto :goto_0

    .line 478
    :catch_1
    move-exception v10

    move-object v1, v10

    .line 480
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method

.method public loadSavedData()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 138
    sget-object v1, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/gamevil/nexus2/NexusGLActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 139
    .local v0, "_updateCheckData":Landroid/content/SharedPreferences;
    const-string v1, "appId"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->productID:Ljava/lang/String;

    .line 140
    const-string v1, "profile_carrier"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->carrier:Ljava/lang/String;

    .line 141
    const-string v1, "profile_type"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->actionType:Ljava/lang/String;

    .line 142
    const-string v1, "title"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->title:Ljava/lang/String;

    .line 143
    const-string v1, "message"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->message:Ljava/lang/String;

    .line 144
    const-string v1, "newsBanner_url"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->newsBannerUrl:Ljava/lang/String;

    .line 145
    const-string v1, "callback_url"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->callbackUrl:Ljava/lang/String;

    .line 146
    const-string v1, "profile_version"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->version:Ljava/lang/String;

    .line 147
    iget-object v1, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->version:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->version:Ljava/lang/String;

    iget-object v2, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->currentVersion:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 149
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->isNewVersion:Z

    .line 151
    :cond_0
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "+---------------------------------------------------"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 152
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "|\t[XML loadSavedData ]\t "

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 153
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "|\tactionType\t: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->actionType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 154
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "|\ttitle\t: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->title:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 155
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "|\tmessage\t: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->message:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 156
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "|\tnewsBannerUrl\t: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->newsBannerUrl:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 157
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "|\tcallbackUrl\t: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->callbackUrl:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 158
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "+---------------------------------------------------"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 159
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 4
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 401
    iget-object v1, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->actionType:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 403
    iget-object v1, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->actionType:Ljava/lang/String;

    const-string v2, "UPDATE"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->isNewVersion:Z

    if-eqz v1, :cond_1

    .line 405
    new-instance v1, Landroid/app/AlertDialog$Builder;

    sget-object v2, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 406
    iget-object v2, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->title:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 407
    iget-object v2, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->message:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 408
    const-string v2, "YES"

    new-instance v3, Lcom/gamevil/nexus2/xml/NexusXmlChecker$1;

    invoke-direct {v3, p0}, Lcom/gamevil/nexus2/xml/NexusXmlChecker$1;-><init>(Lcom/gamevil/nexus2/xml/NexusXmlChecker;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 414
    const-string v2, "NO"

    new-instance v3, Lcom/gamevil/nexus2/xml/NexusXmlChecker$2;

    invoke-direct {v3, p0}, Lcom/gamevil/nexus2/xml/NexusXmlChecker$2;-><init>(Lcom/gamevil/nexus2/xml/NexusXmlChecker;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 418
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 419
    .local v0, "alert":Landroid/app/Dialog;
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 448
    .end local v0    # "alert":Landroid/app/Dialog;
    :cond_0
    :goto_0
    return-void

    .line 421
    :cond_1
    iget-object v1, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->actionType:Ljava/lang/String;

    const-string v2, "ALERT"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 423
    new-instance v1, Landroid/app/AlertDialog$Builder;

    sget-object v2, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 424
    iget-object v2, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->title:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 425
    iget-object v2, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->message:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 426
    const-string v2, "OK"

    new-instance v3, Lcom/gamevil/nexus2/xml/NexusXmlChecker$3;

    invoke-direct {v3, p0}, Lcom/gamevil/nexus2/xml/NexusXmlChecker$3;-><init>(Lcom/gamevil/nexus2/xml/NexusXmlChecker;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 431
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 432
    .restart local v0    # "alert":Landroid/app/Dialog;
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    goto :goto_0

    .line 434
    .end local v0    # "alert":Landroid/app/Dialog;
    :cond_2
    iget-object v1, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->actionType:Ljava/lang/String;

    const-string v2, "NEWS"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 436
    iget-object v1, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->mHandler:Landroid/os/Handler;

    new-instance v2, Lcom/gamevil/nexus2/xml/NexusXmlChecker$4;

    invoke-direct {v2, p0}, Lcom/gamevil/nexus2/xml/NexusXmlChecker$4;-><init>(Lcom/gamevil/nexus2/xml/NexusXmlChecker;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public releaseAll()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 122
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->isNewVersion:Z

    .line 123
    iput-object v1, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->productID:Ljava/lang/String;

    .line 124
    iput-object v1, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->title:Ljava/lang/String;

    .line 125
    iput-object v1, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->message:Ljava/lang/String;

    .line 126
    iput-object v1, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->newsBannerUrl:Ljava/lang/String;

    .line 127
    iput-object v1, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->callbackUrl:Ljava/lang/String;

    .line 128
    iput-object v1, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->mHandler:Landroid/os/Handler;

    .line 129
    iget-object v0, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->task:Lcom/gamevil/nexus2/xml/NewsViewTask;

    if-eqz v0, :cond_0

    .line 131
    invoke-static {}, Lcom/gamevil/nexus2/xml/NewsViewTask;->releaseAll()V

    .line 132
    iput-object v1, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->task:Lcom/gamevil/nexus2/xml/NewsViewTask;

    .line 134
    :cond_0
    return-void
.end method

.method public saveLicensedStatus()V
    .locals 4

    .prologue
    .line 392
    sget-object v2, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/gamevil/nexus2/NexusGLActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 393
    .local v1, "settingsLicense":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 394
    .local v0, "prefEditor":Landroid/content/SharedPreferences$Editor;
    const-string v2, "licensed"

    const/4 v3, 0x1

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 395
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 396
    return-void
.end method
