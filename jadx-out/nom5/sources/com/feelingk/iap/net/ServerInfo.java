package com.feelingk.iap.net;

/* JADX INFO: loaded from: classes.dex */
public class ServerInfo {
    private final int DEFAULT_PORT = -1;
    private String host;
    private int port;

    public ServerInfo(String host) {
        this.host = null;
        this.port = -1;
        this.host = host;
        this.port = -1;
    }

    public ServerInfo(String host, int port) {
        this.host = null;
        this.port = -1;
        this.host = host;
        this.port = port;
    }

    public String getHostAddress() {
        return this.host;
    }

    public int getPort() {
        return this.port;
    }

    public String toString() {
        return "Host: " + this.host + ", Port: " + this.port;
    }
}
