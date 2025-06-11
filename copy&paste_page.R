mod_preds <- ggpredict(liz_mod,
                       terms = "distance [3:40 by =1]")
ggplot(lizard,
       aes(x = distance,
           y = pushup)) +
  geom_point (size = 3,
              alpha = 0.04) +
  geom_ribbon(data = mod_preds,
              aes(x = x,
                  y=predicted,
                  ymin = conf.low,             #example from lecture slides
                  ymax=conf.high),
              alpha = 0.4) +
  geom_line(data = mod_preds,
            aes(x = x,
                y = predicted)) +
  scale_y_continuous(limits = c(0,1),
                     breaks = c(0, 1))
              








# Step 1: Install ggeffects if needed
install.packages("ggeffects")  # Only run this once
library(ggeffects)

# Make sure season is a factor
nested_boxes$season <- as.factor(nested_boxes$season)

# Make sure edge.distance is numeric
nested_boxes$edge.distance <- as.numeric(nested_boxes$edge.distance)

# Load the ggeffects package
library(ggeffects)

# Try ggpredict again — this should now work
mod2_preds <- ggpredict(mod2, terms = c("edge.distance [0:100 by=1]", "season"))


# Step 2: Generate predictions from your fitted model
mod2_preds <- ggpredict(mod2, terms = c("edge.distance [0:100 by=1]", "season"))

# Step 3: Plot following the lecture slide format
ggplot(nested_boxes, aes(x = edge.distance, y = occupied)) +
  geom_point(aes(color = season), alpha = 0.3, size = 2) +
  
  geom_ribbon(data = mod2_preds,
              aes(x = x, ymin = conf.low, ymax = conf.high, fill = group),
              alpha = 0.3, color = NA) +
                                                                                             #an attempt that did render an image
  geom_line(data = mod2_preds,
            aes(x = x, y = predicted, color = group),
            linewidth = 1.2) +
  
  scale_y_continuous(limits = c(0, 1), breaks = c(0, 1)) +
  
  labs(
    x = "Distance to forest edge (meters)",
    y = "Predicted probability of occupancy",
    color = "Season",
    fill = "Season"
  ) +
  
  scale_color_manual(values = c("2016" = "#1b9e77", "2019" = "#d95f02")) +
  scale_fill_manual(values = c("2016" = "#1b9e77", "2019" = "#d95f02")) +
  
  theme_minimal(base_size = 14) +
  theme(
    panel.grid = element_blank(),
    legend.position = "right",
    axis.line = element_line(color = "black"),
    axis.ticks = element_line(color = "black")
  )
    
    
    
    




ggplot() +
  # Raw data points from nested_boxes
  geom_point(data = nested_boxes,
             aes(x = edge.distance, y = occupied, color = season),
             alpha = 0.3, size = 2) +
  
  # Confidence ribbon from mod2_preds
  geom_ribbon(data = mod2_preds,
              aes(x = x, ymin = conf.low, ymax = conf.high, fill = group),
              alpha = 0.3, color = NA) +                                           #most recent attempt (doesnt work)
  
  # Prediction line from mod2_preds
  geom_line(data = mod2_preds,
            aes(x = x, y = predicted, color = group),
            linewidth = 1.2) +
  
  scale_y_continuous(limits = c(0, 1), breaks = c(0, 1)) +
  
  labs(
    x = "Distance to forest edge (meters)",
    y = "Predicted probability of occupancy",
    color = "Season",
    fill = "Season"
  ) +
  
  scale_color_manual(values = c("2016" = "#1b9e77", "2019" = "#d95f02")) +
  scale_fill_manual(values = c("2016" = "#1b9e77", "2019" = "#d95f02")) +
  
  theme_minimal(base_size = 14) +
  theme(
    panel.grid = element_blank(),
    legend.position = "right",
    axis.line = element_line(color = "black"),
    axis.ticks = element_line(color = "black")
  )







    
  )