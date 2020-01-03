/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2019/12/30 20:37:29                          */
/*==============================================================*/


DROP TABLE IF EXISTS T_DAPE;

DROP TABLE IF EXISTS T_JOB;

DROP TABLE IF EXISTS T_JOB_PRO;

DROP TABLE IF EXISTS T_PRO;

DROP TABLE IF EXISTS T_USER;

DROP TABLE IF EXISTS T_USER_JOB;

/*==============================================================*/
/* Table: T_DAPE                                                */
/*==============================================================*/
CREATE TABLE T_DAPE
(
   ID                   INTEGER(255) NOT NULL AUTO_INCREMENT,
   PID                  INTEGER(255),
   NAME                 VARCHAR(255),
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: T_JOB                                                 */
/*==============================================================*/
CREATE TABLE T_JOB
(
   ID                   INTEGER(255) NOT NULL AUTO_INCREMENT,
   NAME                 VARCHAR(255),
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: T_JOB_PRO                                             */
/*==============================================================*/
CREATE TABLE T_JOB_PRO
(
   ID                   INTEGER(255) NOT NULL AUTO_INCREMENT,
   JOBID                INTEGER(255),
   PROID                INTEGER(255),
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: T_PRO                                                 */
/*==============================================================*/
CREATE TABLE T_PRO
(
   ID                   INTEGER(255) NOT NULL AUTO_INCREMENT,
   NAME                 VARCHAR(255),
   PID                  INTEGER(255),
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: T_USER                                                */
/*==============================================================*/
CREATE TABLE T_USER
(
   ID                   INTEGER(255) NOT NULL,
   USERNAME             VARCHAR(255),
   PASSWORD             VARCHAR(255),
   PHONE                VARCHAR(255),
   LOGINTIME            DATETIME,
   LOGINCOUNT           INTEGER(255),
   ERRORTIME            DATETIME,
   ERRORCOUNT           INTEGER(255),
   DEPAID               INTEGER(255),
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: T_USER_JOB                                            */
/*==============================================================*/
CREATE TABLE T_USER_JOB
(
   ID                   INTEGER(255) NOT NULL,
   JOB_ID               INTEGER(255),
   USER_ID              INTEGER(255),
   PRIMARY KEY (ID)
);

ALTER TABLE T_JOB_PRO ADD CONSTRAINT FK_REFERENCE_4 FOREIGN KEY (JOBID)
      REFERENCES T_JOB (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE T_JOB_PRO ADD CONSTRAINT FK_REFERENCE_5 FOREIGN KEY (PROID)
      REFERENCES T_PRO (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE T_USER ADD CONSTRAINT FK_REFERENCE_1 FOREIGN KEY (DEPAID)
      REFERENCES T_DAPE (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE T_USER_JOB ADD CONSTRAINT FK_REFERENCE_2 FOREIGN KEY (USER_ID)
      REFERENCES T_USER (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE T_USER_JOB ADD CONSTRAINT FK_REFERENCE_3 FOREIGN KEY (JOB_ID)
      REFERENCES T_JOB (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

