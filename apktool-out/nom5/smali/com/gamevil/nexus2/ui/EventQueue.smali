.class public Lcom/gamevil/nexus2/ui/EventQueue;
.super Ljava/lang/Object;
.source "EventQueue.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gamevil/nexus2/ui/EventQueue$EventItem;
    }
.end annotation


# instance fields
.field protected m_Capacity:I

.field protected m_Front:I

.field protected m_ItemQueue:[Lcom/gamevil/nexus2/ui/EventQueue$EventItem;

.field protected m_MoveCount:I

.field protected m_MoveEventClip:I

.field protected m_Rear:I


# direct methods
.method public constructor <init>(II)V
    .locals 3
    .param p1, "nSize"    # I
    .param p2, "nMoveEventClip"    # I

    .prologue
    const/4 v2, 0x0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput v2, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_Front:I

    .line 48
    iput v2, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_Rear:I

    .line 49
    const/4 v1, 0x1

    sub-int v1, p1, v1

    iput v1, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_Capacity:I

    .line 50
    new-array v1, p1, [Lcom/gamevil/nexus2/ui/EventQueue$EventItem;

    iput-object v1, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_ItemQueue:[Lcom/gamevil/nexus2/ui/EventQueue$EventItem;

    .line 51
    iput v2, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_MoveCount:I

    .line 52
    iput p2, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_MoveEventClip:I

    .line 54
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, p1, :cond_0

    .line 56
    return-void

    .line 55
    :cond_0
    iget-object v1, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_ItemQueue:[Lcom/gamevil/nexus2/ui/EventQueue$EventItem;

    new-instance v2, Lcom/gamevil/nexus2/ui/EventQueue$EventItem;

    invoke-direct {v2, p0}, Lcom/gamevil/nexus2/ui/EventQueue$EventItem;-><init>(Lcom/gamevil/nexus2/ui/EventQueue;)V

    aput-object v2, v1, v0

    .line 54
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public ClearEvent()V
    .locals 1

    .prologue
    .line 65
    iget v0, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_Rear:I

    iput v0, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_Front:I

    .line 66
    const/4 v0, 0x0

    iput v0, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_MoveCount:I

    .line 67
    return-void
.end method

.method public Dequeue()Lcom/gamevil/nexus2/ui/EventQueue$EventItem;
    .locals 3

    .prologue
    .line 118
    iget v0, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_Front:I

    .line 120
    .local v0, "position":I
    iget v1, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_Front:I

    iget v2, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_Capacity:I

    if-ne v1, v2, :cond_0

    .line 121
    const/4 v1, 0x0

    iput v1, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_Front:I

    .line 125
    :goto_0
    iget-object v1, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_ItemQueue:[Lcom/gamevil/nexus2/ui/EventQueue$EventItem;

    aget-object v1, v1, v0

    return-object v1

    .line 123
    :cond_0
    iget v1, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_Front:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_Front:I

    goto :goto_0
.end method

.method public Enqueue(IIII)V
    .locals 5
    .param p1, "nEvent"    # I
    .param p2, "nParam1"    # I
    .param p3, "nParam2"    # I
    .param p4, "nPointerID"    # I

    .prologue
    const/16 v4, 0x19

    const/4 v3, 0x0

    .line 71
    const/4 v0, 0x0

    .line 73
    .local v0, "position":I
    iget v1, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_Rear:I

    iget v2, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_Capacity:I

    if-ne v1, v2, :cond_2

    .line 75
    iget v0, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_Rear:I

    .line 76
    iput v3, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_Rear:I

    .line 78
    if-ne p1, v4, :cond_1

    .line 80
    iget v1, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_MoveCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_MoveCount:I

    .line 82
    iget v1, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_MoveCount:I

    iget v2, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_MoveEventClip:I

    if-ge v1, v2, :cond_0

    .line 84
    iput v0, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_Rear:I

    .line 114
    :goto_0
    return-void

    .line 89
    :cond_0
    iput v3, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_MoveCount:I

    .line 92
    :cond_1
    iget-object v1, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_ItemQueue:[Lcom/gamevil/nexus2/ui/EventQueue$EventItem;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1, p2, p3, p4}, Lcom/gamevil/nexus2/ui/EventQueue$EventItem;->AttachEvent(IIII)V

    goto :goto_0

    .line 96
    :cond_2
    iget v0, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_Rear:I

    .end local v0    # "position":I
    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_Rear:I

    .line 98
    .restart local v0    # "position":I
    if-ne p1, v4, :cond_4

    .line 100
    iget v1, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_MoveCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_MoveCount:I

    .line 102
    iget v1, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_MoveCount:I

    iget v2, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_MoveEventClip:I

    if-ge v1, v2, :cond_3

    .line 104
    iput v0, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_Rear:I

    goto :goto_0

    .line 109
    :cond_3
    iput v3, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_MoveCount:I

    .line 112
    :cond_4
    iget-object v1, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_ItemQueue:[Lcom/gamevil/nexus2/ui/EventQueue$EventItem;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1, p2, p3, p4}, Lcom/gamevil/nexus2/ui/EventQueue$EventItem;->AttachEvent(IIII)V

    goto :goto_0
.end method

.method public IsEmpty()Z
    .locals 2

    .prologue
    .line 130
    iget v0, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_Front:I

    iget v1, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_Rear:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public IsFull()Z
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 135
    iget v0, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_Front:I

    iget v1, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_Rear:I

    if-ge v0, v1, :cond_1

    .line 136
    iget v0, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_Rear:I

    iget v1, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_Front:I

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_Capacity:I

    if-ne v0, v1, :cond_0

    move v0, v3

    .line 138
    :goto_0
    return v0

    :cond_0
    move v0, v2

    .line 136
    goto :goto_0

    .line 138
    :cond_1
    iget v0, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_Rear:I

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_Front:I

    if-ne v0, v1, :cond_2

    move v0, v3

    goto :goto_0

    :cond_2
    move v0, v2

    goto :goto_0
.end method

.method public setMoveEventClip(I)V
    .locals 0
    .param p1, "_moveEventClip"    # I

    .prologue
    .line 60
    iput p1, p0, Lcom/gamevil/nexus2/ui/EventQueue;->m_MoveEventClip:I

    .line 61
    return-void
.end method
