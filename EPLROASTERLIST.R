#DEFINING THE R LIBRARIES TO RUN THIS SCRIPT
library(polite)
library(tidyverse)
library(rvest)

#SCRAPE INSTRUCTIONS TO SCRAPE ALL THE TEAMS CURRENTLY COMPETING IN THE ENGLISH PREMIER LEAGUE 2023/2024 SEASON

#THE DETAILS ARE SCRAPED BASED ON THE HTML PAGE DOM DETAILS AND CLEANED UP IN TO A DATAFRAME.

print("SCRAPING DETAILS FOR THE CHELSEA SQUAD LIST...")

ChelseaUrl <- 'https://en.wikipedia.org/wiki/Chelsea_F.C.'
session = bow(user_agent = "Chelsea-Scrape", ChelseaUrl)
ChelseaTable <- scrape(session) %>% html_nodes("table:nth-child(142)") %>% html_table()
ChelseaTable <- as.data.frame(ChelseaTable)
ChelseaTable <- ChelseaTable[-c(1,18),-c(1)] %>% select(c(1:3))
names(ChelseaTable)[1] <- "Position"
names(ChelseaTable)[2] <- "Nation"
names(ChelseaTable)[3] <- "PlayerName"
ChelseaTable <- ChelseaTable[-c(1),]
ChelseaTable$Team <- "Chelsea"

ArsenalUrl <- 'https://en.wikipedia.org/wiki/Arsenal_F.C.'
session = bow(user_agent = "arsenal-scrape", ArsenalUrl)
ArsenalTable <- scrape(session) %>% html_nodes("table:nth-child(133)") %>% html_table()
ArsenalTable <- as.data.frame(ArsenalTable)
ArsenalTable <- ArsenalTable[-c(1,16),-c(1)] %>% select(c(1:3))
names(ArsenalTable)[1] <- "Position"
names(ArsenalTable)[2] <- "Nation"
names(ArsenalTable)[3] <- "PlayerName"
ArsenalTable <- ArsenalTable[-c(1),]
ArsenalTable$Team <- "Arsenal"

LiverpoolUrl <- 'https://en.wikipedia.org/wiki/Liverpool_F.C.?wprov=srpw1_0'
session = bow(user_agent = "Liverpool-Scrape", LiverpoolUrl)
LiverpoolTable <- scrape(session) %>% html_nodes("table:nth-child(83)") %>% html_table()

LiverpoolTable <- as.data.frame(LiverpoolTable)
LiverpoolTable <- LiverpoolTable[-c(1,17),-c(1)] %>% select(c(1:3))
names(LiverpoolTable)[1] <- "Position"
names(LiverpoolTable)[2] <- "Nation"
names(LiverpoolTable)[3] <- "PlayerName"
LiverpoolTable <- LiverpoolTable[-c(1),]
LiverpoolTable$Team <- "Liverpool"

ManchesterCityUrl <- 'https://en.wikipedia.org/wiki/Manchester_City_F.C.'
session = bow(user_agent = "ManchesterCity-Scrape", ManchesterCityUrl)
ManchesterCityTable <- scrape(session) %>% html_nodes("table:nth-child(70)") %>% html_table()

ManchesterCityTable <- as.data.frame(ManchesterCityTable)
ManchesterCityTable <- ManchesterCityTable[-c(1,15),-c(1)] %>% select(c(1:3))
names(ManchesterCityTable)[1] <- "Position"
names(ManchesterCityTable)[2] <- "Nation"
names(ManchesterCityTable)[3] <- "PlayerName"
ManchesterCityTable <- ManchesterCityTable[-c(1),]
ManchesterCityTable$Team <- "ManchesterCity"

ManchesterUnitedUrl <- 'https://en.wikipedia.org/wiki/Manchester_United_F.C.'
session = bow(user_agent = "ManchesterUnited-Scrape", ManchesterUnitedUrl)
ManchesterUnitedTable <- scrape(session) %>% html_nodes("table:nth-child(136)") %>% html_table()

ManchesterUnitedTable <- as.data.frame(ManchesterUnitedTable)
ManchesterUnitedTable <- ManchesterUnitedTable[-c(1,19),-c(1)] %>% select(c(1:3))
names(ManchesterUnitedTable)[1] <- "Position"
names(ManchesterUnitedTable)[2] <- "Nation"
names(ManchesterUnitedTable)[3] <- "PlayerName"
ManchesterUnitedTable <- ManchesterUnitedTable[-c(1),]
ManchesterUnitedTable$Team <- "ManchesterUnited"


