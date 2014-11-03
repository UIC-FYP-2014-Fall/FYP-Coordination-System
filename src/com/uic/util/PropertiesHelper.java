package com.uic.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesHelper {
	/**
	 * @author Sam
	 * @description properties file reading and writing tools
	 * @function getProperties(String key), setProperties(String key,String
	 *           value), deleteProperties(String key)
	 */

	private String project_root = "";
	private File file = null;

	public PropertiesHelper(String filePath) {
		// Get to the physical root directory of the project
		project_root = this.getClass().getResource("/").toString()
				.replace("file:/", "");
		project_root = project_root.substring(0,
				project_root.indexOf("/WEB-INF"));

		if (filePath != null && filePath.length() > 0) {
			try {
				file = new File(project_root + filePath);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public String getProperties(String key) {
		InputStream fis = null;
		try {
			Properties prop = new Properties();
			fis = new FileInputStream(getAbsolutePath());

			prop.load(fis);

			return prop.getProperty(key);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (fis != null) {
					fis.close();
				}
			} catch (Exception e) {
			}
		}

		return "";
	}

	public void setProperties(String key, String value) throws Exception {
		Properties prop = new Properties();

		FileOutputStream outputFile = null;
		InputStream fis = null;
		try {
			// Input and output streams to be treated separately, put together
			// will result in the previous property coverage when writing
			fis = new FileInputStream(getAbsolutePath());
			// load properties file
			prop.load(fis);

			// write new key and value
			prop.setProperty(key, value);

			// write
			outputFile = new FileOutputStream(getAbsolutePath());
			prop.store(outputFile, "Update '" + key + "' value");

			outputFile.flush();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (fis != null) {
					fis.close();
				}
			} catch (Exception e) {
			}
			try {
				if (outputFile != null) {
					outputFile.close();
				}
			} catch (Exception e) {
			}
		}
	}

	public void deleteProperties(String key) throws Exception {
		Properties prop = new Properties();

		FileOutputStream outputFile = null;
		InputStream fis = null;
		try {
			// Input and output streams to be treated separately, put together
			// will result in the previous property coverage when writing
			fis = new FileInputStream(getAbsolutePath());
			// load properties file
			prop.load(fis);

			// remove key
			prop.remove(key);

			//write key and value
			outputFile = new FileOutputStream(getAbsolutePath());
			prop.store(outputFile, "Remove '" + key + "' value");

			outputFile.flush();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (fis != null) {
					fis.close();
				}
			} catch (Exception e) {
			}
			try {
				if (outputFile != null) {
					outputFile.close();
				}
			} catch (Exception e) {
			}
		}
	}

	public String getAbsolutePath() {
		try {
			return file.getAbsolutePath();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

}
