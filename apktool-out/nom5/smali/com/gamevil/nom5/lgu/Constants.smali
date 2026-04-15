.class public final enum Lcom/gamevil/nom5/lgu/Constants;
.super Ljava/lang/Enum;
.source "Constants.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/gamevil/nom5/lgu/Constants;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/gamevil/nom5/lgu/Constants;

.field public static final enum LGU:Lcom/gamevil/nom5/lgu/Constants;


# instance fields
.field public final INT_LGU_ARM_PASSED:Ljava/lang/Integer;

.field public final INT_LGU_IAP_GENERAL_ERROR:Ljava/lang/Integer;

.field public final INT_LGU_IAP_NOT_CHARGED:Ljava/lang/Integer;

.field public final INT_LGU_IAP_NOT_INSTALLED:Ljava/lang/Integer;

.field private final STR_GENERAL_ERROR:Ljava/lang/String;

.field private final STR_NETWORK_WARNING:Ljava/lang/String;

.field private final handler:Landroid/os/Handler;

.field private notificationMessageMap:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final properties:Ljava/util/Properties;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 44
    new-instance v0, Lcom/gamevil/nom5/lgu/Constants;

    const-string v1, "LGU"

    invoke-direct {v0, v1, v2}, Lcom/gamevil/nom5/lgu/Constants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/gamevil/nom5/lgu/Constants;->LGU:Lcom/gamevil/nom5/lgu/Constants;

    .line 43
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/gamevil/nom5/lgu/Constants;

    sget-object v1, Lcom/gamevil/nom5/lgu/Constants;->LGU:Lcom/gamevil/nom5/lgu/Constants;

    aput-object v1, v0, v2

    sput-object v0, Lcom/gamevil/nom5/lgu/Constants;->ENUM$VALUES:[Lcom/gamevil/nom5/lgu/Constants;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 5

    .prologue
    .line 49
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 188
    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    iput-object v2, p0, Lcom/gamevil/nom5/lgu/Constants;->handler:Landroid/os/Handler;

    .line 189
    const-string v2, "Network Warining"

    iput-object v2, p0, Lcom/gamevil/nom5/lgu/Constants;->STR_NETWORK_WARNING:Ljava/lang/String;

    .line 190
    const-string v2, "General Error(Constants E)"

    iput-object v2, p0, Lcom/gamevil/nom5/lgu/Constants;->STR_GENERAL_ERROR:Ljava/lang/String;

    .line 191
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, p0, Lcom/gamevil/nom5/lgu/Constants;->INT_LGU_ARM_PASSED:Ljava/lang/Integer;

    .line 192
    const/high16 v2, -0x10000

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, p0, Lcom/gamevil/nom5/lgu/Constants;->INT_LGU_IAP_GENERAL_ERROR:Ljava/lang/Integer;

    .line 193
    const/16 v2, -0x64

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, p0, Lcom/gamevil/nom5/lgu/Constants;->INT_LGU_IAP_NOT_INSTALLED:Ljava/lang/Integer;

    .line 194
    const/16 v2, 0x3e7

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, p0, Lcom/gamevil/nom5/lgu/Constants;->INT_LGU_IAP_NOT_CHARGED:Ljava/lang/Integer;

    .line 195
    new-instance v2, Ljava/util/Properties;

    invoke-direct {v2}, Ljava/util/Properties;-><init>()V

    iput-object v2, p0, Lcom/gamevil/nom5/lgu/Constants;->properties:Ljava/util/Properties;

    .line 196
    new-instance v2, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v2}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v2, p0, Lcom/gamevil/nom5/lgu/Constants;->notificationMessageMap:Ljava/util/concurrent/ConcurrentMap;

    .line 50
    const/4 v1, 0x0

    .line 52
    .local v1, "is":Ljava/io/InputStream;
    :try_start_0
    sget-object v2, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    invoke-virtual {v2}, Lcom/gamevil/nexus2/NexusGLActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const/high16 v3, 0x7f060000

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v1

    .line 53
    iget-object v2, p0, Lcom/gamevil/nom5/lgu/Constants;->properties:Ljava/util/Properties;

    invoke-virtual {v2, v1}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    if-eqz v1, :cond_0

    .line 63
    :try_start_1
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_5

    .line 70
    :cond_0
    :goto_0
    return-void

    .line 54
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 55
    .local v0, "e":Ljava/io/IOException;
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 61
    if-eqz v1, :cond_0

    .line 63
    :try_start_3
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0

    .line 64
    :catch_1
    move-exception v0

    .line 65
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 57
    .end local v0    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v2

    move-object v0, v2

    .line 58
    .local v0, "e":Ljava/lang/Exception;
    :try_start_4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 61
    if-eqz v1, :cond_0

    .line 63
    :try_start_5
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_0

    .line 64
    :catch_3
    move-exception v0

    .line 65
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 60
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v2

    .line 61
    if-eqz v1, :cond_1

    .line 63
    :try_start_6
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    .line 69
    :cond_1
    :goto_1
    throw v2

    .line 64
    :catch_4
    move-exception v0

    .line 65
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 64
    .end local v0    # "e":Ljava/io/IOException;
    :catch_5
    move-exception v0

    .line 65
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/gamevil/nom5/lgu/Constants;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/gamevil/nom5/lgu/Constants;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/gamevil/nom5/lgu/Constants;

    return-object p0
.end method

