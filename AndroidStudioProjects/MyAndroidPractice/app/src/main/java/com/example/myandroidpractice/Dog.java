package com.example.myandroidpractice;

import androidx.databinding.BaseObservable;
import androidx.databinding.Bindable;
import androidx.databinding.library.baseAdapters.BR;

public class Dog extends BaseObservable {
    @Bindable
    public String name;

    private String color;

    public void setDatOnlyName(String name, String color){
        this.name=name;
        this.color=color;
        //只刷新一个字段
        notifyPropertyChanged(BR.textStr);
    }
}
