Discriminability Model
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

The amount of photoreceptor types per species is normalized: all are relative to the long-wavelength photoreceptor, which is set to 1.

Irradiance spectra is set as “Daylight” using a file in the default SPEC library. Since these are butterflies, not birds, ocular media transmittances are not specified. 


**Model assumptions:** Each cell expresses only one rhodopsin (no co-expression). There are only four photoreceptors.



---------------

###SPEC Inputs

1. Speadsheets of spectral sensitivity curves (measured from animal photoreceptors).  
 - [ Link to photoreceptor inputs ](https://github.com/jebriner/DiscriminabilityModel/tree/master/SPECInputs)
2. Spreadsheet of normalized filter spectra (measured from narrow-band wavelength filters)
 - [ Link to filter spectra ] (https://github.com/jebriner/DiscriminabilityModel/tree/master/SPECInputs/InterferenceFilterInputs)
3. Weber fraction (using a default value of **0.05**)
 - Weber's Law: the size of the JND is a constant proportion of the original stimulus value. 
 - A Weber fraction of 0.05  (delta I/I = 5/100 = 0.05) indicates that the difference threshold needed to yield the just noticeable difference is 5 units. 
4. [ Daylight irradiance file] (https://github.com/jebriner/DiscriminabilityModel/blob/master/SPEC/Daylight) from SPEC library

---------------

###SPEC Options

* [SPEC package](https://github.com/jebriner/DiscriminabilityModel/tree/master/SPEC)


**File 2. Quantum cone catches.R**

+ Data format = 3. Excel spreadsheet
+ Open reflectance data (normalized interference filter spectra)
+ Use own cone sensitivities (Kyle or Palacios data)


**File 4. Calc discriminability.R**

+ Open output file from "2. Quantum cone catches.R"
+ Compare all reflectance spectra to each other
+ Disregard the ocular media
+ Take into account irradiance spectra (use Daylight irradiance spectra)
+ Do a Von Kries transformation
+ Set alpha as "high light intensity (T=10,000)"
+ Set Weber fraction to 0.05 for all cones
+ Enter own cone density ratios, ordered from shortest to longest wavelength sensitivity

   1. H. erato females: 0.09, 0.07, 0.17, 1
 
   2. H. erato males: 0.13, 0.2, 1 
 
   3. H. erato hypothetical males: 0.13, 0.2, 1 (UV1/UV2 spectra switched)
 
   4. H. melpomene: 0.09, 0.24, 1
 
   5. H. ismenius: 0.08, 0.25, 1



-------------------------------------

###JNDcompare

* [JNDcompare](https://github.com/jebriner/DiscriminabilityModel/tree/master/JNDcompare)

JNDcompare.R is an R script I wrote for species/species JND comparisons. It quickly scans SPEC outputs for promising JND differences.

JNDcompare.R uses SPEC outputs as its inputs. The user inputs the two species to compare and the JND threshholds they'd like to use (e.g. < 0.35 and > 1). JNDcompare.R produces a list of all wavelength pairs where one species falls below the JND threshold and the other lands above it. If the JND threshholds were chosen sensibly, these listed wavelength pairs should be easily discriminated by one species and poorly discriminated by the other in a binary color choice experiment. 





