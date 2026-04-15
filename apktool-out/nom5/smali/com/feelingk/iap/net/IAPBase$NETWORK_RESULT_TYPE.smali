.class public final enum Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;
.super Ljava/lang/Enum;
.source "IAPBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/feelingk/iap/net/IAPBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "NETWORK_RESULT_TYPE"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum APP_CHARGE_ITEM:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

.field public static final enum APP_CHARGE_ITEM_OK:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

.field public static final enum APP_DATA_OK:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

.field public static final enum APP_DOWNLOADING:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

.field public static final enum APP_ERROR:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

.field public static final enum APP_MAIN:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

.field public static final enum APP_MAX:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

.field public static final enum APP_QUERY_ITEM:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

.field public static final enum APP_QUERY_ITEM_OK:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

.field public static final enum APP_VALID_USER:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

.field private static final synthetic ENUM$VALUES:[Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 34
    new-instance v0, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    const-string v1, "APP_MAIN"

    invoke-direct {v0, v1, v3}, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->APP_MAIN:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    .line 35
    new-instance v0, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    const-string v1, "APP_VALID_USER"

    invoke-direct {v0, v1, v4}, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->APP_VALID_USER:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    .line 36
    new-instance v0, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    const-string v1, "APP_QUERY_ITEM"

    invoke-direct {v0, v1, v5}, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->APP_QUERY_ITEM:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    .line 37
    new-instance v0, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    const-string v1, "APP_QUERY_ITEM_OK"

    invoke-direct {v0, v1, v6}, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->APP_QUERY_ITEM_OK:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    .line 38
    new-instance v0, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    const-string v1, "APP_CHARGE_ITEM"

    invoke-direct {v0, v1, v7}, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->APP_CHARGE_ITEM:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    .line 39
    new-instance v0, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    const-string v1, "APP_CHARGE_ITEM_OK"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->APP_CHARGE_ITEM_OK:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    .line 40
    new-instance v0, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    const-string v1, "APP_DATA_OK"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->APP_DATA_OK:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    .line 41
    new-instance v0, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    const-string v1, "APP_DOWNLOADING"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->APP_DOWNLOADING:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    .line 42
    new-instance v0, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    const-string v1, "APP_ERROR"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->APP_ERROR:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    .line 43
    new-instance v0, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    const-string v1, "APP_MAX"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->APP_MAX:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    .line 33
    const/16 v0, 0xa

    new-array v0, v0, [Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    sget-object v1, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->APP_MAIN:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    aput-object v1, v0, v3

    sget-object v1, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->APP_VALID_USER:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    aput-object v1, v0, v4

    sget-object v1, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->APP_QUERY_ITEM:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    aput-object v1, v0, v5

    sget-object v1, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->APP_QUERY_ITEM_OK:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    aput-object v1, v0, v6

    sget-object v1, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->APP_CHARGE_ITEM:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->APP_CHARGE_ITEM_OK:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->APP_DATA_OK:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->APP_DOWNLOADING:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->APP_ERROR:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->APP_MAX:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    aput-object v2, v0, v1

    sput-object v0, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->ENUM$VALUES:[Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    return-object p0
.end method

.method public static values()[Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->ENUM$VALUES:[Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    array-length v1, v0

    new-array v2, v1, [Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
