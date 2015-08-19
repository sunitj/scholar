# scholar
Adding google scholar citations to google sites.

The following instructions are for the file `citations.r`, the other files were more for testing purposes.:
## Setup:
1. Go to your google scholar profile. The URL should have a term similar to this: `user=VII2oEQAAAAJ`. <-- that's me!
2. Copy the user value and replace the `user` value in `citations.r`
3. Create a new sheet on google drive, type it some names in two columns in the first row.
  3. I chose "Year" and "Citations".
  3. I also named my worksheet "citations".
  3. Save sheet.
4. Copy the link to the sheet and paste it in `citations.url`
5. Once this script runs, the sheet named citations should be populated.
6. Insert a chart in your google sites page and make a chart using this spreadsheet.
*Example:* http://www.sunitjain.com/publications

### Untested:
- To automatically update your citations plot, use cron to run this script periodically. I decided to run it monthly. 
  - Waiting to see what happens.
  - I'm not sure if it'll require me to sign-in again. If it does, that might break the automation.
  - Still pretty neat to be able to do this. :)
