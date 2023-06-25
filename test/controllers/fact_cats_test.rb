require_relative '../test_helper'

class FactCatsTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    def setup
        @controller = FactCatsController.new
        @user = User.new(username: "sasas", email: "", password: 123455677)
        fact_cat = FactCat.new(fact: "fact", length: 3)
        fact_cat.save
        @fact_cats = []
    end


    def test_favorite_without_current_user
        get fact_cats_favorite_path
        assert_redirected_to root_path
        assert_nil @controller.instance_variable_get(:@fact_cats)
        assert_equal 'ups para ver tus favoritos debes estar registrado', flash[:error]
    end

    def test_favorite_with_current_user_with_favorite
        sign_in  @user
        fact_cat = FactCat.first
        fact_cat.users << @user
        get fact_cats_favorite_path
        assert_equal 1, FactCat.all.count
        assert_equal 1, @controller.instance_variable_get(:@fact_cats).count
        assert_template :index
    end

    def test_index
        sign_in  @user
        get fact_cats_path
        total_fact_cat = FactCat.all.count
        assert_equal total_fact_cat, @controller.instance_variable_get(:@fact_cats).count
        assert_template :index
    end

    def test_increment_clicks
        sign_in  @user
        fact_cat = FactCat.all.first
        fact_cat_click_actual = fact_cat.clicks
        post fact_cats_count_click_path(fact_cat_id: fact_cat)
        assert_equal fact_cat.reload.clicks, fact_cat_click_actual + 1
        assert_equal 'La fact se ha marcado cómo favorita', flash[:notice]
    end
end
