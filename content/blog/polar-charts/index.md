---
title: "Polar Charts: Sailing with Data"
date: 2024-10-10T19:30:08+10:00
draft: false
weight: 1
keywords: 
    - tech
summary: Generating real-world and detailed polar charts can give you an edge in semi- and professional sailing.
---

## Polar Charts: Sailing with Data

{{< rawhtml >}}

{{< /rawhtml >}}

Until now, I've had a career—one that's still ongoing—in software engineering, where I've worn many hats: manager, individual contributor, product owner, scrum master, and even founder. I can look back on 16 years of professional experience. However, in 2017, I caught what sailors call "the sailing bug." Since then, my passion for the ocean has deepened. Recently, I raced across the Pacific Ocean and tackled other challenging waters aboard a 70ft monohull, and that's where the inspiration for this post began.

During the race, our team consistently underperformed, which, as a watch lead, frustrated me. I knew we could do better, and I wanted to find ways to improve our performance in future races. Leaning on my engineering background, I developed an optimal sail plan selector and real-world polar charts using our boat's data and logbook. Any successful sports team—whether in sailing or elsewhere—must use data to make informed, repeatable decisions. Since the race concluded a few months ago, I'm now ready to share how I built these tools.

### What Are Polar Charts?

In sailing, polar charts are graphical representations showing how a sailboat's speed varies depending on different wind angles and wind speeds. They're essential tools for optimizing performance on the water. The radial axis typically displays boat speed (in knots), while wind angles (in degrees) are plotted around the circular axis. By interpreting these charts, sailors can determine the best sail settings and course for various wind conditions.

In competitive racing, polar charts are invaluable for feeding data to navigation software, where understanding a boat's optimal performance in relation to the wind can make or break a strategy. Given the nature of a round-the-world race, you'd expect every boat to have these charts. And they did—barely. Most boats had rudimentary versions that likely came from the initial design phase, serving as a good baseline but lacking critical factors like sea state or sail plan variations. Even worse, they were never validated in real-world conditions.

A typical example of a polar chart looks like this:

