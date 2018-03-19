create or replace view SERVICES_OF_AGENCIES as 
select aa.*, 
       st.SERVICE_TYPE 
  from ADVERT_AGENCY aa 
       join SERVICES_TYPES st on aa.ID = st.PID 
 where st.SERVICE_TYPE != 'Печать баннеров';