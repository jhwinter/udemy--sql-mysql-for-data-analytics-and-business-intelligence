CREATE USER 'nativeuser'@'localhost' IDENTIFIED WITH mysql_native_password BY 'nativeuser';
GRANT ALL PRIVILEGES ON *.* TO 'nativeuser'@'localhost';