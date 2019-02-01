# noisy-terrain
by Annie Su, anniesu1

## Procedural Terrain Techniques Used
- Fractal brownian motion (fbm): utilized fbm to take an input of (x, z) coordinates and return a float used to map terrain elevation. The result looks like cloudy mountains. 
- Perlin noise: utilized perlin noise in the same way as fbm--to generate a height map. To obtain more level plains and craggier mountains, I raised the noise output to an exponent greater than 1.
- Height redistribution: redistributed and clamped height to create a biome with sharp plateaus. 

## External Resources
Referenced perlin noise function from 
[here](https://gist.github.com/patriciogonzalezvivo/670c22f3966e662d2f83)

## Link to github.io Demo
https://anniesu1.github.io/hw01-noisy-terrain/
