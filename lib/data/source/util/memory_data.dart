import "package:aroma_mobile/data/model/recipe_model.dart";
import "package:aroma_mobile/data/model/tag_model.dart";

// Tags

abstract class MockTags {
  static const dinner = TagModel(id: 1, name: "Dinner");
  static const lunch = TagModel(id: 2, name: "Lunch");
  static const breakfast = TagModel(id: 3, name: "Breakfast");
  static const snack = TagModel(id: 4, name: "Snack");
  static const dessert = TagModel(id: 5, name: "Dessert");
  static const asian = TagModel(id: 6, name: "Asian");
  static const italian = TagModel(id: 7, name: "Italian");
  static const mexican = TagModel(id: 8, name: "Mexican");
  static const indian = TagModel(id: 9, name: "Indian");
  static const french = TagModel(id: 10, name: "French");
  static const japanese = TagModel(id: 11, name: "Japanese");
  static const korean = TagModel(id: 12, name: "Korean");
  static const thai = TagModel(id: 13, name: "Thai");
}

// Recipes

// TODO: Populate recipe JSON, tags, and nutrition.
abstract class MockRecipes {
  static const tebaShio = RecipeModel(
    id: "1",
    title: "Teba Shio",
    imageUrl: "https://www.justonecookbook.com/wp-content/uploads/2019/09/Teba-Shio-9791-II.jpg",
    rating: 8,
    prepTime: 10,
    cookTime: 20,
    servings: 3,
    difficulty: 1,
    tags: [
      MockTags.dinner,
      MockTags.asian,
      MockTags.japanese,
    ],
    descriptionRaw:
        "Juicy and crispy Japanese Salted Chicken Wings (Teba Shio) are a popular dish at izakaya restaurants. With my unbelievably easy recipe and a few ingredients, you can oven-broil these delicious wings at home for your next party, game-day spread, or lazy Sunday dinner.",
    descriptionJson: "",
    ingredientsRaw:
        "2 lb chicken wings (flats/drumettes)\n1½ cups sake\nDiamond Crystal kosher salt\n▢freshly ground black pepper\nshichimi togarashi (Japanese seven spice)\nlemon",
    ingredientsJson: "",
    directionsRaw:
        "1. Before You Start…Please note that this recipe requires 10 minutes of marinating time.\nGather all the ingredients. Adjust an oven rack to the middle position. Line a baking sheet with aluminum foil (for easy cleaning) and place a wire rack on top.\n\nSoak 2 lb chicken wings (flats/drumettes) in 1½ cups sake for 10 minutes, turning the wings once.\nRemove and pat dry each wing with paper towels. Place the wings, skin side up, on the wire rack.\nSprinkle the wings with a GENEROUS amount of Diamond Crystal kosher salt and freshly ground black pepper. Flip the wings to sprinkle the other side. Keep them skin side down.\nPreheat the oven broiler on High (550ºF/288ºC) for 3 minutes before cooking. Place the baking sheet in the middle rack of the oven, about 8 inches (20 cm) away from the heating element. Cook for 9–10 minutes, until nicely browned and crispy. Then, flip the chicken to cook the other side (skin side) for another 9–10 minutes. Watch the chicken carefully so it does not to burn; if your oven is small/strong, try broiling at Medium (500ºF/260ºC) or lower the rack.\nIf you don‘t have a broiler, bake at 425–450ºF (200–230ºC) for about 45 minutes. Monitor the cooking time; the chicken is cooked through when the internal temperature is 165ºF (74ºC).",
    directionsJson: "",
    notesRaw:
        "This post was originally published in February 2011. The photos have been updated and the video is added in February 2016.",
    notesJson: "",
    nutritionRaw: "",
    nutritionJson: "",
    sourceName: "Just One Cookbook",
    sourceUrl: "https://www.justonecookbook.com/teba-shio-salted-chicken-wings/",
  );

