package com.example.myandroidpractice;

import com.example.myandroidpractice.javaproject.ListNode;

import java.util.Stack;

public class Test {
    public boolean isPalindrome(ListNode head) {
        return isPalindromeStack(head);
    }

    ///利用栈空间翻转链表
    public boolean isPalindromeStack(ListNode head){
        Stack<Integer>stack=new Stack<>();
        ListNode temp=head;
        while (temp!=null){
            stack.push(temp.val);
            temp=temp.next;
        }
        ListNode tempOne=head;
        while(!stack.isEmpty()){
            if(stack.pop()!=tempOne.val)return false;
            tempOne=tempOne.next;
        }
        return true;
    }

    public boolean methodTwo(ListNode head){
        //记录链表的长度
        int len=0;
        ListNode temp=head;
        while (temp!=null){
           len++;
           temp=temp.next;
        }
        ///准备翻转链表
        ListNode cur=head,pre=null;
        for(int j=0;j<len/2;j++){
            ListNode next=cur.next;
            cur.next=pre;
            pre=cur;
            cur=next;
        }
        //如果是奇数，就往后移动一位
        if(len%2==1){
            cur=cur.next;
        }
        for(;pre!=null&&cur!=null;pre=pre.next,cur=cur.next){
            if(pre.val!=cur.val)return false;
        }
        return true;

    }

}
