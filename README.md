# convert_gridrefs
Convert UK grid references to spatial points for mapping

Grid references are a standard spatial reference used in the UK.  In the world of biological recording they are one of the key components of a biological record.
However, they cannot be mapped as standard without conversion into another format.

This repo provides a script and an example data set of biological records, showing how to convert UK grid references into points fro mapping.
This achieved using the R packages 'rnrfa' and 'sf' by converting the Eastings and Nirthings for each grid reference into a Well Known Text (WKT) representation of the points.
A webmap of these points can then be created.

A blogpost describing this in more detaisl in on my website: [dan-carpenter.co.uk](www.dan-carpenter.co.uk)
