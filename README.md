# S<sup>3</sup> - Scholar --> Sheet --> Site 🎓
Adding google scholar citations to google sites. [*Example*](http://www.sunitjain.com/publications)

## Inspiration
This repo was inspired by the following blog posts:

- [Post 1](http://tuxette.nathalievilla.org/?p=1682)
- [Post 2](http://rogiersbart.blogspot.fr/2015/05/put-google-scholar-citations-on-your.html)

I found then both on [r-bloggers](http://www.r-bloggers.com/).


## Why would you want to do this?
This script combined with a job scheduler (like cron) can be used to keep your Google site based website up to date with the data in your Google scholar profile	. The pipeline actually goes:

`(Scholar) -- [citations.r] --> (Sheets) -- [google gadgets] --> (Sites)`

## Required Packages
- [R (3.2.1 +)](https://www.r-project.org/)
- [scholar](https://cran.r-project.org/web/packages/scholar/index.html)
- [googlesheets](https://cran.r-project.org/web/packages/googlesheets/index.html)

The following instructions are for the file `citations.r`, the other files were more for testing purposes.:

## Setup: 
1. Go to your google scholar profile. The URL should have a term similar to this: `user=VII2oEQAAAAJ`. <-- that's me!
2. Copy the user value and replace the `user` value in `citations.r`
3. Create a new sheet on google drive, type it some names in two columns in the first row.
  3. I chose "Year" and "Citations".
  3. I also named my worksheet "citations".
  3. Save sheet.
4. Change the sharing settings to `Anyone with the link`,`Can View` and copy the link generated.
5. Paste the link in `citations.url`
6. Once this script runs, the sheet named citations should be populated.
7. Insert a chart in your google sites page and make a chart using this spreadsheet.

### Caveats 😅
- `citations.r` needs to be run the very first time on an IDE like RStudio, this is because of the `googlesheets` dependency.
- `googlesheets` will try and open your default web browser and authenticate the connection. Make sure you check the profile you're signed in as has access to the Google sheet.

  
### Automation using Cron
- To edit a cron job, type the following in your terminal:
```Shell
crontab -e
```
- Add the following two lines, carefully replacing the appropriate values.
```Shell
MAILTO=my@email.com
@hourly	cd /local/path/to/repo && Rscript citations.r
```
>__Note:__ `@hourly` simply asks the cron daemon to execute the command at the top of the hour, every hour, as long as your computer is on. If you're doing this on a coumputer/server that your rarely shutdown, maybe try something like `@monthly`.
- Save and exit.
>␛:wq ⏎

	(Type: escape,colon,w,q,return)