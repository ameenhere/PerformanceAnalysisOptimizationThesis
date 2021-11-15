SELECT     tei.uid                                AS instance,
           tei.created                            AS created,
           tei.lastupdated                        AS lastupdated,
           ou.uid                                 AS ou,
           ou.NAME                                AS ouname,
           te.uid                                 AS te,
           en.status                              AS enrollment_status,
           tei.inactive                           AS inactive,
           "tJz1lz2sGrl".value                    AS "tJz1lz2sGrl",
           "m8xiBGIwDOT".value                    AS "m8xiBGIwDOT",
           "wi1E4HGW2zn".value                    AS "wi1E4HGW2zn",
           "XELfe4q9YMx".value                    AS "XELfe4q9YMx",
           "xom4oPe793b".value                    AS "xom4oPe793b",
           "I2kOTyjBaL7".value                    AS "I2kOTyjBaL7",
           "PezzGE7AGqZ".value                    AS "PezzGE7AGqZ",
           Cast( "QkgK6iUTKV3".value AS NUMERIC ) AS "QkgK6iUTKV3",
           "phQypUuyU6Q".value                    AS "phQypUuyU6Q",
           "pSTSMtz1Wpl".value                    AS "pSTSMtz1Wpl",
           "II2s9ObHBvz".value                    AS "II2s9ObHBvz",
           "edxMtP94nYO".value                    AS "edxMtP94nYO",
           "eYViMjtiWRA".value                    AS "eYViMjtiWRA",
           "E3rF2khHBXS".value                    AS "E3rF2khHBXS",
           "TPFpCvjJXrH".value                    AS "TPFpCvjJXrH",
           "fFXrgNH7SY6".value                    AS "fFXrgNH7SY6"
FROM       trackedentityinstance tei
INNER JOIN trackedentitytype te
ON         tei.trackedentitytypeid = te.trackedentitytypeid
INNER JOIN
           (
                  SELECT trackedentityinstanceid,
                         organisationunitid
                  FROM   trackedentityprogramowner
                  WHERE  programid = 17609) AS tepo
ON         tei.trackedentityinstanceid = tepo.trackedentityinstanceid
INNER JOIN
           (
                    SELECT   trackedentityinstanceid,
                             Min(
                             CASE
                                      WHEN status='ACTIVE' THEN 0
                                      WHEN status='COMPLETED' THEN 1
                                      ELSE 2
                             END) AS status
                    FROM     programinstance pi
                    WHERE    pi.programid= 17609
                    AND      pi.deleted IS false
                    GROUP BY trackedentityinstanceid ) AS en
ON         tei.trackedentityinstanceid = en.trackedentityinstanceid
INNER JOIN organisationunit ou
ON         tepo.organisationunitid = ou.organisationunitid
INNER JOIN trackedentityattributevalue AS "tJz1lz2sGrl"
ON         "tJz1lz2sGrl".trackedentityinstanceid = tei.trackedentityinstanceid
AND        "tJz1lz2sGrl".trackedentityattributeid = 17633
AND        lower("tJz1lz2sGrl".value) = '783063093v'
LEFT JOIN  trackedentityattributevalue AS "m8xiBGIwDOT"
ON         "m8xiBGIwDOT".trackedentityinstanceid = tei.trackedentityinstanceid
AND        "m8xiBGIwDOT".trackedentityattributeid = 26234
LEFT JOIN  trackedentityattributevalue AS "wi1E4HGW2zn"
ON         "wi1E4HGW2zn".trackedentityinstanceid = tei.trackedentityinstanceid
AND        "wi1E4HGW2zn".trackedentityattributeid = 17621
LEFT JOIN  trackedentityattributevalue AS "XELfe4q9YMx"
ON         "XELfe4q9YMx".trackedentityinstanceid = tei.trackedentityinstanceid
AND        "XELfe4q9YMx".trackedentityattributeid = 357636
LEFT JOIN  trackedentityattributevalue AS "xom4oPe793b"
ON         "xom4oPe793b".trackedentityinstanceid = tei.trackedentityinstanceid
AND        "xom4oPe793b".trackedentityattributeid = 357642
LEFT JOIN  trackedentityattributevalue AS "I2kOTyjBaL7"
ON         "I2kOTyjBaL7".trackedentityinstanceid = tei.trackedentityinstanceid
AND        "I2kOTyjBaL7".trackedentityattributeid = 17585
LEFT JOIN  trackedentityattributevalue AS "PezzGE7AGqZ"
ON         "PezzGE7AGqZ".trackedentityinstanceid = tei.trackedentityinstanceid
AND        "PezzGE7AGqZ".trackedentityattributeid = 357663
LEFT JOIN  trackedentityattributevalue AS "QkgK6iUTKV3"
ON         "QkgK6iUTKV3".trackedentityinstanceid = tei.trackedentityinstanceid
AND        "QkgK6iUTKV3".trackedentityattributeid = 17586
LEFT JOIN  trackedentityattributevalue AS "phQypUuyU6Q"
ON         "phQypUuyU6Q".trackedentityinstanceid = tei.trackedentityinstanceid
AND        "phQypUuyU6Q".trackedentityattributeid = 17587
LEFT JOIN  trackedentityattributevalue AS "pSTSMtz1Wpl"
ON         "pSTSMtz1Wpl".trackedentityinstanceid = tei.trackedentityinstanceid
AND        "pSTSMtz1Wpl".trackedentityattributeid = 357648
LEFT JOIN  trackedentityattributevalue AS "II2s9ObHBvz"
ON         "II2s9ObHBvz".trackedentityinstanceid = tei.trackedentityinstanceid
AND        "II2s9ObHBvz".trackedentityattributeid = 357649
LEFT JOIN  trackedentityattributevalue AS "edxMtP94nYO"
ON         "edxMtP94nYO".trackedentityinstanceid = tei.trackedentityinstanceid
AND        "edxMtP94nYO".trackedentityattributeid = 17592
LEFT JOIN  trackedentityattributevalue AS "eYViMjtiWRA"
ON         "eYViMjtiWRA".trackedentityinstanceid = tei.trackedentityinstanceid
AND        "eYViMjtiWRA".trackedentityattributeid = 17593
LEFT JOIN  trackedentityattributevalue AS "E3rF2khHBXS"
ON         "E3rF2khHBXS".trackedentityinstanceid = tei.trackedentityinstanceid
AND        "E3rF2khHBXS".trackedentityattributeid = 24772
LEFT JOIN  trackedentityattributevalue AS "TPFpCvjJXrH"
ON         "TPFpCvjJXrH".trackedentityinstanceid = tei.trackedentityinstanceid
AND        "TPFpCvjJXrH".trackedentityattributeid = 25029
LEFT JOIN  trackedentityattributevalue AS "fFXrgNH7SY6"
ON         "fFXrgNH7SY6".trackedentityinstanceid = tei.trackedentityinstanceid
AND        "fFXrgNH7SY6".trackedentityattributeid = 29959
WHERE      tei.trackedentitytypeid IN (17581)
AND        (
                      ou.path LIKE '/GYBZ1og9bk7%')
AND        tei.deleted IS false
ORDER BY   en.status ASC,
           lastupdated DESC;