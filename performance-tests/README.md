Dependencies
1. Docker
2. Gatling 


### Running Gatling tests in Gatling container

1. Start docker daemon 
2. Run below to build your local docker container from where dockerfile exists.  If 'reformgatling' image exists in your local you can skip this step

    ```
    > docker build -t hwfgatling:local  .

    ```


3. Run below to run gatling scripts against docker images
    ```
   > docker run --net=host --rm -it  -e E2E_FRONTEND_URL -e USE_IDAM -v `pwd`/src/test/resources:/opt/gatling/conf -v `pwd`/src/test/scala/simulations:/opt/gatling/user-files/simulations -v `pwd`/results:/opt/gatling/results -v `pwd`/data:/opt/gatling/data reformgatling:local -s simulations.HelpWithFeesPerformance

   or

   > Execute ./runloadtest.sh

   ```
    
4. Reports folder will be created once tests successfully ran


### Running Gatling tests using maven without container

1. Get latest from this repo.

2. Execute below command to run test

    ```
      > mvn gatling:execute

      or for single simulation execution

      > mvn gatling:execute -Dgatling.simulationClass=HelpWithFeesPerformance

    ```