# Selenium Comparison

The goal of this project was to build a simple automated web project with Selenium in both R and Python to be able to compare the different interfaces. I have been using R for longer and wanted see how Python compared. Since Selenium is a Java appplication both languages offer interfaces to Selenium. R interfaces through the aptly named [`RSelenium` package](https://www.rdocumentation.org/packages/RSelenium/versions/1.7.7) while Python uses [`selenium`](https://pypi.org/project/selenium/).

The other requirement of the project was to create a clickable desktop interface to launch the scripts. I created `.bat` files to launch the respective scripts since I am using Windows.

## Approaches
The interface and code structure for the two languages are fairly similar as seen in the respective `main` files. Both languages create a webdriver then issue methods from that driver to find and click elements. Python has a slightly cleaner syntax for this operation. I did run into some issues with R when trying to use a Chrome driver that I resolved by switching to Firefox.

## Differences
The biggest difference is how the packages interface with the actual webdriver. Python had more complexity up front while R saved the complexity for the backend.

### R
Running RSelenium creates the webdriver but doesn't seem to have a native way to close the actual driver. This led to hanging connections where the Firefox window would get closed and I would be unable to rerun the script due to the open webdriver connection. Initially I was closing and reopening RStudio to solve this. I added non-R approach of:
```
system("taskkill /im java.exe /f", intern=FALSE, ignore.stdout=FALSE)
system("taskkill /im geckodriver.exe /f", intern=FALSE, ignore.stdout=FALSE)
```
where I kill both java and geckodriver at the end of the script. The trade off being RSelenium worked out of the box once the library was installed without any additional steps.

### Py
The webdriver with Python did not initially work for me, throwing the error *"Message: 'geckodriver' executable needs to be in PATH"*. I **duckduckgo'ed** this message and found I needed to [download the `geckodriver.exe`](https://github.com/mozilla/geckodriver/releases) and place this file in the home directory. I **did not commit** this file since this is probably a computer specific error. Once the exe was in the same folder as the script everything worked find and the script closes the port as expected. I did not mess with system environment variables as I don't use Selenium extensively.

## Conclusion
The two methods are similar enough for this project where I don't see a clear advantage. Whichever language someone is most comfortable is probably best choice. It was enjoyable to recreate a project across languages though.