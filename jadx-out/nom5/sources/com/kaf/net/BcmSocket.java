package com.kaf.net;

import com.kaf.KafManager;
import java.io.IOException;
import java.net.InetAddress;
import java.net.SocketAddress;
import java.net.SocketException;

/* JADX INFO: loaded from: classes.dex */
public class BcmSocket {
    private IBcmSocket socket;

    public BcmSocket() {
        try {
            this.socket = KafManager.getInstance().getBcmSocket();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public BcmSocket(InetAddress addr, int port, String appid, String billKind, char connectKind, boolean isTestMode) throws IOException, SecurityException, IllegalArgumentException {
        this(addr, port, null, 0, appid, billKind, connectKind, isTestMode);
    }

    public BcmSocket(InetAddress dstAddress, int dstPort, InetAddress localAddress, int localPort, String appid, String billKind, char connectKind, boolean isTestMode) throws IOException, SecurityException, IllegalArgumentException {
        try {
            this.socket = KafManager.getInstance().getBcmSocket(dstAddress, dstPort, localAddress, localPort, appid, billKind, connectKind, isTestMode);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean connect(SocketAddress addr, String appID, String billKind, char connectKind, boolean isTestMode) throws IOException, IllegalArgumentException {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            return this.socket.connect(addr, appID, billKind, connectKind, isTestMode, 0);
        }
        return false;
    }

    public boolean connect(SocketAddress addr, String appID, String billKind, char connectKind, boolean isTestMode, int timeOut) throws IOException, IllegalArgumentException {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            return this.socket.connect(addr, appID, billKind, connectKind, isTestMode, timeOut);
        }
        return false;
    }

    public int write(byte[] buf) throws IOException {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            return this.socket.write(buf);
        }
        return -1;
    }

    public int write(byte[] buf, int off, int len) throws IOException {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            return this.socket.write(buf, off, len);
        }
        return -1;
    }

    public int write(byte[] buf, int off, int len, boolean enc) throws IOException {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            return this.socket.write(buf, off, len, enc);
        }
        return -1;
    }

    public int read(byte[] buf) throws IOException {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            return this.socket.read(buf);
        }
        return -1;
    }

    public int read(byte[] buf, int off, int len) throws IOException {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            return this.socket.read(buf, off, len);
        }
        return -1;
    }

    public void close() throws IOException {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            this.socket.close();
        }
    }

    public InetAddress getInetAddress() {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            return this.socket.getInetAddress();
        }
        return null;
    }

    public boolean getKeepAlive() throws SocketException {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            return this.socket.getKeepAlive();
        }
        return false;
    }

    public InetAddress getLocalAddress() {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            return this.socket.getLocalAddress();
        }
        return null;
    }

    public int getLocalPort() {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            return this.socket.getLocalPort();
        }
        return -1;
    }

    public SocketAddress getLocalSocketAddress() {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            return this.socket.getLocalSocketAddress();
        }
        return null;
    }

    public int getPort() {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            return this.socket.getPort();
        }
        return -1;
    }

    public int getReceiveBufferSize() throws SocketException {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            return this.socket.getReceiveBufferSize();
        }
        return -1;
    }

    public SocketAddress getRemoteSocketAddress() {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            return this.socket.getRemoteSocketAddress();
        }
        return null;
    }

    public boolean getReuseAddress() throws SocketException {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            return this.socket.getReuseAddress();
        }
        return false;
    }

    public int getSendBufferSize() throws SocketException {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            return this.socket.getSendBufferSize();
        }
        return -1;
    }

    public int getSoLinger() throws SocketException {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            return this.socket.getSoLinger();
        }
        return -1;
    }

    public int getSoTimeout() throws SocketException {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            return this.socket.getSoTimeout();
        }
        return -1;
    }

    public boolean getTcpNoDelay() throws SocketException {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            return this.socket.getTcpNoDelay();
        }
        return false;
    }

    public boolean isClosed() {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            return this.socket.isClosed();
        }
        return false;
    }

    public boolean isConnected() {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            return this.socket.isConnected();
        }
        return false;
    }

    public boolean isInputShutdown() {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            return this.socket.isInputShutdown();
        }
        return false;
    }

    public boolean isOutputShutdown() {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            return this.socket.isOutputShutdown();
        }
        return false;
    }

    public void setKeepAlive(boolean value) throws SocketException {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            this.socket.setKeepAlive(value);
        }
    }

    public void setReceiveBufferSize(int size) throws SocketException {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            this.socket.setReceiveBufferSize(size);
        }
    }

    public void setReuseAddress(boolean reuse) throws SocketException {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            this.socket.setReuseAddress(reuse);
        }
    }

    public void setSendBufferSize(int size) throws SocketException {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            this.socket.setSendBufferSize(size);
        }
    }

    public void setSoLinger(boolean on, int timeout) throws SocketException {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            this.socket.setSoLinger(on, timeout);
        }
    }

    public void setSoTimeout(int timeout) throws SocketException {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            this.socket.setSoTimeout(timeout);
        }
    }

    public void setTcpNoDelay(boolean on) throws SocketException {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            this.socket.setTcpNoDelay(on);
        }
    }

    public void shutdownInput() throws IOException {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            this.socket.shutdownInput();
        }
    }

    public void shutdownOutput() throws IOException {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            this.socket.shutdownOutput();
        }
    }

    public String toString() {
        if (KafManager.getInstance().isKafLibraryInit() && this.socket != null) {
            return this.socket.toString();
        }
        return null;
    }
}
