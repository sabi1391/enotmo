nowdate=$(date +"%Y%m%d%H%M")
dayago=`(date --date='5 days ago' '+%Y-%m-%d-%H')`

months=$(date +"%Y-%m")
days=$(date +"%d")
mondate=$(date +"%m")
daysago=`(date --date='1 days ago' '+%d')`
lastday=`(date -d '-1 day' '+%d')`

nowdate=$(date +"%Y%m%d")
dayago=`(date --date='2 days ago' '+%Y%m%d')`
todate=$(date +"%d")
mondate=$(date +"%m")
year=$(date +"%Y")

mkdir -p /opt/dbbackup/$year/$mondate/$days
cd /opt/dbbackup/$year/$mondate/$days
rm -rf /opt/dbbackup/$year/$mondate/$daysago
echo "mongo dump performing"

mongodump -h 172.31.17.230 --username adminUser --password Xps6U9QnMrUSFWkF --authenticationDatabase "admin" --db TomorrowCareer --out /opt/dbbackup/$year/$mondate/$days/
mongodump -h 172.31.17.230 --username adminUser --password Xps6U9QnMrUSFWkF --authenticationDatabase "admin" --db TomorrowCareer_apj --out /opt/dbbackup/$year/$mondate/$days/
mongodump -h 172.31.17.230 --username adminUser --password Xps6U9QnMrUSFWkF --authenticationDatabase "admin" --db careerhub --out /opt/dbbackup/$year/$mondate/$days/
#mongodump -h 172.31.17.230 --username adminUser --password Xps6U9QnMrUSFWkF --authenticationDatabase "admin" --db careertomorrow --out /opt/dbbackup/$year/$mondate/$days/
#mongodump -h 172.31.17.230 --username adminUser --password Xps6U9QnMrUSFWkF --authenticationDatabase "admin" --db coivd19sg_mongo --out /opt/dbbackup/$year/$mondate/$days/
#mongodump -h 172.31.17.230 --username adminUser --password Xps6U9QnMrUSFWkF --authenticationDatabase "admin" --db digitallive --out /opt/dbbackup/$year/$mondate/$days/
#mongodump -h 172.31.17.230 --username adminUser --password Xps6U9QnMrUSFWkF --authenticationDatabase "admin" --db klcoudsuite --out /opt/dbbackup/$year/$mondate/$days/
mongodump -h 172.31.17.230 --username adminUser --password Xps6U9QnMrUSFWkF --authenticationDatabase "admin" --db show --out /opt/dbbackup/$year/$mondate/$days/
mongodump -h 172.31.17.230 --username adminUser --password Xps6U9QnMrUSFWkF --authenticationDatabase "admin" -d smm_live_mongo --out /opt/dbbackup/$year/$mondate/$days/
mongodump -h 172.31.17.230 --username adminUser --password Xps6U9QnMrUSFWkF --authenticationDatabase "admin" --db local --out /opt/dbbackup/$year/$mondate/$days/
#mongodump -h 172.31.17.230 --username adminUser --password Xps6U9QnMrUSFWkF --authenticationDatabase "admin" --db TomorrowCareer_ct --out /opt/dbbackup/$year/$mondate/$days/
mongodump -h 172.31.17.230 --username adminUser --password Xps6U9QnMrUSFWkF --authenticationDatabase "admin" --db TomorrowCareer_show --out /opt/dbbackup/$year/$mondate/$days/
#mongodump -h 172.31.17.230 --username adminUser --password Xps6U9QnMrUSFWkF --authenticationDatabase "admin" --db ppearl --out /opt/dbbackup/$year/$mondate/$days/
#mongodump -h 172.31.17.230 --username adminUser --password Xps6U9QnMrUSFWkF --authenticationDatabase "admin" --db TomorrowCareer_ppearl --out /opt/dbbackup/$year/$mondate/$days/
mongodump -h 172.31.17.230 --username adminUser --password Xps6U9QnMrUSFWkF --authenticationDatabase "admin" --db drl_mongo --out /opt/dbbackup/$year/$mondate/$days/
mongodump -h 172.31.29.155 --username adminUser --password W2eJqp7ae2kG5RgW --authenticationDatabase "admin" --db ctuat_careermodule  --out /opt/dbbackup/$year/$mondate/$days/
mongodump -h 172.31.30.217 --username adminUser --password wfKeN7FVh9QKPPkR --authenticationDatabase "admin" --db legato_mongo  --out /opt/dbbackup/$year/$mondate/$days/
mongodump -h 172.31.30.217 --username adminUser --password wfKeN7FVh9QKPPkR --authenticationDatabase "admin" --db legato_ct  --out /opt/dbbackup/$year/$mondate/$days/