EvertonUrl <- 'https://en.wikipedia.org/wiki/Everton_F.C.'
session = bow(user_agent = "Everton-Scrape", EvertonUrl)
EvertonTable <- scrape(session) %>% html_nodes("table:nth-child(89)") %>% html_table()

EvertonTable <- as.data.frame(EvertonTable)
EvertonTable <- EvertonTable[-c(1,16),-c(1)] %>% select(c(1:3))
names(EvertonTable)[1] <- "Position"
names(EvertonTable)[2] <- "Nation"
names(EvertonTable)[3] <- "PlayerName"
EvertonTable <- EvertonTable[-c(1),]
EvertonTable$Team <- "Everton"


BrightonUrl <- 'https://en.wikipedia.org/wiki/Brighton_%26_Hove_Albion_F.C.'
session = bow(user_agent = "Brighton-Scrape", BrightonUrl)
BrightonTable <- scrape(session) %>% html_nodes("table:nth-child(64)") %>% html_table()

BrightonTable <- as.data.frame(BrightonTable)
BrightonTable <- BrightonTable[-c(1,16),-c(1)] %>% select(c(1:3))
names(BrightonTable)[1] <- "Position"
names(BrightonTable)[2] <- "Nation"
names(BrightonTable)[3] <- "PlayerName"
BrightonTable <- BrightonTable[-c(1),]
BrightonTable$Team <- "Brighton"


BrentfordUrl <- 'https://en.wikipedia.org/wiki/Brentford_F.C.'
session = bow(user_agent = "Brentford-Scrape", BrentfordUrl)
BrentfordTable <- scrape(session) %>% html_nodes("table:nth-child(50)") %>% html_table()

BrentfordTable <- as.data.frame(BrentfordTable)
BrentfordTable <- BrentfordTable[-c(1,17),-c(1)] %>% select(c(1:3))
names(BrentfordTable)[1] <- "Position"
names(BrentfordTable)[2] <- "Nation"
names(BrentfordTable)[3] <- "PlayerName"
BrentfordTable <- BrentfordTable[-c(1),]
BrentfordTable$Team <- "Brentford"

TottenhamHotspurUrl <- 'https://en.wikipedia.org/wiki/Tottenham_Hotspur_F.C.'
session = bow(user_agent = "TottenhamHotspur-Scrape", TottenhamHotspurUrl)
TottenhamHotspurTable <- scrape(session) %>% html_nodes("table:nth-child(144)") %>% html_table()

TottenhamHotspurTable <- as.data.frame(TottenhamHotspurTable)
TottenhamHotspurTable <- TottenhamHotspurTable[-c(1,18),-c(1)] %>% select(c(1:3))
names(TottenhamHotspurTable)[1] <- "Position"
names(TottenhamHotspurTable)[2] <- "Nation"
names(TottenhamHotspurTable)[3] <- "PlayerName"
TottenhamHotspurTable <- TottenhamHotspurTable[-c(1),]
TottenhamHotspurTable$Team <- "TottenhamHotspur"


WesthamUrl <- 'https://en.wikipedia.org/wiki/West_Ham_United_F.C.'
WesthamTable <- scrape(session) %>% html_nodes("table:nth-child(155)") %>% html_table()
session = bow(user_agent = "Westham-Scrape", WesthamUrl)
WesthamTable <- as.data.frame(WesthamTable)
WesthamTable <- WesthamTable[-c(1,15),-c(1)] %>% select(c(1:3))
names(WesthamTable)[1] <- "Position"
names(WesthamTable)[2] <- "Nation"
names(WesthamTable)[3] <- "PlayerName"
WesthamTable <- WesthamTable[-c(1),]
WesthamTable$Team <- "WestHam"


AstonVillaUrl <- 'https://en.wikipedia.org/wiki/Aston_Villa_F.C.'
session = bow(user_agent = "AstonVilla-Scrape", AstonVillaUrl)
AstonVillaTable <- scrape(session) %>% html_nodes("table:nth-child(141)") %>% html_table()

