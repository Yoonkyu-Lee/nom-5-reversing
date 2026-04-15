.class public Lcom/feelingk/iap/util/Defines;
.super Ljava/lang/Object;
.source "Defines.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/feelingk/iap/util/Defines$ACTION_EVENT;,
        Lcom/feelingk/iap/util/Defines$DIALOG_STATE;,
        Lcom/feelingk/iap/util/Defines$IAP_GATEWAY_RESPONSE;,
        Lcom/feelingk/iap/util/Defines$KOR_TELECOM;,
        Lcom/feelingk/iap/util/Defines$KOR_TELECOM_PACKET;,
        Lcom/feelingk/iap/util/Defines$WORK_PURCHASE_LIB_FLOW;
    }
.end annotation


# static fields
.field public static final DEBUG:Z = true

.field public static final DUMP:Z = false

.field public static final IAP_BPDATA_PORT:I = 0x1dba

.field public static final IAP_GW_IP:Ljava/lang/String; = "iap.tstore.co.kr"

.field public static final IAP_GW_PORT:I = 0x1cf2

.field public static final IAP_LIBRARY_VERSION:Ljava/lang/String; = "V 11.03.22"

.field public static final IAP_PACKET_HEADER_SIZE:I = 0xc

.field public static final IAP_PARITY_BIT:B = 0x17t

.field public static final IAP_PROTOCOL_VERSION:Ljava/lang/String; = "IAP10.00"

.field public static final IAP_SENDBPDATA_PROTOCOL:Ljava/lang/String; = "SENDBPDATA"

.field public static final IAP_WIFI_PORT:I = 0x1d56

.field public static final SOCKET_CON_TIMEOUT:I = 0x4e20

.field public static final SOCKET_TIMEOUT:I = 0x4e20


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
