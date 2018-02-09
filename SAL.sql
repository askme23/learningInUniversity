--------------------------------------------------------
--  File created - Thursday-February-08-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table SAL
--------------------------------------------------------

  CREATE TABLE "SAL" ("SNUM" NUMBER(4,0), "SNAME" VARCHAR2(10), "CITY" VARCHAR2(10), "COMM" NUMBER(7,2))
--------------------------------------------------------
--  DDL for Index SAL_PK_SNUM
--------------------------------------------------------

  CREATE UNIQUE INDEX "SAL_PK_SNUM" ON "SAL" ("SNUM")
--------------------------------------------------------
--  Constraints for Table SAL
--------------------------------------------------------

  ALTER TABLE "SAL" ADD CONSTRAINT "SAL_PK_SNUM" PRIMARY KEY ("SNUM") ENABLE
  ALTER TABLE "SAL" MODIFY ("COMM" NOT NULL ENABLE)
  ALTER TABLE "SAL" MODIFY ("CITY" NOT NULL ENABLE)
  ALTER TABLE "SAL" MODIFY ("SNAME" NOT NULL ENABLE)
