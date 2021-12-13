package com.example.myandroidpractice;

import androidx.databinding.ObservableField;
import androidx.databinding.ObservableInt;

public class Human {
    public final ObservableField<String>name=new ObservableField<>();
    public final ObservableInt age=new ObservableInt();

    public Human(String name,int age){
        this.name.set(name);
        this.age.set(age);
    }
}
