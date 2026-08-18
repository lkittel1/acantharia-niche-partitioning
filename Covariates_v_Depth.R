library(ggplot2)
library(dplyr)
library(patchwork)

depth_vals <- c(1, 40, 80, 120, 160, 200, 250, 300, 400, 500, 600, 800, 1000)

# ── Total averages ────────────────────────────────────────────────────────────
total <- data.frame(
  depth   = depth_vals,
  density = c(24.805,25.215,25.699,25.942,26.088,26.166,26.242,26.311,26.400,26.596,26.768,27.173,27.534),
  co2     = c(2070.0,2073.4,2081.9,2095.2,2103.1,2104.2,2111.5,2118.5,2126.2,2137.6,2151.2,2180.3,2179.0),
  oxygen  = c(210.2,218.9,219.0,212.3,206.9,204.4,202.5,199.2,184.0,179.7,171.8,148.9,187.5),
  pp      = c(4.501,3.504,2.303,0.605,NA,NA,NA,NA,NA,NA,NA,NA,NA),
  fluor   = c(0.049,0.061,0.117,0.115,0.052,0.022,0.016,0.016,0.010,0.013,0.015,0.019,0.019),
  temp    = c(24.262,22.964,21.354,20.418,19.773,19.380,19.026,18.692,18.240,16.667,14.947,10.454,6.991),
  poc     = c(25.524,29.961,27.431,19.265,12.645,11.862,10.254,8.915,3.500,6.482,7.552,7.164,7.010),
  pon     = c(3.717,4.140,4.340,3.031,1.769,1.546,1.672,1.406,2.050,1.559,1.303,0.991,0.884),
  pop     = c(0.00633,0.00709,0.00853,0.00523,0.00354,0.00300,0.00248,0.00219,0.00200,0.00153,0.00100,0.00600,0.00800)
)

# ── Labels ────────────────────────────────────────────────────────────────────
var_titles <- c(
  density = "Density",
  co2     = "DIC",
  oxygen  = "Oxygen",
  pp      = "Primary Production",
  fluor   = "Fluorescence",
  temp    = "Temperature",
  poc     = "POC",
  pon     = "PON",
  pop     = "POP"
)

var_units <- c(
  density = "kg/m\u00b3",
  co2     = "\u00b5mol/kg",
  oxygen  = "\u00b5mol/kg",
  pp      = "mgC/m\u00b3/day",
  fluor   = "RFU",
  temp    = "\u00b0C",
  poc     = "\u00b5g/kg",
  pon     = "\u00b5g/kg",
  pop     = "\u00b5mol/kg"
)

vars <- names(var_titles)

# ── Theme ─────────────────────────────────────────────────────────────────────
base_theme <- theme_classic() +
  theme(
    text         = element_text(family = "Arial", face = "bold"),
    axis.title   = element_text(family = "Arial", face = "bold", size = 13),
    axis.text    = element_text(family = "Arial", face = "bold", size = 11),
    plot.title   = element_text(family = "Arial", face = "bold", size = 14, hjust = 0.5),
    plot.margin  = margin(4, 6, 4, 4)
  )

# ── Plot function ─────────────────────────────────────────────────────────────
make_plot <- function(var, show_y = TRUE) {
  d <- total %>%
    select(depth, value = all_of(var)) %>%
    filter(!is.na(value))
  
  p <- ggplot(d, aes(x = value, y = depth)) +
    geom_path(colour = "#333333", linewidth = 1.2, linetype = 2) +
    geom_point(colour = "#333333", size = 1.4) +
    scale_y_reverse(
      breaks = c(1, 40, 80, 120, 160, 200, 250, 300, 400, 500, 600, 800, 1000),
      limits = c(1000, 1)
    ) +
    labs(
      title = var_titles[[var]],
      x     = var_units[[var]],
      y     = if (show_y) "Depth (m)" else NULL
    ) +
    base_theme
  
  if (!show_y) {
    p <- p + theme(axis.text.y = element_blank(), axis.ticks.y = element_blank())
  }
  p
}

# ── Assemble ──────────────────────────────────────────────────────────────────
plots <- lapply(seq_along(vars), function(i) {
  make_plot(vars[i], show_y = (i == 1))
})

wrap_plots(plots, nrow = 1) +
  plot_annotation(
    theme = theme(plot.background = element_rect(fill = "white", colour = NA))
  )

ggsave("environmental_profiles_total.pdf", width = 30, height = 9, dpi = 300, bg = "white", device = pdf)