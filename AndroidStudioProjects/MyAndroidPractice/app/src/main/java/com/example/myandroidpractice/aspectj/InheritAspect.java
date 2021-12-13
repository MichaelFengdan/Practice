package com.example.myandroidpractice.aspectj;

import android.util.Log;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class InheritAspect {
    private final String TAG="InheritAspect";
    private static final String ON_CREATE_EXECUTION="execution(void *..*Activity.onCreate(..))";

    /**
     * 方法方面的aspectJ
     */
    String m1="@java.lang.Deprecated * *(..)";//标识标有这个Deprecate注解的所有的方法 参数没有限制
    String m3="public * *(..)";//表示所有的public的方法
    String m4="* *(..)";//表示任何放方法
    String m5="java.lang.String *(..)";//表示返回String类型的所有方法
    String m6="java.lang.String+ *(..)";//返回String及其子类String类型的方法
    String m7="java.lang.* *(..)";//返回String及其子类String类型的方法
    String m8="java.lang.String* *()";//返回String及其子类String类型的方法
    String m9="java.lang.String* *()";//返回String及其子类String类型的方法
    String m10="java..* *(..)";//该表达式表示返回java包及其底下所有包下的类型的所有方法
    String m11="(@java.lang.Deprecated *) *(..)";//表示该返回值类型上有这个注解标识的所有方法

    /**
     * 关于类的aspectJ
     */
    String c1="* com..*Activity+.*(..)";//表示com包及其子包下，以Activity为后缀的所有类及其子类的所有方法，此处+、*与…和返回值处一样
    String c2="*(@java.lang.Deprecated *).*(..)";//表示所有标有这个注解的类的所有方法

    /**
     *关于方法的aspectJ
     */
    String k1="* on*(..)";//表示以on为前缀的方法







    @Pointcut(ON_CREATE_EXECUTION)
    void onCreateExecution(){

    }

    @Before("onCreateExecution()")
    void beforeOnCreateExecution(JoinPoint joinPoint){
        Log.i(TAG, "onCreate() start");
    }
}
