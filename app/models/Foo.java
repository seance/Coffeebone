package models;

import java.lang.annotation.Annotation;
import java.lang.reflect.Type;

import javax.persistence.Entity;

import play.data.binding.TypeBinder;
import play.db.jpa.Model;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

@Entity
public class Foo extends Model {
	
	public String name;
	
	public Foo mergeSave() {
		return super.<Foo>merge().save();
	}
}
