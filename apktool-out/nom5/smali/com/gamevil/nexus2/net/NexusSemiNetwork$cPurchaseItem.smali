.class public Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;
.super Ljava/lang/Object;
.source "NexusSemiNetwork.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gamevil/nexus2/net/NexusSemiNetwork;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "cPurchaseItem"
.end annotation


# instance fields
.field itemName:Ljava/lang/String;

.field itemNameSeq:I

.field payCode:Ljava/lang/String;

.field final synthetic this$0:Lcom/gamevil/nexus2/net/NexusSemiNetwork;


# direct methods
.method constructor <init>(Lcom/gamevil/nexus2/net/NexusSemiNetwork;)V
    .locals 0

    .prologue
    .line 92
    iput-object p1, p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;->this$0:Lcom/gamevil/nexus2/net/NexusSemiNetwork;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lcom/gamevil/nexus2/net/NexusSemiNetwork;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p2, "seq"    # I
    .param p3, "code"    # Ljava/lang/String;
    .param p4, "name"    # Ljava/lang/String;

    .prologue
    .line 101
    iput-object p1, p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;->this$0:Lcom/gamevil/nexus2/net/NexusSemiNetwork;

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    iput p2, p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;->itemNameSeq:I

    .line 99
    iput-object p3, p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;->payCode:Ljava/lang/String;

    .line 100
    iput-object p4, p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;->itemName:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Lcom/gamevil/nexus2/net/NexusSemiNetwork;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p2, "code"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;->this$0:Lcom/gamevil/nexus2/net/NexusSemiNetwork;

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    iput-object p2, p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;->payCode:Ljava/lang/String;

    .line 95
    iput-object p3, p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;->itemName:Ljava/lang/String;

    return-void
.end method
