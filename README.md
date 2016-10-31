# Hotel

### Background

This is a short exercise that was originally a technical interview challenge.

With this code you can create guests, rooms, and reservations. You can check if a room is booked or available for a given date range.

There are potentially 4 different cases to consider, when checking the status of a room:
* leading overlap  (starts before, ends during)
* trailing overlap (starts during, ends after)
* inside overlap   (starts during, ends during)
* outside overlap  (starts before, ends after)

However, upon further inspection, I have discovered that there are not 4 separate cases. Instead, there is only 1 case.

### Availability Checking

In the Room class, there is a simple algorithm that will check for availability.

The use specifies a desired room and date range. The algorithm then iterates over all of the reservations associated with the given room, and check if there is any overlap of the existing date ranges and the desired date range.
