package com.gamevil.nexus2.p000ui;

/* JADX INFO: loaded from: classes.dex */
public class NxArray {
    public static final int DEFAUT_CAPACITY = 20;
    private int capacity;
    private int elementSize;
    private Object[] elements;

    public NxArray() {
        this.capacity = 20;
        this.elementSize = 0;
        this.elements = null;
        initialize();
    }

    public NxArray(int _capacity) {
        this.capacity = _capacity;
        this.elementSize = 0;
        this.elements = null;
        initialize();
    }

    public void initialize() {
        this.elements = new Object[20];
    }

    public int getElemetsSize() {
        return this.elementSize;
    }

    public int getCapacity() {
        return this.capacity;
    }

    public boolean addElemet(Object _element) {
        return insertElemet(this.elementSize, _element);
    }

    public boolean insertElemet(int _idx, Object _element) {
        boolean bSuccess = chackCapacity(1);
        if (bSuccess) {
            for (int i = this.elementSize; i > _idx; i--) {
                this.elements[i] = this.elements[i - 1];
            }
            this.elements[_idx] = _element;
            this.elementSize++;
            return true;
        }
        return false;
    }

    public boolean removeElement(int nIdx) {
        if (nIdx < this.elementSize) {
            for (int i = nIdx; i < this.elementSize - 1; i++) {
                this.elements[i] = this.elements[i + 1];
            }
            this.elementSize--;
            return true;
        }
        return false;
    }

    public boolean removeElement(Object _element) {
        for (int i = 0; i < this.elementSize; i++) {
            if (this.elements[i] == _element) {
                return removeElement(i);
            }
        }
        return false;
    }

    public Object getElement(int _idx) {
        if (_idx < 0 || _idx > this.elements.length) {
            return null;
        }
        return this.elements[_idx];
    }

    public void expandCapacity(int _capacity) {
        if (_capacity != 0) {
            Object[] newArray = new Object[_capacity];
            if (this.elementSize > 0) {
                System.arraycopy(this.elements, 0, newArray, 0, this.elements.length);
            }
            this.elements = null;
            this.capacity = _capacity;
            this.elements = newArray;
        }
    }

    boolean chackCapacity(int _additionalSize) {
        int szAdded = this.elementSize + _additionalSize;
        if (szAdded <= this.capacity) {
            return true;
        }
        int szDouble = this.capacity << 1;
        int nNextSize = max(szDouble, szAdded);
        expandCapacity(nNextSize);
        return false;
    }

    public void swapElement(int idx1, int idx2) {
        Object temp = this.elements[idx1];
        this.elements[idx1] = this.elements[idx2];
        this.elements[idx2] = temp;
    }

    public void cleanUpAll() {
        for (int i = 0; i < this.elementSize; i++) {
            this.elements[i] = null;
        }
        this.elementSize = 0;
    }

    public void releaseAll() {
        cleanUpAll();
        this.elements = null;
    }

    int max(int m, int n) {
        return m > n ? m : n;
    }
}
