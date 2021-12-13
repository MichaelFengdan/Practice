package com.example.myandroidpractice;

import android.view.View;
import android.widget.Toast;

public class OnClickUtil {
    public void onClickWithMe(View view){
        Toast.makeText(view.getContext(), "这次是一个toast方法哦", Toast.LENGTH_SHORT).show();
    }
}