.method public static values()[Lcom/gamevil/nom5/lgu/Constants;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/gamevil/nom5/lgu/Constants;->ENUM$VALUES:[Lcom/gamevil/nom5/lgu/Constants;

    array-length v1, v0

    new-array v2, v1, [Lcom/gamevil/nom5/lgu/Constants;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method


# virtual methods
.method public addNotificationMessage(Ljava/lang/Long;Ljava/lang/String;)V
    .locals 1
    .param p1, "msgNo"    # Ljava/lang/Long;
    .param p2, "errorMsg"    # Ljava/lang/String;

    .prologue
    .line 141
    if-nez p2, :cond_0

    const-string p2, "Network Warining"

    .line 142
    :cond_0
    iget-object v0, p0, Lcom/gamevil/nom5/lgu/Constants;->notificationMessageMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1, p2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    return-void
.end method

.method public getMessage(Ljava/lang/Integer;)Ljava/lang/String;
    .locals 4
    .param p1, "msgCode"    # Ljava/lang/Integer;

    .prologue
    .line 81
    if-eqz p1, :cond_1

    .line 82
    iget-object v1, p0, Lcom/gamevil/nom5/lgu/Constants;->properties:Ljava/util/Properties;

    invoke-virtual {p1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Properties;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 83
    iget-object v1, p0, Lcom/gamevil/nom5/lgu/Constants;->properties:Ljava/util/Properties;

    invoke-virtual {p1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 93
    :goto_0
    return-object v1

    .line 85
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "0x"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 86
    .local v0, "strMsg":Ljava/lang/String;
    iget-object v1, p0, Lcom/gamevil/nom5/lgu/Constants;->properties:Ljava/util/Properties;

    invoke-virtual {v1, v0}, Ljava/util/Properties;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 87
    iget-object v1, p0, Lcom/gamevil/nom5/lgu/Constants;->properties:Ljava/util/Properties;

    invoke-virtual {p1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/gamevil/nom5/lgu/Constants;->properties:Ljava/util/Properties;

    invoke-virtual {v3, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    iget-object v1, p0, Lcom/gamevil/nom5/lgu/Constants;->properties:Ljava/util/Properties;

    invoke-virtual {p1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 93
    .end local v0    # "strMsg":Ljava/lang/String;
    :cond_1
    const-string v1, "General Error(Constants E)"

    goto :goto_0
.end method

.method public getMessage(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/String;
    .locals 4
    .param p1, "msgCode"    # Ljava/lang/Integer;
    .param p2, "elseCode"    # Ljava/lang/Integer;

    .prologue
    .line 108
    if-eqz p1, :cond_1

    .line 109
    iget-object v1, p0, Lcom/gamevil/nom5/lgu/Constants;->properties:Ljava/util/Properties;

    invoke-virtual {p1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Properties;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 110
    iget-object v1, p0, Lcom/gamevil/nom5/lgu/Constants;->properties:Ljava/util/Properties;

    invoke-virtual {p1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 122
    :goto_0
    return-object v1

    .line 112
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "0x"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 113
    .local v0, "strMsg":Ljava/lang/String;
    iget-object v1, p0, Lcom/gamevil/nom5/lgu/Constants;->properties:Ljava/util/Properties;

    invoke-virtual {v1, v0}, Ljava/util/Properties;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 114
    iget-object v1, p0, Lcom/gamevil/nom5/lgu/Constants;->properties:Ljava/util/Properties;

    invoke-virtual {p1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/gamevil/nom5/lgu/Constants;->properties:Ljava/util/Properties;

    invoke-virtual {v3, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    iget-object v1, p0, Lcom/gamevil/nom5/lgu/Constants;->properties:Ljava/util/Properties;

    invoke-virtual {p1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 120
    .end local v0    # "strMsg":Ljava/lang/String;
    :cond_1
    iget-object v1, p0, Lcom/gamevil/nom5/lgu/Constants;->properties:Ljava/util/Properties;

    invoke-virtual {p2}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Properties;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 121
    iget-object v1, p0, Lcom/gamevil/nom5/lgu/Constants;->properties:Ljava/util/Properties;

    invoke-virtual {p2}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 122
    :cond_2
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/gamevil/nom5/lgu/Constants;->getMessage(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public getNotificationMessage(Ljava/lang/Long;)Ljava/lang/String;
    .locals 1
    .param p1, "msgNo"    # Ljava/lang/Long;

    .prologue
    .line 150
    iget-object v0, p0, Lcom/gamevil/nom5/lgu/Constants;->notificationMessageMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 151
    const/4 v0, 0x0

    .line 152
    .end local p0    # "this":Lcom/gamevil/nom5/lgu/Constants;
    :goto_0
    return-object v0

    .restart local p0    # "this":Lcom/gamevil/nom5/lgu/Constants;
    :cond_0
    iget-object v0, p0, Lcom/gamevil/nom5/lgu/Constants;->notificationMessageMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lcom/gamevil/nom5/lgu/Constants;
    check-cast p0, Ljava/lang/String;

    move-object v0, p0

    goto :goto_0
.end method

.method public showNetworkAlert(Ljava/lang/Long;Ljava/lang/String;Z)V
    .locals 2
    .param p1, "currentMillis"    # Ljava/lang/Long;
    .param p2, "errorMsg"    # Ljava/lang/String;
    .param p3, "bCallback"    # Z

    .prologue
    .line 167
    invoke-virtual {p0, p1, p2}, Lcom/gamevil/nom5/lgu/Constants;->addNotificationMessage(Ljava/lang/Long;Ljava/lang/String;)V

    .line 168
    iget-object v0, p0, Lcom/gamevil/nom5/lgu/Constants;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/gamevil/nom5/lgu/Constants$1;

    invoke-direct {v1, p0, p1, p3}, Lcom/gamevil/nom5/lgu/Constants$1;-><init>(Lcom/gamevil/nom5/lgu/Constants;Ljava/lang/Long;Z)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 186
    return-void
.end method
