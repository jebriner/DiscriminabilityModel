#161206 Jennifer Briner
#Discriminability modeling: JND comparison script
#-------------------------------------------------

#Goal: compare the spectral sensitivities of different butterfly species/sexes
#Inputs: spreadsheets generated by SPEC

#----------------------

rm(list = ls())
library(DT)
library(gsubfn)

#preliminaries 
#-------------

#read in data - only choose 1 option per run

#1. if Kyle's data
setwd("/home/jbriner/Dropbox/School/UCI/Briscoe/Experiments/DiscriminabilityModeling/MyOutput/KyleDataAsInput/161206_Her_Hmel_His_MF_WithIrradianceVK_rhodopsintemplates")
  herato_f_Kyle.df <- read.delim("R_161206_Herato_female_Kyle.csv", header=TRUE, sep = ",", row.names=1)
  herato_m_Kyle.df <- read.delim("R_161206_Herato_male_Kyle.csv", header=TRUE, sep = ",", row.names=1)
  hismenius_f_Kyle.df <- read.delim("R_161206_Hismenius_female_Kyle.csv", header=TRUE, sep = ",", row.names=1)
  hismenius_m_Kyle.df <- read.delim("R_161206_Hismenius_male_Kyle.csv", header=TRUE, sep = ",", row.names=1)
  hmelpomene_f_Kyle.df <- read.delim("R_161206_Hmelpomene_female_Kyle.csv", header=TRUE, sep = ",", row.names=1)
  hmelpomene_m_Kyle.df <- read.delim("R_161206_Hmelpomene_male_Kyle.csv", header=TRUE, sep = ",", row.names=1)

#2. if Palacios data
setwd("/home/jbriner/Dropbox/School/UCI/Briscoe/Experiments/DiscriminabilityModeling/MyOutput/PalaciosDataAsInput/161130_HerMF_Hmel_His_WithIrradianceVK")
  herato_f_Palacios.df <- read.delim("R_161130_Heratofem_Palacios.csv", header=TRUE, sep = ",", row.names=1)
  herato_m_Palacios.df <- read.delim("R_161130_Heratomale_Palacios.csv", header=TRUE, sep = ",", row.names=1)
  hismenius_mf_Palacios.df <- read.delim("R_161130_Hismenius_Palacios.csv", header=TRUE, sep = ",", row.names=1)
  hmelpomene_mf_Palacios.df <- read.delim("R_161130_Hmelpomene_Palacios.csv", header=TRUE, sep = ",", row.names=1)
  
#----------------------------- 
  
  #manually modify these names each time - this string feeds into write.csv
    species1 <- "HeratoFKyle"  
    species2 <- "HeratoMKyle"
    
  #manually set groups to compare
        species1.df <-herato_f_Kyle.df
        species2.df <-herato_m_Kyle.df
        
  #manually set JND boundaries
    number_LessThan <- 0.35
    number_GreaterThan <- 1.0
    
#----------------------------- 

#Make a new data frame for the species1/species2 JND comparison. 
  #This df reads TRUE for cells where both conditions are met: one species is less than (number_LessThan) and the other is greater than (number_GreaterThan)
   
   JNDcompare.df = as.data.frame(
      (species1.df > number_GreaterThan & species2.df < number_LessThan)) | 
      (species2.df > number_GreaterThan & species1.df < number_LessThan)
        

#Get the names of the wavelength pairs with significant JND differences between species1/species2. [DONE]
  
  #1. Report back the coordinates where each element reads TRUE in JNDcompare.df. 
      JNDlist.df <- data.frame(ind= which(JNDcompare.df == "TRUE", arr.ind=TRUE))
          
  #2. Add helpful wavelength names to the row and column numbers in JNDlist.df
      JNDlist.df$wavelength1 <- rownames(JNDcompare.df)[JNDlist.df$ind.row]
      JNDlist.df$wavelength2 <- colnames(JNDcompare.df)[JNDlist.df$ind.col]
        
      #Cleaning 
        JNDlist.df$wavelength2 <-gsubfn(".", list("X"="", "."=" "), JNDlist.df$wavelength2) #Regular expression: remove "X" and "." from strings in the wavelength2 column 
        JNDlist.df[1:2] <- list(NULL) #remove now unnecessary columns
        
   #3. Filter the df to only contain unique wavelength pairs: remove all duplicates [where (row, column) = (column, row)] 
     JNDlist_filtered.df  <- unique(t(apply(JNDlist.df, 1, sort)))
        
    
  #4. Add the JND values for the species compared into the df [nice to have, but not necessary] [NEEDS WORK]
    

  
#Save output to csv [DONE]
#------------------------------
  
  date = Sys.Date()
    
  #write output to csv
    write.csv(x=JNDlist_filtered.df, file=paste("JNDcompare", species1, species2, "Greater", number_GreaterThan, "Lesser", number_LessThan, sep="_", date))


    