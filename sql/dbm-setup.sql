CREATE TABLE dbm_patches
(
	filename VARCHAR(128) NOT NULL,
	hash CHAR(32) NOT NULL,
	database VARCHAR(64) NOT NULL,
	order_msb SMALLINT NOT NULL,
	order_lsb SMALLINT NOT NULL,
	contents MEDIUMTEXT NOT NULL,
	description VARCHAR(250) ,
	data_intergrity VARCHAR(250) ,
	status INT NOT NULL DEFAULT 0,
	date_added DATETIME NOT NULL,
	date_installed DATETIME NOT NULL,
	UNIQUE KEY (database,order_msb,order_lsb)
);


CREATE FUNCTION dbm_patch_exists (in_filename VARCHAR(128)) RETURNS BOOL
BEGIN
    DECLARE is_exist BOOL;
    SET is_exist = 0;
    SELECT EXISTS(SELECT * FROM dbm_patches WHERE `filename`=in_filename) INTO is_exist ;
    RETURN is_exist;
END


