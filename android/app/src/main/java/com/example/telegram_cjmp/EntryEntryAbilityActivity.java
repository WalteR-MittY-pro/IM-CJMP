package com.example.telegram_cjmp;

import android.os.Bundle;
import android.util.Log;

import ohos.stage.ability.adapter.StageActivity;


public class EntryEntryAbilityActivity extends StageActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        Log.e("HiHelloWorld", "EntryEntryAbilityActivity");

        setInstanceName("com.example.telegram_cjmp:entry:EntryAbility:");
        super.onCreate(savedInstanceState);
    }
}
