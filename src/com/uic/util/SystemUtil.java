package com.uic.util;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;

public class SystemUtil {
	/**
	 * @author Sam
	 * @description read, write, update FYP system configuration properties
	 * @category Util @
	 */
	static String profilepath = "FYP-system.properties";

	private static Properties props = new Properties();


	static {
		try {
			//writeProperties("DefaultTeacherPassword", "123456");
			//writeProperties("PreTimeState", "false");
			props.load(new FileInputStream(profilepath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			System.exit(-1);
		} catch (IOException e) {
			System.exit(-1);
		}
	}

	/**
	 * @description Reads the properties file corresponding key value
	 * @param key
	 * @return String
	 */
	public static String getKeyValue(String key) {
		return props.getProperty(key);
	}

	/**
	 * 
	 * @param filePath
	 * @param key
	 * @return String
	 */
	public static String readValue(String filePath, String key) {
		Properties props = new Properties();
		try {
			InputStream in = new BufferedInputStream(new FileInputStream(
					filePath));
			props.load(in);
			String value = props.getProperty(key);
			return value;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * Update (or insert) a pair of properties information (primary key and a
	 * key) if the primary key already exists, update the primary key value; if
	 * the primary key does not exist, the plug-one pairs of keys.
	 * 
	 * @param keyname
	 * @param keyvalue
	 * 
	 */
	public static void writeProperties(String keyname, String keyvalue) {
		try {
			OutputStream fos = new FileOutputStream(profilepath);
			props.setProperty(keyname, keyvalue);
			props.store(fos, "Update '" + keyname + "' value");
		} catch (IOException e) {
			System.err.println("Properties file update error!");
		}
	}

	/**
	 * Update on key properties file if the primary key already exists, update
	 * the primary key value; if the primary key does not exist, the plug-pair
	 * key.
	 * 
	 * @param keyname
	 * @param keyvalue
	 */
	public void updateProperties(String keyname, String keyvalue) {
		try {
			props.load(new FileInputStream(profilepath));
			OutputStream fos = new FileOutputStream(profilepath);
			props.setProperty(keyname, keyvalue);
			props.store(fos, "Update '" + keyname + "' value");
		} catch (IOException e) {
			System.err.println("Properties file update error!");
		}
	}
	
	public static void delete(String keyname){
		try {
			OutputStream fos = new FileOutputStream(profilepath);
			props.remove(keyname);
			props.store(fos, "Remove '" + keyname + "' value");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/*
	 * private static InputStream fis = null; private static String password =
	 * ""; static{ Properties pp = new Properties(); try {
	 * fis=SystemUtil.class.getClassLoader
	 * ().getResourceAsStream("FYP-system.properties"); pp.load(fis);
	 * 
	 * password = pp.getProperty("DefaultTeacherPassword"); } catch (IOException
	 * e) { // TODO Auto-generated catch block e.printStackTrace(); } }
	 * 
	 * 
	 * public static String getDefaultTeacherPassword(){ return password; }
	 */

}
