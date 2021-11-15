SELECT TEI.uid                        AS instance,
       TEI.created                    AS created,
       TEI.lastupdated                AS lastupdated,
       TEI.ou                         AS ou,
       TEI.ouname                     AS ouname,
       TET.uid                        AS te,
       TEI.inactive                   AS inactive,
       String_agg(TEA.uid
                  || ':'
                  || TEAV.value, ';') AS tea_values
FROM   (SELECT TEI.trackedentityinstanceid,
               TEI.uid,
               TEI.created,
               TEI.lastupdated,
               TEI.inactive,
               TEI.trackedentitytypeid,
               TEI.deleted,
               OU.uid  AS ou,
               OU.name AS ouname
        FROM   trackedentityinstance TEI
               INNER JOIN trackedentityattributevalue "TfdH5KvFmMy"
                       ON "TfdH5KvFmMy".trackedentityattributeid = 3485
                          AND "TfdH5KvFmMy".trackedentityinstanceid =
                              TEI.trackedentityinstanceid
                          AND Lower("TfdH5KvFmMy".value) LIKE '%doejohn%'
               INNER JOIN trackedentityattributevalue "aW66s2QSosT"
                       ON "aW66s2QSosT".trackedentityattributeid = 3461
                          AND "aW66s2QSosT".trackedentityinstanceid =
                              TEI.trackedentityinstanceid
                          AND Lower("aW66s2QSosT".value) LIKE '%johndoe%'
               INNER JOIN trackedentityattributevalue "ciCR6BBvIT4"
                       ON "ciCR6BBvIT4".trackedentityattributeid = 3465
                          AND "ciCR6BBvIT4".trackedentityinstanceid =
                              TEI.trackedentityinstanceid
                          AND Lower("ciCR6BBvIT4".value) LIKE '%098765432%'
               INNER JOIN organisationunit OU
                       ON OU.organisationunitid = TEI.organisationunitid
                          AND ( OU.path LIKE '/Hjw70Lodtf2%' )
        WHERE  TEI.trackedentitytypeid = 3501
               AND TEI.deleted IS FALSE
        ORDER  BY TEI.trackedentityinstanceid ASC
        LIMIT  21 offset 0) TEI
       LEFT JOIN trackedentitytype TET
              ON TET.trackedentitytypeid = TEI.trackedentitytypeid
       LEFT JOIN trackedentityattributevalue TEAV
              ON TEAV.trackedentityinstanceid = TEI.trackedentityinstanceid
                 AND TEAV.trackedentityattributeid IN (
                     3485, 3461, 3465, 12778931,
                     3469, 3481, 5879557, 5975135,
                     4347, 42647, 3473, 4422,
                     32927, 32844, 32845, 42533, 42512 )
       LEFT JOIN trackedentityattribute TEA
              ON TEA.trackedentityattributeid = TEAV.trackedentityattributeid
GROUP  BY TEI.trackedentityinstanceid,
          TEI.uid,
          TEI.created,
          TEI.lastupdated,
          TEI.ou,
          TEI.ouname,
          TET.uid,
          TEI.inactive
ORDER  BY TEI.trackedentityinstanceid ASC; 