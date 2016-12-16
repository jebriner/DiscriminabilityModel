﻿Discriminability Model
-----------------------

###Purpose: 

Model differences in butterfly color perception caused by differences in rhodopsin sensitivities.

###Goal: 

For each butterfly visual system, calculate the just noticeable difference (JND) for each pair of wavelengths (within the range of 380-470 nm). 
JNDs are the units for discriminability, where a higher JND indicates a more obvious difference.

**Ultimate goal:** Select appropriate pairs of stimuli for behavioral tests of color discrimination. I want to identify wavelength pairs that are easy for one species/sex to discriminate (JND > 1), but difficult for the other (JND < 1).


###Process: 

Using the SPEC package [(Hadfield et al. 2006)](http://rspb.royalsocietypublishing.org/content/273/1592/1347.abstract?ijkey=05e2609097c5f4e30e172452a347c414e1362aa0&keytype2=tf_ipsecsha) for R, photoreceptor spectral data are reduced into 4 quantal catches that quantify the amount of light captured by each type of photoreceptor. This calculation is specific to the visual system of each species, and if visual sexual dimorphism is present, each sex. 

The visual systems used belong to *H. erato* (male and female), *H. melpomene*, and  *H. ismenius*. The photoreceptor data comes from 1) Palacios 1995 or 2) Kyle’s electrophysiology and staining results. 

The photoreceptor types used are UV (very short – ultraviolet) [missing in *H. erato* males], VS (short – violet), B (short - blue), and LWS (long – green). These refer to the range of wavelengths to which each photoreceptor type is most sensitive. Because this analysis centers on shorter wavelengths, a fifth photoreceptor type (red-shifted long-wavelength) is not included. 

Irradiance spectra is set as “Daylight” using a file in the default SPEC library. Since these are butterflies, not birds, ocular media transmittances are not specified. 

Model assumptions: Each cell expresses only one rhodopsin (no co-expression). There are only four photoreceptors.

The amount of photoreceptor types per species is normalized: all are relative to the long-wavelength photoreceptor, which is set to 1.


---------------

###SPEC Inputs

1. Speadsheets of spectral sensitivity curves (measured from animal photoreceptors): 
- [ PhotoreceptorInputs ](https://github.com/jebriner/DiscriminabilityModel/tree/master/PhotoreceptorInputs)
2. Spreadsheet of normalized filter spectra (measured from narrow-band wavelength filters)
 - [ Filter spectra 300-700 nm ] (https://github.com/jebriner/DiscriminabilityModel/tree/master/InterferenceFilterInputs)
3. Weber fraction (using a default value of **0.05**)
 - Weber's Law: the size of the JND is a constant proportion of the original stimulus value. 
 - A Weber fraction of 0.05  (delta I/I = 5/100 = 0.05) indicates that the difference threshold needed to yield the just noticeable difference is 5 units. 
4. [ Irradiance ] (https://github.com/jebriner/DiscriminabilityModel/blob/master/SPEC_OnlyNecessaryFiles/Daylight)

---------------

###SPEC Options

* [SPEC package](https://github.com/jebriner/DiscriminabilityModel/tree/master/SPEC_OnlyNecessaryFiles)


**File 2. Quantum cone catches.R**

+ Data format = Excel spreadsheet
+ Open reflectance data (normalized interference filter spectra)
+ Use own cone sensitivities
+ Disregard ocular media and irradiance spectrum


**File 4. Calc discriminability.R**

+ Open output file from "2. Quantum cone catches.R"
+ Compare all reflectance spectra to each other
+ Disregard the ocular media
+ Take into account irradiance spectra (use Daylight irradiance spectra)
+ Do a Von Kries transformation.
+ Set alpha as High light intensity (T=10,000)
+ Set Weber fraction to 0.05 for all cones
+ Enter own cone density ratios, ordered from shortest to longest wavelength sensitivity
⋅⋅* H. erato females: 0.09, 0.07, 0.17, 1
⋅⋅* H. erato males: 0.13, 0.2, 1 
⋅⋅* H. erato hypothetical males: 0.13, 0.2, 1 (where UV1/UV2 spectra switched)
⋅⋅* H. melpomene: 0.09, 0.24, 1
⋅⋅* H. ismenius: 0.08, 0.25, 1


-------------------------------------

###JNDcompare

* [JNDcompare](https://github.com/jebriner/DiscriminabilityModel/tree/master/JNDcompare)

JNDcompare is an R script I wrote for species/species JND comparisons to quickly scan SPEC outputs for promising JND differences.

JNDcompare uses SPEC outputs as its inputs.





