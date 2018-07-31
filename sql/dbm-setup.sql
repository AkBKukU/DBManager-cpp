
/* Data structures */

/* The main table for all SQL patches */
CREATE TABLE dbm_patches
(
	filename VARCHAR(128) NOT NULL,
	database VARCHAR(64) NOT NULL,
	order_msb SMALLINT NOT NULL,
	order_lsb SMALLINT NOT NULL,
	contents MEDIUMTEXT NOT NULL,
	description VARCHAR(250) ,
	data_intergrity VARCHAR(250) ,
	status INT NOT NULL DEFAULT 0,
	date_added DATETIME NOT NULL,
	date_installed DATETIME,
	UNIQUE KEY (database,order_msb,order_lsb)
);

/* Functions */

/* Check if a patch is already in the table */
CREATE FUNCTION dbm_patch_exists (in_filename VARCHAR(128)) RETURNS BOOL
BEGIN
    DECLARE is_exist BOOL;
    SET is_exist = 0;
    SELECT EXISTS(SELECT * FROM dbm_patches WHERE `filename`=in_filename) INTO is_exist ;
    RETURN is_exist;
END

/* Stored Procedures */

/* Add a new patch file to the table */
CREATE PROCEDURE dbm_patch_addnew (
	in_filename VARCHAR(128),
	in_database VARCHAR(64),
	in_order_msb SMALLINT,
	in_order_lsb SMALLINT,
	in_contents MEDIUMTEXT,
	in_description VARCHAR(250),
	in_data_intergrity VARCHAR(250),
	in_status INT
)
BEGIN
	INSERT INTO dbm_patches (
		in_filename,
		in_database,
		in_order_msb,
		in_order_lsb,
		in_contents,
		in_description,
		in_data_intergrity,
		in_status,
		NOW()
	);
END

/* Mark a patch as installed */
CREATE PROCEDURE dbm_patch_set_installed ( in_filename VARCHAR(9) )
BEGIN
	UPDATE dbm_history SET status = 1 WHERE dbm_patches.filename=in_filename;
END


