package com.isortegah.poc_sikulix;


import cucumber.api.CucumberOptions;
import cucumber.api.testng.AbstractTestNGCucumberTests;

/**
 *
 * @author ISORTEGAH
 */
@CucumberOptions(
        features = "src/test/resources/features" ,
        glue = {"stepdefinition"} ,
        tags = {"@SearchGoogle"} ,
        plugin = {
                "pretty",
                "html:target/cucumber-reports/cucumber-pretty",
                "json:target/cucumber-reports/CucumberTestReport.json",
                "rerun:target/cucumber-reports/rerun.txt"
        }
)
public class TestRunner extends AbstractTestNGCucumberTests {

}
