CREATE TABLE ProjectTracker(
  ProjectID VARCHAR(5),
  Step INTEGER,
  Status VARCHAR(1)
  );
  
INSERT INTO ProjectTracker VALUES
('P100',0,'C'),
('P100',1,'W'),
('P100',2,'W'),
('P201',0,'C'),
('P201',1,'C'),
('P333',0,'W'),
('P333',1,'W'),
('P333',2,'W'),
('P333',3,'W');

SELECT ProjectID from ProjectTracker p 
WHERE Step=0 AND Status='C' AND 
EXISTS 
(SELECT ProjectID FROM ProjectTracker q 
 WHERE q.ProjectID=p.ProjectID
 AND 
 q.Status='W' and q.step>0
GROUP BY ProjectID
HAVING COUNT(ProjectID)>0) AND 
EXISTS 
(SELECT ProjectID FROM ProjectTracker r 
 WHERE r.ProjectID=p.ProjectID
 AND 
 r.Status='C' 
GROUP BY ProjectID
HAVING COUNT(ProjectID)=1);