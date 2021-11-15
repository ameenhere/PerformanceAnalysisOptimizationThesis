SELECT *
FROM   (SELECT ou.uid                                                AS
               ou_identifier,
               p.uid                                                 AS
               p_identifier,
               ps.uid                                                AS
               ps_identifier,
               coc.uid                                               AS
               coc_identifier,
               psi.uid                                               AS psi_uid,
               ou.uid                                                AS ou_uid,
               p.uid                                                 AS p_uid,
               ps.uid                                                AS ps_uid,
               coc.uid                                               AS coc_uid,
               psi.programstageinstanceid                            AS psi_id,
               psi.status                                            AS
               psi_status,
               psi.executiondate                                     AS
                      psi_executiondate,
               psi.eventdatavalues                                   AS
                      psi_eventdatavalues,
               psi.duedate                                           AS
               psi_duedate,
               psi.completedby                                       AS
               psi_completedby
                      ,
               psi.storedby                                          AS
                      psi_storedby,
               psi.created                                           AS
               psi_created,
               psi.createdbyuserinfo                                 AS
                      psi_createdbyuserinfo,
               psi.lastupdated                                       AS
               psi_lastupdated
                      ,
               psi.lastupdatedbyuserinfo                             AS
                      psi_lastupdatedbyuserinfo,
               psi.completeddate                                     AS
                      psi_completeddate,
               psi.deleted                                           AS
               psi_deleted,
               St_astext(psi.geometry)                               AS
               psi_geometry,
               au.uid                                                AS
               user_assigned,
               ( au.firstname
                 || ' '
                 || au.surname )                                     AS
                      user_assigned_name,
               auc.username                                          AS
                      user_assigned_username,
               cocco.categoryoptionid                                AS
                      cocco_categoryoptionid,
               deco.uid                                              AS deco_uid
               ,
               deco.publicaccess
               AS
                      deco_publicaccess,
               decoa.uga_access                                      AS
               uga_access,
               decoa.ua_access                                       AS
               ua_access,
               cocount.option_size                                   AS
               option_size,
               Lower(psi.eventdatavalues #>> '{LavUrktwH5D, value}') AS
               LavUrktwH5D,
               pi.uid                                                AS pi_uid,
               pi.status                                             AS
               pi_status,
               pi.followup                                           AS
               pi_followup,
               p.type                                                AS p_type,
               ps.uid                                                AS ps_uid,
               ou.name                                               AS ou_name,
               tei.trackedentityinstanceid                           AS tei_id,
               tei.uid                                               AS tei_uid,
               teiou.uid                                             AS tei_ou,
               teiou.name                                            AS
               tei_ou_name,
               tei.created                                           AS
               tei_created,
               tei.inactive                                          AS
               tei_inactive
        FROM   programstageinstance psi
               INNER JOIN programinstance pi
                       ON pi.programinstanceid = psi.programinstanceid
               INNER JOIN program p
                       ON p.programid = pi.programid
               INNER JOIN programstage ps
                       ON ps.programstageid = psi.programstageid
               INNER JOIN categoryoptioncombo coc
                       ON coc.categoryoptioncomboid = psi.attributeoptioncomboid
               INNER JOIN categoryoptioncombos_categoryoptions cocco
                       ON
               psi.attributeoptioncomboid = cocco.categoryoptioncomboid
               INNER JOIN dataelementcategoryoption deco
                       ON cocco.categoryoptionid = deco.categoryoptionid
               LEFT JOIN trackedentityinstance tei
                      ON
               tei.trackedentityinstanceid = pi.trackedentityinstanceid
               LEFT JOIN organisationunit ou
                      ON ( psi.organisationunitid = ou.organisationunitid )
               LEFT JOIN organisationunit teiou
                      ON ( tei.organisationunitid = teiou.organisationunitid )
               LEFT JOIN users auc
                      ON ( psi.assigneduserid = auc.userid )
               LEFT JOIN userinfo au
                      ON ( auc.userid = au.userinfoid )
               LEFT JOIN (SELECT categoryoptioncomboid,
                                 Count(categoryoptioncomboid) AS option_size
                          FROM   categoryoptioncombos_categoryoptions
                          GROUP  BY categoryoptioncomboid) AS cocount
                      ON coc.categoryoptioncomboid =
                         cocount.categoryoptioncomboid
               LEFT JOIN (SELECT deco.categoryoptionid   AS deco_id,
                                 deco.uid                AS deco_uid,
                                 deco.publicaccess       AS deco_publicaccess,
                                 couga.usergroupaccessid AS uga_id,
                                 coua.useraccessid       AS ua_id,
                                 uga.access              AS uga_access,
                                 uga.usergroupid         AS usrgrp_id,
                                 ua.access               AS ua_access,
                                 ua.userid               AS usr_id
                          FROM   dataelementcategoryoption deco
               LEFT JOIN dataelementcategoryoptionusergroupaccesses
                         couga
                      ON deco.categoryoptionid =
                         couga.categoryoptionid
               LEFT JOIN dataelementcategoryoptionuseraccesses coua
                      ON deco.categoryoptionid =
                         coua.categoryoptionid
               LEFT JOIN usergroupaccess uga
                      ON couga.usergroupaccessid =
                         uga.usergroupaccessid
               LEFT JOIN useraccess ua
                      ON coua.useraccessid = ua.useraccessid
                          WHERE  ua.userid = 4159444
                                  OR uga.usergroupid IN ( 71485, 1129820, 73014,
                                                          4165089,
                                                          379630 )) AS decoa
                      ON cocco.categoryoptionid = decoa.deco_id
        WHERE  Lower(psi.eventdatavalues #>> '{LavUrktwH5D, value}') LIKE
               '%nphcda000005013%'
               AND p.programid = 64519
               AND psi.deleted IS FALSE
               AND ( p.uid IN ( 'ZooGF6EL7WN', 'gWuxRU2yJ1x', 'yDuAzyqYABS',
                                'FEgBDv3xyCw',
                                'SIVHcESQEcS', 'gCbFSqEM5Ry' ) )
               AND ( ps.uid IN ( 'Du0jyYdpjYn', 'Lvco0jftWeD', 'VGVjsFvx0J4',
                                 'Noldaaz2TLs',
                                 'a1jCssI2LkW', 'so8YZ9J3MeO', 'KPc2vZ0IyiH',
                                 'Y4v9hBo2Xst',
                                 'ScHSJKY4nBj', 'Fwc5G0VTdlV', 'FhmnMGI5RWG',
                                 'Q2jSVdeIOZ5',
                                 'tWjYYTYjs15', 'ZDk16pdB449' ) )
        ORDER  BY psi_lastupdated DESC
        LIMIT  2 offset 0) AS event
       LEFT JOIN (SELECT psic.programstageinstanceid    AS psic_id,
                         psinote.trackedentitycommentid AS psinote_id,
                         psinote.commenttext            AS psinote_value,
                         psinote.created                AS psinote_storeddate,
                         psinote.creator                AS psinote_storedby,
                         psinote.uid                    AS psinote_uid,
                         psinote.lastupdated            AS psinote_lastupdated,
                         usernote.userid                AS usernote_id,
                         usernote.code                  AS usernote_code,
                         usernote.uid                   AS usernote_uid,
                         usernote.username              AS usernote_username,
                         userinfo.firstname             AS userinfo_firstname,
                         userinfo.surname               AS userinfo_surname
                  FROM   programstageinstancecomments psic
                         INNER JOIN trackedentitycomment psinote
                                 ON psic.trackedentitycommentid =
                                    psinote.trackedentitycommentid
                         LEFT JOIN users usernote
                                ON psinote.lastupdatedby = usernote.userid
                         LEFT JOIN userinfo
                                ON usernote.userid = userinfo.userinfoid) AS cm
              ON event.psi_id = cm.psic_id
ORDER  BY psi_lastupdated DESC 