AstonVillaTable <- as.data.frame(AstonVillaTable)
AstonVillaTable <- AstonVillaTable[-c(1,16),-c(1)] %>% select(c(1:3))
names(AstonVillaTable)[1] <- "Position"
names(AstonVillaTable)[2] <- "Nation"
names(AstonVillaTable)[3] <- "PlayerName"
AstonVillaTable <- AstonVillaTable[-c(1),]
AstonVillaTable$Team <- "AstonVilla"

WolverhamptonWanderersUrl <- 'https://en.wikipedia.org/wiki/Wolverhampton_Wanderers_F.C.'
session = bow(user_agent = "WolverhamptonWanderers-Scrape", WolverhamptonWanderersUrl)
WolverhamptonWanderersTable <- scrape(session) %>% html_nodes("table:nth-child(80)") %>% html_table()

WolverhamptonWanderersTable <- as.data.frame(WolverhamptonWanderersTable)
WolverhamptonWanderersTable <- WolverhamptonWanderersTable[-c(1,16),-c(1)] %>% select(c(1:3))
names(WolverhamptonWanderersTable)[1] <- "Position"
names(WolverhamptonWanderersTable)[2] <- "Nation"
names(WolverhamptonWanderersTable)[3] <- "PlayerName"
WolverhamptonWanderersTable <- WolverhamptonWanderersTable[-c(1),]
WolverhamptonWanderersTable$Team <- "WolverhamptonWanderers"



BurnleyUrl <- 'https://en.wikipedia.org/wiki/Burnley_F.C.'
session = bow(user_agent = "Burnley-Scrape", BurnleyUrl)
BurnleyTable <- scrape(session) %>% html_nodes("table:nth-child(75)") %>% html_table()

BurnleyTable <- as.data.frame(BurnleyTable)
BurnleyTable <- BurnleyTable[-c(1,20),-c(1)] %>% select(c(1:3))
names(BurnleyTable)[1] <- "Position"
names(BurnleyTable)[2] <- "Nation"
names(BurnleyTable)[3] <- "PlayerName"
BurnleyTable <- BurnleyTable[-c(1),]
BurnleyTable$Team <- "Burnley"


CrystalPalaceUrl <- 'https://en.wikipedia.org/wiki/Crystal_Palace_F.C.'
session = bow(user_agent = "CrystalPalace-Scrape", CrystalPalaceUrl)
CrystalPalaceTable <- scrape(session) %>% html_nodes("table:nth-child(112)") %>% html_table()

CrystalPalaceTable <- as.data.frame(CrystalPalaceTable)
CrystalPalaceTable <- CrystalPalaceTable[-c(1,17),-c(1)] %>% select(c(1:3))
names(CrystalPalaceTable)[1] <- "Position"
names(CrystalPalaceTable)[2] <- "Nation"
names(CrystalPalaceTable)[3] <- "PlayerName"
CrystalPalaceTable <- CrystalPalaceTable[-c(1),]
CrystalPalaceTable$Team <- "CrystalPalace"


FulhamUrl <- 'https://en.wikipedia.org/wiki/Fulham_F.C.'
session = bow(user_agent = "fulham-test-intern", FulhamUrl)
FulhamTable <- scrape(session) %>% html_nodes("table:nth-child(113)") %>% html_table()

FulhamTable <- as.data.frame(FulhamTable)
FulhamTable <- FulhamTable[-c(1),-c(1)] %>% select(c(1:3))
names(FulhamTable)[1] <- "Position"
names(FulhamTable)[2] <- "Nation"
names(FulhamTable)[3] <- "PlayerName"
FulhamTable <- FulhamTable[-c(1),]
FulhamTable$Team <- "Fulham"


LutonUrl <- 'https://en.wikipedia.org/wiki/Luton_F.C.'

session = bow(user_agent = "Luton-test-intern", LutonUrl)
LutonTable <- scrape(session) %>% html_nodes("table:nth-child(87)") %>% html_table()

LutonTable <- as.data.frame(LutonTable)
LutonTable <- LutonTable[-c(1),-c(1)] %>% select(c(1:3))
names(LutonTable)[1] <- "Position"
names(LutonTable)[2] <- "Nation"
names(LutonTable)[3] <- "PlayerName"
LutonTable <- LutonTable[-c(1),]
LutonTable$Team <- "Luton"

