--------------------------------------------------------
--  File created - Thursday-February-08-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CUST
--------------------------------------------------------

  CREATE TABLE "CUST" ("CNUM" NUMBER(4,0), "CNAME" VARCHAR2(10), "CITY" VARCHAR2(10), "RATING" NUMBER(3,0), "SNUM" NUMBER(4,0))
--------------------------------------------------------
--  DDL for Index CUST_PK_CNUM
--------------------------------------------------------

  CREATE UNIQUE INDEX "CUST_PK_CNUM" ON "CUST" ("CNUM")
--------------------------------------------------------
--  Constraints for Table CUST
--------------------------------------------------------

  ALTER TABLE "CUST" ADD CONSTRAINT "CUST_PK_CNUM" PRIMARY KEY ("CNUM") ENABLE
  ALTER TABLE "CUST" MODIFY ("RATING" NOT NULL ENABLE)
  ALTER TABLE "CUST" MODIFY ("CITY" NOT NULL ENABLE)
  ALTER TABLE "CUST" MODIFY ("CNAME" NOT NULL ENABLE)
--------------------------------------------------------
--  Ref Constraints for Table CUST
--------------------------------------------------------

  ALTER TABLE "CUST" ADD CONSTRAINT "CUST_FK_SNUM" FOREIGN KEY ("SNUM") REFERENCES "SAL" ("SNUM") ENABLE
