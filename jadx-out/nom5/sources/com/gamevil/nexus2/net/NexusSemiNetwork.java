package com.gamevil.nexus2.net;

import android.os.Handler;
import com.gamevil.nexus2.NexusGLActivity;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.SocketTimeoutException;
import java.util.Enumeration;
import java.util.Vector;

/* JADX INFO: loaded from: classes.dex */
public class NexusSemiNetwork extends NexusNetwork implements Runnable {
    private Vector<cPurchaseItem> purchaseItemQueue;
    private Vector<Integer> purchaseSequenceQueue;
    private static boolean doSendPacket = false;
    private static boolean doRecvPacket = false;
    private static int recvPayCodeOffset = 5;
    private static int sendPayCodeOffset = 4;
    private static boolean isUseServerPayCode = true;
    private static boolean isRequestPurchase = false;
    private static String sendPayCode = null;
    private static String pItemPaycode = null;
    private static String pItemName = null;
    private static int pItemBuySeq = 0;
    private static Handler mHandler = new Handler();
    private static NexusSemiNetwork self = null;

    public class cPurchaseItem {
        String itemName;
        int itemNameSeq;
        String payCode;

        cPurchaseItem() {
        }

        cPurchaseItem(String code, String name) {
            this.payCode = code;
            this.itemName = name;
        }

        cPurchaseItem(int seq, String code, String name) {
            this.itemNameSeq = seq;
            this.payCode = code;
            this.itemName = name;
        }
    }

    public NexusSemiNetwork(NexusGLActivity activity, String appID) {
        super(activity, appID);
        this.purchaseSequenceQueue = new Vector<>();
        this.purchaseItemQueue = new Vector<>();
        self = this;
        errorCounter = (byte) 0;
        recvLength = (short) 0;
        myAppId = appID;
        Thread thread = new Thread(this);
        thread.setDaemon(true);
        thread.start();
    }

    public static boolean NexusServer(String sIP, int nPort) {
        errorCounter = (byte) 0;
        recvLength = (short) 0;
        serverInfo(sIP, nPort);
        return NexusNetworkConnect();
    }

    public void initPurchaseSequenceQueue(int[] arrSeq) {
        for (int i : arrSeq) {
            this.purchaseSequenceQueue.addElement(Integer.valueOf(i));
        }
    }

    private boolean isPurchaseSequence(int seqNum) {
        if (!this.purchaseSequenceQueue.isEmpty()) {
            Enumeration<Integer> e = this.purchaseSequenceQueue.elements();
            while (e.hasMoreElements()) {
                Integer obj = e.nextElement();
                if (seqNum == obj.intValue()) {
                    return true;
                }
            }
        }
        return false;
    }

    public void setPayCodeOffsetInPacket(int sendOffset, int recvOffset) {
        sendPayCodeOffset = sendOffset;
        recvPayCodeOffset = recvOffset;
    }

    private void checkOutputPurchaseSequence(byte[] sendPacket) {
        if (!isUseServerPayCode && isPurchaseSequence(sendCmd)) {
            sendPayCode = new String(sendPacket, sendPayCodeOffset, 10);
        }
    }

    private boolean checkInputPurchaseSequence(byte[] recvPacket) {
        String payCode;
        if (isPurchaseSequence(recvCmd)) {
            int ackCode = recvPacket[4];
            if (ackCode == 1) {
                int buySeq = byte2int(recvPacket, 5);
                if (isUseServerPayCode) {
                    payCode = new String(recvPacket, recvPayCodeOffset, 10);
                } else {
                    payCode = sendPayCode;
                }
                cPurchaseItem pItem = getPurchaseItemQueue(payCode);
                if (pItem != null) {
                    requestPurchase(buySeq, pItem.payCode, pItem.itemName);
                    return true;
                }
            }
        }
        return false;
    }

    public void initPurchaseItemQueue(int[] arrSeq, String[] arrCode, String[] arrName) {
        int itemNum = arrSeq.length;
        for (int i = 0; i < itemNum; i++) {
            cPurchaseItem pItem = new cPurchaseItem(arrSeq[i], arrCode[i], arrName[i]);
            this.purchaseItemQueue.addElement(pItem);
        }
    }

    public void initPurchaseItemQueue(String[] arrCode, String[] arrName) {
        int itemNum = arrCode.length;
        for (int i = 0; i < itemNum; i++) {
            cPurchaseItem pItem = new cPurchaseItem(arrCode[i], arrName[i]);
            this.purchaseItemQueue.addElement(pItem);
        }
    }

