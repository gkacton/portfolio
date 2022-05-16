worcester_map <- leaflet(data = worcester_geo) %>% 
  addTiles(group = "OSM") %>%
  addProviderTiles(providers$Stamen.Toner, group = "Toner") %>%
  addProviderTiles(providers$Stamen.TonerLite, group = "Toner Lite") %>% 
  addCircleMarkers(
    radius = 6,
    fillColor = ~case_when(job_title == "Dressmaker" ~ "lightskyblue",
                           job_title == "Milliner" ~ "purple",
                           job_title == "Tailoress" ~ "yellow",
                           job_title == "Store Owner" ~ "lightgreen",
                           job_title == "Store owner" ~ "lightgreen",
                           job_title == "Milliner; Dressmaker" ~ "blueviolet",
                           job_title == "Milliner; dressmaker" ~ "blueviolet",
                           job_title == "Tailor" ~ "blue",
                           job_title == "Milliner; mantuamaker" ~ "magenta",
                           job_title == "Milliner; Mantua-Maker" ~ "magenta",
                           job_title == "Mantuamaker; Milliner" ~ "magenta",
                           job_title == "Tailoress; apprentices" ~ "orange"),
    color = "black",
    stroke = TRUE, 
    weight = 2,
    fillOpacity = 0.5,
    popup = ~popup) %>% 
  addLayersControl(
    baseGroups = c("OSM (default)", "Toner", "Toner Lite"),
    options = layersControlOptions(collapsed = FALSE)
  )

ma_map <- leaflet(data = ma_geo) %>% 
  addTiles(group = "OSM") %>%
  addProviderTiles(providers$Stamen.Toner, group = "Toner") %>%
  addProviderTiles(providers$Stamen.TonerLite, group = "Toner Lite") %>% 
  addCircleMarkers(
    radius = 6,
    fillColor = ~case_when(job_title == "Dressmaker" ~ "lightskyblue",
                           job_title == "Milliner" ~ "purple",
                           job_title == "Tailoress" ~ "yellow",
                           job_title == "Store Owner" ~ "lightgreen",
                           job_title == "Store owner" ~ "lightgreen",
                           job_title == "Milliner; Dressmaker" ~ "blueviolet",
                           job_title == "Milliner; dressmaker" ~ "blueviolet",
                           job_title == "Tailor" ~ "blue",
                           job_title == "Milliner; mantuamaker" ~ "magenta",
                           job_title == "Milliner; Mantua-Maker" ~ "magenta",
                           job_title == "Mantuamaker; Milliner" ~ "magenta",
                           job_title == "Tailoress; apprentices" ~ "orange"),
    color = "black",
    stroke = TRUE, 
    weight = 2,
    fillOpacity = 0.5,
    popup = ~ma_popup) %>% 
  addLayersControl(
    baseGroups = c("OSM (default)", "Toner", "Toner Lite"),
    options = layersControlOptions(collapsed = FALSE)
  )

genealogy_map <- leaflet(data = genealogy_geo) %>% 
  addTiles(group = "OSM") %>%
  addProviderTiles(providers$Stamen.Toner, group = "Toner") %>%
  addProviderTiles(providers$Stamen.TonerLite, group = "Toner Lite") %>% 
  addCircleMarkers(
    radius = 6,
    fillColor = "#9cc1d1",
    color = "black",
    stroke = TRUE, 
    weight = 2,
    fillOpacity = 0.75,
    popup = ~genealogy_popup) %>% 
  addLayersControl(
    baseGroups = c("OSM (default)", "Toner", "Toner Lite"),
    options = layersControlOptions(collapsed = FALSE)
  )