#put fetches here
require 'rest-client'
require 'json'
require 'pry'
require_relative '../../config/api_key'

mock_data = {"imageUrlsBySize"=>{"90"=>"https://lh3.googleusercontent.com/IXpbjcvk0HF21MPAtknrWGKpTK_xW315leDnQuDfIWZuRhRu30pe-je7Ip8qN9ceN-O8es9zV4FWPxd8oyMJH6I=s90-c"}, "sourceDisplayName"=>"Life in the Lofthouse", "ingredients"=>["bow tie pasta", "romaine lettuce", "medium tomato", "bacon strips", "ranch dressing", "barbecue sauce", "pepper"], "id"=>"BLT-Pasta-Salad-1577845", "smallImageUrls"=>["https://lh3.googleusercontent.com/c5BCV3gyYk5kZa_WbqK0drV0NC-EUIxiOU-W5AEHoTi4wc0PhKay4sEPxlVT9jFOPyvFHUBniBarMN3zTyCHjQ=s90"], "recipeName"=>"BLT Pasta Salad", "totalTimeInSeconds"=>1200, "attributes"=>{"course"=>["Salads", "Lunch"]}, "flavors"=>{"piquant"=>0.16666666666666666, "meaty"=>0.16666666666666666, "bitter"=>0.5, "sweet"=>0.16666666666666666, "sour"=>0.6666666666666666, "salty"=>0.3333333333333333}, "rating"=>4}
{"imageUrlsBySize"=>{"90"=>"https://lh3.googleusercontent.com/JYfggPS9JbWW_gHxlrMMzOZkSV_p2B2sfZLMgcHKZ_xa27AlNko2XsiHDd-3ys7xrH2HoxxDEqOQuXA3nhmwIA=s90-c"}, "sourceDisplayName"=>"Damn Delicious", "ingredients"=>["spaghetti", "extra virgin olive oil", "breadcrumbs", "kosher salt", "freshly ground black pepper", "unsalted butter", "garlic", "cremini mushrooms", "thyme", "fresh parsley leaves"], "id"=>"Brown-Butter-Mushroom-Pasta-2518930", "smallImageUrls"=>["https://lh3.googleusercontent.com/euANN9GbIoXeAdtRZrtd1CX7cVC6X1j3KvbO9QeURsAkYeLcUwZhh3tE8qzGxXznbGhdga8vXHGZ424cG3pB_Hg=s90"], "recipeName"=>"Brown Butter Mushroom Pasta", "totalTimeInSeconds"=>1800, "attributes"=>{"course"=>["Main Dishes"]}, "flavors"=>{"piquant"=>0.0, "meaty"=>0.6666666666666666, "bitter"=>0.16666666666666666, "sweet"=>0.16666666666666666, "sour"=>0.16666666666666666, "salty"=>0.5}, "rating"=>4}
{"imageUrlsBySize"=>{"90"=>"https://lh3.googleusercontent.com/Q6RK89oQreFtcHXWQmyB70JcAJhW23BlVYWNmJzMmdpH1EVE1qSiFSSQd9mV1iS2-ioDu3rFHTJQnyQRKyoCoA=s90-c"}, "sourceDisplayName"=>"Carrie's Experimental Kitchen", "ingredients"=>["boneless chicken breasts", "penne pasta", "buffalo wing sauce", "blue cheese dressing", "parsley"], "id"=>"Grilled-Chicken-Buffalo-Pasta-2440386", "smallImageUrls"=>["https://lh3.googleusercontent.com/0LiDPtX76x7Czze-OOtvIMkUTh813SrG5CGw_uXusa-2F17rHRzsrOQlkWPh_ZNCvG_Ag3TJgfRcaLscDjoA=s90"], "recipeName"=>"Grilled Chicken Buffalo Pasta", "totalTimeInSeconds"=>1200, "attributes"=>{"course"=>["Main Dishes"], "cuisine"=>["Barbecue"]}, "flavors"=>{"piquant"=>0.8333333333333334, "meaty"=>0.8333333333333334, "bitter"=>0.8333333333333334, "sweet"=>0.16666666666666666, "sour"=>0.6666666666666666, "salty"=>0.8333333333333334}, "rating"=>4}
{"imageUrlsBySize"=>{"90"=>"http://lh4.ggpht.com/nAxo97VFtexvM-MqzfTQXaqE0gD6MpgoibWezMQrvyYLU8C7SVfVmm2jiZPTnXwLF-8rO3iYN07OzoGIpgeb=s90-c"}, "sourceDisplayName"=>"How Sweet It Is", "ingredients"=>["whole wheat pasta", "pasta sauce", "heavy cream", "grated parmesan cheese", "fresh mozzarella", "grape tomatoes", "fresh basil leaves"], "id"=>"Creamy-caprese-pasta-333554", "smallImageUrls"=>["http://lh3.ggpht.com/THkiqa99fALeMM_v5zUZq6CO_wLFW3rgq2pdQOjTgDgn0FxL2suI-9i7xRRtLhC2OkMhLp4eQwkYlQCRMZ3lve4=s90"], "recipeName"=>"Creamy Caprese Pasta", "totalTimeInSeconds"=>2400, "attributes"=>{"course"=>["Main Dishes"], "cuisine"=>["Italian"]}, "flavors"=>{"piquant"=>0.0, "meaty"=>0.16666666666666666, "bitter"=>0.16666666666666666, "sweet"=>0.16666666666666666, "sour"=>0.16666666666666666, "salty"=>0.3333333333333333}, "rating"=>5}
{"recipeName"=>"Alice Waters' Whole Wheat Pasta With Tomato Vinaigrette", "ingredients"=>["garlic", "salt", "red wine vinegar", "heirloom tomatoes", "basil leaves", "pasta", "extra-virgin olive oil"], "totalTimeInSeconds"=>2100, "sourceDisplayName"=>"Serious Eats", "imageUrlsBySize"=>{"90"=>"http://lh3.ggpht.com/50hKixy41GIMyWlYMBKVl7wbY2luXeO5H6A_vT8tDJky5802Jds2oxXk7hiPDdNYSLHVPi0Jv0cf6PS3xOGEz6E=s90-c"}, "id"=>"Alice-Waters_-Whole-Wheat-Pasta-With-Tomato-Vinaigrette-2513074", "rating"=>5, "flavors"=>{"piquant"=>0.0, "meaty"=>1.0, "bitter"=>1.0, "sweet"=>1.0, "sour"=>1.0, "salty"=>1.0}, "attributes"=>{"course"=>["Main Dishes"], "cuisine"=>["Italian"]}}
{"imageUrlsBySize"=>{"90"=>"https://lh3.googleusercontent.com/-pvusmt0sgzAJVXxyVKZcmdm1UCbu0VlOsO_VV03UcJhjND4Hi2uJs1v2drpUbMPAVi0EUA1eVzm6dsq9QoiAg=s90-c"}, "sourceDisplayName"=>"Kevin and Amanda", "ingredients"=>["olive oil", "boneless, skinless chicken breasts", "fajita seasoning", "diced onion", "bell peppers", "garlic", "chicken broth", "heavy cream", "diced tomatoes and green chiles", "penne pasta", "salt"], "id"=>"Chicken-Fajita-Pasta-2169729", "smallImageUrls"=>["https://lh3.googleusercontent.com/EnSULiWZQMAaL3f-ZHWybny35U1VpURecQf34uLL2kHFAx-L34w3irpHdOqweRt3p65Cb2m3qlDs4TTtjFdtiA=s90"], "recipeName"=>"Chicken Fajita Pasta", "totalTimeInSeconds"=>2700, "attributes"=>{"course"=>["Main Dishes"]}, "flavors"=>{"piquant"=>0.16666666666666666, "meaty"=>0.16666666666666666, "bitter"=>0.16666666666666666, "sweet"=>0.16666666666666666, "sour"=>0.8333333333333334, "salty"=>0.16666666666666666}, "rating"=>4}



  def search_for_recipes_by_keyword(keyword)
    url = "http://api.yummly.com/v1/api/recipes?_app_id=" + KEY[:app_id] + "&_app_key=" + KEY[:app_key] + "&q=" + keyword + "&requirePictures=true"
    response = RestClient.get(url)
    recipe_response = JSON.parse(response)
    recipes = recipe_response["matches"][0..5]
    recipes_array = []
    recipes.each do |recipe|
      recipe.each do |recipe_keys, recipe_values|

      #   recipe[recipeName:][recipe_values]
        # recipe_name ||= {}
        # recipe_name["id"] = []
        # recipe_name["id"] << recipe["id"]
        # recipe_name["smallImageUrls"] = recipe["smallImageUrls"]
        recipes_array << recipe["recipeName"][recipe_keys]
      end
    end
    # recipes_array = []

    # recipes.each do |r|
    #   recipes_array << r
    # end
    recipes_array

  end
  #   #incomplete

  def search_for_random_recipe_by_ingredient
  end



