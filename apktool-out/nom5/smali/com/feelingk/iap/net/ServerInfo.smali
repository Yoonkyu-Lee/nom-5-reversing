.class public Lcom/feelingk/iap/net/ServerInfo;
.super Ljava/lang/Object;
.source "ServerInfo.java"


# instance fields
.field private final DEFAULT_PORT:I

.field private host:Ljava/lang/String;

.field private port:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "host"    # Ljava/lang/String;

    .prologue
    const/4 v1, -0x1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/feelingk/iap/net/ServerInfo;->host:Ljava/lang/String;

    .line 12
    iput v1, p0, Lcom/feelingk/iap/net/ServerInfo;->port:I

    .line 13
    iput v1, p0, Lcom/feelingk/iap/net/ServerInfo;->DEFAULT_PORT:I

    .line 17
    iput-object p1, p0, Lcom/feelingk/iap/net/ServerInfo;->host:Ljava/lang/String;

    .line 18
    iput v1, p0, Lcom/feelingk/iap/net/ServerInfo;->port:I

    .line 19
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 2
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I

    .prologue
    const/4 v1, -0x1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/feelingk/iap/net/ServerInfo;->host:Ljava/lang/String;

    .line 12
    iput v1, p0, Lcom/feelingk/iap/net/ServerInfo;->port:I

    .line 13
    iput v1, p0, Lcom/feelingk/iap/net/ServerInfo;->DEFAULT_PORT:I

    .line 23
    iput-object p1, p0, Lcom/feelingk/iap/net/ServerInfo;->host:Ljava/lang/String;

    .line 24
    iput p2, p0, Lcom/feelingk/iap/net/ServerInfo;->port:I

    .line 25
    return-void
.end method


# virtual methods
.method public getHostAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/feelingk/iap/net/ServerInfo;->host:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .prologue
    .line 34
    iget v0, p0, Lcom/feelingk/iap/net/ServerInfo;->port:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Host: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/feelingk/iap/net/ServerInfo;->host:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", Port: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/feelingk/iap/net/ServerInfo;->port:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
