UPDATE "EventPhases" SET "PhaseName" = 'Setup' WHERE "Id" = 1;
UPDATE "EventPhases" SET "PhaseName" = 'Survey In Progress' WHERE "Id" = 2;
UPDATE "EventPhases" SET "PhaseName" = 'Survey Closed' WHERE "Id" = 3;
UPDATE "EventPhases" SET "PhaseName" = 'Schedule Generated' WHERE "Id" = 4;
UPDATE "EventPhases" SET "PhaseName" = 'Schedule Locked' WHERE "Id" = 5;
UPDATE "EventPhases" SET "PhaseName" = 'Completed' WHERE "Id" = 6;
UPDATE "EventPhases" SET "PhaseName" = 'Cancelled' WHERE "Id" = 7;

DELETE FROM "EventPhases" WHERE "Id" IN (8, 9);