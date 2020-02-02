package com.ruihe.tmall.util;

import lombok.Data;

@Data
public class Page {
    private int start;
    private int count;
    private int total;
    private String param;

    private final static int defaultCount = 5;

    public Page() {
        this.count = defaultCount;
    }

    public Page(int start, int count) {
        this.start = start;
        this.count = count;
    }

    public boolean isHasPrevious() {
        if (start == 0)
            return false;
        return true;
    }

    public boolean isHasNext() {
        if (start == getLast())
            return false;
        return true;
    }

    public int getLast() {
        int last;
        if (total % count == 0)
            last = total - count;
        else
            last = total - total % count;
        return last;
    }

    public int getTotalPage() {
        int totalPage;
        if (total % count == 0)
            totalPage = total / count;
        else
            totalPage = total / count + 1;
        return totalPage;
    }

}