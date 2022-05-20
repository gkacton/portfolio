## **Federal Health Centers Data**

### Description

"This dataset provides a list of federally-funded health centers that provide health services. For more than 40 years, Health Resources and Services Administration (HRSA)-supported health centers have provided comprehensive, culturally competent, quality primary health care services to medically underserved communities and vulnerable populations. Health centers are community-based and consumer-run organizations that serve populations with limited access to health care. These include low-income populations, the uninsured, those with limited English proficiency, migratory and seasonal agricultural workers, individuals and families experiencing homelessness, and those living in public housing."

*Despription reported directly from data.hrsa.gov* 

### Format

A data frame with 197 observations and 34 variables

### Data Dictionary

## `federally_recognized_health_centers.csv`

|variable                                                         |class     |description |
|:----------------------------------------------------------------|:---------|:-----------|
|Health Center Type                                               |character | Data source for the site (Health Center Service Delivery (HCSD) site or HCSD Look-Alike site) |
|Health Center Number                                             |character | 10 character number that HRSA uses in the HRSA Electronic Handbooks (EHB) to identify Health Center Program (HCP) grants or look-alikes |
|BHCMIS Organization Identification Number                        |character | Organization source identification number from the HRSA, Bureau of Primary Health Care (BPHC) Health Center Management Information System (BHCMIS) |
|BPHC Assigned Number                                             |character | Site number assigned by the source system for HRSA, Bureau of Primary Health Care (BPHC) sites |
|Site Name                                                        |character | Name of a health care facility |
|Site Address                                                     |character | Street address of the health care facility |
|Site City                                                        |character | City name of the health care facility  |
|Site Postal Code                                                 |character | U.S. Postal Service ZIP Code portion of the address of a health care facility   |
|Site Telephone Number                                            |character | Telephone number at the primary HCSD site |
|Site Web Address                                                 |character | URL or internet address for the organization or entity associated with the specified record |
|Operating Hours per Week                                         |numerical | (0-80) Number of hours per week the HCSD site is typically scheduled to be open for patient care |
|Health Center Location Setting Identification Number             |integer   | (0-7) Integer value that uniquely identifies the HCSD site location setting |
|Health Center Service Delivery Site Location Setting Description |character | Description of the location setting for the HCSD site - classification of the HCSD site according to the type of institution to which it is affiliated |
|Health Center Status Identification Number                       |integer   | (0-1) Integer that uniquely identifies the HCSD site status|
|Site Status Description                                          |character | (Active or Inactive) Descritpion of the HCSD site activity status |
|Health Center Location Identification Number                     |integer   | (1-5) Integer value that uniquely identifies the HCSD site location type |
|Health Center Location Type Description                          |character | Description of the scope of operations for the health center service delivery site location |
|Health Center Type Identification Number                         |integer   | (1-3) Integer that uniquely identifies the HCSD site type |
|Health Center Type Description                                   |character | Site type - indicates whether the HCSD site offers direct patient care, functions in an administrative capacity, or both |
|Health Center Operator Identification Number                     |integer   | (1-3) Tnteger value that uniquely identifies the HCSD site operator type |
|Health Center Operator Description                               |character | Type of organization that operates the HCSD site |
|Health Center Operating Schedule Identification Number           |integer   | (0-2) Integer that uniquely identifies the HCSD site operating schedule |
|Health Center Operational Schedule Description                   |character | Type of operating schedule (e.g., full-time or part-time) for the HCSD site |
|Health Center Operating Calendar Surrogate Key                   |integer   | (0-2) Integer value that uniquely identifies the HCSD site operating calendar |
|Health Center Operating Calendar                                 |character | Operating calendar that indicates the type of schedule the health clinic operates |
|Health Center Name                                               |character | Organization name associated with the Health Center Service Delivery (HCSD) site or HCSD Look-Alike |
|Health Center Organization Street Address                        |character | Street address for either the Health Center Service Delivery (HCSD) organization or HCSD Look-Alike organization |
|Health Center Organization City                                  |character | City for either the Health Center Service Delivery (HCSD) organization or HCSD Look-Alike organization|
|Health Center Organization ZIP Code                              |character | U.S. Postal Service Zip Code for either the Health Center Service Delivery (HCSD) organization or HCSD Look-Alike organization |
|Geocoding Artifact Address Primary X Coordinate                  |numeric   | Primary longitude in decimal degrees (x coordinate) of the entity based on its address |
|Geocoding Artifact Address Primary Y Coordinate                  |numeric   | Primary latitude in decimal degrees (y coordinate) of the entity based on its address |
|Geocoding Artifact Rural Status Indicator                        |character | (Y or N) Indicator value identifying whether the entity is in a rural area as defined by HRSA |
|Complete County Name                                             |character | Proper county name associated with a specified data element |
|County Equivalent Name                                           |character | Name of the county or county equivalent in which the associated address is located |

### Source

https://data.hrsa.gov/data/download?data=HSCD#HSCD

### Cleaning Script

```{r cleaning-script} 
# read in .csv file
federal_health_centers <- read_csv("/cloud/project/data/primary care providers/federally_recognized_health_centers.csv")

# recode setting description
federal_health_centers <- federal_health_centers %>%
  mutate(`Facility Type` = str_replace(`Health Center Service Delivery Site Location Setting Description`, 
          "All Other Clinic Types", 
          "Clinic"))
```
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

## **Google Maps Scraped Data**

### Description

This dataset provides a list of primary care providers and other related medical practices in the state of Maine, as well as a handful of practices located just outside the Maine border. Data was scraped from google maps using results from searching "primary care providers" in the google maps search bar.

### Format

A data frame with 245 observations and 15 variables

### Data Dictionary

## `maine_primary_care_scrape.csv`

|variable                                     |class     |description |
|:--------------------------------------------|:---------|:-----------|
|placeURL                                     |character | Unique google maps web adress (URL) for the health care practice |
|title                                        |character | Name of the health care facility |
|rating                                       |numeric   | (1-5) Average rating of the health care practice based on google reviews |
|reviewCount                                  |numeric   | (0-80) Number of unique google reviews for the health care practice |
|category                                     |character | Description of the type of the health practice |
|address                                      |character | Address of the health care practice |
|plusCode                                     |character | Unique open location code for the region in which the health care practice is located bsaed on the existing latitude and longitude system |
|website                                      |character | Website of the health care practice if applicable |
|phoneNumber                                  |character | Telephone number at the health care facility  |
|latitude                                     |numeric   | latitude in decimal degrees (y coordinate) of the health care facility based on its address |
|longitude                                    |numerical | longitude in decimal degrees (x coordinate) of the entity based on its address |
|query                                        |character | Google maps generated query address for the health care facility (based on search used to obtain the scraped data) |
|info                                         |character | Any additional information provided by the health care practice |

### Source

https://www.google.com/maps

### Cleaning Script

```{r cleaning-script} 
# read in .csv file
pcp_scrape_df <- read_csv("/cloud/project/data/primary care providers/maine_primary_care_scrape.csv")

# drop unnecessary variables
pcp_scrape_df <- pcp_scrape_df[,!(names(pcp_scrape_df) %in% c("attributes","timestamp"))]
```
