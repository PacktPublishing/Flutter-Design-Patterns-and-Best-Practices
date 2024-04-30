package com.example.candy_store

import android.content.Context
import android.content.SharedPreferences
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity(), LocalStorageApi {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        LocalStorageApi.setUp(flutterEngine.dartExecutor.binaryMessenger, this)
    }

    override fun getFaves(): List<FaveProduct> {
        val preferences = getSharedPreferences()
        val faves = preferences.getStringSet("faves", HashSet()) ?: HashSet()
        return faves.map { FaveProduct(id = it) }
    }

    override fun isFave(id: String): Boolean {
        val preferences = getSharedPreferences()
        val faves = preferences.getStringSet("faves", HashSet()) ?: HashSet()
        return faves.contains(id)
    }

    override fun addFave(id: String) {
        toggleFavorite(id, true)
    }

    override fun removeFave(id: String) {
        toggleFavorite(id, false)
    }

    private fun toggleFavorite(id: String, isFavorite: Boolean) {
        val preferences = getSharedPreferences()
        val allFaves = HashSet<String>()
        val faves = preferences.getStringSet("faves", HashSet()) ?: HashSet()
        allFaves.addAll(faves)
        if (isFavorite) {
            allFaves.add(id)
        } else {
            allFaves.remove(id)
        }
        preferences.edit().putStringSet("faves", allFaves).apply()
    }

    private fun getSharedPreferences(): SharedPreferences {
        return applicationContext.getSharedPreferences("faves", Context.MODE_PRIVATE)
    }
}
