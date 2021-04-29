######################## HI!

### set working directory
setwd("C:/Users/ddaya/OneDrive/R Workshop")
    # this is where we'll retrieve our data from
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  IMPORT AND EXPORT DATA   
 # import data

      ##### .csv
        # from here https://www.kaggle.com/ajaypalsinghlo/world-happiness-report-2021 
        # download the zip file "World Happiness Report 2021"
        # from there, let's take that dataset into our folder
        # and let's import the file "world-happiness-report.csv"
        library(readr)
          world_happiness_report <- read_csv("world-happiness-report.csv")
          View(world_happiness_report) 
          
      ##### .xlsx    
        # from here https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/QZ9BSA
          # download the zip file "Authoritarian Ruling Elites Database (ARED)"
          # from there, let's take the dataset into our folder
          # and let's import the file "Argentina - Consejo Militar Revolucionario - 1955-1958.xlsx"
          library(readxl)
            Argentina_Consejo_Militar_Revolucionario_1955_1958 <- read_excel("Argentina - Consejo Militar Revolucionario - 1955-1958.xlsx")
            View(Argentina_Consejo_Militar_Revolucionario_1955_1958)
            
      #### .txt
            # from here http://courses.washington.edu/b517/Datasets/BirthsKingCounty2001.txt
            # copy paste the data into a notepad
            # save it in our folder as "my_data"
            my_data <- read.table("C:/Users/ddaya/OneDrive/R Workshop/my_data.txt", quote="\"", comment.char="")
            View(my_data)
            
  # export data
        # let's alter our datasets and export our work
            # add a new column full of zeros to this dataset
              world_happiness_report$new_column<-0
            
              ### copy-paste method
              write.table(world_happiness_report, 'clipboard', sep='\t')
                #             then just paste it at the top left of the Excel sheet or Notepad
              
              ### into an Excel file
              library(xlsx)
              write.xlsx(world_happiness_report, "new_data.xlsx") 
              
              ### into a CSV file
              write.csv(world_happiness_report,'new_data2.csv')
              
              ### into a txt file
              write.table(world_happiness_report,'new_data3.txt')
              

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Syntaxis
  # create dataframe
     data_frame(a = 1:6, b = a*2, c = 'string', 'd+e' = 1) %>% glimpse()
              
              