    private cPurchaseItem getPurchaseItemQueue(String payCode) {
        if (!this.purchaseItemQueue.isEmpty()) {
            Enumeration<cPurchaseItem> e = this.purchaseItemQueue.elements();
            while (e.hasMoreElements()) {
                cPurchaseItem pItem = e.nextElement();
                if (pItem.payCode.equals(payCode)) {
                    return pItem;
                }
            }
        }
        return null;
    }

    public boolean isRequestPurchase() {
        return isRequestPurchase;
    }

    public void setUseServerPayCode(boolean b) {
        isUseServerPayCode = b;
    }

    @Override // com.gamevil.nexus2.net.NexusNetwork
    public void doSendTCP(byte[] send) {
        this.requestQueue.addElement(send);
    }

    @Override // com.gamevil.nexus2.net.NexusNetwork
    public byte[] getResponse() {
        byte[] barray = (byte[]) null;
        if (!this.result.isEmpty()) {
            Object obj = this.result.firstElement();
            this.result.removeElementAt(0);
            return obj instanceof byte[] ? (byte[]) obj : barray;
        }
        return barray;
    }

    @Override // com.gamevil.nexus2.net.NexusNetwork
    public boolean isBusy() {
        return (this.requestQueue.isEmpty() && this.result.isEmpty()) ? false : true;
    }

    public boolean isNotRecvYet() {
        return doSendPacket && !doRecvPacket;
    }

    @Override // java.lang.Runnable
    public void run() {
        try {
            while (isRunning) {
                if (isRunning) {
                    if (!this.requestQueue.isEmpty()) {
                        byte[] send = this.requestQueue.elementAt(0);
                        byte[] data = sendTCPRequest(send);
                        checkOutputPurchaseSequence(send);
                        this.requestQueue.removeElementAt(0);
                        if (data != null) {
                            checkInputPurchaseSequence(data);
                            this.result.addElement(data);
                        }
                    }
                    if (isNotRecvYet()) {
                        try {
                            byte[] data2 = readTCPInput(inputStream);
                            if (data2 != null) {
                                checkInputPurchaseSequence(data2);
                                this.result.addElement(data2);
                            }
                        } catch (SocketTimeoutException e) {
                            e.printStackTrace();
                        } catch (Exception e2) {
                            e2.printStackTrace();
                        }
                    }
                } else {
                    return;
                }
            }
        } catch (Exception e3) {
            e3.printStackTrace();
        }
    }

    private static short parseHeader(DataInputStream in) throws Exception {
        byte[] header = new byte[4];
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
            if (in.available() <= 0) {
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
            recvLength = (short) 4;
            while (!isEnd) {
                int startIdx = (blockIdx * NexusConstants.BUFFER_SIZE) + 4;
                int readSize = NexusConstants.BUFFER_SIZE;
                if (startIdx + NexusConstants.BUFFER_SIZE >= datalen) {
                    readSize = datalen - startIdx;
                    isEnd = true;
                } else {
                    blockIdx++;
                }
                recvLength = (short) (recvLength + readSize);
                in.read(result, startIdx, readSize);
                Thread.yield();
            }
            doRecvPacket = true;
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
                System.out.println("[NexusSemiNetwork][DEBUG] outputStream Create!!!");
            }
            outputStream.write(msg);
            outputStream.flush();
            doSendPacket = true;
            doRecvPacket = false;
            if (inputStream == null) {
                inputStream = new DataInputStream(socketConnection.getInputStream());
                System.out.println("[NexusSemiNetwork][DEBUG] inputStream Create!!!");
            }
            return readTCPInput(inputStream);
        } catch (SocketTimeoutException e) {
            System.out.println("[NexusSemiNetwork][DEBUG] getTCPData Socket Time Out!!!");
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
        try {
            openTCPConnection();
        } catch (Exception e) {
            errorCounter = (byte) (errorCounter + 1);
            e.printStackTrace();
        }
        return array;
    }

    private static void requestPurchase(int itemBuySeq, String itemPaycode, String itemName) {
        isRequestPurchase = true;
    }

    public static boolean NexusNetConnect() {
        return false;
    }

    public static boolean NexusNetworkConnect() {
        boolean netConnect = NexusNetConnect();
        if (netConnect) {
            return openTCPConnection();
        }
        return false;
    }

    public static boolean NexusNetworkDisconnect() {
        return closeTCPConnection();
    }
}
