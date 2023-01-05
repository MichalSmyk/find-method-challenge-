require_relative '../lib/recipe_repository'

RSpec.describe RecipeRepository do 

    def reset_recipe_table
        seed_sql = File.read('spec/seeds_test.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory' })
        connection.exec(seed_sql)
    end

      before(:each) do 
        reset_recipe_table
    end

    it 'gets all values from the table' do 
        repo = RecipeRepository.new

        recipe = repo.all

        expect(recipe.length).to eq 2

        expect(recipe[0].id).to eq('1')
        expect(recipe[0].recipe_name).to eq('pasta')
        expect(recipe[0].cooking_time).to eq('22')
        expect(recipe[0].rating).to eq('4')
    end
    it 'fids by the given index' do 
        repo = RecipeRepository.new

        recipe = repo.find(1)

        expect(recipe.id).to eq('1')
        expect(recipe.recipe_name).to eq('pasta')
        expect(recipe.cooking_time).to eq('22')
        expect(recipe.rating).to eq('4')
    end
end 