import matplotlib.pyplot as plt
import matplotlib.dates as mdates
import numpy as np
import textwrap
from datetime import datetime


def vertical_gantt(tasks, start_col=0, col_width=0.8, figsize=(3.2, 16.3), invert_y=True):
    # Parse dates
    for t in tasks:
        t["start_dt"] = datetime.fromisoformat(t["start"])
        t["end_dt"]   = datetime.fromisoformat(t["end"])

    fig, ax = plt.subplots(figsize=figsize)

    # Convert datetimes to Matplotlib date numbers
    for t in tasks:
        y0 = mdates.date2num(t["start_dt"])
        y1 = mdates.date2num(t["end_dt"])
        height = y1 - y0

        x = t.get("col", 0)
        

        ax.bar(
            x=x,
            height=height,
            width=col_width,
            bottom=y0,
            align="center",
            label=t["task"],
            color = t["color"],
            edgecolor = 'k',
            linewidth = 1.5,
            alpha = 0.9,
            zorder = 2
        )

        if t["hatchcolor"] != t["color"]:
            ax.bar(
                x=x,
                height=height,
                width=col_width,
                bottom=y0,
                align="center",
                label=t["task"],
                fill = False,
                edgecolor = t['hatchcolor'],
                linewidth = 1,
                hatch = t["hatch"],
                zorder = 3
            )
        
        ax.bar(
            x=x,
            height=height,
            width=col_width,
            bottom=y0,
            align="center",
            label=t["task"],
            fill = False,
            edgecolor = 'k',
            linewidth = 1.5,
            alpha = 1,
            zorder = 4
        )

        ax.text(
            x, y0 + height/2,
            textwrap.fill(t["task"], width=height*1.5),
            rotation=90,
            fontsize=10.4,
            ha="center",
            va="center",
            zorder = 5
        )
    cols = sorted(set(t.get("col", 0) for t in tasks))
    lane_names = ["Must", "Should", "Could"]  # must match len(cols)
    ax.set_xticks(cols)
    ax.tick_params(top=True, bottom=False, labeltop=False, labelbottom=False)  # hide default labels
    for x, name in zip(cols, lane_names):
        ax.text(
            x, 1.005, name,
            transform=ax.get_xaxis_transform(),  # x in data coords, y in axes coords
            ha="center", va="bottom"
        )


    # Y axis: dates
    ax.yaxis_date()
    ax.yaxis.set_major_locator(mdates.WeekdayLocator(byweekday = 4, interval=1))
    ax.yaxis.set_major_formatter(mdates.DateFormatter("%m-%d"))
    ax.yaxis.set_minor_locator(mdates.DayLocator(interval=1))
    ax.set_ylim(
        datetime(2026, 4, 16),
        datetime(2026, 8, 21)
    )

    ax.axhspan(
        datetime(2026, 4, 24),
        datetime(2026, 5, 1),
        color="lightgrey",
        zorder=-1
    )   

    ax.axhspan(
        datetime(2026, 5, 25),
        datetime(2026, 5, 29),
        color="lightgrey",
        zorder=-1
    )   
    ax.axhline(datetime(2026, 5, 11), color = 'k', linestyle = '--', lw = 2, zorder=1)
    ax.axhline(datetime(2026, 5, 31), color = 'k', linestyle = '--', lw = 2, zorder=1)
    ax.axhline(datetime(2026, 7, 13), color = 'k', linestyle = '--', lw = 2, zorder=1)
    ax.axhline(datetime(2026, 7, 21), color = 'k', linestyle = '--', lw = 2, zorder=1)
    ax.axhline(datetime(2026, 8, 7), color = 'k', linestyle = '--', lw = 2, zorder=1)
    ax.axhline(datetime(2026, 8, 20), color = 'k', linestyle = '--', lw = 2, zorder=1)

    #ax.set_xlabel('Tasks', labelpad=15) 
    #ax.xaxis.set_label_position('top')
    #ax.set_ylabel("Date")

    if invert_y:
        ax.invert_yaxis()

    fig.autofmt_xdate(rotation=0)  # keep y-date labels readable
    ax.set_axisbelow(True)
    ax.grid(True, which="major", axis="y")
    plt.tight_layout()
    plt.savefig("gantt1")
    plt.show()


