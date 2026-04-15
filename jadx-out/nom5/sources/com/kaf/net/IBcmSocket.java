package com.kaf.net;

import java.io.IOException;
import java.net.InetAddress;
import java.net.SocketAddress;
import java.net.SocketException;

/* JADX INFO: loaded from: classes.dex */
public abstract class IBcmSocket {
    public IBcmSocket() {
    }

    public IBcmSocket(InetAddress addr, int port, String appid, String billKind, char connectKind, boolean isTestMode) throws IOException, SecurityException, IllegalArgumentException {
    }

    public IBcmSocket(InetAddress dstAddress, int dstPort, InetAddress localAddress, int localPort, String appid, String billKind, char connectKind, boolean isTestMode) throws IOException, SecurityException, IllegalArgumentException {
    }

    public boolean connect(SocketAddress addr, String appID, String billKind, char connectKind, boolean isTestMode) throws IOException, IllegalArgumentException {
        return false;
    }

    public boolean connect(SocketAddress addr, String appID, String billKind, char connectKind, boolean isTestMode, int timeOut) throws IOException, IllegalArgumentException {
        return false;
    }

    public int write(byte[] buf) throws IOException {
        return -1;
    }

    public int write(byte[] buf, int off, int len) throws IOException {
        return -1;
    }

    public int write(byte[] buf, int off, int len, boolean enc) throws IOException {
        return -1;
    }

    public int read(byte[] buf) throws IOException {
        return -1;
    }

    public int read(byte[] buf, int off, int len) throws IOException {
        return -1;
    }

    public void close() throws IOException {
    }

    public InetAddress getInetAddress() {
        return null;
    }

    public boolean getKeepAlive() throws SocketException {
        return false;
    }

    public InetAddress getLocalAddress() {
        return null;
    }

    public int getLocalPort() {
        return -1;
    }

    public SocketAddress getLocalSocketAddress() {
        return null;
    }

    public int getPort() {
        return -1;
    }

    public int getReceiveBufferSize() throws SocketException {
        return -1;
    }

    public SocketAddress getRemoteSocketAddress() {
        return null;
    }

    public boolean getReuseAddress() throws SocketException {
        return false;
    }

    public int getSendBufferSize() throws SocketException {
        return -1;
    }

    public int getSoLinger() throws SocketException {
        return -1;
    }

    public int getSoTimeout() throws SocketException {
        return -1;
    }

    public boolean getTcpNoDelay() throws SocketException {
        return false;
    }

    public boolean isClosed() {
        return false;
    }

    public boolean isConnected() {
        return false;
    }

    public boolean isInputShutdown() {
        return false;
    }

    public boolean isOutputShutdown() {
        return false;
    }

    public void setKeepAlive(boolean value) throws SocketException {
    }

    public void setReceiveBufferSize(int size) throws SocketException {
    }

    public void setReuseAddress(boolean reuse) throws SocketException {
    }

    public void setSendBufferSize(int size) throws SocketException {
    }

    public void setSoLinger(boolean on, int timeout) throws SocketException {
    }

    public void setSoTimeout(int timeout) throws SocketException {
    }

    public void setTcpNoDelay(boolean on) throws SocketException {
    }

    public void shutdownInput() throws IOException {
    }

    public void shutdownOutput() throws IOException {
    }

    public String toString() {
        return null;
    }
}
