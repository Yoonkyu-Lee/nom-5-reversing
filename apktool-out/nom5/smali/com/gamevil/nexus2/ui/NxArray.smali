.class public Lcom/gamevil/nexus2/ui/NxArray;
.super Ljava/lang/Object;
.source "NxArray.java"


# static fields
.field public static final DEFAUT_CAPACITY:I = 0x14


# instance fields
.field private capacity:I

.field private elementSize:I

.field private elements:[Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const/16 v0, 0x14

    iput v0, p0, Lcom/gamevil/nexus2/ui/NxArray;->capacity:I

    .line 30
    const/4 v0, 0x0

    iput v0, p0, Lcom/gamevil/nexus2/ui/NxArray;->elementSize:I

    .line 31
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/gamevil/nexus2/ui/NxArray;->elements:[Ljava/lang/Object;

    .line 32
    invoke-virtual {p0}, Lcom/gamevil/nexus2/ui/NxArray;->initialize()V

    .line 33
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "_capacity"    # I

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput p1, p0, Lcom/gamevil/nexus2/ui/NxArray;->capacity:I

    .line 38
    const/4 v0, 0x0

    iput v0, p0, Lcom/gamevil/nexus2/ui/NxArray;->elementSize:I

    .line 39
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/gamevil/nexus2/ui/NxArray;->elements:[Ljava/lang/Object;

    .line 40
    invoke-virtual {p0}, Lcom/gamevil/nexus2/ui/NxArray;->initialize()V

    .line 41
    return-void
.end method


# virtual methods
.method public addElemet(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "_element"    # Ljava/lang/Object;

    .prologue
    .line 59
    iget v0, p0, Lcom/gamevil/nexus2/ui/NxArray;->elementSize:I

    invoke-virtual {p0, v0, p1}, Lcom/gamevil/nexus2/ui/NxArray;->insertElemet(ILjava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method chackCapacity(I)Z
    .locals 4
    .param p1, "_additionalSize"    # I

    .prologue
    .line 154
    iget v3, p0, Lcom/gamevil/nexus2/ui/NxArray;->elementSize:I

    add-int v1, v3, p1

    .line 157
    .local v1, "szAdded":I
    iget v3, p0, Lcom/gamevil/nexus2/ui/NxArray;->capacity:I

    if-gt v1, v3, :cond_0

    .line 159
    const/4 v3, 0x1

    .line 168
    :goto_0
    return v3

    .line 163
    :cond_0
    iget v3, p0, Lcom/gamevil/nexus2/ui/NxArray;->capacity:I

    shl-int/lit8 v2, v3, 0x1

    .line 164
    .local v2, "szDouble":I
    invoke-virtual {p0, v2, v1}, Lcom/gamevil/nexus2/ui/NxArray;->max(II)I

    move-result v0

    .line 167
    .local v0, "nNextSize":I
    invoke-virtual {p0, v0}, Lcom/gamevil/nexus2/ui/NxArray;->expandCapacity(I)V

    .line 168
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public cleanUpAll()V
    .locals 3

    .prologue
    .line 181
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lcom/gamevil/nexus2/ui/NxArray;->elementSize:I

    if-lt v0, v1, :cond_0

    .line 185
    const/4 v1, 0x0

    iput v1, p0, Lcom/gamevil/nexus2/ui/NxArray;->elementSize:I

    .line 187
    return-void

    .line 183
    :cond_0
    iget-object v1, p0, Lcom/gamevil/nexus2/ui/NxArray;->elements:[Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v2, v1, v0

    .line 181
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public expandCapacity(I)V
    .locals 4
    .param p1, "_capacity"    # I

    .prologue
    const/4 v3, 0x0

    .line 134
    if-eqz p1, :cond_1

    .line 137
    new-array v0, p1, [Ljava/lang/Object;

    .line 140
    .local v0, "newArray":[Ljava/lang/Object;
    iget v1, p0, Lcom/gamevil/nexus2/ui/NxArray;->elementSize:I

    if-lez v1, :cond_0

    .line 142
    iget-object v1, p0, Lcom/gamevil/nexus2/ui/NxArray;->elements:[Ljava/lang/Object;

    iget-object v2, p0, Lcom/gamevil/nexus2/ui/NxArray;->elements:[Ljava/lang/Object;

    array-length v2, v2

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 145
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/gamevil/nexus2/ui/NxArray;->elements:[Ljava/lang/Object;

    .line 147
    iput p1, p0, Lcom/gamevil/nexus2/ui/NxArray;->capacity:I

    .line 148
    iput-object v0, p0, Lcom/gamevil/nexus2/ui/NxArray;->elements:[Ljava/lang/Object;

    .line 150
    .end local v0    # "newArray":[Ljava/lang/Object;
    :cond_1
    return-void
.end method

.method public getCapacity()I
    .locals 1

    .prologue
    .line 54
    iget v0, p0, Lcom/gamevil/nexus2/ui/NxArray;->capacity:I

    return v0
.end method

.method public getElement(I)Ljava/lang/Object;
    .locals 1
    .param p1, "_idx"    # I

    .prologue
    .line 124
    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/gamevil/nexus2/ui/NxArray;->elements:[Ljava/lang/Object;

    array-length v0, v0

    if-le p1, v0, :cond_1

    .line 126
    :cond_0
    const/4 v0, 0x0

    .line 129
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/NxArray;->elements:[Ljava/lang/Object;

    aget-object v0, v0, p1

    goto :goto_0
.end method

.method public getElemetsSize()I
    .locals 1

    .prologue
    .line 50
    iget v0, p0, Lcom/gamevil/nexus2/ui/NxArray;->elementSize:I

    return v0
.end method

.method public initialize()V
    .locals 1

    .prologue
    .line 45
    const/16 v0, 0x14

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Lcom/gamevil/nexus2/ui/NxArray;->elements:[Ljava/lang/Object;

    .line 46
    return-void
.end method

.method public insertElemet(ILjava/lang/Object;)Z
    .locals 6
    .param p1, "_idx"    # I
    .param p2, "_element"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x1

    .line 65
    invoke-virtual {p0, v5}, Lcom/gamevil/nexus2/ui/NxArray;->chackCapacity(I)Z

    move-result v0

    .line 67
    .local v0, "bSuccess":Z
    if-eqz v0, :cond_1

    .line 70
    iget v1, p0, Lcom/gamevil/nexus2/ui/NxArray;->elementSize:I

    .local v1, "i":I
    :goto_0
    if-gt v1, p1, :cond_0

    .line 76
    iget-object v2, p0, Lcom/gamevil/nexus2/ui/NxArray;->elements:[Ljava/lang/Object;

    aput-object p2, v2, p1

    .line 77
    iget v2, p0, Lcom/gamevil/nexus2/ui/NxArray;->elementSize:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/gamevil/nexus2/ui/NxArray;->elementSize:I

    move v2, v5

    .line 84
    .end local v1    # "i":I
    :goto_1
    return v2

    .line 72
    .restart local v1    # "i":I
    :cond_0
    iget-object v2, p0, Lcom/gamevil/nexus2/ui/NxArray;->elements:[Ljava/lang/Object;

    iget-object v3, p0, Lcom/gamevil/nexus2/ui/NxArray;->elements:[Ljava/lang/Object;

    sub-int v4, v1, v5

    aget-object v3, v3, v4

    aput-object v3, v2, v1

    .line 70
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 84
    .end local v1    # "i":I
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method max(II)I
    .locals 1
    .param p1, "m"    # I
    .param p2, "n"    # I

    .prologue
    .line 198
    if-le p1, p2, :cond_0

    move v0, p1

    .line 201
    :goto_0
    return v0

    :cond_0
    move v0, p2

    goto :goto_0
.end method

.method public releaseAll()V
    .locals 1

    .prologue
    .line 191
    invoke-virtual {p0}, Lcom/gamevil/nexus2/ui/NxArray;->cleanUpAll()V

    .line 192
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/gamevil/nexus2/ui/NxArray;->elements:[Ljava/lang/Object;

    .line 193
    return-void
.end method

.method public removeElement(I)Z
    .locals 5
    .param p1, "nIdx"    # I

    .prologue
    const/4 v4, 0x1

    .line 89
    iget v1, p0, Lcom/gamevil/nexus2/ui/NxArray;->elementSize:I

    if-ge p1, v1, :cond_1

    .line 92
    move v0, p1

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lcom/gamevil/nexus2/ui/NxArray;->elementSize:I

    sub-int/2addr v1, v4

    if-lt v0, v1, :cond_0

    .line 96
    iget v1, p0, Lcom/gamevil/nexus2/ui/NxArray;->elementSize:I

    sub-int/2addr v1, v4

    iput v1, p0, Lcom/gamevil/nexus2/ui/NxArray;->elementSize:I

    move v1, v4

    .line 103
    .end local v0    # "i":I
    :goto_1
    return v1

    .line 94
    .restart local v0    # "i":I
    :cond_0
    iget-object v1, p0, Lcom/gamevil/nexus2/ui/NxArray;->elements:[Ljava/lang/Object;

    iget-object v2, p0, Lcom/gamevil/nexus2/ui/NxArray;->elements:[Ljava/lang/Object;

    add-int/lit8 v3, v0, 0x1

    aget-object v2, v2, v3

    aput-object v2, v1, v0

    .line 92
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 103
    .end local v0    # "i":I
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public removeElement(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "_element"    # Ljava/lang/Object;

    .prologue
    .line 109
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lcom/gamevil/nexus2/ui/NxArray;->elementSize:I

    if-lt v0, v1, :cond_0

    .line 119
    const/4 v1, 0x0

    :goto_1
    return v1

    .line 111
    :cond_0
    iget-object v1, p0, Lcom/gamevil/nexus2/ui/NxArray;->elements:[Ljava/lang/Object;

    aget-object v1, v1, v0

    if-ne v1, p1, :cond_1

    .line 114
    invoke-virtual {p0, v0}, Lcom/gamevil/nexus2/ui/NxArray;->removeElement(I)Z

    move-result v1

    goto :goto_1

    .line 109
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public swapElement(II)V
    .locals 3
    .param p1, "idx1"    # I
    .param p2, "idx2"    # I

    .prologue
    .line 174
    iget-object v1, p0, Lcom/gamevil/nexus2/ui/NxArray;->elements:[Ljava/lang/Object;

    aget-object v0, v1, p1

    .line 175
    .local v0, "temp":Ljava/lang/Object;
    iget-object v1, p0, Lcom/gamevil/nexus2/ui/NxArray;->elements:[Ljava/lang/Object;

    iget-object v2, p0, Lcom/gamevil/nexus2/ui/NxArray;->elements:[Ljava/lang/Object;

    aget-object v2, v2, p2

    aput-object v2, v1, p1

    .line 176
    iget-object v1, p0, Lcom/gamevil/nexus2/ui/NxArray;->elements:[Ljava/lang/Object;

    aput-object v0, v1, p2

    .line 177
    return-void
.end method