#trying to refactor this

  def api_call(method)
    method
    response = RestClient.get(url)
    recipe_response = JSON.parse(response)
    recipe = recipe_response["matches"].sample
    id = recipe["id"]
    url_2 = "http://api.yummly.com/v1/api/recipe/" + id + "?_app_id=" + + KEY[:app_id] + "&_app_key=" + KEY[:app_key]
    response_2 = RestClient.get(url_2)
    recipe_response_2 = JSON.parse(response_2)
    recipe_hash(recipe_response_2)
    recipe_hash = {}
    recipe_hash["name"] = recipe_response_2["name"]
    recipe_hash["time"] = recipe_response_2["totalTime"]
    recipe_hash["source"] = recipe_response_2["source"]["sourceRecipeUrl"]
    recipe_hash["ingredients"] = recipe_response_2["ingredientLines"]
    recipe_hash["servings"] = recipe_response_2["numberOfServings"]
  end

  def search_by_keyword(keyword)
    url = "http://api.yummly.com/v1/api/recipes?_app_id=" + KEY[:app_id] + "&_app_key=" + KEY[:app_key] + "&q=" + keyword + "&requirePictures=true"
  end

  def search_by_three_ingr(ingr1, ingr2, ingr3)
    url = "http://api.yummly.com/v1/api/recipes?_app_id=" + KEY[:app_id] + "&_app_key=" + KEY[:app_key] + "&q&requirePictures=true&allowedIngredient[]=" + ingr1 + "&allowedIngredient[]=" + ingr2 + "&allowedIngredient[]=" + ingr3
  end


# search_for_recipes_by_keyword("pasta")
