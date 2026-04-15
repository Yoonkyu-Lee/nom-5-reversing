package com.gamevil.nexus2.net;

import com.gamevil.nexus2.NexusGLActivity;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.SocketTimeoutException;

/* JADX INFO: loaded from: classes.dex */
public class NexusFullNetwork extends NexusNetwork implements Runnable {
    private static final int SEND_PACKET_HEADER_SIZE = 0;
    private static NexusFullNetwork self = null;

    public NexusFullNetwork(NexusGLActivity activity, String appID) {
        super(activity, appID);
        self = this;
        errorCounter = (byte) 0;
        Thread thread = new Thread(this);
        thread.setDaemon(true);
        thread.start();
    }

    @Override // java.lang.Runnable
    public void run() {
        try {
            while (isRunning) {
                if (isRunning) {
                    if (this.requestQueue.size() == 0) {
                        long currentTime = System.currentTimeMillis();
                        if (currentTime > nextSyncTime && !isBusy()) {
                            nextSyncTime = System.currentTimeMillis() + 5000;
                        }
                    } else {
                        byte[] send = this.requestQueue.elementAt(0);
                        byte[] data = sendTCPRequest(send);
                        this.result.addElement(data);
                        this.requestQueue.removeElementAt(0);
                        try {
                            Thread.sleep(500 << errorCounter);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                } else {
                    return;
                }
            }
        } catch (Exception e2) {
            e2.printStackTrace();
        }
    }

    public static boolean NexusNetworkConnect() {
        return openTCPConnection();
    }

    public static boolean NexusNetworkDisconnect() {
        return closeTCPConnection();
    }

    private static short parseHeader(DataInputStream in) throws Exception {
        byte[] header = new byte[4];
        recvLength = (short) 0;
        try {
            in.read(header, 0, 4);
            recvLength = byte2short(header, 0);
            recvCmd = byte2short(header, 2);
            return recvLength;
        } catch (Exception e) {
            e.printStackTrace();
            return (short) -1;
        }
    }

    private static byte[] readTCPInput(DataInputStream in) throws Exception {
        boolean isEnd = false;
        try {
            byte[] result = (byte[]) null;
            int blockIdx = 0;
            int available = in.available();
            if (available <= 0) {
                in.read(new byte[0]);
                Thread.sleep(500L);
                return null;
            }
            int datalen = parseHeader(in);
            if (1 != 0) {
                if (datalen < 0) {
                    return null;
                }
                if (datalen == 0) {
                    return new byte[0];
                }
                result = new byte[datalen];
            }
            System.arraycopy(short2byte(recvLength), 0, result, 0, 2);
            System.arraycopy(short2byte(recvCmd), 0, result, 2, 2);
            int recvLength = 4;
            while (!isEnd) {
                int startIdx = (blockIdx * NexusConstants.BUFFER_SIZE) + 4;
                int readSize = NexusConstants.BUFFER_SIZE;
                if (startIdx + NexusConstants.BUFFER_SIZE >= datalen) {
                    readSize = datalen - startIdx;
                    isEnd = true;
                } else {
                    blockIdx++;
                }
                recvLength += readSize;
                in.read(result, startIdx, readSize);
                Thread.yield();
            }
            return result;
        } catch (SocketTimeoutException e) {
            e.printStackTrace();
            return null;
        } catch (Exception e2) {
            e2.printStackTrace();
            return null;
        }
    }

    private static byte[] getTCPData(byte[] msg) {
        try {
            if (outputStream == null) {
                outputStream = new DataOutputStream(socketConnection.getOutputStream());
            }
            outputStream.write(msg);
            outputStream.flush();
            if (inputStream == null) {
                inputStream = new DataInputStream(socketConnection.getInputStream());
            }
            return readTCPInput(inputStream);
        } catch (SocketTimeoutException e) {
            e.printStackTrace();
            return null;
        } catch (IOException e2) {
            e2.printStackTrace();
            return null;
        } catch (Exception e3) {
            e3.printStackTrace();
            return null;
        }
    }

    private static byte[] sendTCPRequest(byte[] sendData) {
        byte[] array = (byte[]) null;
        byte[] msg = insertPacketHeader(sendData);
        try {
            openTCPConnection();
            byte[] array2 = getTCPData(msg);
            return array2;
        } catch (Exception e) {
            errorCounter = (byte) (errorCounter + 1);
            e.printStackTrace();
            return array;
        }
    }

    private static byte[] insertPacketHeader(byte[] request) {
        if (request == null) {
            return null;
        }
        byte[] writeBytes = new byte[request.length + 0];
        System.arraycopy(request, 0, writeBytes, 0, request.length);
        return writeBytes;
    }
}
