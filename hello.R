library(tidyverse)
library(dplyr)
?diamonds
view(diamonds) 
?filter
diamonds_sm <- filter(diamonds, cut == "Ideal")
diamonds_sm <- filter(diamonds, price > 10000 )
diamonds_sm <- filter(diamonds, 
                      cut == "Ideal",
                      price > 10000) # , used for AND
view(diamonds_sm)

diamonds_sm <- filter(diamonds, 
                      cut == "Ideal" |
                      price > 10000) # | used for OR 
view(diamonds_sm)


# filter for missing values using is.na or !is.na
?select

diamonds_sm <- select(diamonds, color , cut)
view(diamonds_sm)

diamonds_sm <- select(diamonds, 1:4)
view(diamonds_sm)
diamonds_sm <- select(diamonds, starts_with("c"))
view(diamonds_sm)

diamonds_sm <- select(diamonds, contains("c"))
view(diamonds_sm)

diamonds_sm <- select(diamonds,
                      price,
                      everything())
view(diamonds_sm)

diamonds_sm <- select(diamonds, -price) 
# -price eleminates the column price once we put "-" sign 
view(diamonds_sm)

#using the pipe operator %>% shortcut is ctrl+shift+M
diamonds_sm <- diamonds %>%
  select(-price)

diamonds_arr <- diamonds %>% 
  arrange(color)
view(diamonds_arr)

diamonds_arr <- diamonds %>% 
  arrange(carat)
view(diamonds_arr)

diamonds_arr <- diamonds %>% 
  arrange(color,
          carat)
view(diamonds_arr)

diamonds_arr <- diamonds %>% 
  arrange(carat,
          color)
view(diamonds_arr)

diamonds_arr <- diamonds %>% 
  arrange(desc(carat))
# we can also use "-" sign to show we want the o/p in desc order
view(diamonds_arr)
glimpse(diamonds_arr)


diamonds_new <- diamonds |> 
  mutate(mass_g = .20 * carat)
glimpse(diamonds_new)

diamonds_new <- diamonds |> 
  mutate(mass_g = .20 * carat,
         price_per_carat = price/carat)
glimpse(diamonds_new)


diamonds_new <- diamonds |> 
  mutate(mass_g = .20 * carat,
         price_per_carat = price/carat,
         cut = tolower(cut))
glimpse(diamonds_new)

diamonds_new <- diamonds |> 
  mutate(mass_g = .20 * carat,
         price_per_carat = price/carat,
         cut = tolower(cut),
         expensive_TF = price > 10000)
glimpse(diamonds_new)


# other smaller verbs -----------------------------------------------------
#ctrl + shift + r for new section 
?slice_max
?bind_rows
?left_join
?rename
?case_when


diamonds |> 
  group_by(cut) |> 
  summarize(mean(price))

diamonds |> 
  group_by(cut) |> 
  summarize(avg_price = mean(price),
            sd_price = sd(price))

# for readr(tidyverse) use read_csv and use read.csv from built-in package in R


diamonds |> 
  group_by(cut,
           color) |> 
  summarize(avg_price = mean(price),
            sd_price = sd(price),
            count = n())

diamonds |> 
  count(cut,
        color) #counts only.

diamonds |> 
  group_by(price > 10000) |> 
  summarize(avg_price = mean(price),
            sd_price = sd(price),
            count = n())


diamonds |> 
  group_by(expensive = price > 10000) |> 
  summarize(avg_price = mean(price),
            sd_price = sd(price),
            count = n())

?spread()


glimpse(dig.df)
