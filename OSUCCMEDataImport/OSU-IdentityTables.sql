
SELECT name 'Table with Identity column'
FROM SYS.Tables
WHERE OBJECTPROPERTY(object_id,'TableHasIdentity') = 1
      AND type = 'U'
      order by 'Table with Identity column'

      
SELECT name 'Table without Identity column'
FROM SYS.Tables
WHERE OBJECTPROPERTY(object_id,'TableHasIdentity') = 0
      AND type = 'U'
      order by 'Table without Identity column'

      Go