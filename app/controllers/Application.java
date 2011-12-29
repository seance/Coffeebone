package controllers;

import models.Foo;
import play.mvc.Controller;

import com.google.gson.Gson;
import com.google.gson.JsonElement;

public class Application extends Controller {
	
    public static void index() {
        render();
    }

    public static void listFoos() {
    	renderJSON(Foo.findAll());
    }
    
    public static void createFoo(JsonElement body) {
    	Foo foo = new Gson().fromJson(body, Foo.class).save();
    	System.out.println("Created new Foo with id="+foo.id);
    	renderJSON(foo);
    }
    
    public static void updateFoo(JsonElement body, Long id) {
    	Foo foo = new Gson().fromJson(body, Foo.class).mergeSave();
    	System.out.println("Updated existing Foo with id="+foo.id+", new name="+foo.name);
    	renderJSON(foo);
    }
}