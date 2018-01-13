package stepdefinition;

import cucumber.api.PendingException;
import cucumber.api.java.en.Given;

/**
 *
 * @author ISORTEGAH
 */
public class GoogleStepDefinition {

    @Given("^I am on google page$")
    public void i_am_on_google_page() throws Throwable {
        System.out.println("Pruebas");
        throw new PendingException();
    }
}
