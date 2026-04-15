.class public final Lcom/feelingk/iap/util/Defines$IAP_GATEWAY_RESPONSE;
.super Ljava/lang/Object;
.source "Defines.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/feelingk/iap/util/Defines;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "IAP_GATEWAY_RESPONSE"
.end annotation


# static fields
.field public static final IAP_AE_SUCCESS:B = 0x0t

.field public static final IAP_ERR_ALREADYCONNECTED:B = -0x1t

.field public static final IAP_ERR_ALREADYINIT:B = -0x7t

.field public static final IAP_ERR_CONNECT_FAIL:B = -0x3t

.field public static final IAP_ERR_DISCONNECTED:B = -0x2t

.field public static final IAP_ERR_DOWNLOADING:B = -0x9t

.field public static final IAP_ERR_INVALIDPARITY:B = -0x8t

.field public static final IAP_ERR_NORMAL_TIMEOUT_FAIL:B = -0xbt

.field public static final IAP_ERR_NOTINIT:B = -0x6t

.field public static final IAP_ERR_PARSE_FAIL:B = -0xat

.field public static final IAP_ERR_RECV_FAIL:B = -0x5t

.field public static final IAP_ERR_RECV_TIMEOUT_FAIL:B = -0xdt

.field public static final IAP_ERR_SEND_FAIL:B = -0x4t

.field public static final IAP_ERR_SEND_TIMEOUT_FAIL:B = -0xct


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
