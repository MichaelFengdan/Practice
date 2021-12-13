package com.example.myandroidpractice;

import android.os.Bundle;
import android.view.View;

import androidx.appcompat.app.AppCompatActivity;
import androidx.databinding.DataBindingUtil;

import com.example.myandroidpractice.databinding.ActivityMainBinding;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {
    private ActivityMainBinding baseuseBinding;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        baseuseBinding = DataBindingUtil.setContentView(this, R.layout.activity_main);
        baseuseBinding.setTextStr("This is my firstTextView");
        baseuseBinding.setOnClickListener(this);
        baseuseBinding.setOnClickUtil(new OnClickUtil());
    }

    @Override
    public void onClick(View v) {
       baseuseBinding.textView1.setText("更改名称了");
    }
}