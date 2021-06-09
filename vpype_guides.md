# vpype guide
## Dimensions
Plotter drawing area is:   `22.5cm x 25cm`
A page from this book is:  `14cm x 19cm`

## Left Page
Assuming the svg is correct orientation as is, all that is left is to scale it to the page:

parameters:
	* dimension to scale to
```zsh
vpype read example.svg layout 14cmx19cm scaleto 11cm 11cm write example.svg
```

## Right Page
You must flip the svg horizontally and vertically.
If rotated, then align it to the right side of the page.
