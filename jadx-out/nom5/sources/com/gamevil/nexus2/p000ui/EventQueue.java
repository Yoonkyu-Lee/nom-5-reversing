package com.gamevil.nexus2.p000ui;

/* JADX INFO: loaded from: classes.dex */
public class EventQueue {
    protected int m_Capacity;
    protected EventItem[] m_ItemQueue;
    protected int m_MoveEventClip;
    protected int m_Front = 0;
    protected int m_Rear = 0;
    protected int m_MoveCount = 0;

    public class EventItem {
        protected int m_nEvent;
        protected int m_nParam1;
        protected int m_nParam2;
        protected int m_nPointerID;

        public EventItem() {
            this.m_nEvent = 0;
            this.m_nParam1 = 0;
            this.m_nParam2 = 0;
            this.m_nPointerID = 0;
        }

        public EventItem(int nEvent, int nParam1, int nParam2, int nPointerID) {
            AttachEvent(nEvent, nParam1, nParam2, nPointerID);
        }

        public int GetEvent() {
            return this.m_nEvent;
        }

        public int GetParam1() {
            return this.m_nParam1;
        }

        public int GetParam2() {
            return this.m_nParam2;
        }

        public int GetPointerID() {
            return this.m_nPointerID;
        }

        public void AttachEvent(int nEvent, int nParam1, int nParam2, int nPointerID) {
            this.m_nEvent = nEvent;
            this.m_nParam1 = nParam1;
            this.m_nParam2 = nParam2;
            this.m_nPointerID = nPointerID;
        }
    }

    public EventQueue(int nSize, int nMoveEventClip) {
        this.m_Capacity = nSize - 1;
        this.m_ItemQueue = new EventItem[nSize];
        this.m_MoveEventClip = nMoveEventClip;
        for (int i = 0; i < nSize; i++) {
            this.m_ItemQueue[i] = new EventItem();
        }
    }

    public void setMoveEventClip(int _moveEventClip) {
        this.m_MoveEventClip = _moveEventClip;
    }

    public void ClearEvent() {
        this.m_Front = this.m_Rear;
        this.m_MoveCount = 0;
    }

    public void Enqueue(int nEvent, int nParam1, int nParam2, int nPointerID) {
        if (this.m_Rear == this.m_Capacity) {
            int position = this.m_Rear;
            this.m_Rear = 0;
            if (nEvent == 25) {
                this.m_MoveCount++;
                if (this.m_MoveCount < this.m_MoveEventClip) {
                    this.m_Rear = position;
                    return;
                }
                this.m_MoveCount = 0;
            }
            this.m_ItemQueue[position].AttachEvent(nEvent, nParam1, nParam2, nPointerID);
            return;
        }
        int position2 = this.m_Rear;
        this.m_Rear = position2 + 1;
        if (nEvent == 25) {
            this.m_MoveCount++;
            if (this.m_MoveCount < this.m_MoveEventClip) {
                this.m_Rear = position2;
                return;
            }
            this.m_MoveCount = 0;
        }
        this.m_ItemQueue[position2].AttachEvent(nEvent, nParam1, nParam2, nPointerID);
    }

    public EventItem Dequeue() {
        int position = this.m_Front;
        if (this.m_Front == this.m_Capacity) {
            this.m_Front = 0;
        } else {
            this.m_Front++;
        }
        return this.m_ItemQueue[position];
    }

    public boolean IsEmpty() {
        return this.m_Front == this.m_Rear;
    }

    public boolean IsFull() {
        return this.m_Front < this.m_Rear ? this.m_Rear - this.m_Front == this.m_Capacity : this.m_Rear + 1 == this.m_Front;
    }
}
