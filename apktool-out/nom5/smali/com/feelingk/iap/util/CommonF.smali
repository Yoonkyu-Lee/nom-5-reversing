.class public Lcom/feelingk/iap/util/CommonF;
.super Ljava/lang/Object;
.source "CommonF.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/feelingk/iap/util/CommonF$LOGGER;
    }
.end annotation


# static fields
.field static final TAG:Ljava/lang/String; = "Util.CommonF"

.field static m_UsimState:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 14
    const/4 v0, 0x0

    sput v0, Lcom/feelingk/iap/util/CommonF;->m_UsimState:I

    .line 12
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convertMDN(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "telNumber"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 31
    move-object v0, p0

    .line 32
    .local v0, "converMDN":Ljava/lang/String;
    const-string v1, "+82"

    invoke-virtual {p0, v1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 33
    const-string v1, "0%s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x3

    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 35
    :cond_0
    return-object v0
.end method

.method public static getCarrier(Landroid/content/Context;)I
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    const/4 v3, -0x1

    .line 51
    const-string v2, "phone"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 52
    .local v1, "systemService":Landroid/telephony/TelephonyManager;
    if-nez v1, :cond_0

    move v2, v4

    .line 73
    :goto_0
    return v2

    .line 62
    :cond_0
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;

    move-result-object v0

    .line 63
    .local v0, "strNetworkOperator":Ljava/lang/String;
    if-eqz v0, :cond_4

    .line 64
    const-string v2, "05"

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-eq v2, v3, :cond_1

    .line 65
    const/4 v2, 0x1

    goto :goto_0

    .line 66
    :cond_1
    const-string v2, "02"

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-ne v2, v3, :cond_2

    .line 67
    const-string v2, "04"

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-ne v2, v3, :cond_2

    .line 68
    const-string v2, "08"

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-eq v2, v3, :cond_3

    .line 69
    :cond_2
    const/4 v2, 0x2

    goto :goto_0

    .line 70
    :cond_3
    const-string v2, "06"

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-eq v2, v3, :cond_4

    .line 71
    const/4 v2, 0x3

    goto :goto_0

    :cond_4
    move v2, v4

    .line 73
    goto :goto_0
.end method

.method public static getMDN(Landroid/content/Context;I)Ljava/lang/String;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "CarrierIndex"    # I

    .prologue
    .line 19
    const-string v2, "phone"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 20
    .local v1, "tm":Landroid/telephony/TelephonyManager;
    if-nez v1, :cond_0

    .line 21
    const/4 v2, 0x0

    .line 25
    :goto_0
    return-object v2

    .line 22
    :cond_0
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v0

    .line 23
    .local v0, "phoneNumber":Ljava/lang/String;
    const/4 v2, 0x2

    if-ne p1, v2, :cond_1

    .line 24
    invoke-static {v0}, Lcom/feelingk/iap/util/CommonF;->convertMDN(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_1
    move-object v2, v0

    .line 25
    goto :goto_0
.end method

.method public static getTID(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "pid"    # Ljava/lang/String;

    .prologue
    .line 40
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v4, "yyyyMMddHHmmss"

    invoke-direct {v2, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 41
    .local v2, "format":Ljava/text/SimpleDateFormat;
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 42
    .local v1, "date":Ljava/util/Date;
    invoke-virtual {v2, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 44
    .local v0, "FixDate":Ljava/lang/String;
    const-string v4, "%s_%s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v0, v5, v6

    const/4 v6, 0x1

    aput-object p1, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 46
    .local v3, "makeTID":Ljava/lang/String;
    return-object v3
.end method
