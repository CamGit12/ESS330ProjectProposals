flowtrend <- ggplot(flow_decomp, aes(x = Date, y = trend)) +
  geom_line() + 
  geom_smooth(color = "white", method = "lm", formula = (y ~ x)) + 
  theme(
    panel.background = element_rect(fill='transparent'),
    plot.background = element_rect(fill='transparent', color=NA),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    axis.line = element_line(colour = "white")
  ) +
  labs(
    x = "Date",
    y = "Discharge Trend (cfs)"
  )

ggsave("imgs/flowtrend.png", flowtrend, bg = "transparent")

flowseason <- ggplot(flow_decomp, aes(x = Date, y = season_year)) +
  geom_line() + 
  theme(
    panel.background = element_rect(fill='transparent'),
    plot.background = element_rect(fill='transparent', color=NA),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    axis.line = element_line(colour = "white")
  ) +
  labs(
    x = "Date",
    y = "Discharge Seasonality (cfs)"
  )

ggsave("imgs/flowseason.png", flowseason, bg = "transparent")


##

turbidtrend <- ggplot(turbid_decomp, aes(x = Date, y = trend)) +
  geom_line() + 
  geom_smooth(color = "white", method = "lm", formula = (y ~ x)) + 
  theme(
    panel.background = element_rect(fill='transparent'),
    plot.background = element_rect(fill='transparent', color=NA),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    axis.line = element_line(colour = "white")
  ) +
  labs(
    x = "Date",
    y = "Turbidity Trend (fbu)"
  )

ggsave("imgs/turbidtrend.png", turbidtrend, bg = "transparent")

turbidseason <- ggplot(turbid_decomp, aes(x = Date, y = season_year)) +
  geom_line() + 
  theme(
    panel.background = element_rect(fill='transparent'),
    plot.background = element_rect(fill='transparent', color=NA),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    axis.line = element_line(colour = "white")
  ) +
  labs(
    x = "Date",
    y = "Turbidity Seasonality (fbu)"
  )

ggsave("imgs/turbidseason.png", turbidseason, bg = "transparent")


median <- joined_data %>% 
  group_by(year = year(dateTime)) %>% 
  summarize(median = median.default(turbidity_fbu))

median <- ggplot(median, aes(x = year, y = median)) +
  geom_line(linetype = 2) + 
  geom_point() +
  theme(
    panel.background = element_rect(fill='transparent'),
    plot.background = element_rect(fill='transparent', color=NA),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    axis.line = element_line(colour = "white")
  ) +
  labs(
    x = "Date",
    y = "Median Turbidity (fbu)"
  )

ggsave("imgs/median.png", median, bg = "transparent", width = 13)
