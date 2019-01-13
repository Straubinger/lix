# Load packages and dataset ----
library(tidyverse)
library(RCurl)
library(hrbrthemes)

lix <- read.csv(text=getURL("https://raw.githubusercontent.com/Straubinger/lix/master/lix.csv"))

# Convert data from wide to long format ----
lix <- gather(lix, type, lix, openparl_dk:xmas_royal_se, factor_key = TRUE)

# Opening of Parliament Speeches delivered by Prime Ministers ----
p1 <- ggplot(subset(lix, type %in% c("openparl_dk", "openparl_no", "openparl_se")), 
       aes(x = year, y = lix, colour = type)) +
  geom_point() +
  geom_smooth(se = FALSE) +
  coord_cartesian(ylim=c(25, 65)) + 
  scale_y_continuous(breaks=seq(25, 65, 10)) +
  theme_ipsum_rc() +
  theme(legend.title = element_blank(),
        axis.title.x = element_blank(),
        legend.position = "bottom") +
  scale_colour_manual(breaks = c("openparl_dk", "openparl_se", "openparl_no"),
                      values = c("red", "blue", "forestgreen"),
                      labels = c("Denmark", "Sweden", "Norway")) +
  labs(y = "LIX", 
       title ="LIX of speeches delivered by Prime Ministers at opening of parliament", 
       caption = "Data: github.com/straubinger/lix")

png("lix_openparl.png", width = 1344, height = 960, units = "px", res = 150)
plot(p1)
dev.off()


# Royal New Year Addresses and Christmas Addresses 
p2 <- ggplot(subset(lix, type %in% c("newyear_royal_dk", "xmas_royal_se", "newyear_royal_no")), 
       aes(x = year, y = lix, colour = type)) +
  geom_point() +
  geom_smooth(se = FALSE) +
  coord_cartesian(ylim=c(25, 65)) + 
  scale_y_continuous(breaks=seq(25, 65, 10)) +
  theme_ipsum_rc() +
  theme(legend.position = "bottom", 
        legend.title = element_blank(),
        axis.title.x = element_blank()) +
  scale_colour_manual(breaks = c("newyear_royal_dk", "xmas_royal_se", "newyear_royal_no"),
                      values = c("red", "blue", "forestgreen"),
                      labels = c("Denmark (New Year)", "Sweden (Christmas)", "Norway (New Year)")) +
  labs(y = "LIX", 
       title ="LIX of Royal New Year and Christmas Addresses", 
       caption = "Data: github.com/straubinger/lix")

png("lix_newyear_royal.png", width = 1344, height = 960, units = "px", res = 150)
plot(p2)
dev.off()

# New Year Addresses delivered by Prime Ministers
p3 <- ggplot(subset(lix, type %in% c("newyear_pm_dk", "newyear_pm_no")), 
       aes(x = year, y = lix, colour = type)) +
  geom_point() +
  geom_smooth(se = FALSE) +
  coord_cartesian(ylim=c(25, 45)) + 
  scale_y_continuous(breaks=seq(25, 45, 10)) +
  theme_ipsum_rc() +
  theme(legend.position = "bottom", 
        legend.title = element_blank(),
        axis.title.x = element_blank()) +
  scale_colour_manual(breaks = c("newyear_pm_dk", "newyear_pm_no"),
                      values = c("Red", "forestgreen"),
                      labels = c("Denmark", "Norway")) +
  xlim(1985, NA) +
  labs(x = "",
       y = "Lixtal", 
       title ="LIX of New Year Addresses delivered by Prime Ministers", 
       caption = "Data: github.com/straubinger/lix")

png("lix_newyear_pm.png", width = 1344, height = 960, units = "px", res = 150)
plot(p3)
dev.off()