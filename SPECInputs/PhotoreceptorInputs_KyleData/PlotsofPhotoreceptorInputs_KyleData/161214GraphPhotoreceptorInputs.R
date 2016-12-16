#161214
#Get a sense for photoreceptor input files for the SPEC analysis. 
#Data is based on Kyle's rhodopsin template curves for photoreceptor sensitivity (experimentally derived via electrophysiology).


rm(list = ls())
library(ggplot2)
library(dplyr)
library(splitstackshape)


setwd("/home/jbriner/Dropbox/School/UCI/Briscoe/Experiments/DiscriminabilityModeling/JNDCompareSpecies/inputspec4_photoreceptors/KyleTemplates/ProcessedData_JB")

hismen_f.df <- read.delim("161121_Hismenius_female_averaged_sensitivities_rhodopsin_JB.csv", header=TRUE, sep = ",")
hismen_m.df <- read.delim("161121_Hismenius_male_averaged_sensitivities_rhodopsin_JB.csv", header=TRUE, sep = ",")

hmelp_f.df <- read.delim("161121_Hmelpomene_female_averaged_sensitivities_rhodopsin_JB.csv", header=TRUE, sep = ",")
hmelp_m.df <- read.delim("161121_Hmelpomene_male_averaged_sensitivities_rhodopsin_JB.csv", header=TRUE, sep = ",")

herato_f.df <- read.delim("Heliconius erato McCulloch female 2016", header=TRUE, sep = ",")
herato_m.df <- read.delim("Heliconius erato McCulloch UV2 male 2016", header=TRUE, sep = ",")
herato_h.df <- read.delim("Heliconius erato McCulloch UV1 male 2016 hypothetical", header=TRUE, sep = ",")

#Plots -----------------------------------------------------------------

herato_f_plot <- ggplot(data.frame(herato_f.df), aes(x=Wavelength)) + 
  geom_line(aes(y = UV, color = "UV"), size = 1.5 ) + 
  geom_line(aes(y = VS, color = "VS"), size = 1.5 ) +
  geom_line(aes(y = M, color = "M"), size = 1.5 ) +
  geom_line(aes(y = L, color = "L"), size = 1.5 ) +
    ggtitle("Spectral sensitivity: H. erato females") +
    labs(x="wavelength", y="absorption") +
    theme(plot.title = element_text(family = "Trebuchet MS", color="#000066", face="bold", size=24)) +
    theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=16)) 

herato_m_plot <- ggplot(data.frame(herato_m.df), aes(x=Wavelength)) + 
  geom_line(aes(y = VS, color = "VS"), size = 1.5 ) +
  geom_line(aes(y = M, color = "M"), size = 1.5 ) +
  geom_line(aes(y = L, color = "L"), size = 1.5 ) +
  ggtitle("Spectral sensitivity: H. erato males") +
  labs(x="wavelength", y="absorption") +
  theme(plot.title = element_text(family = "Trebuchet MS", color="#000066", face="bold", size=24)) +
  theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=16)) 

herato_h_plot <- ggplot(data.frame(herato_h.df), aes(x=Wavelength)) + 
  geom_line(aes(y = UV, color = "UV"), size = 1.5 ) +
  geom_line(aes(y = M, color = "M"), size = 1.5 ) +
  geom_line(aes(y = L, color = "L"), size = 1.5 ) +
  ggtitle("Spectral sensitivity: H. erato hypothetical males") +
  labs(x="wavelength", y="absorption") +
  theme(plot.title = element_text(family = "Trebuchet MS", color="#000066", face="bold", size=24)) +
  theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=16)) 




hismen_m_plot <- ggplot(data.frame(hismen_m.df), aes(x=wavelength)) + 
  geom_line(aes(y = UV1..template.365, color = "UV1"), size = 1.5 ) + 
  geom_line(aes(y = B..template.445, color = "B"), size = 1.5 ) +
  geom_line(aes(y = LW..template.565, color = "L"), size = 1.5 ) +
  ggtitle("Spectral sensitivity: H. ismenius males") +
  labs(x="wavelength", y="absorption") +
  theme(plot.title = element_text(family = "Trebuchet MS", color="#000066", face="bold", size=24)) +
  theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=16)) 

hismen_f_plot <- ggplot(data.frame(hismen_f.df), aes(x=wavelength)) + 
  geom_line(aes(y = UV1..template.365, color = "UV1"), size = 1.5 ) + 
  geom_line(aes(y = B..template.445, color = "B"), size = 1.5 ) +
  geom_line(aes(y = LW..template.565, color = "L"), size = 1.5 ) +
  ggtitle("Spectral sensitivity: H. ismenius females") +
  labs(x="wavelength", y="absorption") +
  theme(plot.title = element_text(family = "Trebuchet MS", color="#000066", face="bold", size=24)) +
  theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=16)) 



hmelp_f_plot <- ggplot(data.frame(hmelp_f.df), aes(x=wavelength)) + 
  geom_line(aes(y = UV1.template..365, color = "UV1"), size = 1.5 ) + 
  geom_line(aes(y = B..template.470, color = "B"), size = 1.5 ) +
  geom_line(aes(y = LW..template.561, color = "L"), size = 1.5 ) +
  ggtitle("Spectral sensitivity: H. melpomene females") +
  labs(x="wavelength", y="absorption") +
  theme(plot.title = element_text(family = "Trebuchet MS", color="#000066", face="bold", size=24)) +
  theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=16)) 

hmelp_m_plot <- ggplot(data.frame(hmelp_m.df), aes(x=wavelength)) + 
  geom_line(aes(y = UV1..template.365, color = "UV1"), size = 1.5 ) + 
  geom_line(aes(y = B..template.470, color = "B"), size = 1.5 ) +
  geom_line(aes(y = LW..template.570, color = "L"), size = 1.5 ) +
  ggtitle("Spectral sensitivity: H. melpomene males") +
  labs(x="wavelength", y="absorption") +
  theme(plot.title = element_text(family = "Trebuchet MS", color="#000066", face="bold", size=24)) +
  theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=16)) 

