# POC SIKULIX

Esta prueba de concepto, se limita a lo mínimo necesario para poder comenzar a crear pruebas automatizadas con [Sikulix](http://sikulix.com/). 

El poc esta integrado por [TestNG](https://testng.org/doc/index.html) como framework de ejecución de pruebas con [Cucumber](https://cucumber.io/) que es utilizado para pruebas de aceptación con un enfoque BDD y [MAVEN](https://maven.apache.org/) como administración de dependencias. 

Hay dos formas de ejecutar el POC, directamente con el comando `mvn test` o vía el contenedor Docker.

### Comando maven

```bash
mvn test -DbrowserDefault=chrome -Dso=linux
 ```
Arrojando lo siguiente:

```bash
[INFO] Scanning for projects...[INFO][INFO] ------------------------------------------------------------------------[INFO] Building poc_sikulix 1.0-SNAPSHOT[INFO] ------------------------------------------------------------------------
[INFO]
[INFO] --- maven-resources-plugin:2.6:resources (default-resources) @ poc_sikulix ---
[INFO] Using 'UTF-8' encoding to copy filtered resources.
[INFO] skip non existing resourceDirectory /home/isortega/GitHub/isortegah/poc_sikulix/src/main/resources
[INFO]
[INFO] --- maven-compiler-plugin:3.6.1:compile (default-compile) @ poc_sikulix ---
[INFO] Nothing to compile - all classes are up to date
[INFO]
[INFO] --- maven-resources-plugin:2.6:testResources (default-testResources) @ poc_sikulix ---
[INFO] Using 'UTF-8' encoding to copy filtered resources.
[INFO] Copying 5 resources
[INFO]
[INFO] --- maven-compiler-plugin:3.6.1:testCompile (default-testCompile) @ poc_sikulix ---
[INFO] Nothing to compile - all classes are up to date
[INFO]
[INFO] --- maven-surefire-plugin:2.20.1:test (default-test) @ poc_sikulix ---
[INFO]
[INFO] -------------------------------------------------------
[INFO]  T E S T S
[INFO] -------------------------------------------------------
[INFO] Running TestSuite
Feature: To search cucumber in google
Al iniciar el escenario
chrome
linux
/home/isortega/GitHub/isortegah/poc_sikulix
Starting ChromeDriver 2.35.528139 (47ead77cb35ad2a9a83248b292151462a66cd881) on port 20195
Only local connections are allowed.
Jun 28, 2018 8:17:51 PM org.openqa.selenium.remote.ProtocolHandshake createSession
INFO: Detected dialect: OSS
Al terminar el escenario

  @SearchGoogle
  Scenario: Cucumber Google   # google.feature:3
    Given I am on google page # GoogleStepDefinition.i_am_on_google_page()

1 Scenarios (1 passed)
1 Steps (1 passed)
0m3.280s

[INFO] Tests run: 1, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 3.806 s - in TestSuite
[INFO]
[INFO] Results:
[INFO]
[INFO] Tests run: 1, Failures: 0, Errors: 0, Skipped: 0
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 10.707 s
[INFO] Finished at: 2018-06-28T20:17:52-05:00
[INFO] Final Memory: 51M/1404M
[INFO] ------------------------------------------------------------------------
```

![Alt Text](/imgs/poc_sikulix.gif)
### Docker

Al momento para este POC utilice una imagen **Docker** `isortegah/sikulix_ubuntu_chrome` que cree basandome en las imagenes de **Selenium**, en especial esta imagen esta creada para solo ejecutar pruebas con el navegador chrome. Pueden ver otras imagenes que he construido en mi repo [Projects and Docker](https://github.com/isortegah/projects-and-docker).

* Construcción de imagen
```bash
docker build -t <nombre imagen> .
```
* Ejecución de imagen
```bash 
docker run -it -p 5900:5900 <nombre imagen>
```
Nota: se coloca el puerto 5900 para acceder al contenedor si deseamos ver la ejecución vía **VNC**. Yo utilizo en Debian **xvncviewer**.
```bash
xvncviewer 127.0.0.1
```
La contraseña es **secret**.

El resultado que arroja la ejecución del contenedor es igual a la de la ejecución con el comando maven directo.

![Alt Text](/imgs/poc_docker.gif)