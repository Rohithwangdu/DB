CREATE TABLE HotelStays
(roomNum INTEGER NOT NULL,
arrDate DATE NOT NULL,
depDate DATE NOT NULL,
guestName CHAR(30) NOT NULL,
PRIMARY KEY (roomNum, arrDate),
CHECK (arrDate < depDate));
GO
CREATE OR REPLACE FUNCTION func_trig()
  RETURNS TRIGGER
  LANGUAGE plpgsql
AS
$body$
BEGIN
IF EXISTS (SELECT * FROM HotelStays h WHERE h.roomNum=New.roomNum
          and NEW.arrDate >= h.arrDate AND NEW.arrDate<=h.depDate) THEN
           RAISE EXCEPTION 'RESERVATION ALREADY EXISTS FOR ROOMNUM:%',NEW.roomNum;
  END IF;
  RETURN NEW;
END;
$body$
GO
create trigger inserting BEFORE insert on 
HotelStays FOR EACH ROW execute procedure func_trig();

GO
INSERT INTO HotelStays(roomNum, arrDate, depDate, guestName)
VALUES 
(123, to_date('20160202', 'YYYYMMDD'), to_date('20160206','YYYYMMDD'), 'A'),
(123, to_date('20160204', 'YYYYMMDD'), to_date('20160208','YYYYMMDD'), 'B'),
(201, to_date('20160210', 'YYYYMMDD'), to_date('20160206','YYYYMMDD'), 'C')
; 