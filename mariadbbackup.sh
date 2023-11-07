nowdate=$(date +"%Y%m%d")
dayago=`(date --date='2 days ago' '+%Y%m%d')`
todate=$(date +"%d")
mondate=$(date +"%m")
year=$(date +"%Y")

cd /opt/mariadbbackup
rm -rf $dayago

mkdir $nowdate
cd $nowdate

#########CTH SKylark###########


mysqldump -C --max_allowed_packet=512M -uroot -pLtVhr8wJXHp2SvTC -h apjprod-readreplica.ctanibxecydf.ap-southeast-1.rds.amazonaws.com careerhub_bi > careerhub_bi_$nowdate.sql
#mysqldump -C --max_allowed_packet=512M -uroot -pLtVhr8wJXHp2SvTC -h cthskylark.ctanibxecydf.ap-southeast-1.rds.amazonaws.com covid19sg > covid19sg_$nowdate.sql
#mysqldump -C --max_allowed_packet=512M -uroot -pLtVhr8wJXHp2SvTC -h apjprod-readreplica.ctanibxecydf.ap-southeast-1.rds.amazonaws.com careertomorrow > careertomorrow_$nowdate.sql
mysqldump -C --max_allowed_packet=512M -uroot -pLtVhr8wJXHp2SvTC -h apjprod-readreplica.ctanibxecydf.ap-southeast-1.rds.amazonaws.com digitallive_skylark > digitallive_skylark_$nowdate.sql
mysqldump -C --max_allowed_packet=512M -uroot -pLtVhr8wJXHp2SvTC -h apjprod-readreplica.ctanibxecydf.ap-southeast-1.rds.amazonaws.com careerhub > careerhub_$nowdate.sql

###SMM



###
#DRL
#mysqldump -C --max_allowed_packet=512M  -uroot -pLtVhr8wJXHp2SvTC -h apjprodreadreplica.ctanibxecydf.ap-southeast-1.rds.amazonaws.com drl > drl_$nowdate.sql
mysqldump -C --max_allowed_packet=512M  -uroot -phChnDUPAaLsEYkBW -h apjprod-2.ctanibxecydf.ap-southeast-1.rds.amazonaws.com drl > drl_$nowdate.sql

#legato
mysqldump -C --max_allowed_packet=512M  -uroot -poXXdaIalb4rfkUyen5Z3 -h apjprod-3.ctanibxecydf.ap-southeast-1.rds.amazonaws.com legato_db > legato_db_$nowdate.sql
mysqldump -C --max_allowed_packet=512M  -uroot -poXXdaIalb4rfkUyen5Z3 -h apjprod-3.ctanibxecydf.ap-southeast-1.rds.amazonaws.com legato_bi > legato_bi_$nowdate.sql

#ERP
#mysqldump -C --max_allowed_packet=512M  -uroot -pLtVhr8wJXHp2SvTC -h cthskylark.ctanibxecydf.ap-southeast-1.rds.amazonaws.com erp_logic > erp_logic_$nowdate.sql
#mysqldump -C --max_allowed_packet=512M  -uroot -pLtVhr8wJXHp2SvTC -h cthskylark.ctanibxecydf.ap-southeast-1.rds.amazonaws.com gg_etl_schema > gg_etl_schema_$nowdate.sql
mysqldump -C --max_allowed_packet=512M  -uroot -pLtVhr8wJXHp2SvTC -h apjprod-readreplica.ctanibxecydf.ap-southeast-1.rds.amazonaws.com keycloak_cluster > keycloak_cluster_$nowdate.sql
#mysqldump -C --max_allowed_packet=512M  -uroot -pLtVhr8wJXHp2SvTC -h cthskylark.ctanibxecydf.ap-southeast-1.rds.amazonaws.com kresna > kresna_$nowdate.sql
mysqldump -C --max_allowed_packet=512M  -uroot -pLtVhr8wJXHp2SvTC -h apjprod-readreplica.ctanibxecydf.ap-southeast-1.rds.amazonaws.com mdr_live > mdr_live_$nowdate.sql
#mysqldump -C --max_allowed_packet=512M  -uroot -pLtVhr8wJXHp2SvTC -h cthskylark.ctanibxecydf.ap-southeast-1.rds.amazonaws.com performax > performax_$nowdate.sql
mysqldump -C --max_allowed_packet=512M  -uroot -pLtVhr8wJXHp2SvTC -h apjprod-readreplica.ctanibxecydf.ap-southeast-1.rds.amazonaws.com sam_sek > sam_sek_$nowdate.sql
#mysqldump -C --max_allowed_packet=512M  -uroot -pLtVhr8wJXHp2SvTC -h cthskylark.ctanibxecydf.ap-southeast-1.rds.amazonaws.com sinarmas > sinarmas_$nowdate.sql

