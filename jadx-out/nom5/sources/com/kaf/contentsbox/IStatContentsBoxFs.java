package com.kaf.contentsbox;

/* JADX INFO: loaded from: classes.dex */
public abstract class IStatContentsBoxFs {
    public IStatContentsBoxFs() {
    }

    public IStatContentsBoxFs(int blockSize, int blockCount, int freeBlocks) {
    }

    public int describeContents() {
        return -1;
    }

    public int getBlockSize() {
        return -1;
    }

    public void setBlockSize(int blockSize) {
    }

    public int getBlockCount() {
        return -1;
    }

    public void setBlockCount(int blockCount) {
    }

    public int getFreeBlocks() {
        return -1;
    }

    public void setFreeBlocks(int freeBlocks) {
    }

    public int getUsedBlocks() {
        return -1;
    }

    public void setUsedBlocks(int usedBlocks) {
    }

    public int getUsedContentsBox() {
        return -1;
    }

    public void setUsedContentsBox(int usedContentsBox) {
    }
}