# ---- EASY WAY TO ADD TASKS: edit this list ----
tasks = [
    {"task": "Familiarize with SCONE",  "start": "2026-04-17", "end": "2026-05-01", "col": 0, "color" : "white", "hatch" : "/", "hatchcolor" : "white"},
    {"task": "Run simulations without FM", "start": "2026-04-17", "end": "2026-05-01", "col": 1, "color" : "lightgrey", "hatch" : "/", "hatchcolor" : "lightgrey"},
    {"task": "Run simulations without FM",    "start": "2026-05-01", "end": "2026-05-15", "col": 0, "color" : "lightgrey", "hatch" : "/", "hatchcolor" : "lightgrey"},
    {"task": "Theoretical analysis of                 the simulations without FM", "start": "2026-05-01", "end": "2026-05-29", "col": 1, "color" : "white", "hatch" : "/", "hatchcolor" : "lightgrey"},
    {"task": "Write about        the simulations without FM", "start": "2026-05-01", "end": "2026-05-15", "col": 2, "color" : "white", "hatch" : "-", "hatchcolor" : "lightgrey"},
    {"task": "Modify SCONE for    FM simulations",     "start": "2026-05-15", "end": "2026-05-29", "col": 0, "color" : "white", "hatch" : "\\\\", "hatchcolor" : "lightgrey"},
    {"task": "Run simulations with FM", "start": "2026-05-15", "end": "2026-05-29", "col": 2, "color" : "lightgrey", "hatch" : "/", "hatchcolor" : "white"},
    {"task": "Run simulations with FM", "start": "2026-05-29", "end": "2026-06-26", "col": 0, "color" : "lightgrey", "hatch" : "/", "hatchcolor" : "white"},
    {"task": "Theoretical  analysis of                the simulations with FM",   "start": "2026-05-29", "end": "2026-06-26", "col": 1, "color" : "white", "hatch" : "/", "hatchcolor" : "lightgrey"},
    {"task": "Theoretical work",   "start": "2026-06-26", "end": "2026-07-10", "col": 0, "color" : "white", "hatch" : "/", "hatchcolor" : "lightgrey"},
    {"task": "Write report", "start": "2026-06-26", "end": "2026-07-03", "col": 1, "color" : "white", "hatch" : "-", "hatchcolor" : "lightgrey"},
    {"task": "Prepare conference slides", "start": "2026-07-03", "end": "2026-07-10", "col": 1, "color" : "lightgrey", "hatch" : "\\\\", "hatchcolor" : "white"},
    {"task": "Write report", "start": "2026-05-29", "end": "2026-06-26", "col": 2, "color" : "white", "hatch" : "-", "hatchcolor" : "lightgrey"},
    {"task": "Write report", "start": "2026-07-10", "end": "2026-07-21", "col": 1, "color" : "white", "hatch" : "-", "hatchcolor" : "lightgrey"},
    {"task": "Modified FM setup", "start": "2026-06-26", "end": "2026-08-07", "col": 2, "color" : "lightgrey", "hatch" : "-", "hatchcolor" : "white"},
    {"task": "Prepare conference presentation", "start": "2026-07-10", "end": "2026-07-21", "col": 0, "color" : "lightgrey", "hatch" : "\\\\", "hatchcolor" : "white"},
    {"task": "Finalize the first draft",   "start": "2026-07-21", "end": "2026-08-07", "col": 0, "color" : "white", "hatch" : "-", "hatchcolor" : "lightgrey"},
    {"task": "Finish the report",   "start": "2026-08-07", "end": "2026-08-20", "col": 0, "color" : "white", "hatch" : "-", "hatchcolor" : "lightgrey"}
]

vertical_gantt(tasks)