SheffieldUnitedUrl <- 'https://en.wikipedia.org/wiki/Sheffield_United_F.C.'
session = bow(user_agent = "SheffieldUnited-test-intern", SheffieldUnitedUrl)
SheffieldUnitedTable <- scrape(session) %>% html_nodes("table:nth-child(90)") %>% html_table()

SheffieldUnitedTable <- as.data.frame(SheffieldUnitedTable)
SheffieldUnitedTable <- SheffieldUnitedTable[-c(1),-c(1)] %>% select(c(1:3))
names(SheffieldUnitedTable)[1] <- "Position"
names(SheffieldUnitedTable)[2] <- "Nation"
names(SheffieldUnitedTable)[3] <- "PlayerName"
SheffieldUnitedTable <- SheffieldUnitedTable[-c(1),]
SheffieldUnitedTable$Team <- "SheffieldUnited"

BournemouthUrl <- 'https://en.wikipedia.org/wiki/AFC_Bournemouth'
session = bow(user_agent = "Bournemouth-test-intern", BournemouthUrl)
BournemouthTable <- scrape(session) %>% html_nodes("table:nth-child(68)") %>% html_table()

BournemouthTable <- as.data.frame(BournemouthTable)
BournemouthTable <- BournemouthTable[-c(1),-c(1)] %>% select(c(1:3))
names(BournemouthTable)[1] <- "Position"
names(BournemouthTable)[2] <- "Nation"
names(BournemouthTable)[3] <- "PlayerName"
BournemouthTable <- BournemouthTable[-c(1),]
BournemouthTable$Team <- "Bournemouth"

NewscastleUnitedUrl <- 'https://en.wikipedia.org/wiki/Newcastle_United_F.C.'
session = bow(user_agent = "NewscastleUnited-test-intern", NewscastleUnitedUrl)
NewscastleUnitedTable <- scrape(session) %>% html_nodes("table:nth-child(130)") %>% html_table()
NewscastleUnitedTable <- as.data.frame(NewscastleUnitedTable)
NewscastleUnitedTable <- NewscastleUnitedTable[-c(1),-c(1)] %>% select(c(1:3))
names(NewscastleUnitedTable)[1] <- "Position"
names(NewscastleUnitedTable)[2] <- "Nation"
names(NewscastleUnitedTable)[3] <- "PlayerName"
NewscastleUnitedTable <- NewscastleUnitedTable[-c(1),]
NewscastleUnitedTable$Team <- "NewscastleUnited"

NottinghamforestUrl <- 'https://en.wikipedia.org/wiki/Nottingham_Forest_F.C.'
session = bow(user_agent = "Nottinghamforest-test-intern", NottinghamforestUrl)
NottinghamforestTable <- scrape(session) %>% html_nodes("table:nth-child(152)") %>% html_table()
NottinghamforestTable <- as.data.frame(NottinghamforestTable)
NottinghamforestTable <- NottinghamforestTable[-c(1)] %>% select(c(1:3))
names(NottinghamforestTable)[1] <- "Position"
names(NottinghamforestTable)[2] <- "Nation"
names(NottinghamforestTable)[3] <- "PlayerName"
NottinghamforestTable <- NottinghamforestTable[-c(1),]
NottinghamforestTable$Team <- "Nottinghamforest"

print("COMBINING THE VARIOUS TEAMS DATAFRAMES IN TO A ROW BIND")

EPLSQUADLIST <- rbind(ArsenalTable, ChelseaTable, LiverpoolTable, ManchesterCityTable, ManchesterUnitedTable, EvertonTable, BrightonTable, BrentfordTable, TottenhamHotspurTable, WesthamTable, AstonVillaTable, WolverhamptonWanderersTable, BurnleyTable, CrystalPalaceTable, FulhamTable, LutonTable, SheffieldUnitedTable, BournemouthTable, NewscastleUnitedTable, NottinghamforestTable)

# SAVING THE EQLSQUADLIST TO A CSV FILE

write.csv(EPLSQUADLIST, "EPLSQUADLIST.csv")

# AT THIS STAGE USE YOUR FAVORITE TOOL TO CONVERT THIS DATAFRAME TO A JSON FORMAT AND DEFINE IT IN THE DJANGO NINJA PORTION OF THIS REPO.

# I USED THIS https://www.convertcsv.com/csv-to-json.htm but for a Production environment, Python would be a better choice.

print("SCRIPT RUN COMPLETE!")



