.class public Lcom/feelingk/iap/net/IAPNet;
.super Ljava/lang/Object;
.source "IAPNet.java"


# static fields
.field static final TAG:Ljava/lang/String; = "IAPNet"

.field private static connect:Z

.field private static connectBP:Z

.field private static inputStream:Ljava/io/InputStream;

.field private static inputStreamBP:Ljava/io/InputStream;

.field private static isInit:Z

.field private static isWifi:Z

.field private static outputStream:Ljava/io/OutputStream;

.field private static outputStreamBP:Ljava/io/OutputStream;

.field private static socketBP:Ljava/net/Socket;

.field private static socketGateway:Ljava/net/Socket;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 39
    sput-boolean v1, Lcom/feelingk/iap/net/IAPNet;->isWifi:Z

    .line 40
    sput-boolean v1, Lcom/feelingk/iap/net/IAPNet;->connectBP:Z

    .line 41
    sput-boolean v1, Lcom/feelingk/iap/net/IAPNet;->connect:Z

    .line 42
    sput-boolean v1, Lcom/feelingk/iap/net/IAPNet;->isInit:Z

    .line 44
    sput-object v0, Lcom/feelingk/iap/net/IAPNet;->socketGateway:Ljava/net/Socket;

    .line 45
    sput-object v0, Lcom/feelingk/iap/net/IAPNet;->inputStream:Ljava/io/InputStream;

    .line 46
    sput-object v0, Lcom/feelingk/iap/net/IAPNet;->outputStream:Ljava/io/OutputStream;

    .line 48
    sput-object v0, Lcom/feelingk/iap/net/IAPNet;->socketBP:Ljava/net/Socket;

    .line 49
    sput-object v0, Lcom/feelingk/iap/net/IAPNet;->inputStreamBP:Ljava/io/InputStream;

    .line 50
    sput-object v0, Lcom/feelingk/iap/net/IAPNet;->outputStreamBP:Ljava/io/OutputStream;

    .line 36
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static iapClose(Z)I
    .locals 4
    .param p0, "isResRelease"    # Z

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 162
    const-string v0, "IAPNet"

    const-string v1, "[ DEBUG ] Socket Close!"

    invoke-static {v0, v1}, Lcom/feelingk/iap/util/CommonF$LOGGER;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    :try_start_0
    sget-object v0, Lcom/feelingk/iap/net/IAPNet;->inputStream:Ljava/io/InputStream;

    if-eqz v0, :cond_0

    .line 165
    sget-object v0, Lcom/feelingk/iap/net/IAPNet;->inputStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 172
    :cond_0
    :goto_0
    :try_start_1
    sget-object v0, Lcom/feelingk/iap/net/IAPNet;->outputStream:Ljava/io/OutputStream;

    if-eqz v0, :cond_1

    .line 173
    sget-object v0, Lcom/feelingk/iap/net/IAPNet;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 180
    :cond_1
    :goto_1
    :try_start_2
    sget-object v0, Lcom/feelingk/iap/net/IAPNet;->socketGateway:Ljava/net/Socket;

    if-eqz v0, :cond_2

    .line 181
    sget-object v0, Lcom/feelingk/iap/net/IAPNet;->socketGateway:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 186
    :cond_2
    :goto_2
    sput-object v3, Lcom/feelingk/iap/net/IAPNet;->inputStream:Ljava/io/InputStream;

    .line 187
    sput-object v3, Lcom/feelingk/iap/net/IAPNet;->outputStream:Ljava/io/OutputStream;

    .line 188
    sput-object v3, Lcom/feelingk/iap/net/IAPNet;->socketGateway:Ljava/net/Socket;

    .line 190
    sput-boolean v2, Lcom/feelingk/iap/net/IAPNet;->connect:Z

    .line 191
    sput-boolean v2, Lcom/feelingk/iap/net/IAPNet;->isInit:Z

    .line 194
    return v2

    .line 183
    :catch_0
    move-exception v0

    goto :goto_2

    .line 175
    :catch_1
    move-exception v0

    goto :goto_1

    .line 167
    :catch_2
    move-exception v0

    goto :goto_0
.end method

.method protected static iapCloseBP(Z)I
    .locals 3
    .param p0, "isResRelease"    # Z

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 596
    :try_start_0
    sget-object v0, Lcom/feelingk/iap/net/IAPNet;->inputStreamBP:Ljava/io/InputStream;

    if-eqz v0, :cond_0

    .line 597
    sget-object v0, Lcom/feelingk/iap/net/IAPNet;->inputStreamBP:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 604
    :cond_0
    :goto_0
    :try_start_1
    sget-object v0, Lcom/feelingk/iap/net/IAPNet;->outputStreamBP:Ljava/io/OutputStream;

    if-eqz v0, :cond_1

    .line 605
    sget-object v0, Lcom/feelingk/iap/net/IAPNet;->outputStreamBP:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 611
    :cond_1
    :goto_1
    :try_start_2
    sget-object v0, Lcom/feelingk/iap/net/IAPNet;->socketBP:Ljava/net/Socket;

    if-eqz v0, :cond_2

    .line 612
    sget-object v0, Lcom/feelingk/iap/net/IAPNet;->socketBP:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 617
    :cond_2
    :goto_2
    sput-object v1, Lcom/feelingk/iap/net/IAPNet;->inputStreamBP:Ljava/io/InputStream;

    .line 618
    sput-object v1, Lcom/feelingk/iap/net/IAPNet;->outputStreamBP:Ljava/io/OutputStream;

    .line 619
    sput-object v1, Lcom/feelingk/iap/net/IAPNet;->socketBP:Ljava/net/Socket;

    .line 621
    sput-boolean v2, Lcom/feelingk/iap/net/IAPNet;->connectBP:Z

    .line 622
    return v2

    .line 614
    :catch_0
    move-exception v0

    goto :goto_2

    .line 607
    :catch_1
    move-exception v0

    goto :goto_1

    .line 599
    :catch_2
    move-exception v0

    goto :goto_0
.end method

