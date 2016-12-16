#161215
#Get a sense for photoreceptor input files for the SPEC analysis. 
#Data is based on the Palacios 1995 curves for photoreceptor sensitivity (experimentally derived via electrophysiology).


rm(list = ls())
library(ggplot2)
library(dplyr)
library(splitstackshape)


setwd("/home/jbriner/Dropbox/School/UCI/Briscoe/Experiments/DiscriminabilityModeling/JNDCompareSpecies/inputspec4_photoreceptors/Palacios1995Templates/PhotoreceptorInputs_Palacios1995")

hismen_x.df <- read.delim("H_ismenius_Palacios1996.csv", header=TRUE, sep = ",") #no male/female distinction for the H. ismenius Palacios inputs.
hmelp_x.df <- read.delim("H_melpomene_Palacios1996.csv", header=TRUE, sep = ",") #no male/female distinction for the H. melpomene Palacios inputs.
herato_f.df <- read.delim("H_erato_female_Palacios1996.csv", header=TRUE, sep = ",")
herato_m.df <- read.delim("H_erato_male_Palacios1996.csv", header=TRUE, sep = ",")

#Plots -----------------------------------------------------------------

herato_f_plot <- ggplot(data.frame(herato_f.df), aes(x=Wavelength)) + 
  geom_line(aes(y = UV, color = "UV"), size = 1.5 ) + 
  geom_line(aes(y = VS, color = "VS"), size = 1.5 ) +
  geom_line(aes(y = M, color = "M"), size = 1.5 ) +
  geom_line(aes(y = L, color = "L"), size = 1.5 ) +
    ggtitle("Spectral sensitivity: H. erato females [Palacios 1995]") +
    labs(x="wavelength", y="absorption") +
    theme(plot.title = element_text(family = "Trebuchet MS", color="#000066", face="bold", size=24)) +
    theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=16)) 

herato_m_plot <- ggplot(data.frame(herato_m.df), aes(x=Wavelength)) + 
  geom_line(aes(y = VS, color = "VS"), size = 1.5 ) +
  geom_line(aes(y = M, color = "M"), size = 1.5 ) +
  geom_line(aes(y = L, color = "L"), size = 1.5 ) +
  ggtitle("Spectral sensitivity: H. erato males [Palacios 1995]") +
  labs(x="wavelength", y="absorption") +
  theme(plot.title = element_text(family = "Trebuchet MS", color="#000066", face="bold", size=24)) +
  theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=16)) 


hismen_x_plot <- ggplot(data.frame(hismen_x.df), aes(x=Wavelength)) + 
  geom_line(aes(y = UV, color = "UV"), size = 1.5 ) + 
  geom_line(aes(y = M, color = "M"), size = 1.5 ) +
  geom_line(aes(y = L, color = "L"), size = 1.5 ) +
  ggtitle("Spectral sensitivity: H. ismenius [Palacios 1995]") +
  labs(x="wavelength", y="absorption") +
  theme(plot.title = element_text(family = "Trebuchet MS", color="#000066", face="bold", size=24)) +
  theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=16)) 


hmelp_x_plot <- ggplot(data.frame(hmelp_x.df), aes(x=Wavelength)) + 
  geom_line(aes(y = UV, color = "UV"), size = 1.5 ) + 
  geom_line(aes(y = M, color = "B"), size = 1.5 ) +
  geom_line(aes(y = L, color = "L"), size = 1.5 ) +
  ggtitle("Spectral sensitivity: H. melpomene [Palacios 1995]") +
  labs(x="wavelength", y="absorption") +
  theme(plot.title = element_text(family = "Trebuchet MS", color="#000066", face="bold", size=24)) +
  theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=16)) 



