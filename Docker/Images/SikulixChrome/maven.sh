#!/bin/bash
mvn verify -DENV_URL=http://google.com -Dcucumber.options="--tags @WebSikulix" -DUSER=p