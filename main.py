from selenium import webdriver
import time
from rich import print

print("[bold green] Weather app will be open for 45 seconds")

driver = webdriver.Firefox()

driver.get(
    "https://www.wunderground.com/wundermap?lat=45.52&lon=-122.68&zoom=8&radar=1&wxstn=0"
)
driver.maximize_window()

# find settings tab
el = driver.find_element(
    by="css selector",
    value=".tab-buttons > ul:nth-child(1) > li:nth-child(4) > span:nth-child(2)",
)
el.click()

# privacy pop up
el = driver.find_element(by="css selector", value=".close")
el.click()

# parent div to selector button
el = driver.find_element(
    by="css selector",
    value="div.active:nth-child(4) > map-settings:nth-child(1) > div:nth-child(1) > div:nth-child(3)",
)
el.click()

# dark map options
el = driver.find_element(
    by="xpath",
    value="/html/body/app-root/app-wundermap/no-column-layout/wu-header/sidenav/mat-sidenav-container/mat-sidenav-content/div/div/section/div/div/lib-wundermap-map-view/div/lib-wm-sidebar/div/div[2]/div/div[4]/map-settings/div/div[3]/div/select/option[2]",
)
el.click()

# close settings tab
el = driver.find_element(
    by="css selector",
    value=".tab-buttons > ul:nth-child(1) > li:nth-child(4) > span:nth-child(2)",
)
el.click()

# Sleep for 45 seconds
time.sleep(45)

# shutdown program
driver.close()