zip -r TomorrowCareer-$nowdate.zip TomorrowCareer
zip -r TomorrowCareer_apj-$nowdate.zip TomorrowCareer_apj
zip -r careerhub-$nowdate.zip careerhub
#zip -r careertomorrow-$nowdate.zip careertomorrow
#zip -r coivd19sg_mongo-$nowdate.zip coivd19sg_mongo
#zip -r digitallive-$nowdate.zip digitallive
#zip -r klcoudsuite-$nowdate.zip klcoudsuite
zip -r show-$nowdate.zip show
#zip -r smm_live_mongo-$nowdate.zip smm_live_mongo
zip -r local-$nowdate.zip local
#zip -r TomorrowCareer_ct-$nowdate.zip TomorrowCareer_ct
zip -r TomorrowCareer_show-$nowdate.zip TomorrowCareer_show
#zip -r ppearl-$nowdate.zip ppearl
#zip -r TomorrowCareer_ppearl-$nowdate.zip TomorrowCareer_ppearl
zip -r drl_mongo-$nowdate.zip drl_mongo
zip -r ctuat_careermodule-$nowdate.zip ctuat_careermodule
zip -r legato_ct-$nowdate.zip  legato_ct
zip -r legato_mongo-$nowdate.zip legato_mongo
tar -czvf smm_live_mongo-$nowdate.tar.gz smm_live_mongo

rm -rf TomorrowCareer smm_live_mongo TomorrowCareer_apj careerhub  show  local TomorrowCareer_show drl_mongo ctuat_careermodule  legato_mongo legato_ct

/opt/dbbackup/$year/$mondate/$days

#/usr/local/sbin/aws s3 cp $days s3://apjbackup/Prodmongo/$year/$mondate/$days/ --recursive
/usr/local/sbin/aws s3 cp smm_live_mongo-$nowdate.tar.gz s3://apjbackup/Prodmongo/$year/$mondate/$days/smm_live_mongo-$nowdate.tar.gz
#/usr/local/bin/aws s3 cp /opt/dbbackup/$year/$mondate/$days/smm_live_mongo-$nowdate.gz s3://apjbackup/Prodmongo/$year/$mondate/$days/
/usr/local/sbin/aws s3 cp TomorrowCareer_show-$nowdate.zip s3://apjbackup/Prodmongo/$year/$mondate/$days/TomorrowCareer_show-$nowdate.zip
/usr/local/sbin/aws s3 cp drl_mongo-$nowdate.zip s3://apjbackup/Prodmongo/$year/$mondate/$days/drl_mongo-$nowdate.zip
/usr/local/sbin/aws s3 cp legato_ct-$nowdate.zip s3://apjbackup/Prodmongo/$year/$mondate/$days/legato_ct-$nowdate.zip
/usr/local/sbin/aws s3 cp legato_mongo-$nowdate.zip s3://apjbackup/Prodmongo/$year/$mondate/$days/legato_mongo-$nowdate.zip
/usr/local/sbin/aws s3 cp local-$nowdate.zip s3://apjbackup/Prodmongo/$year/$mondate/$days/local-$nowdate.zip
/usr/local/sbin/aws s3 cp show-$nowdate.zip s3://apjbackup/Prodmongo/$year/$mondate/$days/show-$nowdate.zip
/usr/local/sbin/aws s3 cp careerhub-$nowdate.zip s3://apjbackup/Prodmongo/$year/$mondate/$days/careerhub-$nowdate.zip
/usr/local/sbin/aws s3 cp TomorrowCareer_apj-$nowdate.zip s3://apjbackup/Prodmongo/$year/$mondate/$days/TomorrowCareer_apj-$nowdate.zip
/usr/local/sbin/aws s3 cp TomorrowCareer-$nowdate.zip s3://apjbackup/Prodmongo/$year/$mondate/$days/TomorrowCareer-$nowdate.zip
/usr/local/sbin/aws s3 cp ctuat_careermodule-$nowdate.zip s3://apjbackup/uatmongodb/$year/$mondate/$days/ctuat_careermodule-$nowdate.zip

rm -rf $daysago


if [ "$?" = "0" ]; then
        echo "APJ SG Mongo Database Backup Process was Successful." | mailx -s "APJ SG Database Backup Process was Successful" devops@kpisoft.com
else
         echo "APJ SG Mongo Database Backup Process was Failed. Please contact System Administrator" | mailx -s "APJ SG Database Backup Process was Failed " devops@kpisoft.com
        exit 1
fi