![Example of a Polar Chart](images/polar_chart_example.png#center)

### What is TimeZero?

TimeZero is a go-to tool in professional sailing races for its powerful navigation and route planning features. It helps crews stay ahead by providing over-the-air data updates like weather updates, currents, and tides, so they can make smarter decisions as conditions change. With its accurate chart plotting and precise positioning, teams can plan the best routes and react quickly when needed. In high-stakes racing, having reliable software like TimeZero on board is key to staying competitive and making sure every move counts.

![How we used TZ on board](images/tz.jpg#center)

### What We Tracked to Build a Boat-Specific Polar Chart

To build an effective polar chart, several data sources are necessary:

- Datetime (from TimeZero and the logbook)
- Sea state (logged manually from the logbook)
- Sail plan (also from the logbook)
- Water speed (from TimeZero)
- Wind speed (from TimeZero)
- Apparent wind angle (AWA) (from TimeZero)
- Apparent wind speed (AWS) (from TimeZero)
- Whether we are under Power or not (from Logbook)

#### TimeZero Setup

By default, Speed (SOG) and Depth data are always recorded inside the track (provided that the corresponding sensors are connected and configured in TimeZero). You can add other data from the Ship & Tracks Options by clicking on the "Track Data Recorded" button. The following data can be recorded inside the track:

![Click all the relevant boxes](images/record_track_data.png#center)

We use water speed instead of SOG since water speed isn't affected by tidal movements, making it a more accurate measure of a boat's true performance. Additionally, sea state data is crucial, as it heavily influences speed and stability but is often neglected in simplistic polar models.

The first step was enabling data collection within TimeZero to gather all relevant metrics, combined with manually transcribed logbook entries for sail plan adjustments and sea state observations.
Since the creation of realistic charts is retroactive, we need to export our track data to CSV in TimeZero.
You can export all your tracks or only tracks belonging to specific layers from the "Import/Export" button available under the TimeZero button. Please refer to the Import & Export Data chapter for more information. Be sure to use the CSV-Generic option to export all the recorded data.

![Use CSV to export all needed datapoints](images/export_track_data.png#center)

#### Transcribing the Logbook

As mentioned above, for better results we needed to record sea state and the sail plan. We had a Main (plus reefs), Staysail, three Yankees, and four asymmetric Spinnakers (Codes) on board. All these data points were transcribed from our logbook, which we filled out every hour or on any significant changes. A logbook "page" consisted of two pages which roughly looked like this:

![Left Page with seastate and others](images/logbook_both.png#center)

I used Fiverr to have these photos transcribed, at times 50+ pages, into CSV, which ended up looking like this:

{{< highlight csv  >}}

Date,UTC,Power/Sail,Sea State,(M)SeaPlan,(S)SeaPlan,(Y)SeaPlan,(A)SeaPlan
2024-01-26,02:00,,,--,--,--,--
2024-01-26,03:00,P,SL,--,--,--,--
2024-01-26,04:12,P,SL,2,--,--,--
2024-01-26,05:08,P/S,SL,tk,--,--,--
2024-01-26,06:00,P/S,SL,tk,--,--,--

{{< / highlight >}}

You may notice some strange values and columns here, which I fixed at a later point in the process, as you can see in the next section.

### Transforming the Data So It Becomes Usable

With our two sources now being in CSV, we can start importing that into a database. For simplicity, I chose `sqlite`. This diagram shows how the data is being processed - of course starting with the import from CSV.

![Diagram of how data was imported and processed](images/diagram.png#center)

Most of the data wrangling is pure `sql` with a utility that just executes the scripts in the correct order. If this ever grows out of this stage, which I want it to - I would certainly go with `dbt` to get an automatic execution plan.

### Interpreting the Results

The data I collected spanned over 10,000 nautical miles with over 600k data points of offshore racing on a Clipper 70, using TimeZero and manual logbook transcription. The graph below shows the maximum achieved Speed through Water or Water Speed averaged on the minute level, split by tack, meaning from which side the wind blows off the vessel and thus which side of the vessel is more submerged in the water.

![Tack difference on Speed through water](images/tack.png#center)

One unexpected insight we discovered was that our boat consistently performed better on starboard tack, particularly when reaching. Despite extensive discussions and theories—ranging from rudder setup to rigging and hull shape—we couldn't pinpoint a definitive cause.

![Drop in speed based on AWA](images/yankee.png#center)

Another, now very clear insight - under a full main, with a staysail and the biggest Yankee on, you can see two things. First, the effectiveness of the sail starts to deteriorate starting at around 100 degrees AWA (Apparent Wind Angle), and second, it sharply drops after 135 degrees AWA. Both happen for all wind speeds as the legend shows.

Still, armed with this data, we became one of the fastest boats in the fleet, outpacing competitors by systematically applying the insights gained from our polar charts.

### Putting It into Practice

Given the constraints of time between races and limited access to the navigational computer, I opted for a simple yet highly effective tool: spreadsheets. I built an easy-to-use interface where you could input wind speed and apparent wind angle (AWA) to get the target water speed and sail plan. This allowed us to make real-time, data-driven decisions on the boat. I would relay this information directly to the trimmer and helmsman, enabling us to make adjustments on the fly and optimize our speed.

Here's a visual of the spreadsheet setup I used:

![Filter down to the parameters you want](images/excel.png#center)

Imagine we were on a starboard tack with just the full main and the yankee 1 up (F-1-), I would get the stay up as well and say to the team, beat 6.5 kts through the water.

### Want Help with Your Campaign? I'll Do It for Free

I miss those boats like crazy. If any of this sounds intriguing, don't hesitate to reach out. I have a ton of ideas for improving this system further. Plus, since I'm passionate about sailing in high-performance environments and firmly believe that data gives competitive teams an edge, I'm offering to help your campaign for free. Let's make data work for you on the water.