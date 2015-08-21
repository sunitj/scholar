#!/usr/bin/Rscript

# Setup:
# Go to your google scholar profile. The URL should have a term similar to this: user=VII2oEQAAAAJ. <-- that's me!
# Copy the user value and replace the 'user' value below.
# Create a new sheet on google drive, type it some names in two columns in the first row. I chose "Year" and "Citations". I also named my worksheet "citations". Save sheet.
# Copy the link to the sheet and paste it in "citations.url"
# Once this script runs, the sheet named citations should be populated, insert a chart in your google sites page and make a chart using this spreadsheet.
# Example: http://www.sunitjain.com/publications
## Untested:
# To automatically update your data, use cron to run this script periodically. I decided to run it monthly. Waiting to see what happens.
# I'm not sure if it'll require me to sign-in again. If it does, that might break the automation.

# Gets citations from Google Scholar
library(scholar)
# Google Scholar ID
user = "VII2oEQAAAAJ"
cit <- get_citation_history(user)

# Updates Google spreadsheets, which updates the citations graph on my website!
if (length(cit$year)>0){
	library(googlesheets)
	citations.url="https://docs.google.com/spreadsheets/d/1MhrkS2uH9D1cZ7RXcK3Cyyjy8baZqFywrVa6zYJ0tng/edit?usp=sharing"
	citations=gs_url(citations.url,lookup=T,visibility = "private")
	gs_edit_cells(citations,ws="citations",input=cit,anchor = "A2",col_names = FALSE)
	writeLines("[Success!]\tYour Google sheet was updated!")
} else {
	writeLines("[FATAL]\tEither check the Scholar ID,\nIf that's OK your IP may have been blocked (again!)!\nTry in a few days...")
}
