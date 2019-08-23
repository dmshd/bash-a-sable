# line-height impacting box size 

The line-height value affects rendering even in the absence of text, since “'line-height' specifies the minimal height of line boxes within the element. The minimum height consists of a minimum height above the baseline and a minimum depth below it, exactly as if each line box starts with a zero-width inline box with the element's font and line height properties.” (CSS 2.1 about line-height.)  

But that’s really not the cause here. Images are by default rendered inline, meaning that they act as big (or maybe small) letters, sitting on the baseline of text. The details are complicated, but by setting line-height considerably smaller than font size, you put baselines closer to each other and the space vanishes.  

Another way to remove the disturbing effect is to set display: block on the img element. Then the element will be formatted in a different way.  

Yet another way is to set vertical-align: bottom on the img element.  
