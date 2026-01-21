SELECT
    s."Id"               AS "SurveyId",
    s."CreatedAt" AT TIME ZONE 'America/Los_Angeles' AS "CreatedAtPST",
    st."FirstName",
    st."LastName",
    st."EventId",
    spc."PrimaryCareersId",
    st."SurveyComplete"
FROM "Surveys" s
INNER JOIN "Students" st
    ON s."StudentId" = st."Id"
LEFT JOIN "SurveyPrimaryCareers" spc
    ON spc."SurveyId" = s."Id"
ORDER BY s."CreatedAt" DESC
LIMIT 400;