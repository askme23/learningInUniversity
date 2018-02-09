--------------------------------------------------------
--  File created - Thursday-February-08-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ORD
--------------------------------------------------------

  CREATE TABLE "ORD" ("ONUM" NUMBER(4,0), "AMT" NUMBER(7,2), "ODATE" DATE, "CNUM" NUMBER(4,0), "SNUM" NUMBER(4,0))
--------------------------------------------------------
--  DDL for Index ORD_PK_ONUM
--------------------------------------------------------

  CREATE UNIQUE INDEX "ORD_PK_ONUM" ON "ORD" ("ONUM")
--------------------------------------------------------
--  Constraints for Table ORD
--------------------------------------------------------

  ALTER TABLE "ORD" ADD CONSTRAINT "ORD_PK_ONUM" PRIMARY KEY ("ONUM") ENABLE
  ALTER TABLE "ORD" MODIFY ("ODATE" NOT NULL ENABLE)
  ALTER TABLE "ORD" MODIFY ("AMT" NOT NULL ENABLE)
--------------------------------------------------------
--  Ref Constraints for Table ORD
--------------------------------------------------------

  ALTER TABLE "ORD" ADD CONSTRAINT "ORD_FK_CNUM" FOREIGN KEY ("CNUM") REFERENCES "CUST" ("CNUM") ENABLE
  ALTER TABLE "ORD" ADD CONSTRAINT "ORD_FK_SNUM" FOREIGN KEY ("SNUM") REFERENCES "SAL" ("SNUM") ENABLE
