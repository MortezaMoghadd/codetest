
dfTEST = data.frame(user = c("1", "1", "1", "2", "2", "2", "3", "3", "3", "1", "1", "1"), 
                 date = c("2016-04-10","2016-04-10","2016-04-10","2016-04-10","2016-04-10","2016-04-10","2016-04-11","2016-04-11","2016-04-11", "2016-04-12","2016-04-12","2016-04-12"),
                 eventlabel = c("a", "start", "c", "a", "b", "c", "a", "start", "e", "a", "b", "c"))
library(lubridate)
dfTEST$date <- ymd(as.character(dfTEST$date))


##########   dplyr code that is not working for me:

dfTEST %>%
  group_by(user, date) %>%
  mutate(newLabel2 = eventlabel[which(eventlabel == "start")])


____________________________________________________________________
############  The other code that is doing half of what I need:

library(data.table)
setDT(dfTEST)[, newLabel2 := eventlabel[which(eventlabel == "start")], by = date]


# I tried to group date and user column but it is not working as well
setDT(dfTEST)[, newLabel2 := eventlabel[eventlabel == "start"], by = .(user,date)]