  static const thaiRedCurry = RecipeModel(
    id: "2",
    title: "Thai Red Curry",
    imageUrl: "https://hot-thai-kitchen.com/wp-content/uploads/2015/05/red-curry-kabocha-sq-2.jpg",
    rating: 7,
    prepTime: 20,
    cookTime: 25,
    servings: 4,
    difficulty: 2,
    tags: [
      MockTags.dinner,
      MockTags.asian,
      MockTags.thai,
    ],
    descriptionRaw:
        "This classic recipe is a great one to start with if you've never made a Thai curry before. Easy, but totally delicious and fail-proof. The creamy squash goes wonderfully with red curry, but feel free to change up the veggies!",
    descriptionJson: "",
    ingredientsRaw:
        "2 cups kabocha squash, bite-sized pieces\n▢1 ½ cup coconut milk\n3½-5 tablespoon red curry paste\n1 lb chicken thigh\n▢1 cup chicken stock, unsalted or low sodium\n▢2 tablespoon fish sauce\n2-3 tablespoon palm sugar, finely chopped\n1 cup Thai basil leaves\n¼ red bell pepper, julienned (optional for colour)",
    ingredientsJson: "",
    directionsRaw:
        "1. Wash the kabocha squash and slice off any part of the skin that has blemishes, otherwise the skin can be left on. Remove the seeds by scraping off with a spoon and cut into bite-sized cubes. If you have leftover squash, try using it in this stir-fry recipe!\n2. Bring ½ cup of coconut milk to a boil, add curry paste and stir to break up lumps. Continue cooking and reducing over medium high heat until it is very thick and the coconut oil starts separating from the curry paste (if the paste is very thick but no oil is separating, don't worry, just proceed with the recipe).\n3. Add the chicken and toss to mix with the paste. Add the remaining coconut milk and the chicken stock. Season with 1 tablespoon (15 ml) of the fish sauce and the palm sugar, then simmer for about 8 minutes.\n4. Add the kabocha squash and simmer for about 6-8 minutes, or until the squash is fully cooked and can easily be pierced through with a fork. Be careful not to overcook the squash or it’ll turn to mush.\n5. Remove from heat and adjust seasoning with the remaining fish sauce as needed; different brands of curry pastes have different amounts of salt, so it is important to taste and adjust. Stir in Thai basil and red pepper, if using. Serve immediately with jasmine rice.",
    directionsJson: "",
    notesRaw:
        "To prep kabocha, halve the squash, scoop out the seeds, then cut the half into 1-inch thick wedges. Then cut each wedge down into ½ inch thick pieces. No need to peel the skin, but if there are woody blemishes you can shave those off.",
    notesJson: "",
    nutritionRaw: "",
    nutritionJson: "",
    sourceName: "Hot Thai Kitchen",
    sourceUrl: "https://hot-thai-kitchen.com/red-curry-chicken-squash/",
  );

  static const oiMuchin = RecipeModel(
    id: "3",
    title: "오이무침",
    imageUrl: "https://recipe1.ezmember.co.kr/cache/recipe/2017/05/24/9fe380db166eeeaa796997ba21595a981.jpg",
    rating: 6,
    prepTime: 0,
    cookTime: 10,
    servings: 4,
    difficulty: 1,
    tags: [
      MockTags.snack,
      MockTags.asian,
      MockTags.korean,
    ],
    descriptionRaw: "백종원 레시피는 시간이 지나도 챙겨보게 되는데요\n오늘도 열심히 따라 합니다\n오이무침 새콤달콤 맛있게 맛있게~~",
    descriptionJson: "",
    ingredientsRaw: "오이 2개\n양파 1/2개\n고추장 1T\n고춧가루 1T\n설탕 1T\n올리고당 1T\n다진마늘 1/2T\n간장 1T\n식초 1.5T\n참기름 1T\n통깨 1T",
    ingredientsJson: "",
    directionsRaw:
        "1. 오이는 동글동글 모양살려 썰어 소금에 잠시 절여 둡니다\n2. 절인다기 보다는 양념 준비하는 동안 잠시 소금에 절인다 생각하면 됩니다\n3. 고추장(1T), 고춧가루(1T), 설탕(1T), 올리고당(1T) 다진마늘(1/2T), 간장(1T), 식초(1.5T), 참기름(1T), 통깨(1T) 섞어 양념장 만들어요\n4. 물기 꼭 짜 주고\n5. 슬라이스한 양파도 넣어요\n6. 준비한 양념장 넣고 무쳐 냅니다\n7. 새콤달콤 맛있는 오이무침 완성입니다 수분을 꼭 짜고 무친 것이라 꼬들꼬들 아삭함이 좋은 오이무침 입니다 맛있어요",
    directionsJson: "",
    notesRaw: "",
    notesJson: "",
    nutritionRaw: "",
    nutritionJson: "",
    sourceName: "10000 Recipe",
    sourceUrl: "https://www.10000recipe.com/recipe/6897261",
  );
}
