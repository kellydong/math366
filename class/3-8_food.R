Food.Type = c( "Food Type (100g)", 
    "Fat (grams)",
    "Carb (grams)", 
    "Protein (grams)", 
    "Calories", 
    "Cost (dollars)") 

# Redundant above


# Measured in 100 grams
# Dry Ingredients
Food.Type = c("Nuttela",
              "Peanut Butter",
              "Pasta",
              "Oats",
              "Soybeans",
              "Egg White Isolate")

Fat = c(30,50,2,8,25,0)

Carb = c(60,20,75,68,35,3)

Protein = c(6,25,14,13,36,80)

Calories = c(540,590,370,375,500,420)
# 540 = 30*9cal/g + 60*4cal/g + 6*4cal/g

Cost = c(0.85,0.52,0.35,0.31,2.53,6.59) 

A = data.frame(Food.Type,Fat,Carb,Protein,Calories,Cost)
# Note that when adding fat+carb+pro it will nvr be 100g because there's things the body don't take