#mysqldump -C --max_allowed_packet=512M  -uroot -pLtVhr8wJXHp2SvTC -h cthskylark.ctanibxecydf.ap-southeast-1.rds.amazonaws.com sinarmas_multiartha > sinarmas_multiartha_$nowdate.sql

mysqldump -C --max_allowed_packet=512M  -uroot -pLtVhr8wJXHp2SvTC -h apjprod-readreplica.ctanibxecydf.ap-southeast-1.rds.amazonaws.com skylark_demo > skylark_demo_$nowdate.sql
mysqldump -C --max_allowed_packet=512M  -uroot -pLtVhr8wJXHp2SvTC -h apjprod-readreplica.ctanibxecydf.ap-southeast-1.rds.amazonaws.com skylark_mr_live > skylark_mr_live_$nowdate.sql

#mysqldump -C --max_allowed_packet=512M -uroot -pLtVhr8wJXHp2SvTC -h cthskylark.ctanibxecydf.ap-southeast-1.rds.amazonaws.com ppearl > ppearl_$nowdate.sql


mysqldump -C --max_allowed_packet=512M -h datawarehousekpisoft.ctanibxecydf.ap-southeast-1.rds.amazonaws.com -uadminin -pXHN6v8Cxdh generali_bi > generali_bi_$nowdate.sql


OUT=$?
if [ "$OUT" = "0" ] ; then
 bash /opt/scripts/teams-chat-post.sh https://outlook.office.com/webhook/659990b9-b909-4c5b-ac06-dd168977b423@4e7fc100-a3ca-4172-9394-29dbfec53920/IncomingWebhook/0c5c27b7c3514620bff6b9fab360c8bc/39c12b9f-469b-44b5-9484-16bdc90df3a8 "CTH-SKYLARK Database Backup" "#000000" "Status: SUCCESS"
else
bash /opt/scripts/teams-chat-post.sh https://outlook.office.com/webhook/659990b9-b909-4c5b-ac06-dd168977b423@4e7fc100-a3ca-4172-9394-29dbfec53920/IncomingWebhook/0c5c27b7c3514620bff6b9fab360c8bc/39c12b9f-469b-44b5-9484-16bdc90df3a8 "CTH-SKYLARK Database Backup" "#000000" "Status: FAILED"

fi




#compress all the sql files
gzip *.sql
cd ..
/usr/local/sbin/aws  s3 cp $nowdate s3://apjbackup/Prodmariadb/$year/$mondate/$todate --recursive



OUT=$?
if [ "$OUT" = "0" ] ; then
 bash /opt/scripts/teams-chat-post.sh https://outlook.office.com/webhook/659990b9-b909-4c5b-ac06-dd168977b423@4e7fc100-a3ca-4172-9394-29dbfec53920/IncomingWebhook/0c5c27b7c3514620bff6b9fab360c8bc/39c12b9f-469b-44b5-9484-16bdc90df3a8 "CTH-SKYLARK Database Backup Push to S3" "#000000" "Status: SUCCESS"
else
bash /opt/scripts/teams-chat-post.sh https://outlook.office.com/webhook/659990b9-b909-4c5b-ac06-dd168977b423@4e7fc100-a3ca-4172-9394-29dbfec53920/IncomingWebhook/0c5c27b7c3514620bff6b9fab360c8bc/39c12b9f-469b-44b5-9484-16bdc90df3a8 "CTH-SKYLARK Database Backup push to s3" "#000000" "Status: FAILED"

fi


echo $?
#Email Notification
if [ "$?" = "0" ]; then
        echo "CTH-SKYLARK Database Backup has been Done" | mailx -s "CTH-SKYLARK Database Backup has been done and sucessfully moved to S3 bucket" devops@kpisoft.com
else
         echo "CTH-SKYLARK Database Backup Failed. Please contact System Administrator" | mailx -s "CTH-SKYLARK Database Backup Failed and s3 movement has been failed, " devops@kpisoft.com
        exit 1
fi
