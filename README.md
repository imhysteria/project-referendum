# Project Referendum

### Overview

This is the overview for the Iron Hack Mid-Project, where a data analysis was done to understand how the demographic areas of Australia voted in the Referendum, and if any key factors contributed to either a YES or NO vote.

You can access the required files via the following in this repository

1. Notebook: ray-midproject-referendum-v1.ipynb
2. MySQL: ray-referendum-mid.sql
3. Presentation: RayPham - IronHack - Referendum.pdf
4. Tableau: https://public.tableau.com/app/profile/ray.pham/viz/ray-referendum-ironhack/AustraliaMap
5. Trello: https://trello.com/b/R9S219AF/bootcamp-project

All the necessary CSV and datasets are included with the cleaned versions available in the root folder.


### Background

In October 2023, Australians went to the polls to vote for a change within the constitution to recognise the Australian Indigenous people and allow them to be represented within the Parliament of Australia. In order for it to succeed, it needed a majority population vote, and a majority state vote. Unfortunately, it failed on both counts with the population vote being 39.94% Yes Votes and 60.06% No Votes. Only one state (Australian Capital Territory) had the majority with 61.29% Yes votes.


### Approach

I wanted to use this as an opportunity to understand if the demographic and regions had influenced the voter decision. The dataset provided by the Australian Electoral Commission didn’t provide any specific demographic profiles for the people who voted, rather only by electoral area. However, there was a census survey conducted across Australia in 2021, which mapped out key demographic attributes in via electoral areas. These demographic attributes included age, gender, indigenous population, education, job sector, religious affiliations and housing situation (income, rent etc). 

While it is not 100% that the census data correlates directly to the voter demographic, when you are enrolled to vote in Australia, you must state your electoral area, and when you go for any election, as you enter the polling, you are required to mark down your electoral area. I used this as the baseline of the research and framework I wanted to map out the profile of how different electoral areas voted, and therefore provide a picture of the demographic of voter preference.


## Process

1. Researched for the relevant datasets, one for the census data and one for the referendum vote.
2. Had to download multiple datasets from the census data, to understand which ones are relevant and able to be mapped out to the electoral data.
3. There are ways to break down various levels of geographic areas in Australia (state, local government area, suburb, postcode etc).
4. Identified that it was possible to join via the CED (Commonwealth Electoral Area) ID and Name.
5. Cleaned the relevant datasets, to focus only on clustering to the electoral areas.
6. (Note: would've been provided difficult to map location of polling booths with the census data, and that you can vote in different booths outside your electoral area).
7. Created the necessary CSV files to import to SQL to do the data analysis.
8. Once the data was analysed, key learnings were extracted from the queries and then was exported back into Pandas.
9. Created a correlation matrix to uncover any interesting insights.
10. Master master dataframe was created to be exported to Tableau for data visualisation.

- Census dataset: https://www.abs.gov.au/census/find-census-data/datapacks?release=2021&product=IP&geography=LGA&header=S
- Referendum dataset: https://tallyroom.aec.gov.au/ReferendumNationalResults-29581.htm


### Learnings

Some key learnings after this analysis:

- Median income did have an impact on how people voted (higher above the median you are more likely to vote YES).
- Areas with a high percentage of indigenous population are more likely to vote NO.
- No clear evidence if education levels have an impact on how you vote.
- Areas with an above average population born overseas is inconclusive for voter preference.