library(hflights) #dataset  
             
               
        # convert to dataframe
              flights<-data.frame(hflights)
              
              
        # base R approach to view all flights on January 1
              flights[flights$Month==1 & flights$DayofMonth==1, ]
              
              
        # use pipe for OR condition
         flights[flights$UniqueCarrier=="AA" | flights$UniqueCarrier=="UA", ]
              
        # in dplyr     
          # you can also use %in% operator
              filter(flights, UniqueCarrier %in% c("AA", "UA"))
              
        # show the amount of rows of a dataset
            nrow(flights)
              
        ## select: Pick columns by name
              
              
              # select DepTime, ArrTime, and FlightNum columns
              flights[, c("DepTime", "ArrTime", "FlightNum")]
              
              # select those same columns by index
              flights[, c(5, 6, 8)]
              
              # EXERCISE
              # select the column "DayofMonth" 
              
              # ANSWER
              flights[, c("DepTime", "ArrTime", "FlightNum")]
              
              
              # select the first three rows
              flights[c(1:3),]
              
              # EXERCISE
              # select the first 50 rows and the last 40 rows, while also selecting column 5 
              
              # ANSWER
              flights[c(1:50, 40:nrow(flights)), 5]
              
              
              
              # create new variable
              # base R approach to create a new variable Speed (in mph)
              flights$Speed <- flights$Distance / flights$AirTime*60
              
              
              
 #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ LOOPS          
              # loops
              # for loop
              # EXMAPLE 1
              # Create fruit vector
              fruit <- c('Apple', 'Orange', 'Passion fruit', 'Banana')
              # Create the for statement
              for ( i in fruit){ 
                print(i)
              }
              # if loop
              # EXAMPLE 1
              quantity <-  25
              # Set the is-else statement
              if (quantity > 20) {
                print('You sold a lot!')
              }
              # EXAMPLE 2
              # set dataset
              fruit <- c('Apple', 'Orange', 'Passion fruit', 'Banana')
              lunches<-c(1,2,3,4)
              box<-data.frame(fruit, lunches)
              
              # Create the for loop
              for (i in (1:nrow(box))){ 
                if (box$fruit[i] == "Apple") {
                  print(box$lunches[i])
                }
              }
              
              # Exercise: create an "if" loop to identify the people that stayed for more than 2 years in the military elite in Authoritarian Argentina
              
              
              # Answer:
              for (i in (1:nrow(Argentina_Consejo_Militar_Revolucionario_1955_1958))){
                if (round(Argentina_Consejo_Militar_Revolucionario_1955_1958$ELITE_EXITAGE[i]-Argentina_Consejo_Militar_Revolucionario_1955_1958$ELITE_ENTERAGE[i]) > 2){
                  print(Argentina_Consejo_Militar_Revolucionario_1955_1958$ELITE_NAME[i])
                }
              }
              
              # if else loop
              
              #EXAMPLE 1
              
              # Create vector quantiy
              quantity <-  10
              # Create multiple condition statement
              if (quantity <20) {
                print('Not enough for today')
              } else if (quantity > 20  &quantity <= 30) {
                print('Average day')
              } else {
                print('What a great day!')
              }
              
              
              # EXERCISE
              # given this dataset:
              
              quantity <-  c(10,4,10,20,11,9)
              drinks<-c("Medalla", "Heineken", "BlueMoon", "Smirnoff", "Champagne", "Wine")
              bar_tap<-data.frame(drinks, quantity)
              
              # create an if else loop that returns:
              # 1) if quantity < 10, print drink "<--Didn't like it much"
              # 2) if quantity >=10 and quantity < 20 , print drink "<--I liked this"
              # 3) if quantity > 20 , print drink "<--I LOVED it!"
              
              
              # ANSWER
              for (i in (1:nrow(bar_tap))){
                # Create multiple condition statement
                if (bar_tap$quantity[i]<10) {
                  print(paste(bar_tap$drinks[i], "<--Didn't like it much"))
                } else if (bar_tap$quantity[i] >= 10  & bar_tap$quantity[i] < 20) {
                  print(paste(bar_tap$drinks[i], "<--I liked this"))
                } else {
                  print(paste(bar_tap$drinks[i], "<--I LOVED it!"))
                }
              }
              
              # while loop
              
              #  EXAMPLE
              
              i <- 1
              while (i < 6) {
                print(i)
                i = i+1
              }
              
              # EXERCISE
              # Make a dataframe for all countries that have a below average perception of corruption.
              # make sure to include the years each country is mentioned, because we also want to verify
              # the consistency of these countries and their low corruption
              # we don't want to move to a country that had low corruption for ONE year only!
              
              # HINT:
              # delete all NA rows
              world_happiness_report<-na.omit(world_happiness_report)
              world_happiness_report<-world_happiness_report[order(world_happiness_report$`Perceptions of corruption`),] # sort in descending order
              
              
              #ANSWER:
              
              Country<-c()
              Year<-c()
              i<-1
              while (world_happiness_report$`Perceptions of corruption`[i] < mean(world_happiness_report$`Perceptions of corruption`)) {
                Country[i]<-world_happiness_report$`Country name`[i]
                Year[i]<-world_happiness_report$year[i]
                i = i+1
              }
              Cool_Places<-data.frame(Country,Year)
              View(Cool_Places)
              
              
                            
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Manipulate Data
library(dplyr)    # for data cleaning 
          #-------------------------------------------------------------------    
              
              ## "Chaining" or "Pipelining"
              
              #* Usual way to perform multiple operations in one line is by nesting
              #* Can write commands in a natural order by using the `%>%` infix operator (which can be pronounced as "then")
              
              #########@@@@ subset
              # EXAMPLE
              # nesting method to select UniqueCarrier and DepDelay columns and filter for delays over 60 minutes
              filter(select(flights, UniqueCarrier, DepDelay), DepDelay > 60)
              
              # EXERCISE 1
              # for each carrier, calculate the percentage of flights cancelled or diverted
              
              # ANSWER
              flights %>%
                group_by(UniqueCarrier) %>%
                summarise_each(funs(mean), Cancelled, Diverted)
              
              # EXERCISE 2
              # for each carrier, calculate the minimum and maximum arrival and departure delays
             
              # ANSWER
               flights %>%
                group_by(UniqueCarrier) %>%
                summarise_each(funs(min(., na.rm=TRUE), max(., na.rm=TRUE)), matches("DepDelay"))
              
              ####@@@@ Arithmetic 
              # EXAMPLE
               # sum two row 3 to 15, of distance
               sum(flights[c(3:15), "Distance"])
               
              # EXERCISE
               # return a column that has the divition of rows 5 to 10 of DepDelay, into rows 11 to 16 of AirTime
               flights[c(5:10),"DepDelay"]/flights[c(11:16),"AirTime"]
               
              #@@@@ Functions
               # EXAMPLE
               celsius_to_kelvin <- function(temp_C) {
                 temp_K <- temp_C + 273.15
                 return(temp_K)
               }
               
               # freezing point of water in Kelvin
               celsius_to_kelvin(0)
               
               
               # EXERCISE 1
               # create a formula that multiplies a number x and a number y, and then adds a number z
               # make sure it works for:
               # 1) 1,2,3
               # 2) 4,5,3
               # 3) 0,3,7
               
               # ANSWER
               new.function <- function(x,y,z) {
                 result <- x * y + z
                 print(result)
               }
               
               new.function(1,2,3)
               new.function(4,5,3)
               new.function(0,3,7)
               
               
               
               # EXERCISE 2
               # add a column in our dataset that has the compounded interest rate of each savings account
               # please do this by creating a function that returns the compounded interest rate of each account 
               # make sure that it works for dataset1, dataset2, and dataset3
               # additionally, please round the result for 2 decimal numbers, since we are working with money
               # you can see the formula here: https://financeformulas.net/Compound_Interest.html
               
               
               # dataset 1
               Principal<-c(100,100,100,201,232,203,100,402,92) # this is in thousands
               rate_per_period<-c(0.08,0.02,0.13,0.04,0.021,0.09,0.2,0.13,0.15)
               number_of_periods<-c(12,12,12,12,6,24,12,72,12)
               myloans1<-data.frame(Principal,rate_per_period,number_of_periods)
               
               #dataset2
               myloans2<-dataset1^2
               
               #dataset3
               myloans3<-dataset1/2
               
               # ANSWER
               Compound_int <- function(dataset) {
                 my_interest<-c()
                 for (i in (1:nrow(dataset))){
                 my_interest[i] <- dataset$Principal[i]*((1+dataset$rate_per_period[i])^dataset$number_of_periods[i]-1)
                 }
                 return(my_interest)
               }
               
               myloans1$Compound_interest<-round(Compound_int(myloans1), 2)
               myloans2$Compounded_interest<-round(Compound_int(myloans2), 2)
               myloans3$Compounded_interest<-round(Compound_int(myloans3), 2)
               
              
              #@@@@@@@@@ descriptive statistics
               mean(myloans1$Principal)
               var(myloans2$Principal)
               
               summary(myloans1)
               
               
            

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ SUPERVISED MACHINE LEARNING
              
              #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
              # %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
              
              
              library(datasets)
              View(swiss)
              
              
              
              ###########################################################
              # %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
              #            EJERCICIO 1  : LINEAR REGRESSION                                
              ##########################################################
              # %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
              
              #Experimental data
              OS<-swiss
              #Exploring the data
              View(OS)
              str(OS)
              NROW(OS)
              NCOL(OS)
              #Experimental name
              OS<-swiss
              # Transformando variables 
              
              
              
              #Visualizando
              # Grafica
              plot(OS$Catholic, OS$Education)
              #anadiendo la linea de regresion
              abline(lm(Catholic~Education,OS), col="red")
              #Para detectar mejor las variables y sus funciones
              #correlacion
              cor(OS$Catholic,OS$Education)
              #Grafica
              #Matriz de correlacion
              # Third Correlogram Example
              library(corplot)
              M <- cor(OS)
              corrplot(M, method="number")
              # Realizando la regresion
              Reg <- lm(Fertility~Education, OS)
              Reg
              summary(Reg)
              
              # Cuantos ninos tendrian las mujeres en el pueblo si adquieren doctorados?
              # ***(a?os de educacion aumentarian a 23)***
              predict(Reg, data.frame("Education"=23 ))
              #  Entonces, cual seria el intervalo de confianza?
              # (El nivel de significancia es .95 por default en R)
              predict(Reg, data.frame("Education"=23 ), interval = "prediction")
              #Cuantos ni?os tendrian las mujeres del pueblo con un promedio de 
              #1 a?o de educacion y 84 horas promedio anuales dedicadas al catolicismo
              # *bien catolicas* 
              glm<-lm(Fertility~Education+Catholic, swiss)
              g<-data.frame(Education=1, Catholic=84)
              predict(glm, g )
              
      
  
              
              ###########################################################
              # %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
              #            EJERCICIO 2  : LOGIT REGRESSION                                
              ##########################################################
              # %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
              
              
              View(Titanic)
              # Paso 1: Crear dataframe experimental
              TT<- Titanic
              View(TT)
              TT<- data.frame(TT)
              
              
              # Paso 2:Limpio mis datos
              # total de observaciones esperadas
              # total de pasajeros registrados en el Titanic
              sum(TT$Freq)
              # Repito filas
              # Class
              TT<- data.frame(TT)
              T1<- TT[,-c(2,3,4)]
              T1<- rep(TT$Class, TT$Freq)
              T1<- data.frame(T1)
              View(T1)
              #Sex
              T2<- TT[,-c(1,3,4)]
              T2<-rep(T2$Sex,T2$Freq)
              T2<-data.frame(T2)
              View(T2)
              #Age
              T3<-TT[,-c(1,2,4)]
              T3<-rep(T3$Age, T3$Freq)
              T3<-data.frame(T3)
              #Survived
              T4<- TT[,-c(1,2,3)]
              T4<-rep(T4$Survived, T4$Freq)
              T4<-data.frame(T4)
              #Hago un dataframe con todo esto
              df = data.frame(T1, T2, T3, T4)
              View(df)
              # Nombro las variables
              colnames(df)<- c("Class","Sex","Age","Survived")
              
              #Paso 3: Creo mis dummies
              # Dependiente: dicotoma
              library(caret)
              dmy <- dummyVars("~ .", df)
              trsf <- data.frame(predict(dmy, newdata = df))
              View(trsf)
              
              # Identificar algunos datos curiosos
              #                     S<-sum(trsf$Survived.Yes)
              #                    C1<-sum(trsf$Class.1st)
              #                   S.F.C1<-sum(trsf$Sex.Female == 1 & trsf$Class.1st==1 
              #                                     & trsf$Survived.Yes==1) 
              #                 S.M.C1<-sum(trsf$Sex.Male == 1 & trsf$Class.1st==1 
              #                            & trsf$Survived.Yes==1)
              #               S.F.C<-sum(trsf$Sex.Female == 1 & trsf$Class.Crew==1 
              #                          & trsf$Survived.Yes==1) 
              #             S.M.C<-sum(trsf$Sex.Male == 1 & trsf$Class.Crew==1 
              #                        & trsf$Survived.Yes==1)
              #           S.F<-sum(trsf$Sex.Female == 1 
              #                   & trsf$Survived.Yes==1)
              #         S.M<-sum(trsf$Sex.Male == 1 
              #                 & trsf$Survived.Yes==1)
              
              # Paso 5: Realizo Regresion
              logit1 <- glm(Survived.Yes ~Class.1st+Class.2nd+Class.3rd+Class.Crew,
                            family=binomial(link='logit'), trsf)
              summary(logit1)
              # Dato: singularidad significa que hay multicolinearidad perfecta
              
              # Paso 6: Intervalos de confianza
              conf<-confint(logit1)
              # Paso 7: Interpretacion
              # Tranformacion de vuelta a lass unidades originales
              # para deshacernos del log lo multiplicamos por un exponencial
              # Primero de los coeficientes
              Resultados<-exp(logit1$coefficients)
              # Segundo de los limites del intervalo de confianza
              Intervalo<-exp(conf)
              # Los observamos
              #Resultados
              # Interpretamos
              # Intercepto:
              
              # La probabilidad de no sobrevivir el Titanic es de .3150074
              # cuando no se pertenece a ninguna clase
              # Class.1st
              
              # El estar en primera clase aumentaba las probabilidades
              #de sobrevivir el Titanic por 5.28  
              # o simplemente aumenta por 5 veces las 
              # probabilidades de supervivencia   
              
              
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Decision Tree
              set.seed(678)
              path <- 'https://raw.githubusercontent.com/guru99-edu/R-Programming/master/titanic_data.csv'
              titanic <-read.csv(path)
              #Convert to factor level
              titanic<-titanic[,-c(13, 9, 11, 4, 1)]
              titanic<-na.omit(titanic)
              titanic$sex<-as.factor(titanic$sex)
              titanic$embarked<-as.factor(titanic$embarked)
              titanic$fare<-as.numeric(titanic$fare)
              titanic$age<-as.numeric(titanic$age)
            
              library(rpart)
              library(rpart.plot)
              
              fit <- rpart(survived~., data = titanic, method = 'class')
              rpart.plot(fit, extra = 106)
              

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Forecasting
              # import stock data
              library(quantmod)
              getSymbols("GOOGL",src="yahoo") # confirm if this is the GOOGLE data
              GOOGLE<- GOOGL[,"GOOGL.Close"] # choose the closing price of the stock
              class(GOOGLE) # with this, we confirm that our class is "xts", and "zoo" means that GOOGLE
              # stock is in time index format
              GOOGLE<- GOOGLE[(index(GOOGLE) >= "2015-01-01" & index(GOOGLE) <= "2020-12-31"),] 
       
            GOOGLE<-na.omit(GOOGLE)
              ### Point Forecasts
              # Note: A point forecast is the mean of all possible future sample paths. So the point forecasts are usually much less variable than the data.
              # we will forecast for the next 10 days 
              
              library(forecast)
              m_ets = ets(GOOGLE) #exponential smoothing
              f_ets = forecast(m_ets, h=10) # forecast de exponential smoothing
              # plot( f_ets)
              
              m_aa = auto.arima(GOOGLE)  # Auto ARIMA
              f_aa = forecast(m_aa, h=10)   # forecast de ARIMA
              # plot(f_aa)
             
             
              m_holt <- HoltWinters(GOOGLE, gamma=FALSE)
              f_holt=forecast(m_holt, h = 10)   # forecast Holt's Exponential Smoothing
              # plot(f_holt)
              m_nai<- naive(GOOGLE) #naive bayes
              f_nai<-forecast(m_nai, h=10) # forecast naive bayes
              # plot(f_nai)
              m_rwf<-rwf(GOOGLE) # random walk with drift model 
              f_rwf<-forecast(m_rwf, h=10) # drift forecast
              #   plot(f_rwf)
              m_nn <- nnetar(GOOGLE)  # Neural Network
              f_nn <- forecast(m_nn, h=10)       # forecast Neural Network
              # plot(f_nn)
                m_a <- ma(GOOGLE,order=5) # Moving Average
              f_ma<-forecast(m_a, h=10) # forecast MA
              # plot(f_ma)
             
              
              f_aa$mean
              
              
              ### we generate graphs of the predicted values
              # png(file='gtemps1.png', width=600, height=320)  
              
              library(ggplot2)   
              gtemp.df    = data.frame(Time=c(time(f_ets$mean)), gtemp=c(f_aa$mean), gtempk=c(f_ets$mean), 
                                       gtempl=c(f_ma$mean), gtempm=c(f_nn$mean), gtempn=c(f_holt$mean), gtempo=c(f_nai$mean))
              ggplot(data = gtemp.df, aes(x=Time, y=value, color=variable )  )             +
                ylab('Price')                                 +
                geom_line(aes(y=gtemp , col='ARIMA'), size=1, alpha=.5)   +
                geom_line(aes(y=gtempk, col='ETS'),  size=1, alpha=.5)   +
                geom_line(aes(y=gtempl, col='Moving Average'),  size=1, alpha=.5)   +
                geom_line(aes(y=gtempm, col='Neural Network'),  size=1, alpha=.5)   +
                geom_line(aes(y=gtempn, col='Holt Winters'),  size=1, alpha=.5)   +
                geom_line(aes(y=gtempo, col='Naive Bayes'),  size=1, alpha=.5)   +
                theme(legend.position=c(.1,.85))	         
              #  dev.off() 
              
              
              
              
              
              # graph of model performance
              # png(file='gtemps2.png', width=600, height=320)  
              
              library(ggplot2)   
              gtemp.df    = data.frame(Time=c(time(GOOGLE)), gtemp=c(f_aa$fitted), gtempk=c(f_ets$fitted), gtempl=c(f_holt$fitted), 
                                       gtempm=c(f_nn$fitted), gtempn=c(GOOGLE$GOOGL.Close), gtempo=c(f_nai$fitted))
              ggplot(data = gtemp.df, aes(x=Time, y=value, color=variable )  )             +
                ylab('Price')                                 +
                geom_line(aes(y=gtemp , col='ARIMA'), size=1, alpha=.5)   +
                geom_line(aes(y=gtempk, col='ETS'),  size=1, alpha=.5)   +
                geom_line(aes(y=gtempl, col='Holt Winters'),  size=1, alpha=.5)   +
                geom_line(aes(y=gtempm, col='Neural Network'),  size=1, alpha=.5)   +
                geom_line(aes(y=gtempn, col='GOOGLE'),  size=1, alpha=.5)   +
                geom_line(aes(y=gtempo, col='Naive Bayes'),  size=1, alpha=.5)   +
                theme(legend.position=c(.1,.85))	         
              
              #  dev.off() 
              
              
