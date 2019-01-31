# noisy-terrain
by Annie Su, anniesu1

## Procedural Terrain Techniques Used
- Fractal brownian motion (fbm): utilized fbm to take an input of (x, z) coordinates and return a float used to map terrain elevation. The result looks like cloudy mountains. 
- Perlin noise: utilized perlin noise in the same way as fbm--to generate a height map. To obtain more level plains and craggier mountains, I raised the noise output to an exponent greater than 1.
- Worley noise: I used worley noise to construct a voronoi grid that dictates the different biome sections of the entire terrain.

## External Resources
Referenced perlin noise function from 
[here](https://gist.github.com/patriciogonzalezvivo/670c22f3966e662d2f83)

## Link to github.io Demo
A link to your live github.io demo (refer to the pinned Piazza post on how to make a live demo through github.io)
An explanation of the techniques you used to generate your planet features. Please be as detailed as you can; 
not only will this help you explain your work to recruiters, but it helps us understand your project when we grade it!
