package stepdefinition;

import cucumber.api.PendingException;
import cucumber.api.java.en.Given;
import org.openqa.selenium.WebDriver;

/**
 *
 * @author ISORTEGAH
 */
public class GoogleStepDefinition {

    WebDriver driver = null;
    @Given("^I am on google page$")
    public void i_am_on_google_page() throws Throwable {
        driver = Hooks.driver;
        driver.get("http://google.com");
        //throw new PendingException();
    }
}
