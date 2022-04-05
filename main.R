suppressWarnings(library(RSelenium))
library(crayon)


warning(crayon::bold(crayon::green("Weather app will be open for 45 seconds")))


# Create client and driver
rD <- rsDriver(browser = "firefox",
               port = 4545L,
               verbose = F)

remDr <- rD[["client"]]


remDr$navigate("https://www.wunderground.com/wundermap?lat=45.52&lon=-122.68&zoom=8&radar=1&wxstn=0")
remDr$maxWindowSize()

# find settings tab
el <- remDr$findElement(using = "css selector", value = ".tab-buttons > ul:nth-child(1) > li:nth-child(4) > span:nth-child(2)")
el$clickElement()

# privacy pop up
el <- remDr$findElement(using = "css selector", value = ".close")
el$clickElement()

# parent div to selector button
el <- remDr$findElement(using = "css selector", value = 'div.active:nth-child(4) > map-settings:nth-child(1) > div:nth-child(1) > div:nth-child(3)')
el$clickElement()

# dark map options
el <- remDr$findElement(using = "xpath", value = '/html/body/app-root/app-wundermap/no-column-layout/wu-header/sidenav/mat-sidenav-container/mat-sidenav-content/div/div/section/div/div/lib-wundermap-map-view/div/lib-wm-sidebar/div/div[2]/div/div[4]/map-settings/div/div[3]/div/select/option[2]')
el$clickElement()

# close settings tab
el <- remDr$findElement(using = "css selector", value = ".tab-buttons > ul:nth-child(1) > li:nth-child(4) > span:nth-child(2)")
el$clickElement()


# Sleep the system for 45 seconds and then close all connections
Sys.sleep(45)

remDr$close()
rD[["server"]]$stop()

system("taskkill /im java.exe /f", intern=FALSE, ignore.stdout=FALSE)
system("taskkill /im geckodriver.exe /f", intern=FALSE, ignore.stdout=FALSE)
