package stepdefinition;

import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.Before;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;


/**
 *
 * @author ISORTEGAH
 */
public class Hooks {

    public static WebDriver driver;

    @Before
    public void initializeTest(){
        System.out.println("Al iniciar el escenario");
        System.out.println(System.getProperty("browserDefault"));
        System.out.println(System.getProperty("so"));
        System.out.println(System.getProperty("user.dir"));
        String browser = System.getProperty("browserDefault");
        if(browser.equals("chrome")){
            String srcDriver = 
                    System.getProperty("user.dir") 
                    + "//src//test//resources//common/chromedriver_"
                    + System.getProperty("so");
            System.setProperty("webdriver.chrome.driver",
					srcDriver);
            driver = new ChromeDriver();
        }
    }
 
    @After
    public void embedScreenshot(Scenario scenario) {
        System.out.println("Al terminar el escenario");
        driver.quit();
    }
}
