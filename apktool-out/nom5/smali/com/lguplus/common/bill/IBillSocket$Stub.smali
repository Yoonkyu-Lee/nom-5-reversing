.class public abstract Lcom/lguplus/common/bill/IBillSocket$Stub;
.super Landroid/os/Binder;
.source "IBillSocket.java"

# interfaces
.implements Lcom/lguplus/common/bill/IBillSocket;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lguplus/common/bill/IBillSocket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lguplus/common/bill/IBillSocket$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.lguplus.common.bill.IBillSocket"

.field static final TRANSACTION_close:I = 0x2

.field static final TRANSACTION_connect:I = 0x1

.field static final TRANSACTION_getLastErrorMsg:I = 0x7

.field static final TRANSACTION_readByOffset:I = 0x4

.field static final TRANSACTION_readBytes:I = 0x3

.field static final TRANSACTION_writeByOffset:I = 0x6

.field static final TRANSACTION_writeBytes:I = 0x5


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 13
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 15
    const-string v0, "com.lguplus.common.bill.IBillSocket"

    invoke-virtual {p0, p0, v0}, Lcom/lguplus/common/bill/IBillSocket$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 16
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/lguplus/common/bill/IBillSocket;
    .locals 2
    .param p0, "obj"    # Landroid/os/IBinder;

    .prologue
    .line 23
    if-nez p0, :cond_0

    .line 24
    const/4 v1, 0x0

    .line 30
    :goto_0
    return-object v1

    .line 26
    :cond_0
    const-string v1, "com.lguplus.common.bill.IBillSocket"

    invoke-interface {p0, v1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 27
    .local v0, "iin":Landroid/os/IInterface;
    if-eqz v0, :cond_1

    instance-of v1, v0, Lcom/lguplus/common/bill/IBillSocket;

    if-eqz v1, :cond_1

    .line 28
    check-cast v0, Lcom/lguplus/common/bill/IBillSocket;

    .end local v0    # "iin":Landroid/os/IInterface;
    move-object v1, v0

    goto :goto_0

    .line 30
    .restart local v0    # "iin":Landroid/os/IInterface;
    :cond_1
    new-instance v1, Lcom/lguplus/common/bill/IBillSocket$Stub$Proxy;

    invoke-direct {v1, p0}, Lcom/lguplus/common/bill/IBillSocket$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    goto :goto_0
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .prologue
    .line 34
    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 8
    .param p1, "code"    # I
    .param p2, "data"    # Landroid/os/Parcel;
    .param p3, "reply"    # Landroid/os/Parcel;
    .param p4, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 38
    sparse-switch p1, :sswitch_data_0

    .line 137
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v5

    :goto_0
    return v5

    .line 42
    :sswitch_0
    const-string v5, "com.lguplus.common.bill.IBillSocket"

    invoke-virtual {p3, v5}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    move v5, v6

    .line 43
    goto :goto_0

    .line 47
    :sswitch_1
    const-string v5, "com.lguplus.common.bill.IBillSocket"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 49
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 51
    .local v0, "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 53
    .local v2, "_arg1":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 54
    .local v3, "_arg2":I
    invoke-virtual {p0, v0, v2, v3}, Lcom/lguplus/common/bill/IBillSocket$Stub;->connect(Ljava/lang/String;Ljava/lang/String;I)Z

    move-result v4

    .line 55
    .local v4, "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 56
    if-eqz v4, :cond_0

    move v5, v6

    :goto_1
    invoke-virtual {p3, v5}, Landroid/os/Parcel;->writeInt(I)V

    move v5, v6

    .line 57
    goto :goto_0

    :cond_0
    move v5, v7

    .line 56
    goto :goto_1

    .line 61
    .end local v0    # "_arg0":Ljava/lang/String;
    .end local v2    # "_arg1":Ljava/lang/String;
    .end local v3    # "_arg2":I
    .end local v4    # "_result":Z
    :sswitch_2
    const-string v5, "com.lguplus.common.bill.IBillSocket"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 62
    invoke-virtual {p0}, Lcom/lguplus/common/bill/IBillSocket$Stub;->close()V

    .line 63
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    move v5, v6

    .line 64
    goto :goto_0

    .line 68
    :sswitch_3
    const-string v5, "com.lguplus.common.bill.IBillSocket"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 70
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 71
    .local v1, "_arg0_length":I
    if-gez v1, :cond_1

    .line 72
    check-cast v0, [B

    .line 77
    .local v0, "_arg0":[B
    :goto_2
    invoke-virtual {p0, v0}, Lcom/lguplus/common/bill/IBillSocket$Stub;->readBytes([B)I

    move-result v4

    .line 78
    .local v4, "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 79
    invoke-virtual {p3, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 80
    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeByteArray([B)V

    move v5, v6

    .line 81
    goto :goto_0

    .line 75
    .end local v0    # "_arg0":[B
    .end local v4    # "_result":I
    :cond_1
    new-array v0, v1, [B

    .restart local v0    # "_arg0":[B
    goto :goto_2

    .line 85
    .end local v0    # "_arg0":[B
    .end local v1    # "_arg0_length":I
    :sswitch_4
    const-string v5, "com.lguplus.common.bill.IBillSocket"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 87
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 88
    .restart local v1    # "_arg0_length":I
    if-gez v1, :cond_2

    .line 89
    check-cast v0, [B

    .line 95
    .restart local v0    # "_arg0":[B
    :goto_3
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 97
    .local v2, "_arg1":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 98
    .restart local v3    # "_arg2":I
    invoke-virtual {p0, v0, v2, v3}, Lcom/lguplus/common/bill/IBillSocket$Stub;->readByOffset([BII)I

    move-result v4

    .line 99
    .restart local v4    # "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 100
    invoke-virtual {p3, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 101
    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeByteArray([B)V

    move v5, v6

    .line 102
    goto :goto_0

    .line 92
    .end local v0    # "_arg0":[B
    .end local v2    # "_arg1":I
    .end local v3    # "_arg2":I
    .end local v4    # "_result":I
    :cond_2
    new-array v0, v1, [B

    .restart local v0    # "_arg0":[B
    goto :goto_3

    .line 106
    .end local v0    # "_arg0":[B
    .end local v1    # "_arg0_length":I
    :sswitch_5
    const-string v5, "com.lguplus.common.bill.IBillSocket"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 108
    invoke-virtual {p2}, Landroid/os/Parcel;->createByteArray()[B

    move-result-object v0

    .line 109
    .restart local v0    # "_arg0":[B
    invoke-virtual {p0, v0}, Lcom/lguplus/common/bill/IBillSocket$Stub;->writeBytes([B)Z

    move-result v4

    .line 110
    .local v4, "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 111
    if-eqz v4, :cond_3

    move v5, v6

    :goto_4
    invoke-virtual {p3, v5}, Landroid/os/Parcel;->writeInt(I)V

    move v5, v6

    .line 112
    goto/16 :goto_0

    :cond_3
    move v5, v7

    .line 111
    goto :goto_4

    .line 116
    .end local v0    # "_arg0":[B
    .end local v4    # "_result":Z
    :sswitch_6
    const-string v5, "com.lguplus.common.bill.IBillSocket"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 118
    invoke-virtual {p2}, Landroid/os/Parcel;->createByteArray()[B

    move-result-object v0

    .line 120
    .restart local v0    # "_arg0":[B
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 122
    .restart local v2    # "_arg1":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 123
    .restart local v3    # "_arg2":I
    invoke-virtual {p0, v0, v2, v3}, Lcom/lguplus/common/bill/IBillSocket$Stub;->writeByOffset([BII)Z

    move-result v4

    .line 124
    .restart local v4    # "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 125
    if-eqz v4, :cond_4

    move v5, v6

    :goto_5
    invoke-virtual {p3, v5}, Landroid/os/Parcel;->writeInt(I)V

    move v5, v6

    .line 126
    goto/16 :goto_0

    :cond_4
    move v5, v7

    .line 125
    goto :goto_5

    .line 130
    .end local v0    # "_arg0":[B
    .end local v2    # "_arg1":I
    .end local v3    # "_arg2":I
    .end local v4    # "_result":Z
    :sswitch_7
    const-string v5, "com.lguplus.common.bill.IBillSocket"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 131
    invoke-virtual {p0}, Lcom/lguplus/common/bill/IBillSocket$Stub;->getLastErrorMsg()Ljava/lang/String;

    move-result-object v4

    .line 132
    .local v4, "_result":Ljava/lang/String;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 133
    invoke-virtual {p3, v4}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    move v5, v6

    .line 134
    goto/16 :goto_0

    .line 38
    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x2 -> :sswitch_2
        0x3 -> :sswitch_3
        0x4 -> :sswitch_4
        0x5 -> :sswitch_5
        0x6 -> :sswitch_6
        0x7 -> :sswitch_7
        0x5f4e5446 -> :sswitch_0
    .end sparse-switch
.end method
