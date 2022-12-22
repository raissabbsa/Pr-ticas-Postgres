SELECT 
    schools.name AS school,
    courses.name AS course, 
    COUNT(educations.id) AS "studentsCount",
    educations.status
FROM educations
    JOIN schools ON educations."schoolId" = schools.id
    JOIN courses ON educations."courseId" = courses.id
WHERE educations.status = 'ongoing' OR educations.status = 'finished'
GROUP BY schools.id, courses.id, educations.id
ORDER BY "studentsCount" DESC
LIMIT 3;