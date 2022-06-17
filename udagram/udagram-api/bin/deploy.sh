echo $EP_APP
echo $EP_ENV
cd wwww
printenv > .env
eb init --region $AWS_REGION $EP_APP
eb deploy $EB_ENV
