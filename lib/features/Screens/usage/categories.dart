List<String> categories = ["Vegetables", "Fruits", "Dry Fruits"];

  List<String> getSubCategories(String category) {
    switch (category) {
      case "Vegetables":
        return [
          "Leafy Greens",
          "Root Vegetables",
          "Cruciferous Vegetables",
          "General Vegetables",
          "All Vegetables"
        ];
      case "Fruits":
        return [
          "Organic Fruits",
          "Stone Fruits",
          "Citrus Fruits",
          "General Fruits",
          "All Fruits"
        ];
      case "Dry Fruits":
        return ["Nuts", "Dried Fruits", "All Dry Fruits"];
      default:
        return [];
    }
  }

  List<String> getItemsByCategory(String category, String subCategory) {
    switch (category) {
      case "Vegetables":
        switch (subCategory) {
          case "Leafy Greens":
            return ["Spinach", "Lettuce", "Kale", "Chard"];
          case "Root Vegetables":
            return ["Carrot", "Beets", "Potatoes", "Radishes"];
          case "Cruciferous Vegetables":
            return ["Broccoli", "Cauliflower", "Cabbage"];
          case "General Vegetables":
            return [
              "Brinjals",
              "Cucumbers",
              "Garlic",
              "Onion",
              "Pepper",
              "Zucchinis"
            ];
          case "All Vegetables":
            return [
              "Brinjals",
              "Broccoli",
              "Cabbage",
              "Carrot",
              "Cucumbers",
              "Garlic",
              "Onion",
              "Pepper",
              "Potatoes",
              "Spinach",
              "Tomato",
              "Zucchinis",
              "Chard",
              "Lettuce",
              "Kale",
              "Beets",
              "Radishes",
              "Cauliflower"
            ];
          default:
            return [];
        }
      case "Fruits":
        switch (subCategory) {
          case "Organic Fruits":
            return [
              "Red Apples",
              "Green Apples",
              "Banana",
              "Blueberry",
              "Grapes",
              "Strawberry"
            ];
          case "Stone Fruits":
            return ["Apricots", "Cherry", "Mango", "Peaches", "Plums"];
          case "Citrus Fruits":
            return ["Oranges", "Tangerine", "Lemons", "Limes", "Grapefruits"];
          case "General Fruits":
            return [
              "Avocado","Cantaloupe","Fig","Kiwi",
              "Pineapple","Pomegranate","Redberry","Watermelons","Mixed berries"
            ];
          case "All Fruits":
            return [
              "Apricots","Avocado","Banana","Blueberry",
              "Cantaloupe","Cherry","Grapes","Fig","Kiwi","Oranges","Mango",
              "Mixed berries","Peaches","Pineapple","Pomegranate",
              "Redberry","Strawberry","Watermelons","Red Apples",
              "Green Apples","Plums","Tangerine","Lemons","Limes","Grapefruits"
            ];
          default:
            return [];
        }
      case "Dry Fruits":
        switch (subCategory) {
          case "Nuts":
            return ["Almonds", "Cashews", "Walnuts", "Pistachios"];
          case "Dried Fruits":
            return ["Dates", "Raisins", "Dried apricots", "Dried figs"];
          case "All Dry Fruits":
            return [
              "Almonds",
              "Brazilian nuts",
              "Cashews",
              "Dates",
              "Dried apricots",
              "Dried figs",
              "Hazelnuts",
              "Pistachios",
              "Raisins",
              "Walnuts"
            ];
          default:
            return [];
        }
      default:
        return [];
    }
  }
  Map<String, double> productPrices = {
  // Vegetables
  "Spinach": 3.50,
  "Lettuce": 2.80,
  "Kale": 4.00,
  "Chard": 3.30,
  "Carrot": 1.50,
  "Beets": 2.00,
  "Potatoes": 1.80,
  "Radishes": 1.20,
  "Broccoli": 2.90,
  "Cauliflower": 3.10,
  "Cabbage": 2.50,
  "Brinjals": 2.70,
  "Cucumbers": 1.40,
  "Garlic": 0.80,
  "Onion": 1.20,
  "Pepper": 2.10,
  "Zucchinis": 2.00,
  "Tomato": 1.90,

  // Fruits
  "Red Apples": 3.00,
  "Green Apples": 3.20,
  "Banana": 1.00,
  "Blueberry": 4.50,
  "Grapes": 3.80,
  "Strawberry": 3.50,
  "Apricots": 5.00,
  "Cherry": 6.00,
  "Mango": 4.20,
  "Peaches": 3.90,
  "Plums": 4.00,
  "Oranges": 2.50,
  "Tangerine": 2.70,
  "Lemons": 2.00,
  "Limes": 2.30,
  "Grapefruits": 3.00,
  "Avocado": 2.80,
  "Cantaloupe": 3.10,
  "Fig": 5.50,
  "Kiwi": 4.00,
  "Pineapple": 4.50,
  "Pomegranate": 3.80,
  "Redberry": 4.70,
  "Watermelons": 6.00,

  // Dry Fruits
  "Almonds": 10.00,
  "Cashews": 8.50,
  "Walnuts": 9.00,
  "Pistachios": 10.50,
  "Dates": 7.00,
  "Raisins": 5.50,
  "Dried apricots": 6.00,
  "Dried figs": 6.50
};