.method protected static iapConnect(Lcom/feelingk/iap/net/ServerInfo;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/feelingk/iap/net/InitConfirm;
    .locals 10
    .param p0, "info"    # Lcom/feelingk/iap/net/ServerInfo;
    .param p1, "telecom"    # I
    .param p2, "mcid"    # Ljava/lang/String;
    .param p3, "min"    # Ljava/lang/String;
    .param p4, "bpServerIP"    # Ljava/lang/String;
    .param p5, "bpServerPort"    # I
    .param p6, "pID"    # Ljava/lang/String;
    .param p7, "pTID"    # Ljava/lang/String;
    .param p8, "pEncJumin"    # Ljava/lang/String;
    .param p9, "useBpServer"    # Z

    .prologue
    .line 67
    new-instance v0, Lcom/feelingk/iap/net/InitConfirm;

    invoke-direct {v0}, Lcom/feelingk/iap/net/InitConfirm;-><init>()V

    .line 68
    .local v0, "initConfirm":Lcom/feelingk/iap/net/InitConfirm;
    const-string v1, "IAPNet"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "[ DEBUG ] Server connect - Start : iapConnect Wifi= "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-boolean v3, Lcom/feelingk/iap/net/IAPNet;->isWifi:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    sget-boolean v1, Lcom/feelingk/iap/net/IAPNet;->connect:Z

    if-eqz v1, :cond_1

    .line 71
    const/4 p0, -0x1

    invoke-virtual {v0, p0}, Lcom/feelingk/iap/net/InitConfirm;->setResultCode(B)V

    .line 153
    .end local p0    # "info":Lcom/feelingk/iap/net/ServerInfo;
    .end local p1    # "telecom":I
    .end local p2    # "mcid":Ljava/lang/String;
    .end local p3    # "min":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v0

    .line 76
    .restart local p0    # "info":Lcom/feelingk/iap/net/ServerInfo;
    .restart local p1    # "telecom":I
    .restart local p2    # "mcid":Ljava/lang/String;
    .restart local p3    # "min":Ljava/lang/String;
    :cond_1
    :try_start_0
    sget-boolean v1, Lcom/feelingk/iap/net/IAPNet;->isWifi:Z

    if-eqz v1, :cond_4

    .line 77
    new-instance v1, Ljava/net/InetSocketAddress;

    invoke-virtual {p0}, Lcom/feelingk/iap/net/ServerInfo;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/feelingk/iap/net/ServerInfo;->getPort()I

    move-result p0

    .end local p0    # "info":Lcom/feelingk/iap/net/ServerInfo;
    invoke-direct {v1, v2, p0}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    .line 78
    .local v1, "socketAddress":Ljava/net/SocketAddress;
    const-string p0, "TLS"

    invoke-static {p0}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object p0

    .line 79
    .local p0, "sslcontext":Ljavax/net/ssl/SSLContext;
    const/4 v2, 0x1

    new-array v2, v2, [Lcom/feelingk/iap/net/TrustManager;

    const/4 v3, 0x0

    new-instance v4, Lcom/feelingk/iap/net/TrustManager;

    invoke-direct {v4}, Lcom/feelingk/iap/net/TrustManager;-><init>()V

    aput-object v4, v2, v3

    .line 81
    .local v2, "trustManagers":[Lcom/feelingk/iap/net/TrustManager;
    const/4 v3, 0x0

    new-instance v4, Ljava/security/SecureRandom;

    invoke-direct {v4}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {p0, v3, v2, v4}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 83
    invoke-virtual {p0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object p0

    .line 85
    .local p0, "FACTORY":Ljavax/net/ssl/SSLSocketFactory;
    invoke-virtual {p0}, Ljavax/net/ssl/SSLSocketFactory;->createSocket()Ljava/net/Socket;

    move-result-object p0

    .end local p0    # "FACTORY":Ljavax/net/ssl/SSLSocketFactory;
    sput-object p0, Lcom/feelingk/iap/net/IAPNet;->socketGateway:Ljava/net/Socket;

    .line 86
    sget-object p0, Lcom/feelingk/iap/net/IAPNet;->socketGateway:Ljava/net/Socket;

    const/16 v2, 0x4e20

    invoke-virtual {p0, v2}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 87
    .end local v2    # "trustManagers":[Lcom/feelingk/iap/net/TrustManager;
    sget-object p0, Lcom/feelingk/iap/net/IAPNet;->socketGateway:Ljava/net/Socket;

    const/16 v2, 0x4e20

    invoke-virtual {p0, v1, v2}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    .line 89
    sget-object p0, Lcom/feelingk/iap/net/IAPNet;->socketGateway:Ljava/net/Socket;

    invoke-virtual {p0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object p0

    sput-object p0, Lcom/feelingk/iap/net/IAPNet;->inputStream:Ljava/io/InputStream;

    .line 90
    sget-object p0, Lcom/feelingk/iap/net/IAPNet;->socketGateway:Ljava/net/Socket;

    invoke-virtual {p0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p0

    sput-object p0, Lcom/feelingk/iap/net/IAPNet;->outputStream:Ljava/io/OutputStream;
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 127
    .end local v1    # "socketAddress":Ljava/net/SocketAddress;
    :goto_1
    const/4 p0, 0x1

    sput-boolean p0, Lcom/feelingk/iap/net/IAPNet;->connect:Z

    .line 128
    const-string p0, "IAPNet"

    const-string v1, "[ DEBUG ] Server connect - Complete!!!"

    invoke-static {p0, v1}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    move v1, p1

    move-object v2, p2

    move-object/from16 v3, p8

    move-object v4, p3

    move-object v5, p4

    move v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move/from16 v9, p9

    .line 131
    invoke-static/range {v0 .. v9}, Lcom/feelingk/iap/net/IAPNet;->iapSendInit(Lcom/feelingk/iap/net/InitConfirm;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Z)V

    .line 132
    invoke-virtual {v0}, Lcom/feelingk/iap/net/InitConfirm;->getResultCode()B

    move-result p0

    if-eqz p0, :cond_5

    .line 134
    invoke-virtual {v0}, Lcom/feelingk/iap/net/InitConfirm;->getResultCode()B

    move-result p0

    const/4 p1, -0x7

    if-eq p0, p1, :cond_2

    .line 135
    .end local p1    # "telecom":I
    const/4 p0, 0x0

    sput-boolean p0, Lcom/feelingk/iap/net/IAPNet;->isInit:Z

    .line 136
    :cond_2
    invoke-virtual {v0}, Lcom/feelingk/iap/net/InitConfirm;->getResultCode()B

    move-result p0

    const/4 p1, -0x5

    if-eq p0, p1, :cond_3

    .line 137
    invoke-virtual {v0}, Lcom/feelingk/iap/net/InitConfirm;->getResultCode()B

    move-result p0

    const/4 p1, -0x4

    if-ne p0, p1, :cond_0

    .line 139
    :cond_3
    const-string p0, "\ub124\ud2b8\uc6cc\ud06c \uc5f0\uacb0\uc744 \ud655\uc778 \ud574\uc8fc\uc2dc\uae30 \ubc14\ub78d\ub2c8\ub2e4."

    invoke-virtual {v0, p0}, Lcom/feelingk/iap/net/InitConfirm;->SetUserMessage(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 93
    .local p0, "info":Lcom/feelingk/iap/net/ServerInfo;
    .restart local p1    # "telecom":I
    :cond_4
    :try_start_1
    new-instance v1, Ljava/net/Socket;

    invoke-direct {v1}, Ljava/net/Socket;-><init>()V

    sput-object v1, Lcom/feelingk/iap/net/IAPNet;->socketGateway:Ljava/net/Socket;

    .line 94
    sget-object v1, Lcom/feelingk/iap/net/IAPNet;->socketGateway:Ljava/net/Socket;

    const/16 v2, 0x4e20

    invoke-virtual {v1, v2}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 95
    sget-object v1, Lcom/feelingk/iap/net/IAPNet;->socketGateway:Ljava/net/Socket;

    new-instance v2, Ljava/net/InetSocketAddress;

    invoke-virtual {p0}, Lcom/feelingk/iap/net/ServerInfo;->getHostAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/feelingk/iap/net/ServerInfo;->getPort()I

    move-result p0

    .end local p0    # "info":Lcom/feelingk/iap/net/ServerInfo;
    invoke-direct {v2, v3, p0}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    const/16 p0, 0x4e20

    invoke-virtual {v1, v2, p0}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    .line 97
    sget-object p0, Lcom/feelingk/iap/net/IAPNet;->socketGateway:Ljava/net/Socket;

    invoke-virtual {p0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object p0

    sput-object p0, Lcom/feelingk/iap/net/IAPNet;->inputStream:Ljava/io/InputStream;

    .line 98
    sget-object p0, Lcom/feelingk/iap/net/IAPNet;->socketGateway:Ljava/net/Socket;

    invoke-virtual {p0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p0

    sput-object p0, Lcom/feelingk/iap/net/IAPNet;->outputStream:Ljava/io/OutputStream;
    :try_end_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_1

    .line 101
    :catch_0
    move-exception p0

    .line 102
    .local p0, "e":Ljava/net/SocketTimeoutException;
    const/4 p1, 0x0

    sput-boolean p1, Lcom/feelingk/iap/net/IAPNet;->connect:Z

    .line 103
    .end local p1    # "telecom":I
    const/16 p1, -0xb

    invoke-virtual {v0, p1}, Lcom/feelingk/iap/net/InitConfirm;->setResultCode(B)V

    .line 104
    const-string p1, "\ub124\ud2b8\uc6cc\ud06c \uc5f0\uacb0\uc744 \ud655\uc778 \ud574\uc8fc\uc2dc\uae30 \ubc14\ub78d\ub2c8\ub2e4."

    invoke-virtual {v0, p1}, Lcom/feelingk/iap/net/InitConfirm;->SetUserMessage(Ljava/lang/String;)V

    .line 105
    invoke-virtual {p0}, Ljava/net/SocketTimeoutException;->printStackTrace()V

    goto/16 :goto_0

    .line 108
    .end local p0    # "e":Ljava/net/SocketTimeoutException;
    .restart local p1    # "telecom":I
    :catch_1
    move-exception p0

    .line 109
    .local p0, "e":Ljava/io/IOException;
    const/4 p1, 0x0

    sput-boolean p1, Lcom/feelingk/iap/net/IAPNet;->connect:Z

    .line 110
    .end local p1    # "telecom":I
    const-string p1, "IAPNet"

    new-instance p2, Ljava/lang/StringBuilder;

    .end local p2    # "mcid":Ljava/lang/String;
    const-string p3, "[ Exception ] iapConnect() DUMP :"

    .end local p3    # "min":Ljava/lang/String;
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    const/4 p1, -0x3

    invoke-virtual {v0, p1}, Lcom/feelingk/iap/net/InitConfirm;->setResultCode(B)V

    .line 112
    const-string p1, "\ub124\ud2b8\uc6cc\ud06c \uc5f0\uacb0\uc744 \ud655\uc778 \ud574\uc8fc\uc2dc\uae30 \ubc14\ub78d\ub2c8\ub2e4."

    invoke-virtual {v0, p1}, Lcom/feelingk/iap/net/InitConfirm;->SetUserMessage(Ljava/lang/String;)V

    .line 113
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_0

    .line 116
    .end local p0    # "e":Ljava/io/IOException;
    .restart local p1    # "telecom":I
    .restart local p2    # "mcid":Ljava/lang/String;
    .restart local p3    # "min":Ljava/lang/String;
    :catch_2
    move-exception p0

    .line 117
    .local p0, "e":Ljava/lang/Exception;
    const-string p1, "IAPNet"

    .end local p1    # "telecom":I
    new-instance p2, Ljava/lang/StringBuilder;

    .end local p2    # "mcid":Ljava/lang/String;
    const-string p3, "[ Exception ] iapConnect() DUMP :"

    .end local p3    # "min":Ljava/lang/String;
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    const/4 p1, 0x0

    sput-boolean p1, Lcom/feelingk/iap/net/IAPNet;->connect:Z

    .line 120
    const/4 p1, -0x3

    invoke-virtual {v0, p1}, Lcom/feelingk/iap/net/InitConfirm;->setResultCode(B)V

    .line 121
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/feelingk/iap/net/InitConfirm;->SetDumpMessage(Ljava/lang/String;)V

    .line 122
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0

    .line 144
    .end local p0    # "e":Ljava/lang/Exception;
    .restart local p1    # "telecom":I
    .restart local p2    # "mcid":Ljava/lang/String;
    .restart local p3    # "min":Ljava/lang/String;
    :cond_5
    invoke-static {v0}, Lcom/feelingk/iap/net/IAPNet;->iapReceive(Lcom/feelingk/iap/net/Confirm;)[B

    move-result-object p0

    .line 145
    .local p0, "recv":[B
    invoke-virtual {v0}, Lcom/feelingk/iap/net/InitConfirm;->getResultCode()B

    move-result p1

    .end local p1    # "telecom":I
    if-eqz p1, :cond_6

    .line 146
    const/4 p0, 0x0

    sput-boolean p0, Lcom/feelingk/iap/net/IAPNet;->isInit:Z

    .line 147
    .end local p0    # "recv":[B
    const-string p0, "\ub124\ud2b8\uc6cc\ud06c \uc804\uc1a1\uc911 \uc5d0\ub7ec\uc785\ub2c8\ub2e4."

    invoke-virtual {v0, p0}, Lcom/feelingk/iap/net/InitConfirm;->SetUserMessage(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 152
    .restart local p0    # "recv":[B
    :cond_6
    invoke-virtual {v0, p0}, Lcom/feelingk/iap/net/InitConfirm;->parse([B)V

    goto/16 :goto_0
.end method

.method protected static iapConnectBP(Lcom/feelingk/iap/net/ServerInfo;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lcom/feelingk/iap/net/InitConfirm;
    .locals 6
    .param p0, "info"    # Lcom/feelingk/iap/net/ServerInfo;
    .param p1, "telecom"    # I
    .param p2, "mcid"    # Ljava/lang/String;
    .param p3, "min"    # Ljava/lang/String;
    .param p4, "bpServerIP"    # Ljava/lang/String;
    .param p5, "bpServerPort"    # I

    .prologue
    .line 529
    new-instance v0, Lcom/feelingk/iap/net/InitConfirm;

    invoke-direct {v0}, Lcom/feelingk/iap/net/InitConfirm;-><init>()V

    .line 531
    .local v0, "init":Lcom/feelingk/iap/net/InitConfirm;
    const-string v1, "IAPNet"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "[ DEBUG ] iapConnectBP - Start! isWifi= "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-boolean v3, Lcom/feelingk/iap/net/IAPNet;->isWifi:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 532
    sget-boolean v1, Lcom/feelingk/iap/net/IAPNet;->connectBP:Z

    if-eqz v1, :cond_0

    .line 533
    const/4 p0, -0x1

    invoke-virtual {v0, p0}, Lcom/feelingk/iap/net/InitConfirm;->setResultCode(B)V

    .line 586
    .end local p0    # "info":Lcom/feelingk/iap/net/ServerInfo;
    .end local p1    # "telecom":I
    .end local p2    # "mcid":Ljava/lang/String;
    .end local p3    # "min":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 538
    .restart local p0    # "info":Lcom/feelingk/iap/net/ServerInfo;
    .restart local p1    # "telecom":I
    .restart local p2    # "mcid":Ljava/lang/String;
    .restart local p3    # "min":Ljava/lang/String;
    :cond_0
    :try_start_0
    sget-boolean v1, Lcom/feelingk/iap/net/IAPNet;->isWifi:Z

    if-eqz v1, :cond_1

    .line 539
    const-string v1, "TLS"

    invoke-static {v1}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v1

    .line 540
    .local v1, "context":Ljavax/net/ssl/SSLContext;
    const/4 v2, 0x0

    check-cast v2, [Lcom/feelingk/iap/net/TrustManager;

    .line 541
    .local v2, "trustManagers":[Lcom/feelingk/iap/net/TrustManager;
    const/4 v2, 0x1

    new-array v2, v2, [Lcom/feelingk/iap/net/TrustManager;

    .end local v2    # "trustManagers":[Lcom/feelingk/iap/net/TrustManager;
    const/4 v3, 0x0

    new-instance v4, Lcom/feelingk/iap/net/TrustManager;

    invoke-direct {v4}, Lcom/feelingk/iap/net/TrustManager;-><init>()V

    aput-object v4, v2, v3

    .line 542
    .restart local v2    # "trustManagers":[Lcom/feelingk/iap/net/TrustManager;
    const/4 v3, 0x0

    new-instance v4, Ljava/security/SecureRandom;

    invoke-direct {v4}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v1, v3, v2, v4}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 543
    invoke-virtual {v1}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v1

    .line 544
    .local v1, "FACTORY":Ljavax/net/ssl/SSLSocketFactory;
    invoke-virtual {v1}, Ljavax/net/ssl/SSLSocketFactory;->createSocket()Ljava/net/Socket;

    move-result-object v1

    .end local v1    # "FACTORY":Ljavax/net/ssl/SSLSocketFactory;
    sput-object v1, Lcom/feelingk/iap/net/IAPNet;->socketBP:Ljava/net/Socket;

    .line 549
    .end local v2    # "trustManagers":[Lcom/feelingk/iap/net/TrustManager;
    :goto_1
    sget-object v1, Lcom/feelingk/iap/net/IAPNet;->socketBP:Ljava/net/Socket;

    new-instance v2, Ljava/net/InetSocketAddress;

    invoke-virtual {p0}, Lcom/feelingk/iap/net/ServerInfo;->getHostAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/feelingk/iap/net/ServerInfo;->getPort()I

    move-result p0

    .end local p0    # "info":Lcom/feelingk/iap/net/ServerInfo;
    invoke-direct {v2, v3, p0}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    const/16 p0, 0x2710

    invoke-virtual {v1, v2, p0}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    .line 551
    sget-object p0, Lcom/feelingk/iap/net/IAPNet;->socketBP:Ljava/net/Socket;

    invoke-virtual {p0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object p0

    sput-object p0, Lcom/feelingk/iap/net/IAPNet;->inputStreamBP:Ljava/io/InputStream;

    .line 552
    sget-object p0, Lcom/feelingk/iap/net/IAPNet;->socketBP:Ljava/net/Socket;

    invoke-virtual {p0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p0

    sput-object p0, Lcom/feelingk/iap/net/IAPNet;->outputStreamBP:Ljava/io/OutputStream;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 563
    const/4 p0, 0x1

    sput-boolean p0, Lcom/feelingk/iap/net/IAPNet;->connectBP:Z

    .line 565
    const-string p0, "IAPNet"

    const-string v1, "[ DEBUG ] iapConnectBP - Connection Complete!"

    invoke-static {p0, v1}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 568
    invoke-virtual {p4}, Ljava/lang/String;->getBytes()[B

    move-result-object v4

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    move v5, p5

    invoke-static/range {v0 .. v5}, Lcom/feelingk/iap/net/IAPNet;->iapSendInitBP(Lcom/feelingk/iap/net/InitConfirm;ILjava/lang/String;Ljava/lang/String;[BI)V

    .line 569
    invoke-virtual {v0}, Lcom/feelingk/iap/net/InitConfirm;->getResultCode()B

    move-result p0

    if-eqz p0, :cond_2

    .line 570
    invoke-virtual {v0}, Lcom/feelingk/iap/net/InitConfirm;->getResultCode()B

    move-result p0

    const/4 p1, -0x7

    if-eq p0, p1, :cond_2

    .line 571
    .end local p1    # "telecom":I
    const-string p0, "\ub124\ud2b8\uc6cc\ud06c \uc5f0\uacb0\uc744 \ud655\uc778 \ud574\uc8fc\uc2dc\uae30 \ubc14\ub78d\ub2c8\ub2e4."

    invoke-virtual {v0, p0}, Lcom/feelingk/iap/net/InitConfirm;->SetUserMessage(Ljava/lang/String;)V

    goto :goto_0

    .line 547
    .restart local p0    # "info":Lcom/feelingk/iap/net/ServerInfo;
    .restart local p1    # "telecom":I
    :cond_1
    :try_start_1
    new-instance v1, Ljava/net/Socket;

    invoke-direct {v1}, Ljava/net/Socket;-><init>()V

    sput-object v1, Lcom/feelingk/iap/net/IAPNet;->socketBP:Ljava/net/Socket;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 554
    .end local p0    # "info":Lcom/feelingk/iap/net/ServerInfo;
    :catch_0
    move-exception p0

    .line 555
    .local p0, "e":Ljava/lang/Exception;
    const-string p1, "IAPNet"

    .end local p1    # "telecom":I
    new-instance p2, Ljava/lang/StringBuilder;

    .end local p2    # "mcid":Ljava/lang/String;
    const-string p3, "[ Exception ] iapConnectBP() "

    .end local p3    # "min":Ljava/lang/String;
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    .end local p0    # "e":Ljava/lang/Exception;
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 556
    const/4 p0, 0x0

    sput-boolean p0, Lcom/feelingk/iap/net/IAPNet;->connectBP:Z

    .line 557
    const/4 p0, -0x3

    invoke-virtual {v0, p0}, Lcom/feelingk/iap/net/InitConfirm;->setResultCode(B)V

    .line 558
    const-string p0, "\ub124\ud2b8\uc6cc\ud06c \uc5f0\uacb0\uc744 \ud655\uc778 \ud574\uc8fc\uc2dc\uae30 \ubc14\ub78d\ub2c8\ub2e4."

    invoke-virtual {v0, p0}, Lcom/feelingk/iap/net/InitConfirm;->SetUserMessage(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 577
    .restart local p2    # "mcid":Ljava/lang/String;
    .restart local p3    # "min":Ljava/lang/String;
    :cond_2
    invoke-static {v0}, Lcom/feelingk/iap/net/IAPNet;->iapReceiveBP(Lcom/feelingk/iap/net/Confirm;)[B

    move-result-object p0

    .line 578
    .local p0, "recv":[B
    invoke-virtual {v0}, Lcom/feelingk/iap/net/InitConfirm;->getResultCode()B

    move-result p1

    if-eqz p1, :cond_3

    .line 579
    const-string p0, "\ub124\ud2b8\uc6cc\ud06c \uc5f0\uacb0\uc744 \ud655\uc778 \ud574\uc8fc\uc2dc\uae30 \ubc14\ub78d\ub2c8\ub2e4."

    .end local p0    # "recv":[B
    invoke-virtual {v0, p0}, Lcom/feelingk/iap/net/InitConfirm;->SetUserMessage(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 584
    .restart local p0    # "recv":[B
    :cond_3
    invoke-virtual {v0, p0}, Lcom/feelingk/iap/net/InitConfirm;->parse([B)V

    goto/16 :goto_0
.end method

.method protected static iapReAuth(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Lcom/feelingk/iap/net/InitConfirm;
    .locals 10
    .param p0, "pTelecom"    # I
    .param p1, "applicationID"    # Ljava/lang/String;
    .param p2, "pJuminNumber"    # Ljava/lang/String;
    .param p3, "MDN"    # Ljava/lang/String;
    .param p4, "bpServerIP"    # Ljava/lang/String;
    .param p5, "bpServerPort"    # I
    .param p6, "pID"    # Ljava/lang/String;
    .param p7, "pTID"    # Ljava/lang/String;

    .prologue
    .line 370
    new-instance v0, Lcom/feelingk/iap/net/InitConfirm;

    invoke-direct {v0}, Lcom/feelingk/iap/net/InitConfirm;-><init>()V

    .line 373
    .local v0, "initConfirm":Lcom/feelingk/iap/net/InitConfirm;
    const/4 v1, 0x0

    sput-boolean v1, Lcom/feelingk/iap/net/IAPNet;->isInit:Z

    .line 376
    const/4 v9, 0x0

    move v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    invoke-static/range {v0 .. v9}, Lcom/feelingk/iap/net/IAPNet;->iapSendInit(Lcom/feelingk/iap/net/InitConfirm;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Z)V

    .line 378
    invoke-virtual {v0}, Lcom/feelingk/iap/net/InitConfirm;->getResultCode()B

    move-result p0

    .end local p0    # "pTelecom":I
    if-eqz p0, :cond_0

    .line 390
    .end local p1    # "applicationID":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 382
    .restart local p1    # "applicationID":Ljava/lang/String;
    :cond_0
    invoke-static {v0}, Lcom/feelingk/iap/net/IAPNet;->iapReceive(Lcom/feelingk/iap/net/Confirm;)[B

    move-result-object p0

    .line 383
    .local p0, "recv":[B
    invoke-virtual {v0}, Lcom/feelingk/iap/net/InitConfirm;->getResultCode()B

    move-result p1

    .end local p1    # "applicationID":Ljava/lang/String;
    if-eqz p1, :cond_1

    .line 384
    const-string p0, "\ub124\ud2b8\uc6cc\ud06c \uc804\uc1a1\uc911 \uc5d0\ub7ec\uc785\ub2c8\ub2e4."

    .end local p0    # "recv":[B
    invoke-virtual {v0, p0}, Lcom/feelingk/iap/net/InitConfirm;->SetUserMessage(Ljava/lang/String;)V

    goto :goto_0

    .line 389
    .restart local p0    # "recv":[B
    :cond_1
    invoke-virtual {v0, p0}, Lcom/feelingk/iap/net/InitConfirm;->parse([B)V

    goto :goto_0
.end method

.method private static declared-synchronized iapReceive(Lcom/feelingk/iap/net/Confirm;)[B
    .locals 15
    .param p0, "confirm"    # Lcom/feelingk/iap/net/Confirm;

    .prologue
    const/4 v14, 0x1

    const/4 v13, -0x1

    const/4 v12, 0x0

    .line 434
    const-class v8, Lcom/feelingk/iap/net/IAPNet;

    monitor-enter v8

    :try_start_0
    const-string v9, "IAPNet"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "[ DEBUG ] iapReceive() Header Start ("

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-boolean v11, Lcom/feelingk/iap/net/IAPNet;->isInit:Z

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ")"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/feelingk/iap/util/CommonF$LOGGER;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 435
    sget-boolean v9, Lcom/feelingk/iap/net/IAPNet;->isInit:Z

    if-nez v9, :cond_0

    .line 436
    const/4 v9, -0x6

    invoke-virtual {p0, v9}, Lcom/feelingk/iap/net/Confirm;->setResultCode(B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v9, v12

    .line 513
    :goto_0
    monitor-exit v8

    return-object v9

    .line 440
    :cond_0
    const/4 v4, 0x0

    :try_start_1
    check-cast v4, [B

    .line 441
    .local v4, "header":[B
    const/4 v0, 0x0

    check-cast v0, [B

    .line 442
    .local v0, "data":[B
    const/4 v7, 0x0

    check-cast v7, [B
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 443
    .local v7, "returnData":[B
    const/4 v6, 0x0

    .line 444
    .local v6, "receivedBytes":I
    const/4 v5, 0x0

    .line 445
    .local v5, "reads":I
    const/4 v1, 0x0

    .line 449
    .local v1, "data_len":I
    const/16 v9, 0xc

    :try_start_2
    new-array v4, v9, [B

    .line 451
    :goto_1
    const/16 v9, 0xc

    if-lt v6, v9, :cond_3

    .line 465
    :cond_1
    new-instance v9, Ljava/lang/String;

    const/4 v10, 0x2

    const/16 v11, 0xa

    invoke-direct {v9, v4, v10, v11}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 467
    .local v2, "datalength":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_5

    .line 468
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 474
    new-array v0, v1, [B

    .line 475
    const/4 v6, 0x0

    .line 478
    :goto_2
    if-lt v6, v1, :cond_6

    .line 486
    :cond_2
    const/16 v9, 0x17

    sub-int v10, v1, v14

    aget-byte v10, v0, v10

    if-eq v9, v10, :cond_7

    .line 487
    const-string v9, "IAPNet"

    const-string v10, "[ DEBUG ] IAP_ERR_INVALIDPARITY ="

    invoke-static {v9, v10}, Lcom/feelingk/iap/util/CommonF$LOGGER;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 488
    const/4 v9, -0x8

    invoke-virtual {p0, v9}, Lcom/feelingk/iap/net/Confirm;->setResultCode(B)V

    move-object v9, v12

    .line 489
    goto :goto_0

    .line 452
    .end local v2    # "datalength":Ljava/lang/String;
    :cond_3
    sget-object v9, Lcom/feelingk/iap/net/IAPNet;->inputStream:Ljava/io/InputStream;

    array-length v10, v4

    sub-int/2addr v10, v6

    invoke-virtual {v9, v4, v6, v10}, Ljava/io/InputStream;->read([BII)I

    move-result v5

    .line 454
    if-eq v5, v13, :cond_4

    .line 455
    add-int/2addr v6, v5

    goto :goto_1

    .line 456
    :cond_4
    if-ne v5, v13, :cond_1

    .line 458
    const/4 v9, -0x5

    invoke-virtual {p0, v9}, Lcom/feelingk/iap/net/Confirm;->setResultCode(B)V

    move-object v9, v12

    .line 459
    goto :goto_0

    .line 470
    .restart local v2    # "datalength":Ljava/lang/String;
    :cond_5
    const/4 v9, -0x5

    invoke-virtual {p0, v9}, Lcom/feelingk/iap/net/Confirm;->setResultCode(B)V

    move-object v9, v12

    .line 471
    goto :goto_0

    .line 479
    :cond_6
    sget-object v9, Lcom/feelingk/iap/net/IAPNet;->inputStream:Ljava/io/InputStream;

    array-length v10, v0

    sub-int/2addr v10, v6

    invoke-virtual {v9, v0, v6, v10}, Ljava/io/InputStream;->read([BII)I
    :try_end_2
    .catch Ljava/net/SocketTimeoutException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v5

    .line 480
    if-eq v5, v13, :cond_2

    .line 481
    add-int/2addr v6, v5

    goto :goto_2

    .line 492
    .end local v2    # "datalength":Ljava/lang/String;
    :catch_0
    move-exception v9

    move-object v3, v9

    .line 493
    .local v3, "e":Ljava/net/SocketTimeoutException;
    :try_start_3
    const-string v9, "IAPNet"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "[ Exception ] iapReceive() "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 494
    const/16 v9, -0xd

    invoke-virtual {p0, v9}, Lcom/feelingk/iap/net/Confirm;->setResultCode(B)V

    move-object v9, v12

    .line 495
    goto/16 :goto_0

    .line 497
    .end local v3    # "e":Ljava/net/SocketTimeoutException;
    :catch_1
    move-exception v9

    move-object v3, v9

    .line 498
    .local v3, "e":Ljava/lang/Exception;
    const-string v9, "IAPNet"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "[ Exception ] iapReceive() "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 499
    const/4 v9, -0x5

    invoke-virtual {p0, v9}, Lcom/feelingk/iap/net/Confirm;->setResultCode(B)V

    move-object v9, v12

    .line 501
    goto/16 :goto_0

    .line 504
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v2    # "datalength":Ljava/lang/String;
    :cond_7
    array-length v9, v4

    array-length v10, v0

    add-int/2addr v9, v10

    new-array v7, v9, [B

    .line 505
    const/4 v9, 0x0

    const/4 v10, 0x0

    array-length v11, v4

    invoke-static {v4, v9, v7, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 506
    const/4 v9, 0x0

    array-length v10, v4

    array-length v11, v0

    sub-int/2addr v11, v14

    invoke-static {v0, v9, v7, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 508
    if-eqz p0, :cond_8

    .line 509
    const/4 v9, 0x0

    invoke-virtual {p0, v9}, Lcom/feelingk/iap/net/Confirm;->setResultCode(B)V

    .line 510
    :cond_8
    array-length v9, v4

    array-length v10, v0

    add-int/2addr v9, v10

    invoke-static {v7, v9}, Lcom/feelingk/iap/net/IAPNetworkUtil;->packetDebug([BI)V

    .line 512
    const-string v9, "IAPNet"

    const-string v10, "[ DEBUG ] iapReceive() Success!!  "

    invoke-static {v9, v10}, Lcom/feelingk/iap/util/CommonF$LOGGER;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-object v9, v7

    .line 513
    goto/16 :goto_0

    .line 434
    .end local v0    # "data":[B
    .end local v1    # "data_len":I
    .end local v2    # "datalength":Ljava/lang/String;
    .end local v4    # "header":[B
    .end local v5    # "reads":I
    .end local v6    # "receivedBytes":I
    .end local v7    # "returnData":[B
    :catchall_0
    move-exception v9

    monitor-exit v8

    throw v9
.end method

.method private static declared-synchronized iapReceiveBP(Lcom/feelingk/iap/net/Confirm;)[B
    .locals 15
    .param p0, "c"    # Lcom/feelingk/iap/net/Confirm;

    .prologue
    const/4 v14, 0x1

    const/4 v13, -0x1

    const/4 v12, 0x0

    .line 817
    const-class v8, Lcom/feelingk/iap/net/IAPNet;

    monitor-enter v8

    const/4 v4, 0x0

    :try_start_0
    check-cast v4, [B

    .line 818
    .local v4, "header":[B
    const/4 v0, 0x0

    check-cast v0, [B

    .line 819
    .local v0, "data":[B
    const/4 v7, 0x0

    check-cast v7, [B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 820
    .local v7, "returnData":[B
    const/4 v6, 0x0

    .line 821
    .local v6, "receivedBytes":I
    const/4 v5, 0x0

    .line 822
    .local v5, "reads":I
    const/4 v1, 0x0

    .line 825
    .local v1, "data_len":I
    const/16 v9, 0xc

    :try_start_1
    new-array v4, v9, [B

    .line 827
    :goto_0
    const/16 v9, 0xc

    if-lt v6, v9, :cond_3

    .line 839
    :cond_0
    const-string v9, "IAPNet"

    const-string v10, "[ DEBUG ] iapReceiveBP() Header Receive Complete!"

    invoke-static {v9, v10}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 841
    new-instance v9, Ljava/lang/String;

    const/4 v10, 0x2

    const/16 v11, 0xa

    invoke-direct {v9, v4, v10, v11}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 842
    .local v2, "datalength":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_5

    .line 843
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 848
    const-string v9, "IAPNet"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "[ DEBUG ] iapReceiveBP() Data Length: "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 849
    new-array v0, v1, [B

    .line 851
    const/4 v6, 0x0

    .line 852
    :goto_1
    if-lt v6, v1, :cond_6

    .line 863
    :cond_1
    sub-int v9, v1, v14

    aget-byte v9, v0, v9
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 873
    :try_start_2
    array-length v9, v4

    array-length v10, v0

    add-int/2addr v9, v10

    new-array v7, v9, [B

    .line 874
    const/4 v9, 0x0

    const/4 v10, 0x0

    array-length v11, v4

    invoke-static {v4, v9, v7, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 875
    const/4 v9, 0x0

    array-length v10, v4

    array-length v11, v0

    sub-int/2addr v11, v14

    invoke-static {v0, v9, v7, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 877
    if-eqz p0, :cond_2

    .line 878
    const/4 v9, 0x0

    invoke-virtual {p0, v9}, Lcom/feelingk/iap/net/Confirm;->setResultCode(B)V

    .line 880
    :cond_2
    array-length v9, v4

    array-length v10, v0

    add-int/2addr v9, v10

    invoke-static {v7, v9}, Lcom/feelingk/iap/net/IAPNetworkUtil;->packetDebug([BI)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object v9, v7

    .line 881
    .end local v2    # "datalength":Ljava/lang/String;
    :goto_2
    monitor-exit v8

    return-object v9

    .line 828
    :cond_3
    :try_start_3
    sget-object v9, Lcom/feelingk/iap/net/IAPNet;->inputStreamBP:Ljava/io/InputStream;

    array-length v10, v4

    sub-int/2addr v10, v6

    invoke-virtual {v9, v4, v6, v10}, Ljava/io/InputStream;->read([BII)I

    move-result v5

    .line 830
    if-eq v5, v13, :cond_4

    .line 831
    add-int/2addr v6, v5

    goto :goto_0

    .line 832
    :cond_4
    if-ne v5, v13, :cond_0

    .line 834
    const/4 v9, -0x5

    invoke-virtual {p0, v9}, Lcom/feelingk/iap/net/Confirm;->setResultCode(B)V

    move-object v9, v12

    .line 835
    goto :goto_2

    .line 845
    .restart local v2    # "datalength":Ljava/lang/String;
    :cond_5
    const/4 v9, -0x5

    invoke-virtual {p0, v9}, Lcom/feelingk/iap/net/Confirm;->setResultCode(B)V

    move-object v9, v12

    .line 846
    goto :goto_2

    .line 853
    :cond_6
    sget-object v9, Lcom/feelingk/iap/net/IAPNet;->inputStreamBP:Ljava/io/InputStream;

    array-length v10, v0

    sub-int/2addr v10, v6

    invoke-virtual {v9, v0, v6, v10}, Ljava/io/InputStream;->read([BII)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v5

    .line 855
    if-eq v5, v13, :cond_1

    .line 856
    add-int/2addr v6, v5

    goto :goto_1

    .line 867
    .end local v2    # "datalength":Ljava/lang/String;
    :catch_0
    move-exception v9

    move-object v3, v9

    .line 868
    .local v3, "e":Ljava/lang/Exception;
    :try_start_4
    const-string v9, "IAPNet"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "[ Exception ] iapReceiveBP() "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 869
    const/4 v9, -0x5

    invoke-virtual {p0, v9}, Lcom/feelingk/iap/net/Confirm;->setResultCode(B)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-object v9, v12

    .line 870
    goto :goto_2

    .line 817
    .end local v0    # "data":[B
    .end local v1    # "data_len":I
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v4    # "header":[B
    .end local v5    # "reads":I
    .end local v6    # "receivedBytes":I
    .end local v7    # "returnData":[B
    :catchall_0
    move-exception v9

    monitor-exit v8

    throw v9
.end method

.method protected static iapSendData([B)[B
    .locals 11
    .param p0, "data"    # [B

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x0

    .line 893
    new-instance v0, Lcom/feelingk/iap/net/DataPacket;

    invoke-direct {v0}, Lcom/feelingk/iap/net/DataPacket;-><init>()V

    .line 896
    .local v0, "datapacket":Lcom/feelingk/iap/net/DataPacket;
    const-string v7, "IAPNet"

    const-string v8, "[ DEBUG ] iapSendData!!!!() Start ~~~~~~~~~~~~~~~~~~~~"

    invoke-static {v7, v8}, Lcom/feelingk/iap/util/CommonF$LOGGER;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 897
    array-length v7, p0

    add-int/lit8 v7, v7, 0xc

    add-int/lit8 v4, v7, 0x1

    .line 898
    .local v4, "packet_len":I
    new-array v3, v4, [B

    .line 900
    .local v3, "packetBytes":[B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-lt v2, v4, :cond_1

    .line 903
    const-string v7, "DP"

    array-length v8, p0

    add-int/lit8 v8, v8, 0x1

    invoke-static {v7, v8}, Lcom/feelingk/iap/net/IAPNetworkUtil;->iapMakePacketHeader(Ljava/lang/String;I)[B

    move-result-object v1

    .line 904
    .local v1, "header":[B
    array-length v7, v1

    invoke-static {v1, v9, v3, v9, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 906
    if-eqz p0, :cond_0

    .line 909
    const/16 v7, 0xc

    array-length v8, p0

    invoke-static {p0, v9, v3, v7, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 912
    :cond_0
    const/4 v7, 0x1

    sub-int v7, v4, v7

    const/16 v8, 0x17

    aput-byte v8, v3, v7

    .line 914
    invoke-static {v3}, Lcom/feelingk/iap/net/IAPNet;->iapWrite([B)B

    move-result v6

    .line 915
    .local v6, "ret":B
    if-eqz v6, :cond_2

    move-object v7, v10

    .line 927
    :goto_1
    return-object v7

    .line 901
    .end local v1    # "header":[B
    .end local v6    # "ret":B
    :cond_1
    aput-byte v9, v3, v2

    .line 900
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 919
    .restart local v1    # "header":[B
    .restart local v6    # "ret":B
    :cond_2
    invoke-static {v0}, Lcom/feelingk/iap/net/IAPNet;->iapReceive(Lcom/feelingk/iap/net/Confirm;)[B

    move-result-object v5

    .line 920
    .local v5, "recv":[B
    invoke-virtual {v0}, Lcom/feelingk/iap/net/DataPacket;->getResultCode()B

    move-result v7

    if-eqz v7, :cond_3

    move-object v7, v10

    .line 921
    goto :goto_1

    .line 924
    :cond_3
    invoke-virtual {v0, v5}, Lcom/feelingk/iap/net/DataPacket;->parse([B)V

    .line 925
    const-string v7, "IAPNet"

    const-string v8, "[ DEBUG ] iapSendData() End~~~~~~~~~~~~~~~~~~~~"

    invoke-static {v7, v8}, Lcom/feelingk/iap/util/CommonF$LOGGER;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 927
    invoke-virtual {v0}, Lcom/feelingk/iap/net/DataPacket;->getData()[B

    move-result-object v7

    goto :goto_1
.end method

.method protected static iapSendDataBP([B)[B
    .locals 11
    .param p0, "data"    # [B

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x0

    .line 769
    new-instance v0, Lcom/feelingk/iap/net/DataPacket;

    invoke-direct {v0}, Lcom/feelingk/iap/net/DataPacket;-><init>()V

    .line 772
    .local v0, "dp":Lcom/feelingk/iap/net/DataPacket;
    const-string v7, "IAPNet"

    const-string v8, "[ DEBUG ] iapSendDataBP()"

    invoke-static {v7, v8}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 773
    array-length v7, p0

    add-int/lit8 v7, v7, 0xc

    add-int/lit8 v4, v7, 0x1

    .line 774
    .local v4, "packet_len":I
    new-array v3, v4, [B

    .line 776
    .local v3, "packetBytes":[B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-lt v2, v4, :cond_1

    .line 779
    const-string v7, "DP"

    array-length v8, p0

    add-int/lit8 v8, v8, 0x1

    invoke-static {v7, v8}, Lcom/feelingk/iap/net/IAPNetworkUtil;->iapMakePacketHeader(Ljava/lang/String;I)[B

    move-result-object v1

    .line 780
    .local v1, "header":[B
    array-length v7, v1

    invoke-static {v1, v9, v3, v9, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 782
    if-eqz p0, :cond_0

    .line 785
    const/16 v7, 0xc

    array-length v8, p0

    invoke-static {p0, v9, v3, v7, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 788
    :cond_0
    const/4 v7, 0x1

    sub-int v7, v4, v7

    const/16 v8, 0x17

    aput-byte v8, v3, v7

    .line 790
    invoke-static {v3}, Lcom/feelingk/iap/net/IAPNet;->iapWriteBP([B)B

    move-result v6

    .line 791
    .local v6, "ret":B
    if-eqz v6, :cond_2

    move-object v7, v10

    .line 804
    :goto_1
    return-object v7

    .line 777
    .end local v1    # "header":[B
    .end local v6    # "ret":B
    :cond_1
    aput-byte v9, v3, v2

    .line 776
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 796
    .restart local v1    # "header":[B
    .restart local v6    # "ret":B
    :cond_2
    invoke-static {v0}, Lcom/feelingk/iap/net/IAPNet;->iapReceiveBP(Lcom/feelingk/iap/net/Confirm;)[B

    move-result-object v5

    .line 797
    .local v5, "recv":[B
    array-length v7, v5

    invoke-static {v5, v7}, Lcom/feelingk/iap/net/IAPNetworkUtil;->packetDebug([BI)V

    .line 798
    invoke-virtual {v0}, Lcom/feelingk/iap/net/DataPacket;->getResultCode()B

    move-result v7

    if-eqz v7, :cond_3

    move-object v7, v10

    .line 799
    goto :goto_1

    .line 803
    :cond_3
    invoke-virtual {v0, v5}, Lcom/feelingk/iap/net/DataPacket;->parse([B)V

    .line 804
    invoke-virtual {v0}, Lcom/feelingk/iap/net/DataPacket;->getData()[B

    move-result-object v7

    goto :goto_1
.end method

.method protected static iapSendInit(Lcom/feelingk/iap/net/InitConfirm;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Z)V
    .locals 6
    .param p0, "initConfirm"    # Lcom/feelingk/iap/net/InitConfirm;
    .param p1, "pTelecom"    # I
    .param p2, "applicationID"    # Ljava/lang/String;
    .param p3, "encJuminNumber"    # Ljava/lang/String;
    .param p4, "MIN"    # Ljava/lang/String;
    .param p5, "bpServerIP"    # Ljava/lang/String;
    .param p6, "bpServerPort"    # I
    .param p7, "pID"    # Ljava/lang/String;
    .param p8, "pTID"    # Ljava/lang/String;
    .param p9, "useBpServer"    # Z

    .prologue
    .line 216
    const-string v0, "IAPNet"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "iapSendInit  Start() isInit="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-boolean v2, Lcom/feelingk/iap/net/IAPNet;->isInit:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 217
    const-string v0, "IAPNet"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "iapSendInit  Start() useBpServer ="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 218
    const-string v0, "IAPNet"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "iapSendInit  Start() encJuminNumberCheck ="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz p3, :cond_0

    const/4 v2, 0x1

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    sget-boolean v0, Lcom/feelingk/iap/net/IAPNet;->isInit:Z

    if-eqz v0, :cond_1

    .line 220
    const/4 p1, -0x7

    invoke-virtual {p0, p1}, Lcom/feelingk/iap/net/InitConfirm;->setResultCode(B)V

    .line 361
    .end local p0    # "initConfirm":Lcom/feelingk/iap/net/InitConfirm;
    .end local p1    # "pTelecom":I
    .end local p2    # "applicationID":Ljava/lang/String;
    .end local p3    # "encJuminNumber":Ljava/lang/String;
    .end local p4    # "MIN":Ljava/lang/String;
    .end local p5    # "bpServerIP":Ljava/lang/String;
    .end local p6    # "bpServerPort":I
    :goto_1
    return-void

    .line 218
    .restart local p0    # "initConfirm":Lcom/feelingk/iap/net/InitConfirm;
    .restart local p1    # "pTelecom":I
    .restart local p2    # "applicationID":Ljava/lang/String;
    .restart local p3    # "encJuminNumber":Ljava/lang/String;
    .restart local p4    # "MIN":Ljava/lang/String;
    .restart local p5    # "bpServerIP":Ljava/lang/String;
    .restart local p6    # "bpServerPort":I
    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .line 224
    :cond_1
    if-eqz p5, :cond_9

    invoke-virtual {p5}, Ljava/lang/String;->getBytes()[B

    move-result-object p5

    .end local p5    # "bpServerIP":Ljava/lang/String;
    move-object v0, p5

    .line 225
    .local v0, "ipBytes":[B
    :goto_2
    invoke-static {p6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p5

    invoke-virtual {p5}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    .line 229
    .local v3, "portBytes":[B
    const/16 p5, 0xc

    .line 231
    .local p5, "packet_len":I
    if-eqz p8, :cond_a

    .line 232
    const-string p6, "QP"

    .line 233
    .local p6, "sHeaderPacket":Ljava/lang/String;
    add-int/lit8 p5, p5, 0x64

    move-object v4, p6

    .line 238
    .end local p6    # "sHeaderPacket":Ljava/lang/String;
    .local v4, "sHeaderPacket":Ljava/lang/String;
    :goto_3
    add-int/lit8 p5, p5, 0x1

    .line 239
    add-int/lit8 p5, p5, 0x8

    .line 240
    add-int/lit8 p5, p5, 0x1

    .line 241
    add-int/lit8 p5, p5, 0xa

    .line 242
    add-int/lit8 p5, p5, 0xb

    .line 243
    add-int/lit8 p5, p5, 0x1

    .line 245
    if-eqz v0, :cond_2

    .line 246
    array-length p6, v0

    add-int/2addr p5, p6

    .line 247
    :cond_2
    add-int/lit8 p5, p5, 0x7

    .line 248
    add-int/lit8 p5, p5, 0xa

    .line 251
    const/4 p6, 0x2

    if-eq p1, p6, :cond_3

    const/4 p6, 0x3

    if-ne p1, p6, :cond_4

    .line 252
    :cond_3
    add-int/lit8 p5, p5, 0x2

    .line 254
    if-eqz p9, :cond_b

    .line 255
    add-int/lit8 p5, p5, 0x1

    .line 256
    const-string p6, "SENDBPDATA"

    invoke-virtual {p6}, Ljava/lang/String;->length()I

    move-result p6

    add-int/2addr p5, p6

    .line 265
    :cond_4
    :goto_4
    add-int/lit8 v2, p5, 0x1

    .line 267
    .end local p5    # "packet_len":I
    .local v2, "packet_len":I
    new-array v1, v2, [B

    .line 269
    .local v1, "packetBytes":[B
    const/4 p5, 0x0

    .local p5, "i":I
    :goto_5
    if-lt p5, v2, :cond_c

    .line 272
    const/4 p6, 0x0

    .line 274
    .local p6, "offset":I
    const/16 p5, 0xc

    sub-int p5, v2, p5

    invoke-static {v4, p5}, Lcom/feelingk/iap/net/IAPNetworkUtil;->iapMakePacketHeader(Ljava/lang/String;I)[B

    .end local p5    # "i":I
    move-result-object p5

    .line 277
    .local p5, "header":[B
    const/4 v4, 0x0

    array-length v5, p5

    .end local v4    # "sHeaderPacket":Ljava/lang/String;
    invoke-static {p5, v4, v1, p6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 278
    add-int/lit8 p5, p6, 0xc

    .line 280
    .end local p6    # "offset":I
    .local p5, "offset":I
    add-int/lit8 p6, p5, 0x1

    .end local p5    # "offset":I
    .restart local p6    # "offset":I
    const/16 v4, 0x47

    aput-byte v4, v1, p5

    .line 283
    const-string p5, "IAP10.00"

    invoke-virtual {p5}, Ljava/lang/String;->getBytes()[B

    move-result-object p5

    const/4 v4, 0x0

    const/16 v5, 0x8

    invoke-static {p5, v4, v1, p6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 284
    add-int/lit8 p5, p6, 0x8

    .line 287
    .end local p6    # "offset":I
    .restart local p5    # "offset":I
    add-int/lit8 p6, p5, 0x1

    .end local p5    # "offset":I
    .restart local p6    # "offset":I
    const/16 v4, 0x41

    aput-byte v4, v1, p5

    .line 289
    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object p5

    const/4 v4, 0x0

    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object p2

    .end local p2    # "applicationID":Ljava/lang/String;
    array-length p2, p2

    const/16 v5, 0xa

    invoke-static {p2, v5}, Ljava/lang/Math;->min(II)I

    move-result p2

    invoke-static {p5, v4, v1, p6, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 290
    add-int/lit8 p2, p6, 0xa

    .line 292
    .end local p6    # "offset":I
    .local p2, "offset":I
    invoke-virtual {p4}, Ljava/lang/String;->getBytes()[B

    move-result-object p5

    const/4 p6, 0x0

    invoke-virtual {p4}, Ljava/lang/String;->getBytes()[B

    move-result-object p4

    .end local p4    # "MIN":Ljava/lang/String;
    array-length p4, p4

    const/16 v4, 0xb

    invoke-static {p4, v4}, Ljava/lang/Math;->min(II)I

    move-result p4

    invoke-static {p5, p6, v1, p2, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 293
    add-int/lit8 p2, p2, 0xb

    .line 295
    if-eqz v0, :cond_5

    .line 296
    array-length p4, v0

    int-to-byte p4, p4

    aput-byte p4, v1, p2

    .line 297
    :cond_5
    add-int/lit8 p2, p2, 0x1

    .line 299
    if-eqz v0, :cond_6

    .line 301
    const/4 p4, 0x0

    array-length p5, v0

    invoke-static {v0, p4, v1, p2, p5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 302
    array-length p2, v0

    .end local p2    # "offset":I
    add-int/lit8 p2, p2, 0x2c

    .line 304
    .restart local p2    # "offset":I
    const/4 p4, 0x0

    array-length p5, v3

    invoke-static {v3, p4, v1, p2, p5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 307
    :cond_6
    add-int/lit8 p4, p2, 0x7

    .line 310
    .end local p2    # "offset":I
    .local p4, "offset":I
    if-eqz p7, :cond_7

    .line 311
    invoke-static {p7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object p2

    .line 312
    .local p2, "byte_pID":[B
    array-length p5, p2

    const/16 p6, 0xa

    if-gt p5, p6, :cond_7

    .line 313
    const/4 p5, 0x0

    array-length p6, p2

    invoke-static {p2, p5, v1, p4, p6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 317
    .end local p2    # "byte_pID":[B
    :cond_7
    add-int/lit8 p4, p4, 0xa

    .line 318
    if-eqz p8, :cond_11

    .line 319
    invoke-static {p8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object p2

    .line 320
    .local p2, "byte_pTID":[B
    const/4 p5, 0x0

    array-length p6, p2

    invoke-static {p2, p5, v1, p4, p6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 321
    add-int/lit8 p2, p4, 0x64

    .line 325
    .end local p4    # "offset":I
    .local p2, "offset":I
    :goto_6
    const/4 p4, 0x2

    if-eq p1, p4, :cond_8

    const/4 p4, 0x3

    if-ne p1, p4, :cond_10

    .line 327
    :cond_8
    const/4 p4, 0x2

    if-ne p1, p4, :cond_d

    const-string p1, "12"

    .line 328
    .local p1, "currTelecom":Ljava/lang/String;
    :goto_7
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .end local p1    # "currTelecom":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    .line 329
    .local p1, "byte_pTelecom":[B
    const/4 p4, 0x0

    array-length p5, p1

    invoke-static {p1, p4, v1, p2, p5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 330
    add-int/lit8 p1, p2, 0x2

    .line 332
    .end local p2    # "offset":I
    .local p1, "offset":I
    if-eqz p9, :cond_e

    .line 334
    add-int/lit8 p2, p1, 0x1

    .end local p1    # "offset":I
    .restart local p2    # "offset":I
    const-string p3, "SENDBPDATA"

    .end local p3    # "encJuminNumber":Ljava/lang/String;
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p3

    int-to-byte p3, p3

    aput-byte p3, v1, p1

    .line 335
    const-string p1, "SENDBPDATA"

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    .line 336
    .local p1, "byte_pSendBPData":[B
    const/4 p3, 0x0

    array-length p4, p1

    invoke-static {p1, p3, v1, p2, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 337
    array-length p1, p1

    .end local p1    # "byte_pSendBPData":[B
    add-int/2addr p1, p2

    .line 349
    .end local p2    # "offset":I
    .local p1, "offset":I
    :goto_8
    const/4 p1, 0x1

    sub-int p1, v2, p1

    const/16 p2, 0x17

    aput-byte p2, v1, p1

    .line 351
    .end local p1    # "offset":I
    invoke-static {v1}, Lcom/feelingk/iap/net/IAPNet;->iapWrite([B)B

    move-result p1

    .line 352
    .local p1, "ret":B
    if-eqz p1, :cond_f

    .line 353
    invoke-virtual {p0, p1}, Lcom/feelingk/iap/net/InitConfirm;->setResultCode(B)V

    .line 354
    const-string p1, "\ub124\ud2b8\uc6cc\ud06c \uc804\uc1a1\uc911 \uc5d0\ub7ec\uc785\ub2c8\ub2e4."

    .end local p1    # "ret":B
    invoke-virtual {p0, p1}, Lcom/feelingk/iap/net/InitConfirm;->SetUserMessage(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 224
    .end local v0    # "ipBytes":[B
    .end local v1    # "packetBytes":[B
    .end local v2    # "packet_len":I
    .end local v3    # "portBytes":[B
    .local p1, "pTelecom":I
    .local p2, "applicationID":Ljava/lang/String;
    .restart local p3    # "encJuminNumber":Ljava/lang/String;
    .local p4, "MIN":Ljava/lang/String;
    .local p5, "bpServerIP":Ljava/lang/String;
    .local p6, "bpServerPort":I
    :cond_9
    const/4 p5, 0x0

    move-object v0, p5

    goto/16 :goto_2

    .line 236
    .restart local v0    # "ipBytes":[B
    .restart local v3    # "portBytes":[B
    .local p5, "packet_len":I
    :cond_a
    const-string p6, "IP"

    .local p6, "sHeaderPacket":Ljava/lang/String;
    move-object v4, p6

    .end local p6    # "sHeaderPacket":Ljava/lang/String;
    .restart local v4    # "sHeaderPacket":Ljava/lang/String;
    goto/16 :goto_3

    .line 260
    :cond_b
    add-int/lit8 p5, p5, 0x1

    .line 261
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p6

    add-int/2addr p5, p6

    goto/16 :goto_4

    .line 270
    .restart local v1    # "packetBytes":[B
    .restart local v2    # "packet_len":I
    .local p5, "i":I
    :cond_c
    const/4 p6, 0x0

    aput-byte p6, v1, p5

    .line 269
    add-int/lit8 p5, p5, 0x1

    goto/16 :goto_5

    .line 327
    .end local v4    # "sHeaderPacket":Ljava/lang/String;
    .end local p4    # "MIN":Ljava/lang/String;
    .end local p5    # "i":I
    .local p2, "offset":I
    :cond_d
    const-string p1, "13"

    goto :goto_7

    .line 341
    .end local p2    # "offset":I
    .local p1, "offset":I
    :cond_e
    add-int/lit8 p2, p1, 0x1

    .end local p1    # "offset":I
    .restart local p2    # "offset":I
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p4

    int-to-byte p4, p4

    aput-byte p4, v1, p1

    .line 342
    invoke-virtual {p3}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    .line 343
    .local p1, "byte_pJumin":[B
    const/4 p4, 0x0

    array-length p5, p1

    invoke-static {p1, p4, v1, p2, p5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 344
    invoke-virtual {p3}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    .end local p1    # "byte_pJumin":[B
    array-length p1, p1

    add-int/2addr p1, p2

    .end local p2    # "offset":I
    .local p1, "offset":I
    goto :goto_8

    .line 358
    .end local p3    # "encJuminNumber":Ljava/lang/String;
    .local p1, "ret":B
    :cond_f
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/feelingk/iap/net/InitConfirm;->setResultCode(B)V

    .line 359
    .end local p1    # "ret":B
    const/4 p0, 0x1

    sput-boolean p0, Lcom/feelingk/iap/net/IAPNet;->isInit:Z

    goto/16 :goto_1

    .local p1, "pTelecom":I
    .restart local p2    # "offset":I
    .restart local p3    # "encJuminNumber":Ljava/lang/String;
    :cond_10
    move p1, p2

    .end local p2    # "offset":I
    .local p1, "offset":I
    goto :goto_8

    .local p1, "pTelecom":I
    .local p4, "offset":I
    :cond_11
    move p2, p4

    .end local p4    # "offset":I
    .restart local p2    # "offset":I
    goto/16 :goto_6
.end method

.method protected static iapSendInitBP(Lcom/feelingk/iap/net/InitConfirm;ILjava/lang/String;Ljava/lang/String;[BI)V
    .locals 6
    .param p0, "init"    # Lcom/feelingk/iap/net/InitConfirm;
    .param p1, "pTelecom"    # I
    .param p2, "applicationID"    # Ljava/lang/String;
    .param p3, "MIN"    # Ljava/lang/String;
    .param p4, "ip"    # [B
    .param p5, "port"    # I

    .prologue
    .line 637
    invoke-static {p5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p5

    .end local p5    # "port":I
    invoke-virtual {p5}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    .line 640
    .local v3, "portBytes":[B
    const-string p5, "IAPNet"

    const-string v0, "[ DEBUG ] iapSendInitBP()  __ Start"

    invoke-static {p5, v0}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 642
    const/16 p5, 0xc

    .line 643
    .local p5, "packet_len":I
    add-int/lit8 p5, p5, 0x1

    .line 644
    add-int/lit8 p5, p5, 0x8

    .line 645
    add-int/lit8 p5, p5, 0x1

    .line 646
    add-int/lit8 p5, p5, 0xa

    .line 647
    add-int/lit8 p5, p5, 0xb

    .line 648
    add-int/lit8 p5, p5, 0x1

    .line 649
    if-eqz p4, :cond_0

    .line 650
    array-length p5, p4

    .end local p5    # "packet_len":I
    add-int/lit8 p5, p5, 0x2c

    .line 651
    .restart local p5    # "packet_len":I
    :cond_0
    add-int/lit8 p5, p5, 0x7

    .line 652
    add-int/lit8 p5, p5, 0xa

    .line 654
    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_2

    .line 655
    :cond_1
    add-int/lit8 p5, p5, 0x2

    .line 657
    add-int/lit8 p5, p5, 0x1

    .line 658
    const-string v0, "SENDBPDATA"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/2addr p5, v0

    .line 661
    :cond_2
    add-int/lit8 v2, p5, 0x1

    .line 663
    .end local p5    # "packet_len":I
    .local v2, "packet_len":I
    new-array v1, v2, [B

    .line 665
    .local v1, "packetBytes":[B
    const/4 p5, 0x0

    .local p5, "i":I
    :goto_0
    if-lt p5, v2, :cond_6

    .line 668
    const/4 v0, 0x0

    .line 670
    .local v0, "offset":I
    const-string p5, "IP"

    .end local p5    # "i":I
    const/16 v4, 0xc

    sub-int v4, v2, v4

    invoke-static {p5, v4}, Lcom/feelingk/iap/net/IAPNetworkUtil;->iapMakePacketHeader(Ljava/lang/String;I)[B

    move-result-object p5

    .line 673
    .local p5, "header":[B
    const/4 v4, 0x0

    array-length v5, p5

    invoke-static {p5, v4, v1, v0, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 674
    add-int/lit8 p5, v0, 0xc

    .line 676
    .end local v0    # "offset":I
    .local p5, "offset":I
    add-int/lit8 v0, p5, 0x1

    .end local p5    # "offset":I
    .restart local v0    # "offset":I
    const/16 v4, 0x47

    aput-byte v4, v1, p5

    .line 679
    const-string p5, "IAP10.00"

    invoke-virtual {p5}, Ljava/lang/String;->getBytes()[B

    move-result-object p5

    const/4 v4, 0x0

    const/16 v5, 0x8

    invoke-static {p5, v4, v1, v0, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 680
    add-int/lit8 p5, v0, 0x8

    .line 683
    .end local v0    # "offset":I
    .restart local p5    # "offset":I
    add-int/lit8 v0, p5, 0x1

    .end local p5    # "offset":I
    .restart local v0    # "offset":I
    const/16 v4, 0x41

    aput-byte v4, v1, p5

    .line 686
    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object p5

    const/4 v4, 0x0

    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object p2

    .end local p2    # "applicationID":Ljava/lang/String;
    array-length p2, p2

    const/16 v5, 0xa

    invoke-static {p2, v5}, Ljava/lang/Math;->min(II)I

    move-result p2

    invoke-static {p5, v4, v1, v0, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 687
    add-int/lit8 p2, v0, 0xa

    .line 689
    .end local v0    # "offset":I
    .local p2, "offset":I
    invoke-virtual {p3}, Ljava/lang/String;->getBytes()[B

    move-result-object p5

    const/4 v0, 0x0

    invoke-virtual {p3}, Ljava/lang/String;->getBytes()[B

    move-result-object p3

    .end local p3    # "MIN":Ljava/lang/String;
    array-length p3, p3

    const/16 v4, 0xb

    invoke-static {p3, v4}, Ljava/lang/Math;->min(II)I

    move-result p3

    invoke-static {p5, v0, v1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 690
    add-int/lit8 p2, p2, 0xb

    .line 692
    if-eqz p4, :cond_3

    .line 693
    array-length p3, p4

    int-to-byte p3, p3

    aput-byte p3, v1, p2

    .line 694
    :cond_3
    add-int/lit8 p2, p2, 0x1

    .line 696
    if-eqz p4, :cond_4

    .line 698
    const/4 p3, 0x0

    array-length p5, p4

    invoke-static {p4, p3, v1, p2, p5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 699
    array-length p2, p4

    .end local p2    # "offset":I
    add-int/lit8 p2, p2, 0x2c

    .line 701
    .restart local p2    # "offset":I
    const/4 p3, 0x0

    array-length p4, v3

    .end local p4    # "ip":[B
    invoke-static {v3, p3, v1, p2, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 703
    :cond_4
    add-int/lit8 p2, p2, 0x7

    .line 705
    add-int/lit8 p2, p2, 0xa

    .line 708
    const/4 p3, 0x2

    if-eq p1, p3, :cond_5

    const/4 p3, 0x3

    if-ne p1, p3, :cond_9

    .line 710
    :cond_5
    const/4 p3, 0x2

    if-ne p1, p3, :cond_7

    const-string p1, "12"

    .line 711
    .local p1, "currTelecom":Ljava/lang/String;
    :goto_1
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .end local p1    # "currTelecom":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    .line 712
    .local p1, "byte_pTelecom":[B
    const/4 p3, 0x0

    array-length p4, p1

    invoke-static {p1, p3, v1, p2, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 713
    add-int/lit8 p1, p2, 0x2

    .line 715
    .end local p2    # "offset":I
    .local p1, "offset":I
    add-int/lit8 p2, p1, 0x1

    .end local p1    # "offset":I
    .restart local p2    # "offset":I
    const-string p3, "SENDBPDATA"

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p3

    int-to-byte p3, p3

    aput-byte p3, v1, p1

    .line 716
    const-string p1, "SENDBPDATA"

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    .line 717
    .local p1, "byte_pSendBPData":[B
    const/4 p3, 0x0

    array-length p4, p1

    invoke-static {p1, p3, v1, p2, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 718
    array-length p1, p1

    .end local p1    # "byte_pSendBPData":[B
    add-int/2addr p1, p2

    .line 722
    .end local p2    # "offset":I
    .local p1, "offset":I
    :goto_2
    const/4 p1, 0x1

    sub-int p1, v2, p1

    const/16 p2, 0x17

    aput-byte p2, v1, p1

    .line 724
    .end local p1    # "offset":I
    invoke-static {v1}, Lcom/feelingk/iap/net/IAPNet;->iapWriteBP([B)B

    move-result p1

    .line 725
    .local p1, "ret":B
    if-eqz p1, :cond_8

    .line 726
    invoke-virtual {p0, p1}, Lcom/feelingk/iap/net/InitConfirm;->setResultCode(B)V

    .line 727
    const-string p1, "\ub124\ud2b8\uc6cc\ud06c \uc5f0\uacb0\uc744 \ud655\uc778 \ud574\uc8fc\uc2dc\uae30 \ubc14\ub78d\ub2c8\ub2e4."

    .end local p1    # "ret":B
    invoke-virtual {p0, p1}, Lcom/feelingk/iap/net/InitConfirm;->SetUserMessage(Ljava/lang/String;)V

    .line 734
    :goto_3
    return-void

    .line 666
    .local p1, "pTelecom":I
    .local p2, "applicationID":Ljava/lang/String;
    .restart local p3    # "MIN":Ljava/lang/String;
    .restart local p4    # "ip":[B
    .local p5, "i":I
    :cond_6
    const/4 v0, 0x0

    aput-byte v0, v1, p5

    .line 665
    add-int/lit8 p5, p5, 0x1

    goto/16 :goto_0

    .line 710
    .end local p3    # "MIN":Ljava/lang/String;
    .end local p4    # "ip":[B
    .end local p5    # "i":I
    .local p2, "offset":I
    :cond_7
    const-string p1, "13"

    goto :goto_1

    .line 731
    .end local p2    # "offset":I
    .local p1, "ret":B
    :cond_8
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/feelingk/iap/net/InitConfirm;->setResultCode(B)V

    goto :goto_3

    .local p1, "pTelecom":I
    .restart local p2    # "offset":I
    :cond_9
    move p1, p2

    .end local p2    # "offset":I
    .local p1, "offset":I
    goto :goto_2
.end method

.method protected static iapSendItemInfoQuery(Ljava/lang/String;)Lcom/feelingk/iap/net/ItemInfoConfirm;
    .locals 12
    .param p0, "pID"    # Ljava/lang/String;

    .prologue
    const/4 v11, 0x0

    .line 1091
    new-instance v3, Lcom/feelingk/iap/net/ItemInfoConfirm;

    invoke-direct {v3}, Lcom/feelingk/iap/net/ItemInfoConfirm;-><init>()V

    .line 1093
    .local v3, "itemInfoConfirm":Lcom/feelingk/iap/net/ItemInfoConfirm;
    const-string v9, "IAPNet"

    const-string v10, "[ DEBUG ] iapSendItemInfoQuery()"

    invoke-static {v9, v10}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1095
    const/16 v6, 0xc

    .line 1096
    .local v6, "packet_len":I
    add-int/lit8 v6, v6, 0xa

    .line 1097
    add-int/lit8 v6, v6, 0x1

    .line 1099
    new-array v5, v6, [B

    .line 1100
    .local v5, "packetBytes":[B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-lt v2, v6, :cond_0

    .line 1102
    const/4 v4, 0x0

    .line 1104
    .local v4, "offset":I
    const-string v9, "GP"

    const/16 v10, 0xc

    sub-int v10, v6, v10

    invoke-static {v9, v10}, Lcom/feelingk/iap/net/IAPNetworkUtil;->iapMakePacketHeader(Ljava/lang/String;I)[B

    move-result-object v1

    .line 1107
    .local v1, "header":[B
    array-length v9, v1

    invoke-static {v1, v11, v5, v4, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1109
    add-int/lit8 v4, v4, 0xc

    .line 1110
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 1111
    .local v0, "byte_pID":[B
    array-length v9, v0

    invoke-static {v0, v11, v5, v4, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1113
    const/4 v9, 0x1

    sub-int v9, v6, v9

    const/16 v10, 0x17

    aput-byte v10, v5, v9

    .line 1115
    invoke-static {v5}, Lcom/feelingk/iap/net/IAPNet;->iapWrite([B)B

    move-result v8

    .line 1116
    .local v8, "ret":B
    if-eqz v8, :cond_1

    .line 1117
    invoke-virtual {v3, v8}, Lcom/feelingk/iap/net/ItemInfoConfirm;->setResultCode(B)V

    .line 1118
    const-string v9, "\ub124\ud2b8\uc6cc\ud06c \uc804\uc1a1\uc911 \uc5d0\ub7ec\uc785\ub2c8\ub2e4."

    invoke-virtual {v3, v9}, Lcom/feelingk/iap/net/ItemInfoConfirm;->SetUserMessage(Ljava/lang/String;)V

    .line 1130
    :goto_1
    return-object v3

    .line 1101
    .end local v0    # "byte_pID":[B
    .end local v1    # "header":[B
    .end local v4    # "offset":I
    .end local v8    # "ret":B
    :cond_0
    aput-byte v11, v5, v2

    .line 1100
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1123
    .restart local v0    # "byte_pID":[B
    .restart local v1    # "header":[B
    .restart local v4    # "offset":I
    .restart local v8    # "ret":B
    :cond_1
    invoke-static {v3}, Lcom/feelingk/iap/net/IAPNet;->iapReceive(Lcom/feelingk/iap/net/Confirm;)[B

    move-result-object v7

    .line 1124
    .local v7, "recv":[B
    invoke-virtual {v3}, Lcom/feelingk/iap/net/ItemInfoConfirm;->getResultCode()B

    move-result v9

    if-eqz v9, :cond_2

    .line 1125
    const-string v9, "\ub124\ud2b8\uc6cc\ud06c \uc804\uc1a1\uc911 \uc5d0\ub7ec\uc785\ub2c8\ub2e4."

    invoke-virtual {v3, v9}, Lcom/feelingk/iap/net/ItemInfoConfirm;->SetUserMessage(Ljava/lang/String;)V

    goto :goto_1

    .line 1129
    :cond_2
    invoke-virtual {v3, v7}, Lcom/feelingk/iap/net/ItemInfoConfirm;->parse([B)V

    goto :goto_1
.end method

.method protected static iapSendItemPurchase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)Lcom/feelingk/iap/net/MsgConfirm;
    .locals 9
    .param p0, "pID"    # Ljava/lang/String;
    .param p1, "pName"    # Ljava/lang/String;
    .param p2, "bTCash"    # Ljava/lang/Boolean;
    .param p3, "TID"    # Ljava/lang/String;
    .param p4, "BPInfo"    # Ljava/lang/String;
    .param p5, "bUseBPProtocol"    # Ljava/lang/Boolean;

    .prologue
    .line 1149
    new-instance v2, Lcom/feelingk/iap/net/MsgConfirm;

    invoke-direct {v2}, Lcom/feelingk/iap/net/MsgConfirm;-><init>()V

    .line 1151
    .local v2, "msgConfirm":Lcom/feelingk/iap/net/MsgConfirm;
    const-string v0, "IAPNet"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "[ DEBUG ] iapSendItemPurchase() bUseBPProtocol = "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "  START !!!!!!!!"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1153
    const/16 v0, 0xc

    .line 1154
    .local v0, "packet_len":I
    add-int/lit8 v1, v0, 0xa

    .line 1156
    .end local v0    # "packet_len":I
    .local v1, "packet_len":I
    invoke-virtual {p5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1158
    const-string v0, "BP"

    .local v0, "headerParam":Ljava/lang/String;
    move v8, v1

    .end local v1    # "packet_len":I
    .local v8, "packet_len":I
    move-object v1, v0

    .end local v0    # "headerParam":Ljava/lang/String;
    .local v1, "headerParam":Ljava/lang/String;
    move v0, v8

    .line 1179
    .end local v8    # "packet_len":I
    .local v0, "packet_len":I
    :goto_0
    add-int/lit8 v5, v0, 0x1

    .line 1181
    .end local v0    # "packet_len":I
    .local v5, "packet_len":I
    new-array v4, v5, [B

    .line 1182
    .local v4, "packetBytes":[B
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-lt v0, v5, :cond_7

    .line 1184
    const/4 v3, 0x0

    .line 1186
    .local v3, "offset":I
    const/4 v0, 0x0

    check-cast v0, [B

    .line 1187
    .local v0, "header":[B
    const-string v0, "IAPNet"

    .end local v0    # "header":[B
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "[ DEBUG ] iapSendItemPurchase()  bTCash="

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "// PName="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    if-nez p1, :cond_8

    const/4 v7, 0x0

    :goto_2
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v6}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1193
    const/16 v0, 0xc

    sub-int v0, v5, v0

    invoke-static {v1, v0}, Lcom/feelingk/iap/net/IAPNetworkUtil;->iapMakePacketHeader(Ljava/lang/String;I)[B

    move-result-object v0

    .line 1196
    .restart local v0    # "header":[B
    const/4 v1, 0x0

    array-length v6, v0

    .end local v1    # "headerParam":Ljava/lang/String;
    invoke-static {v0, v1, v4, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1197
    add-int/lit8 v0, v3, 0xc

    .line 1199
    .end local v3    # "offset":I
    .local v0, "offset":I
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .end local p0    # "pID":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    .line 1200
    .local p0, "byte_pID":[B
    const/4 v1, 0x0

    array-length v3, p0

    invoke-static {p0, v1, v4, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1201
    add-int/lit8 p0, v0, 0xa

    .line 1224
    .end local v0    # "offset":I
    .local p0, "offset":I
    invoke-virtual {p5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p5

    .end local p5    # "bUseBPProtocol":Ljava/lang/Boolean;
    if-nez p5, :cond_3

    .line 1226
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    .end local p2    # "bTCash":Ljava/lang/Boolean;
    if-eqz p2, :cond_9

    .line 1227
    const/16 p2, 0x59

    aput-byte p2, v4, p0

    .line 1231
    :goto_3
    add-int/lit8 p0, p0, 0x1

    .line 1233
    if-eqz p1, :cond_0

    .line 1234
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    int-to-byte p2, p2

    aput-byte p2, v4, p0

    .line 1237
    :cond_0
    add-int/lit8 p0, p0, 0x1

    .line 1239
    if-eqz p1, :cond_1

    .line 1240
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p2

    const/4 p5, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v0, v0

    invoke-static {p2, p5, v4, p0, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1241
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    .end local p0    # "offset":I
    array-length p0, p0

    add-int/lit8 p0, p0, 0x18

    .line 1245
    .restart local p0    # "offset":I
    :cond_1
    if-eqz p3, :cond_2

    .line 1246
    invoke-virtual {p3}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    .end local p1    # "pName":Ljava/lang/String;
    const/4 p2, 0x0

    invoke-virtual {p3}, Ljava/lang/String;->getBytes()[B

    move-result-object p3

    .end local p3    # "TID":Ljava/lang/String;
    array-length p3, p3

    invoke-static {p1, p2, v4, p0, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1247
    add-int/lit8 p0, p0, 0x64

    .line 1251
    :cond_2
    if-eqz p4, :cond_3

    .line 1252
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result p1

    int-to-byte p1, p1

    aput-byte p1, v4, p0

    .line 1253
    add-int/lit8 p0, p0, 0x1

    .line 1254
    invoke-virtual {p4}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p4}, Ljava/lang/String;->getBytes()[B

    move-result-object p3

    array-length p3, p3

    invoke-static {p1, p2, v4, p0, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1255
    invoke-virtual {p4}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    array-length p1, p1

    add-int/2addr p0, p1

    .line 1260
    :cond_3
    const/4 p0, 0x1

    sub-int p0, v5, p0

    const/16 p1, 0x17

    aput-byte p1, v4, p0

    .line 1262
    .end local p0    # "offset":I
    invoke-static {v4}, Lcom/feelingk/iap/net/IAPNet;->iapWrite([B)B

    move-result p0

    .line 1263
    .local p0, "ret":B
    if-eqz p0, :cond_a

    .line 1264
    invoke-virtual {v2, p0}, Lcom/feelingk/iap/net/MsgConfirm;->setResultCode(B)V

    .line 1265
    const-string p0, "\ub124\ud2b8\uc6cc\ud06c \uc804\uc1a1\uc911 \uc5d0\ub7ec\uc785\ub2c8\ub2e4."

    .end local p0    # "ret":B
    invoke-virtual {v2, p0}, Lcom/feelingk/iap/net/MsgConfirm;->SetUserMessage(Ljava/lang/String;)V

    move-object p0, v2

    .line 1277
    .end local v2    # "msgConfirm":Lcom/feelingk/iap/net/MsgConfirm;
    .local p0, "msgConfirm":Lcom/feelingk/iap/net/MsgConfirm;
    :goto_4
    return-object p0

    .line 1161
    .end local v4    # "packetBytes":[B
    .end local v5    # "packet_len":I
    .local v1, "packet_len":I
    .restart local v2    # "msgConfirm":Lcom/feelingk/iap/net/MsgConfirm;
    .local p0, "pID":Ljava/lang/String;
    .restart local p1    # "pName":Ljava/lang/String;
    .restart local p2    # "bTCash":Ljava/lang/Boolean;
    .restart local p3    # "TID":Ljava/lang/String;
    .restart local p5    # "bUseBPProtocol":Ljava/lang/Boolean;
    :cond_4
    const-string v0, "HP"

    .line 1163
    .local v0, "headerParam":Ljava/lang/String;
    add-int/lit8 v1, v1, 0x1

    .line 1164
    add-int/lit8 v1, v1, 0x1

    .line 1165
    if-eqz p1, :cond_5

    .line 1166
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    .end local v1    # "packet_len":I
    array-length v1, v1

    add-int/lit8 v1, v1, 0x18

    .line 1168
    .restart local v1    # "packet_len":I
    :cond_5
    if-eqz p3, :cond_6

    .line 1169
    const-string v0, "OP"

    .line 1170
    add-int/lit8 v1, v1, 0x64

    .line 1171
    add-int/lit8 v1, v1, 0x1

    .line 1174
    :cond_6
    if-eqz p4, :cond_c

    .line 1175
    invoke-virtual {p4}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    array-length v3, v3

    add-int/2addr v1, v3

    move v8, v1

    .end local v1    # "packet_len":I
    .restart local v8    # "packet_len":I
    move-object v1, v0

    .end local v0    # "headerParam":Ljava/lang/String;
    .local v1, "headerParam":Ljava/lang/String;
    move v0, v8

    .end local v8    # "packet_len":I
    .local v0, "packet_len":I
    goto/16 :goto_0

    .line 1183
    .local v0, "i":I
    .restart local v4    # "packetBytes":[B
    .restart local v5    # "packet_len":I
    :cond_7
    const/4 v3, 0x0

    aput-byte v3, v4, v0

    .line 1182
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_1

    .line 1187
    .end local v0    # "i":I
    .restart local v3    # "offset":I
    :cond_8
    const/4 v7, 0x1

    goto/16 :goto_2

    .line 1229
    .end local v1    # "headerParam":Ljava/lang/String;
    .end local v3    # "offset":I
    .end local p2    # "bTCash":Ljava/lang/Boolean;
    .end local p5    # "bUseBPProtocol":Ljava/lang/Boolean;
    .local p0, "offset":I
    :cond_9
    const/16 p2, 0x4e

    aput-byte p2, v4, p0

    goto/16 :goto_3

    .line 1270
    .end local p1    # "pName":Ljava/lang/String;
    .end local p3    # "TID":Ljava/lang/String;
    .local p0, "ret":B
    :cond_a
    invoke-static {v2}, Lcom/feelingk/iap/net/IAPNet;->iapReceive(Lcom/feelingk/iap/net/Confirm;)[B

    move-result-object p0

    .line 1271
    .local p0, "recv":[B
    invoke-virtual {v2}, Lcom/feelingk/iap/net/MsgConfirm;->getResultCode()B

    move-result p1

    if-eqz p1, :cond_b

    .line 1272
    const-string p0, "\ub124\ud2b8\uc6cc\ud06c \uc804\uc1a1\uc911 \uc5d0\ub7ec\uc785\ub2c8\ub2e4."

    .end local p0    # "recv":[B
    invoke-virtual {v2, p0}, Lcom/feelingk/iap/net/MsgConfirm;->SetUserMessage(Ljava/lang/String;)V

    move-object p0, v2

    .line 1273
    .end local v2    # "msgConfirm":Lcom/feelingk/iap/net/MsgConfirm;
    .local p0, "msgConfirm":Lcom/feelingk/iap/net/MsgConfirm;
    goto :goto_4

    .line 1276
    .restart local v2    # "msgConfirm":Lcom/feelingk/iap/net/MsgConfirm;
    .local p0, "recv":[B
    :cond_b
    invoke-virtual {v2, p0}, Lcom/feelingk/iap/net/MsgConfirm;->parse([B)V

    move-object p0, v2

    .line 1277
    .end local v2    # "msgConfirm":Lcom/feelingk/iap/net/MsgConfirm;
    .local p0, "msgConfirm":Lcom/feelingk/iap/net/MsgConfirm;
    goto :goto_4

    .end local v4    # "packetBytes":[B
    .end local v5    # "packet_len":I
    .local v0, "headerParam":Ljava/lang/String;
    .local v1, "packet_len":I
    .restart local v2    # "msgConfirm":Lcom/feelingk/iap/net/MsgConfirm;
    .local p0, "pID":Ljava/lang/String;
    .restart local p1    # "pName":Ljava/lang/String;
    .restart local p2    # "bTCash":Ljava/lang/Boolean;
    .restart local p3    # "TID":Ljava/lang/String;
    .restart local p5    # "bUseBPProtocol":Ljava/lang/Boolean;
    :cond_c
    move v8, v1

    .end local v1    # "packet_len":I
    .restart local v8    # "packet_len":I
    move-object v1, v0

    .end local v0    # "headerParam":Ljava/lang/String;
    .local v1, "headerParam":Ljava/lang/String;
    move v0, v8

    .end local v8    # "packet_len":I
    .local v0, "packet_len":I
    goto/16 :goto_0
.end method

.method protected static iapSendItemPurchaseByDanal(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Lcom/feelingk/iap/net/MsgConfirm;
    .locals 11
    .param p0, "mdn"    # Ljava/lang/String;
    .param p1, "pID"    # Ljava/lang/String;
    .param p2, "pName"    # Ljava/lang/String;
    .param p3, "pCarrier"    # I
    .param p4, "TID"    # Ljava/lang/String;
    .param p5, "BPInfo"    # Ljava/lang/String;
    .param p6, "bUseTCash"    # Z
    .param p7, "encJumin"    # Ljava/lang/String;

    .prologue
    .line 1298
    const/4 v6, 0x0

    .line 1300
    .local v6, "useXPProtocol":Z
    const-string v3, "KP"

    .line 1301
    .local v3, "headerParam":Ljava/lang/String;
    const/4 v2, 0x0

    .line 1302
    .local v2, "carrierStr":Ljava/lang/String;
    const/16 v2, 0xc

    .line 1303
    .local v2, "packet_len":I
    new-instance v4, Lcom/feelingk/iap/net/MsgConfirm;

    invoke-direct {v4}, Lcom/feelingk/iap/net/MsgConfirm;-><init>()V

    .line 1305
    .local v4, "itemPurchaseDanalCfm":Lcom/feelingk/iap/net/MsgConfirm;
    add-int/lit8 v2, v2, 0x1

    .line 1306
    if-eqz p2, :cond_e

    .line 1307
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    .end local v2    # "packet_len":I
    add-int/lit8 v2, v2, 0xd

    .restart local v2    # "packet_len":I
    move v5, v2

    .line 1309
    .end local v2    # "packet_len":I
    .local v5, "packet_len":I
    :goto_0
    if-nez p4, :cond_0

    if-eqz p5, :cond_d

    .line 1310
    :cond_0
    const-string v2, "XP"

    .line 1311
    .end local v3    # "headerParam":Ljava/lang/String;
    .local v2, "headerParam":Ljava/lang/String;
    const/4 v6, 0x1

    .line 1312
    add-int/lit8 v3, v5, 0x64

    .line 1313
    .end local v5    # "packet_len":I
    .local v3, "packet_len":I
    add-int/lit8 v3, v3, 0x1

    .line 1314
    if-eqz p5, :cond_c

    .line 1315
    invoke-virtual/range {p5 .. p5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v3, v5

    move v8, v6

    .end local v6    # "useXPProtocol":Z
    .local v8, "useXPProtocol":Z
    move-object v10, v2

    .end local v2    # "headerParam":Ljava/lang/String;
    .local v10, "headerParam":Ljava/lang/String;
    move v2, v3

    .end local v3    # "packet_len":I
    .local v2, "packet_len":I
    move-object v3, v10

    .line 1318
    .end local v10    # "headerParam":Ljava/lang/String;
    .local v3, "headerParam":Ljava/lang/String;
    :goto_1
    const-string v5, "IAPNet"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "[ DEBUG ] iapSendItemPurchaseByDanal() STart!! "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1319
    add-int/lit8 v2, v2, 0xa

    .line 1320
    add-int/lit8 v2, v2, 0x2

    .line 1321
    add-int/lit8 v2, v2, 0xb

    .line 1322
    add-int/lit8 v2, v2, 0x1

    .line 1323
    invoke-virtual/range {p7 .. p7}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v2, v5

    .line 1324
    add-int/lit8 v2, v2, 0x1

    .line 1325
    add-int/lit8 v7, v2, 0x1

    .line 1328
    .end local v2    # "packet_len":I
    .local v7, "packet_len":I
    const/4 v2, 0x2

    if-ne p3, v2, :cond_6

    .line 1329
    const-string p3, "12"

    .line 1338
    .local p3, "carrierStr":Ljava/lang/String;
    :goto_2
    new-array v6, v7, [B

    .line 1339
    .local v6, "packetBytes":[B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_3
    if-lt v2, v7, :cond_8

    .line 1341
    const/4 v5, 0x0

    .line 1342
    .local v5, "offset":I
    const/4 v2, 0x0

    check-cast v2, [B

    .line 1344
    .local v2, "header":[B
    const/16 v2, 0xc

    sub-int v2, v7, v2

    invoke-static {v3, v2}, Lcom/feelingk/iap/net/IAPNetworkUtil;->iapMakePacketHeader(Ljava/lang/String;I)[B

    .end local v2    # "header":[B
    move-result-object v2

    .line 1347
    .restart local v2    # "header":[B
    const/4 v3, 0x0

    array-length v9, v2

    .end local v3    # "headerParam":Ljava/lang/String;
    invoke-static {v2, v3, v6, v5, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1348
    add-int/lit8 v2, v5, 0xc

    .line 1351
    .end local v5    # "offset":I
    .local v2, "offset":I
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .end local p1    # "pID":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    .line 1352
    .local p1, "byte_pID":[B
    const/4 v3, 0x0

    array-length v5, p1

    invoke-static {p1, v3, v6, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1353
    add-int/lit8 v2, v2, 0xa

    .line 1356
    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .end local p1    # "byte_pID":[B
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    .line 1357
    .local p1, "byte_pCarrier":[B
    const/4 p3, 0x0

    array-length v3, p1

    .end local p3    # "carrierStr":Ljava/lang/String;
    invoke-static {p1, p3, v6, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1358
    add-int/lit8 p1, v2, 0x2

    .line 1361
    .end local v2    # "offset":I
    .local p1, "offset":I
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .end local p0    # "mdn":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    .line 1362
    .local p0, "byte_pMdn":[B
    const/4 p3, 0x0

    array-length v2, p0

    invoke-static {p0, p3, v6, p1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1363
    add-int/lit8 p0, p1, 0xb

    .line 1366
    .end local p1    # "offset":I
    .local p0, "offset":I
    if-eqz p4, :cond_1

    .line 1367
    invoke-virtual {p4}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    const/4 p3, 0x0

    invoke-virtual {p4}, Ljava/lang/String;->getBytes()[B

    move-result-object p4

    .end local p4    # "TID":Ljava/lang/String;
    array-length p4, p4

    invoke-static {p1, p3, v6, p0, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1368
    add-int/lit8 p0, p0, 0x64

    .line 1372
    :cond_1
    if-eqz p2, :cond_2

    .line 1373
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    int-to-byte p1, p1

    aput-byte p1, v6, p0

    .line 1374
    :cond_2
    add-int/lit8 p0, p0, 0x1

    .line 1376
    if-eqz p2, :cond_3

    .line 1377
    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    const/4 p3, 0x0

    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object p4

    array-length p4, p4

    invoke-static {p1, p3, v6, p0, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1378
    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    array-length p1, p1

    add-int/2addr p0, p1

    .line 1381
    :cond_3
    if-eqz v8, :cond_5

    .line 1383
    if-eqz p5, :cond_4

    .line 1384
    invoke-virtual/range {p5 .. p5}, Ljava/lang/String;->length()I

    move-result p1

    int-to-byte p1, p1

    aput-byte p1, v6, p0

    .line 1386
    :cond_4
    add-int/lit8 p0, p0, 0x1

    .line 1388
    if-eqz p5, :cond_5

    .line 1389
    invoke-virtual/range {p5 .. p5}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual/range {p5 .. p5}, Ljava/lang/String;->getBytes()[B

    .end local p2    # "pName":Ljava/lang/String;
    move-result-object p3

    array-length p3, p3

    invoke-static {p1, p2, v6, p0, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1390
    invoke-virtual/range {p5 .. p5}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    array-length p1, p1

    add-int/2addr p0, p1

    .line 1395
    :cond_5
    add-int/lit8 p1, p0, 0x1

    .end local p0    # "offset":I
    .restart local p1    # "offset":I
    invoke-virtual/range {p7 .. p7}, Ljava/lang/String;->length()I

    move-result p2

    int-to-byte p2, p2

    aput-byte p2, v6, p0

    .line 1396
    invoke-static/range {p7 .. p7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    .line 1397
    .local p0, "byte_pJumin":[B
    const/4 p2, 0x0

    array-length p3, p0

    invoke-static {p0, p2, v6, p1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1398
    invoke-virtual/range {p7 .. p7}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    .end local p0    # "byte_pJumin":[B
    array-length p0, p0

    add-int/2addr p0, p1

    .line 1400
    .end local p1    # "offset":I
    .local p0, "offset":I
    const-string p1, "DEBUG"

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "Jumin="

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p7 .. p7}, Ljava/lang/String;->length()I

    move-result p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, "  // Value = "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    move-object v0, p2

    move-object/from16 v1, p7

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/feelingk/iap/util/CommonF$LOGGER;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1404
    if-eqz p6, :cond_9

    .line 1405
    add-int/lit8 p1, p0, 0x1

    .end local p0    # "offset":I
    .restart local p1    # "offset":I
    const/16 p2, 0x59

    aput-byte p2, v6, p0

    move p0, p1

    .line 1409
    .end local p1    # "offset":I
    .restart local p0    # "offset":I
    :goto_4
    const/4 p0, 0x1

    sub-int p0, v7, p0

    const/16 p1, 0x17

    aput-byte p1, v6, p0

    .line 1412
    .end local p0    # "offset":I
    invoke-static {v6}, Lcom/feelingk/iap/net/IAPNet;->iapWrite([B)B

    move-result p0

    .line 1413
    .local p0, "ret":B
    array-length p1, v6

    invoke-static {v6, p1}, Lcom/feelingk/iap/net/IAPNetworkUtil;->packetDebug([BI)V

    .line 1414
    if-eqz p0, :cond_a

    .line 1415
    invoke-virtual {v4, p0}, Lcom/feelingk/iap/net/MsgConfirm;->setResultCode(B)V

    .line 1416
    const-string p0, "\ub124\ud2b8\uc6cc\ud06c \uc804\uc1a1\uc911 \uc5d0\ub7ec\uc785\ub2c8\ub2e4."

    .end local p0    # "ret":B
    invoke-virtual {v4, p0}, Lcom/feelingk/iap/net/MsgConfirm;->SetUserMessage(Ljava/lang/String;)V

    move-object p0, v4

    .line 1429
    .end local v4    # "itemPurchaseDanalCfm":Lcom/feelingk/iap/net/MsgConfirm;
    .local p0, "itemPurchaseDanalCfm":Lcom/feelingk/iap/net/MsgConfirm;
    :goto_5
    return-object p0

    .line 1331
    .end local v6    # "packetBytes":[B
    .restart local v3    # "headerParam":Ljava/lang/String;
    .restart local v4    # "itemPurchaseDanalCfm":Lcom/feelingk/iap/net/MsgConfirm;
    .local p0, "mdn":Ljava/lang/String;
    .local p1, "pID":Ljava/lang/String;
    .restart local p2    # "pName":Ljava/lang/String;
    .local p3, "pCarrier":I
    .restart local p4    # "TID":Ljava/lang/String;
    :cond_6
    const/4 v2, 0x3

    if-ne p3, v2, :cond_7

    .line 1332
    const-string p3, "13"

    .local p3, "carrierStr":Ljava/lang/String;
    goto/16 :goto_2

    .line 1335
    .local p3, "pCarrier":I
    :cond_7
    const-string p3, "11"

    .local p3, "carrierStr":Ljava/lang/String;
    goto/16 :goto_2

    .line 1340
    .local v2, "i":I
    .restart local v6    # "packetBytes":[B
    :cond_8
    const/4 v5, 0x0

    aput-byte v5, v6, v2

    .line 1339
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_3

    .line 1407
    .end local v2    # "i":I
    .end local v3    # "headerParam":Ljava/lang/String;
    .end local p1    # "pID":Ljava/lang/String;
    .end local p2    # "pName":Ljava/lang/String;
    .end local p3    # "carrierStr":Ljava/lang/String;
    .end local p4    # "TID":Ljava/lang/String;
    .local p0, "offset":I
    :cond_9
    add-int/lit8 p1, p0, 0x1

    .end local p0    # "offset":I
    .local p1, "offset":I
    const/16 p2, 0x4e

    aput-byte p2, v6, p0

    move p0, p1

    .end local p1    # "offset":I
    .restart local p0    # "offset":I
    goto :goto_4

    .line 1421
    .local p0, "ret":B
    :cond_a
    invoke-static {v4}, Lcom/feelingk/iap/net/IAPNet;->iapReceive(Lcom/feelingk/iap/net/Confirm;)[B

    move-result-object p0

    .line 1422
    .local p0, "recv":[B
    invoke-virtual {v4}, Lcom/feelingk/iap/net/MsgConfirm;->getResultCode()B

    move-result p1

    if-eqz p1, :cond_b

    .line 1423
    const-string p0, "\ub124\ud2b8\uc6cc\ud06c \uc804\uc1a1\uc911 \uc5d0\ub7ec\uc785\ub2c8\ub2e4."

    .end local p0    # "recv":[B
    invoke-virtual {v4, p0}, Lcom/feelingk/iap/net/MsgConfirm;->SetUserMessage(Ljava/lang/String;)V

    move-object p0, v4

    .line 1424
    .end local v4    # "itemPurchaseDanalCfm":Lcom/feelingk/iap/net/MsgConfirm;
    .local p0, "itemPurchaseDanalCfm":Lcom/feelingk/iap/net/MsgConfirm;
    goto :goto_5

    .line 1427
    .restart local v4    # "itemPurchaseDanalCfm":Lcom/feelingk/iap/net/MsgConfirm;
    .local p0, "recv":[B
    :cond_b
    invoke-virtual {v4, p0}, Lcom/feelingk/iap/net/MsgConfirm;->parse([B)V

    .line 1428
    const-string p0, "IAPNet"

    .end local p0    # "recv":[B
    const-string p1, "[ DEBUG ] iapSendItemPurchaseByDanal()  End !!!!!!!!"

    invoke-static {p0, p1}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    move-object p0, v4

    .line 1429
    .end local v4    # "itemPurchaseDanalCfm":Lcom/feelingk/iap/net/MsgConfirm;
    .local p0, "itemPurchaseDanalCfm":Lcom/feelingk/iap/net/MsgConfirm;
    goto :goto_5

    .end local v7    # "packet_len":I
    .end local v8    # "useXPProtocol":Z
    .local v2, "headerParam":Ljava/lang/String;
    .local v3, "packet_len":I
    .restart local v4    # "itemPurchaseDanalCfm":Lcom/feelingk/iap/net/MsgConfirm;
    .local v6, "useXPProtocol":Z
    .local p0, "mdn":Ljava/lang/String;
    .local p1, "pID":Ljava/lang/String;
    .restart local p2    # "pName":Ljava/lang/String;
    .local p3, "pCarrier":I
    .restart local p4    # "TID":Ljava/lang/String;
    :cond_c
    move v8, v6

    .end local v6    # "useXPProtocol":Z
    .restart local v8    # "useXPProtocol":Z
    move-object v10, v2

    .end local v2    # "headerParam":Ljava/lang/String;
    .restart local v10    # "headerParam":Ljava/lang/String;
    move v2, v3

    .end local v3    # "packet_len":I
    .local v2, "packet_len":I
    move-object v3, v10

    .end local v10    # "headerParam":Ljava/lang/String;
    .local v3, "headerParam":Ljava/lang/String;
    goto/16 :goto_1

    .end local v2    # "packet_len":I
    .end local v8    # "useXPProtocol":Z
    .local v5, "packet_len":I
    .restart local v6    # "useXPProtocol":Z
    :cond_d
    move v2, v5

    .end local v5    # "packet_len":I
    .restart local v2    # "packet_len":I
    move v8, v6

    .end local v6    # "useXPProtocol":Z
    .restart local v8    # "useXPProtocol":Z
    goto/16 :goto_1

    .end local v8    # "useXPProtocol":Z
    .restart local v6    # "useXPProtocol":Z
    :cond_e
    move v5, v2

    .end local v2    # "packet_len":I
    .restart local v5    # "packet_len":I
    goto/16 :goto_0
.end method

.method protected static iapSendItemQuery(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/feelingk/iap/net/MsgConfirm;
    .locals 8
    .param p0, "pID"    # Ljava/lang/String;
    .param p1, "pName"    # Ljava/lang/String;
    .param p2, "pTID"    # Ljava/lang/String;
    .param p3, "pBPInfo"    # Ljava/lang/String;

    .prologue
    .line 973
    const-string v0, "LP"

    .line 974
    .local v0, "headerParam":Ljava/lang/String;
    new-instance v2, Lcom/feelingk/iap/net/MsgConfirm;

    invoke-direct {v2}, Lcom/feelingk/iap/net/MsgConfirm;-><init>()V

    .line 976
    .local v2, "msgConfirm":Lcom/feelingk/iap/net/MsgConfirm;
    const-string v1, "IAPNet"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "[ DEBUG ] iapSendItemQuery() PID="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 977
    const/16 v1, 0xc

    .line 979
    .local v1, "packet_len":I
    add-int/lit8 v1, v1, 0xa

    .line 980
    add-int/lit8 v1, v1, 0x1

    .line 981
    if-eqz p1, :cond_0

    .line 984
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .end local v0    # "headerParam":Ljava/lang/String;
    array-length v0, v0

    add-int/lit8 v1, v0, 0x17

    .line 985
    const-string v0, "EP"

    .line 988
    .restart local v0    # "headerParam":Ljava/lang/String;
    :cond_0
    if-eqz p2, :cond_9

    .line 989
    add-int/lit8 v1, v1, 0x64

    .line 990
    const-string v0, "NP"

    .line 991
    add-int/lit8 v1, v1, 0x1

    move v7, v1

    .end local v1    # "packet_len":I
    .local v7, "packet_len":I
    move-object v1, v0

    .end local v0    # "headerParam":Ljava/lang/String;
    .local v1, "headerParam":Ljava/lang/String;
    move v0, v7

    .line 994
    .end local v7    # "packet_len":I
    .local v0, "packet_len":I
    :goto_0
    if-eqz p3, :cond_1

    .line 995
    invoke-virtual {p3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    array-length v3, v3

    add-int/2addr v0, v3

    .line 998
    :cond_1
    add-int/lit8 v5, v0, 0x1

    .line 1001
    .end local v0    # "packet_len":I
    .local v5, "packet_len":I
    new-array v4, v5, [B

    .line 1002
    .local v4, "packetBytes":[B
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-lt v0, v5, :cond_6

    .line 1004
    const/4 v3, 0x0

    .line 1006
    .local v3, "offset":I
    const/4 v0, 0x0

    check-cast v0, [B

    .line 1008
    .local v0, "header":[B
    const/16 v0, 0xc

    sub-int v0, v5, v0

    invoke-static {v1, v0}, Lcom/feelingk/iap/net/IAPNetworkUtil;->iapMakePacketHeader(Ljava/lang/String;I)[B

    .end local v0    # "header":[B
    move-result-object v0

    .line 1018
    .restart local v0    # "header":[B
    const/16 v1, 0xc

    invoke-static {v0, v1}, Lcom/feelingk/iap/net/IAPNetworkUtil;->packetDebug([BI)V

    .line 1021
    .end local v1    # "headerParam":Ljava/lang/String;
    const/4 v1, 0x0

    array-length v6, v0

    invoke-static {v0, v1, v4, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1023
    add-int/lit8 v0, v3, 0xc

    .line 1025
    .end local v3    # "offset":I
    .local v0, "offset":I
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .end local p0    # "pID":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    .line 1026
    .local p0, "byte_pID":[B
    const/4 v1, 0x0

    array-length v3, p0

    invoke-static {p0, v1, v4, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1028
    add-int/lit8 p0, v0, 0xa

    .line 1039
    .end local v0    # "offset":I
    .local p0, "offset":I
    if-eqz p1, :cond_2

    .line 1040
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v0, v0

    int-to-byte v0, v0

    aput-byte v0, v4, p0

    .line 1041
    :cond_2
    add-int/lit8 p0, p0, 0x1

    .line 1043
    if-eqz p1, :cond_3

    .line 1044
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    array-length v3, v3

    invoke-static {v0, v1, v4, p0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1045
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    .end local p0    # "offset":I
    array-length p0, p0

    add-int/lit8 p0, p0, 0x17

    .line 1050
    .restart local p0    # "offset":I
    :cond_3
    if-eqz p2, :cond_4

    .line 1051
    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    .end local p1    # "pName":Ljava/lang/String;
    const/4 v0, 0x0

    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object p2

    .end local p2    # "pTID":Ljava/lang/String;
    array-length p2, p2

    invoke-static {p1, v0, v4, p0, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1052
    add-int/lit8 p0, p0, 0x64

    .line 1053
    add-int/lit8 p0, p0, 0x1

    .line 1056
    :cond_4
    if-eqz p3, :cond_5

    .line 1057
    invoke-virtual {p3}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    array-length p1, p1

    int-to-byte p1, p1

    aput-byte p1, v4, p0

    .line 1058
    invoke-virtual {p3}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p3}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v0, v0

    invoke-static {p1, p2, v4, p0, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1059
    invoke-virtual {p3}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    array-length p1, p1

    add-int/2addr p0, p1

    .line 1063
    :cond_5
    const/4 p0, 0x1

    sub-int p0, v5, p0

    const/16 p1, 0x17

    aput-byte p1, v4, p0

    .line 1065
    .end local p0    # "offset":I
    invoke-static {v4}, Lcom/feelingk/iap/net/IAPNet;->iapWrite([B)B

    move-result p0

    .line 1066
    .local p0, "ret":B
    if-eqz p0, :cond_7

    .line 1067
    invoke-virtual {v2, p0}, Lcom/feelingk/iap/net/MsgConfirm;->setResultCode(B)V

    .line 1068
    const-string p0, "\ub124\ud2b8\uc6cc\ud06c \uc804\uc1a1\uc911 \uc5d0\ub7ec\uc785\ub2c8\ub2e4."

    .end local p0    # "ret":B
    invoke-virtual {v2, p0}, Lcom/feelingk/iap/net/MsgConfirm;->SetUserMessage(Ljava/lang/String;)V

    move-object p0, v2

    .line 1081
    .end local v2    # "msgConfirm":Lcom/feelingk/iap/net/MsgConfirm;
    .local p0, "msgConfirm":Lcom/feelingk/iap/net/MsgConfirm;
    :goto_2
    return-object p0

    .line 1003
    .local v0, "i":I
    .restart local v1    # "headerParam":Ljava/lang/String;
    .restart local v2    # "msgConfirm":Lcom/feelingk/iap/net/MsgConfirm;
    .local p0, "pID":Ljava/lang/String;
    .restart local p1    # "pName":Ljava/lang/String;
    .restart local p2    # "pTID":Ljava/lang/String;
    :cond_6
    const/4 v3, 0x0

    aput-byte v3, v4, v0

    .line 1002
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_1

    .line 1073
    .end local v0    # "i":I
    .end local v1    # "headerParam":Ljava/lang/String;
    .end local p1    # "pName":Ljava/lang/String;
    .end local p2    # "pTID":Ljava/lang/String;
    .local p0, "ret":B
    :cond_7
    invoke-static {v2}, Lcom/feelingk/iap/net/IAPNet;->iapReceive(Lcom/feelingk/iap/net/Confirm;)[B

    move-result-object p0

    .line 1074
    .local p0, "recv":[B
    invoke-virtual {v2}, Lcom/feelingk/iap/net/MsgConfirm;->getResultCode()B

    move-result p1

    if-eqz p1, :cond_8

    .line 1075
    const-string p0, "\ub124\ud2b8\uc6cc\ud06c \uc804\uc1a1\uc911 \uc5d0\ub7ec\uc785\ub2c8\ub2e4."

    .end local p0    # "recv":[B
    invoke-virtual {v2, p0}, Lcom/feelingk/iap/net/MsgConfirm;->SetUserMessage(Ljava/lang/String;)V

    move-object p0, v2

    .line 1076
    .end local v2    # "msgConfirm":Lcom/feelingk/iap/net/MsgConfirm;
    .local p0, "msgConfirm":Lcom/feelingk/iap/net/MsgConfirm;
    goto :goto_2

    .line 1080
    .restart local v2    # "msgConfirm":Lcom/feelingk/iap/net/MsgConfirm;
    .local p0, "recv":[B
    :cond_8
    invoke-virtual {v2, p0}, Lcom/feelingk/iap/net/MsgConfirm;->parse([B)V

    move-object p0, v2

    .line 1081
    .end local v2    # "msgConfirm":Lcom/feelingk/iap/net/MsgConfirm;
    .local p0, "msgConfirm":Lcom/feelingk/iap/net/MsgConfirm;
    goto :goto_2

    .end local v4    # "packetBytes":[B
    .end local v5    # "packet_len":I
    .local v0, "headerParam":Ljava/lang/String;
    .local v1, "packet_len":I
    .restart local v2    # "msgConfirm":Lcom/feelingk/iap/net/MsgConfirm;
    .local p0, "pID":Ljava/lang/String;
    .restart local p1    # "pName":Ljava/lang/String;
    .restart local p2    # "pTID":Ljava/lang/String;
    :cond_9
    move v7, v1

    .end local v1    # "packet_len":I
    .restart local v7    # "packet_len":I
    move-object v1, v0

    .end local v0    # "headerParam":Ljava/lang/String;
    .local v1, "headerParam":Ljava/lang/String;
    move v0, v7

    .end local v7    # "packet_len":I
    .local v0, "packet_len":I
    goto/16 :goto_0
.end method

.method protected static iapSendItemUse(Ljava/lang/String;)Lcom/feelingk/iap/net/ItemUseConfirm;
    .locals 12
    .param p0, "pID"    # Ljava/lang/String;

    .prologue
    const/4 v11, 0x0

    .line 1492
    new-instance v3, Lcom/feelingk/iap/net/ItemUseConfirm;

    invoke-direct {v3}, Lcom/feelingk/iap/net/ItemUseConfirm;-><init>()V

    .line 1495
    .local v3, "itemUseConfirmMsg":Lcom/feelingk/iap/net/ItemUseConfirm;
    const/16 v6, 0xc

    .line 1496
    .local v6, "packet_len":I
    add-int/lit8 v6, v6, 0xa

    .line 1497
    add-int/lit8 v6, v6, 0x1

    .line 1499
    new-array v5, v6, [B

    .line 1500
    .local v5, "packetBytes":[B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-lt v2, v6, :cond_0

    .line 1502
    const/4 v4, 0x0

    .line 1504
    .local v4, "offset":I
    const-string v9, "MP"

    const/16 v10, 0xc

    sub-int v10, v6, v10

    invoke-static {v9, v10}, Lcom/feelingk/iap/net/IAPNetworkUtil;->iapMakePacketHeader(Ljava/lang/String;I)[B

    move-result-object v1

    .line 1507
    .local v1, "header":[B
    array-length v9, v1

    invoke-static {v1, v11, v5, v4, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1508
    add-int/lit8 v4, v4, 0xc

    .line 1510
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 1511
    .local v0, "byte_pID":[B
    array-length v9, v0

    invoke-static {v0, v11, v5, v4, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1513
    const/4 v9, 0x1

    sub-int v9, v6, v9

    const/16 v10, 0x17

    aput-byte v10, v5, v9

    .line 1515
    invoke-static {v5}, Lcom/feelingk/iap/net/IAPNet;->iapWrite([B)B

    move-result v8

    .line 1516
    .local v8, "ret":B
    if-eqz v8, :cond_1

    .line 1517
    invoke-virtual {v3, v8}, Lcom/feelingk/iap/net/ItemUseConfirm;->setResultCode(B)V

    .line 1518
    const-string v9, "\ub124\ud2b8\uc6cc\ud06c \uc804\uc1a1\uc911 \uc5d0\ub7ec\uc785\ub2c8\ub2e4."

    invoke-virtual {v3, v9}, Lcom/feelingk/iap/net/ItemUseConfirm;->SetUserMessage(Ljava/lang/String;)V

    .line 1531
    :goto_1
    return-object v3

    .line 1501
    .end local v0    # "byte_pID":[B
    .end local v1    # "header":[B
    .end local v4    # "offset":I
    .end local v8    # "ret":B
    :cond_0
    aput-byte v11, v5, v2

    .line 1500
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1523
    .restart local v0    # "byte_pID":[B
    .restart local v1    # "header":[B
    .restart local v4    # "offset":I
    .restart local v8    # "ret":B
    :cond_1
    invoke-static {v3}, Lcom/feelingk/iap/net/IAPNet;->iapReceive(Lcom/feelingk/iap/net/Confirm;)[B

    move-result-object v7

    .line 1524
    .local v7, "recv":[B
    invoke-virtual {v3}, Lcom/feelingk/iap/net/ItemUseConfirm;->getResultCode()B

    move-result v9

    if-eqz v9, :cond_2

    .line 1525
    const-string v9, "\ub124\ud2b8\uc6cc\ud06c \uc804\uc1a1\uc911 \uc5d0\ub7ec\uc785\ub2c8\ub2e4."

    invoke-virtual {v3, v9}, Lcom/feelingk/iap/net/ItemUseConfirm;->SetUserMessage(Ljava/lang/String;)V

    goto :goto_1

    .line 1530
    :cond_2
    invoke-virtual {v3, v7}, Lcom/feelingk/iap/net/ItemUseConfirm;->parse([B)V

    goto :goto_1
.end method

.method protected static iapSendItemWholeAuth()Lcom/feelingk/iap/net/ItemWholeAuthConfirm;
    .locals 11

    .prologue
    const/4 v10, 0x0

    .line 1447
    new-instance v2, Lcom/feelingk/iap/net/ItemWholeAuthConfirm;

    invoke-direct {v2}, Lcom/feelingk/iap/net/ItemWholeAuthConfirm;-><init>()V

    .line 1449
    .local v2, "itemWholeAutchConfirm":Lcom/feelingk/iap/net/ItemWholeAuthConfirm;
    const-string v8, "IAPNet"

    const-string v9, "[ DEBUG ] iapSendItemWholeAuth()"

    invoke-static {v8, v9}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1451
    const/16 v5, 0xc

    .line 1452
    .local v5, "packet_len":I
    add-int/lit8 v5, v5, 0x1

    .line 1454
    new-array v4, v5, [B

    .line 1455
    .local v4, "packetBytes":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-lt v1, v5, :cond_0

    .line 1457
    const/4 v3, 0x0

    .line 1459
    .local v3, "offset":I
    const-string v8, "AP"

    const/16 v9, 0xc

    sub-int v9, v5, v9

    invoke-static {v8, v9}, Lcom/feelingk/iap/net/IAPNetworkUtil;->iapMakePacketHeader(Ljava/lang/String;I)[B

    move-result-object v0

    .line 1462
    .local v0, "header":[B
    array-length v8, v0

    invoke-static {v0, v10, v4, v3, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1464
    const/4 v8, 0x1

    sub-int v8, v5, v8

    const/16 v9, 0x17

    aput-byte v9, v4, v8

    .line 1466
    invoke-static {v4}, Lcom/feelingk/iap/net/IAPNet;->iapWrite([B)B

    move-result v7

    .line 1467
    .local v7, "ret":B
    if-eqz v7, :cond_1

    .line 1468
    invoke-virtual {v2, v7}, Lcom/feelingk/iap/net/ItemWholeAuthConfirm;->setResultCode(B)V

    .line 1469
    const-string v8, "\ub124\ud2b8\uc6cc\ud06c \uc804\uc1a1\uc911 \uc5d0\ub7ec\uc785\ub2c8\ub2e4."

    invoke-virtual {v2, v8}, Lcom/feelingk/iap/net/ItemWholeAuthConfirm;->SetUserMessage(Ljava/lang/String;)V

    .line 1482
    :goto_1
    return-object v2

    .line 1456
    .end local v0    # "header":[B
    .end local v3    # "offset":I
    .end local v7    # "ret":B
    :cond_0
    aput-byte v10, v4, v1

    .line 1455
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1474
    .restart local v0    # "header":[B
    .restart local v3    # "offset":I
    .restart local v7    # "ret":B
    :cond_1
    invoke-static {v2}, Lcom/feelingk/iap/net/IAPNet;->iapReceive(Lcom/feelingk/iap/net/Confirm;)[B

    move-result-object v6

    .line 1475
    .local v6, "recv":[B
    invoke-virtual {v2}, Lcom/feelingk/iap/net/ItemWholeAuthConfirm;->getResultCode()B

    move-result v8

    if-eqz v8, :cond_2

    .line 1476
    const-string v8, "\ub124\ud2b8\uc6cc\ud06c \uc804\uc1a1\uc911 \uc5d0\ub7ec\uc785\ub2c8\ub2e4."

    invoke-virtual {v2, v8}, Lcom/feelingk/iap/net/ItemWholeAuthConfirm;->SetUserMessage(Ljava/lang/String;)V

    goto :goto_1

    .line 1481
    :cond_2
    invoke-virtual {v2, v6}, Lcom/feelingk/iap/net/ItemWholeAuthConfirm;->parse([B)V

    goto :goto_1
.end method

.method protected static declared-synchronized iapWrite([B)B
    .locals 6
    .param p0, "sendBuf"    # [B

    .prologue
    const/4 v5, 0x0

    .line 401
    const-class v1, Lcom/feelingk/iap/net/IAPNet;

    monitor-enter v1

    :try_start_0
    const-string v2, "IAPNet"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "[ DEBUG ] iapWrite connect("

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-boolean v4, Lcom/feelingk/iap/net/IAPNet;->connect:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/feelingk/iap/util/CommonF$LOGGER;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 402
    sget-boolean v2, Lcom/feelingk/iap/net/IAPNet;->connect:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    .line 403
    const/4 v2, -0x2

    .line 422
    :goto_0
    monitor-exit v1

    return v2

    .line 406
    :cond_0
    :try_start_1
    array-length v2, p0

    invoke-static {p0, v2}, Lcom/feelingk/iap/net/IAPNetworkUtil;->packetDebug([BI)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 408
    :try_start_2
    sget-object v2, Lcom/feelingk/iap/net/IAPNet;->outputStream:Ljava/io/OutputStream;

    const/4 v3, 0x0

    array-length v4, p0

    invoke-virtual {v2, p0, v3, v4}, Ljava/io/OutputStream;->write([BII)V

    .line 409
    sget-object v2, Lcom/feelingk/iap/net/IAPNet;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V
    :try_end_2
    .catch Ljava/net/SocketTimeoutException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 421
    :try_start_3
    const-string v2, "IAPNet"

    const-string v3, "[ DEBUG ] iapWrite End  "

    invoke-static {v2, v3}, Lcom/feelingk/iap/util/CommonF$LOGGER;->e(Ljava/lang/String;Ljava/lang/String;)V

    move v2, v5

    .line 422
    goto :goto_0

    .line 411
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 412
    .local v0, "e":Ljava/net/SocketTimeoutException;
    const-string v2, "IAPNet"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "[ Exception ] iapWrite() "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 413
    invoke-virtual {v0}, Ljava/net/SocketTimeoutException;->printStackTrace()V

    .line 414
    const/16 v2, -0xc

    goto :goto_0

    .line 416
    .end local v0    # "e":Ljava/net/SocketTimeoutException;
    :catch_1
    move-exception v2

    move-object v0, v2

    .line 417
    .local v0, "e":Ljava/io/IOException;
    const-string v2, "IAPNet"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "[ Exception ] iapWrite() "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 418
    const/4 v2, -0x4

    goto :goto_0

    .line 401
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v2

    monitor-exit v1

    throw v2
.end method

.method protected static declared-synchronized iapWriteBP([B)B
    .locals 6
    .param p0, "sendBuf"    # [B

    .prologue
    const/4 v5, 0x0

    .line 744
    const-class v1, Lcom/feelingk/iap/net/IAPNet;

    monitor-enter v1

    :try_start_0
    sget-boolean v2, Lcom/feelingk/iap/net/IAPNet;->connectBP:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    .line 745
    const/4 v2, -0x2

    .line 757
    :goto_0
    monitor-exit v1

    return v2

    .line 749
    :cond_0
    :try_start_1
    sget-object v2, Lcom/feelingk/iap/net/IAPNet;->outputStreamBP:Ljava/io/OutputStream;

    const/4 v3, 0x0

    array-length v4, p0

    invoke-virtual {v2, p0, v3, v4}, Ljava/io/OutputStream;->write([BII)V

    .line 750
    sget-object v2, Lcom/feelingk/iap/net/IAPNet;->outputStreamBP:Ljava/io/OutputStream;

    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move v2, v5

    .line 757
    goto :goto_0

    .line 752
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 753
    .local v0, "e":Ljava/io/IOException;
    :try_start_2
    const-string v2, "IAPNet"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "[ DEBUG ] iapWriteBP() "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 754
    const/4 v2, -0x4

    goto :goto_0

    .line 744
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v2

    monitor-exit v1

    throw v2
.end method

.method protected static isConnect()Z
    .locals 1

    .prologue
    .line 935
    sget-boolean v0, Lcom/feelingk/iap/net/IAPNet;->connect:Z

    return v0
.end method

.method protected static isWifi()Z
    .locals 1

    .prologue
    .line 942
    sget-boolean v0, Lcom/feelingk/iap/net/IAPNet;->isWifi:Z

    return v0
.end method

.method protected static setWifi(Z)V
    .locals 0
    .param p0, "isWifi"    # Z

    .prologue
    .line 950
    sput-boolean p0, Lcom/feelingk/iap/net/IAPNet;->isWifi:Z

    .line 951
    return-void
.end method
