require 'httparty'

class FactCatsController < ApplicationController
    include HTTParty;

    def index
        @fact_cats = FactCat.all
        get_fact_cat(2)
        render 'index', locals: { favorite: true, titulo: 'Nuestros Facts Cats para ti', ranking: false }
    end

    def favorite
        if !current_user
            flash[:error] = 'ups para ver tus favoritos debes estar registrado'
            return redirect_to root_path
        end
        @fact_cats = current_user.fact_cats.first(10).uniq
        render 'index', locals: { favorite: false, titulo: 'Tus Fact Cats favoritos', ranking: false}
    end

    def increment_click_count
        return if !current_user || !params[:fact_cat_id]
        fact_cat_id = params[:fact_cat_id]
        fact_cat = FactCat.find(fact_cat_id)
        fact_cat.clicks += 1
        fact_cat.users << current_user
        if fact_cat.save
            flash[:notice] = 'La fact se ha marcado cómo favorita'
            redirect_to root_path
        else
            flash[:error] = 'La fact no se ha podido marcar cómo favorita'
        end
    end

    def get_fact_cat(times_number)

        times_number.times do
            response = HTTParty.get('https://catfact.ninja/fact')

            if response.code == 200
                fact = response.parsed_response['fact']
                length = response.parsed_response['length']
                cat = FactCat.new(fact: fact, length: length)

                if cat.save
                    flash[:notice] = 'facts agregado con éxito!'
                    root_path
                else
                    @error = "Error al guardar el fact: #{cat.errors.full_messages.join(', ')}"
                    erb :error
                end
            @fact = response.parsed_response['fact']
            else
            @error = "Error: #{response.code}"
            end
        end
    end
end