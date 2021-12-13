package com.example.myandroidpractice;

import java.util.HashMap;

/**
 * 定义一个内存缓存框架
 */
public class MyLruCache {
    /**
     * 定义一个双向链表的数据结构
     */
    class  Node{
        Node pre;//前一个结点
        Node next;//下一个结点
        int key=-1;
        int value=-1;

        public Node(int key,int value){
            this.key=key;
            this.value=value;
        }
    }
    private final HashMap<Integer,Node>hashMap;
    private int size;//标志当前的容量
    private Node head;//头指针
    private Node tail;//尾指针
    private final int capacity;//初始化容量

    public MyLruCache(int capacity){
        hashMap=new HashMap<>(capacity);
        this.capacity=capacity;
        size=0;
        head=null;
        tail=null;
    }

    int getValue(int key){
        Node node=hashMap.get(key);
        if(node==null){
            return -1;
        }
        moveNodeToHead(node);
        return node.value;
    }

    void putValue(int key,int value){
        Node node=hashMap.get(key);
        if(node!=null){
            node.value=value;
        }else{
            //数组里面没有找到，准备存储
            Node newNode=new Node(key, value);
            if(size>=capacity){
                hashMap.remove(tail.key);
                removeNodeFromTail();
            }else{
                size++;
            }
        }
        if(size==1){
            head=node;
            tail=node;
        }
        moveNodeToHead(node);
        hashMap.put(key, node);
    }

    private void removeNodeFromTail() {
        if(tail!=null){
            if(tail.pre!=null){
                tail.pre.next=null;
            }else{
                head=null;
            }
            tail=tail.pre;
        }
    }

    /**
     * 将当前取到的Node移到头部
     * @param node
     */
    private void moveNodeToHead(Node node) {
        if(head==node){
            return;
        }
        if(node.next!=null){
            node.next.pre=node.pre;
        }
        if(node.pre!=null){
            node.pre.next=node.next;
        }
        if(tail==node){
           tail=node.pre;
        }
        if(head!=null){
            node.next=head;
            head.pre=node;
        }
        head=node;
        head.pre=null;
    }
}





















