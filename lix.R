# Load packages and dataset

library(ggplot2)
library(tidyr)

lix <- read.csv("lix.csv")


# Convert data from wide to long format

lix <- gather(lix, type, lix, openparl_dk:newyear_royal_no, factor_key = TRUE)


# Fig. 1 PM opening of parliament

ggplot(subset(lix, type %in% c("openparl_dk", "openparl_no", "openparl_se")), 
       aes(x = year, y = lix, colour = type)) +
  geom_point() +
  geom_smooth(se = FALSE) +
  theme(legend.position = "bottom", 
        legend.title = element_blank(),
        panel.grid.minor = element_blank()) +
  scale_colour_manual(breaks = c("openparl_dk", "openparl_se", "openparl_no"),
                      values = c("red", "blue", "forestgreen"),
                      labels = c("Danmark", "Sverige", "Norge")) +
  labs(x = "",
       y = "Lixtal", 
       title ="LIX for statsministerens åbningstaler", 
       caption = "Data: github.com/straubinger/lix")

ggsave("lix_openparl.png", height = 6, width = 7, dpi = 800)


# Fig. 2 Royal New Year Address

ggplot(subset(lix, type %in% c("newyear_royal_dk", "xmas_royal_se", "newyear_royal_no")), 
       aes(x = year, y = lix, colour = type)) +
  geom_point() +
  geom_smooth(se = FALSE) +
  theme(legend.position = "bottom", 
        legend.title = element_blank(),
        panel.grid.minor = element_blank()) +
  scale_colour_manual(breaks = c("newyear_royal_dk", "xmas_royal_se", "newyear_royal_no"),
                      values = c("red", "blue", "forestgreen"),
                      labels = c("Danmark", "Sverige", "Norge")) +
  labs(x = "",
       y = "Lixtal", 
       title ="LIX for royale nytårs- eller juletaler", 
       caption = "Data: github.com/straubinger/lix")

ggsave("lix_newyear_royal.png", height = 6, width = 7, dpi = 800)


# Fig. 3 PM New Year Address

ggplot(subset(lix, type %in% c("newyear_pm_dk", "newyear_pm_no")), 
       aes(x = year, y = lix, colour = type)) +
  geom_point() +
  geom_smooth(se = FALSE) +
  theme(legend.position = "bottom", 
        legend.title = element_blank(),
        panel.grid.minor = element_blank()) +
  scale_colour_manual(breaks = c("newyear_pm_dk", "newyear_pm_no"),
                      values = c("Red", "forestgreen"),
                      labels = c("Danmark", "Norge")) +
  xlim(1985, NA) +
  labs(x = "",
       y = "Lixtal", 
       title ="LIX for statsministerens nytårstaler", 
       caption = "Data: github.com/straubinger/lix")

ggsave("lix_newyear_pm.png", height = 6, width = 7, dpi = 800)
