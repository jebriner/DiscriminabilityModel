Cone density ratios ordered from shortest to longest wavelength sensitivity

1. H. erato females: 0.09, 0.07, 0.17, 1
2. H. erato males: 0.13, 0.2, 1 
3. H. erato hypothetical males: 0.13, 0.2, 1 (where UV1/UV2 spectra switched)
4. H. melpomene: 0.09, 0.24, 1
5. H. ismenius: 0.08, 0.25, 1




**Cone density ratios (photoreceptor proportions normalized to LW)**

|   | UV1 | UV2 | B | LW | 
| ----- |:--:| --:| --:| --:|
| *H. erato* females: | 0.086580087 | 	0.078255078 | 0.168498168 |	1 | 
| *H. erato* males: | 0	| 0.12679346 | 	0.206539873	| 1 | 
| *H. melpomene* females: | 0.103333333	| 0	| 0.23	| 1| 
| *H. melpomene* males: | 0.084166667	| 0	| 0.249166667	| 1| 
| *H. ismenius* females: | 0.096570097	| 0	| 0.236763237	| 1| 
| *H. ismenius* males: | 0.084166667	| 0	| 0.249166667	| 1| 



161121
------
Got updated photoreceptor count/sensitivity data from Kyle for *H. melpomene* and *H. ismenius*. Used them to calculate cone density ratios (original data = Kyle's spreadsheet of SW cell counts). 

Results: There is little sexual dimorphism in the *H. melpomene* and *H. ismenius* counts. I might condense their cone density ratios into 1 per species so I'm not juggling unnecessary comparisons. 

Notes: The *H. melpomene* and *H. ismenius* LW counts will overstate the proportion of cells with the given photoreceptor sensitivity. The LW figures do not account for diversity in the LW cells (red-shifted cells are excluded and treated as if they were regular LW cells).




**Photoreceptor rhodopsin template peaks**

|   | UV1 | UV2 | B | LW1 | LW2 | LW-redshift | 
| ----- |:--:| --:| --:| --:| --:| --:|
|   | 355	| 0	| 470	| 532 |560 | 600 | 


**From Kyle, re: photoreceptor sensitivity files** 
"The 565 template is probably the LW rhodopsin, while the 532 template is a sort of stand in because we are not modeling coexpression. We think right now (not sure at all yet) that the 532 peak is probably due to blue and LW coexpression."




------


Initially the options I chose while running the SPEC analyses were

**File 2. Quantum cone catches.R**

+ Data format = Excel spreadsheet
+ Open reflectance data (normalized interference filter spectra)
+ Use own cone sensitivities (Palacios curves)
+ Disregard ocular media and irradiance spectrum

**File 4. Calc discriminability.R**

+ Open output file from "2. Quantum cone catches.R"
+ Compare all reflectance spectra to each other
+ Set alpha as High light intensity (T=10,000)
+ Set Weber fraction to 0.05 for all cones
+ Enter own cone density ratios, ordered from shortest to longest wavelength sensitivity
1. H. erato females: 0.09, 0.07, 0.17, 1
2. H. erato males: 0.13, 0.2, 1 
3. H. erato hypothetical males: 0.13, 0.2, 1 
4. H. melpomene: 0.09, 0.24, 1
5. H. ismenius: 0.08, 0.25, 1


**Repeated SPEC analyses with modifications requested by Adriana:** 

1. Took into account irradiance spectra
+ Used option "1: Daylight". The file was in the default library of spectral data (irradiance spectra = Daylight, Blue Sky or Forest Shade)
2. Did a Von Kries transformation.

Did the same (updated for irradiance spectra and VK) using Kyle's data as inputs. 
For Kyle's ismenius and melpomene data, I used the spectral sensitvity data calculated from the rhodopsin templates (not the average normalized response data).

