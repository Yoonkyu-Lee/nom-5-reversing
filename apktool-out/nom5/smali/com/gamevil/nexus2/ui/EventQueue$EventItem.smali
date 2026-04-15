.class public Lcom/gamevil/nexus2/ui/EventQueue$EventItem;
.super Ljava/lang/Object;
.source "EventQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gamevil/nexus2/ui/EventQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "EventItem"
.end annotation


# instance fields
.field protected m_nEvent:I

.field protected m_nParam1:I

.field protected m_nParam2:I

.field protected m_nPointerID:I

.field final synthetic this$0:Lcom/gamevil/nexus2/ui/EventQueue;


# direct methods
.method public constructor <init>(Lcom/gamevil/nexus2/ui/EventQueue;)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 19
    iput-object p1, p0, Lcom/gamevil/nexus2/ui/EventQueue$EventItem;->this$0:Lcom/gamevil/nexus2/ui/EventQueue;

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput v0, p0, Lcom/gamevil/nexus2/ui/EventQueue$EventItem;->m_nEvent:I

    .line 16
    iput v0, p0, Lcom/gamevil/nexus2/ui/EventQueue$EventItem;->m_nParam1:I

    .line 17
    iput v0, p0, Lcom/gamevil/nexus2/ui/EventQueue$EventItem;->m_nParam2:I

    .line 18
    iput v0, p0, Lcom/gamevil/nexus2/ui/EventQueue$EventItem;->m_nPointerID:I

    return-void
.end method

.method public constructor <init>(Lcom/gamevil/nexus2/ui/EventQueue;IIII)V
    .locals 0
    .param p2, "nEvent"    # I
    .param p3, "nParam1"    # I
    .param p4, "nParam2"    # I
    .param p5, "nPointerID"    # I

    .prologue
    .line 24
    iput-object p1, p0, Lcom/gamevil/nexus2/ui/EventQueue$EventItem;->this$0:Lcom/gamevil/nexus2/ui/EventQueue;

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    invoke-virtual {p0, p2, p3, p4, p5}, Lcom/gamevil/nexus2/ui/EventQueue$EventItem;->AttachEvent(IIII)V

    return-void
.end method


# virtual methods
.method public AttachEvent(IIII)V
    .locals 0
    .param p1, "nEvent"    # I
    .param p2, "nParam1"    # I
    .param p3, "nParam2"    # I
    .param p4, "nPointerID"    # I

    .prologue
    .line 33
    iput p1, p0, Lcom/gamevil/nexus2/ui/EventQueue$EventItem;->m_nEvent:I

    .line 34
    iput p2, p0, Lcom/gamevil/nexus2/ui/EventQueue$EventItem;->m_nParam1:I

    .line 35
    iput p3, p0, Lcom/gamevil/nexus2/ui/EventQueue$EventItem;->m_nParam2:I

    .line 36
    iput p4, p0, Lcom/gamevil/nexus2/ui/EventQueue$EventItem;->m_nPointerID:I

    .line 37
    return-void
.end method

.method public GetEvent()I
    .locals 1

    .prologue
    .line 26
    iget v0, p0, Lcom/gamevil/nexus2/ui/EventQueue$EventItem;->m_nEvent:I

    return v0
.end method

.method public GetParam1()I
    .locals 1

    .prologue
    .line 27
    iget v0, p0, Lcom/gamevil/nexus2/ui/EventQueue$EventItem;->m_nParam1:I

    return v0
.end method

.method public GetParam2()I
    .locals 1

    .prologue
    .line 28
    iget v0, p0, Lcom/gamevil/nexus2/ui/EventQueue$EventItem;->m_nParam2:I

    return v0
.end method

.method public GetPointerID()I
    .locals 1

    .prologue
    .line 29
    iget v0, p0, Lcom/gamevil/nexus2/ui/EventQueue$EventItem;->m_nPointerID:I

    return v0
.end method
