class LanguageProficienciesController < ApplicationController
  def index
    matching_language_proficiencies = LanguageProficiency.all

    @list_of_language_proficiencies = matching_language_proficiencies.order({ :created_at => :desc })

    render({ :template => "language_proficiencies/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_language_proficiencies = LanguageProficiency.where({ :id => the_id })

    @the_language_proficiency = matching_language_proficiencies.at(0)

    render({ :template => "language_proficiencies/show" })
  end

  def create
    the_language_proficiency = LanguageProficiency.new
    the_language_proficiency.language_id = params.fetch("query_language_id")
    the_language_proficiency.proficiency_level = params.fetch("query_proficiency_level")
    the_language_proficiency.user_id = params.fetch("query_user_id")

    if the_language_proficiency.valid?
      the_language_proficiency.save
      redirect_to("/language_proficiencies", { :notice => "Language proficiency created successfully." })
    else
      redirect_to("/language_proficiencies", { :alert => the_language_proficiency.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_language_proficiency = LanguageProficiency.where({ :id => the_id }).at(0)

    the_language_proficiency.language_id = params.fetch("query_language_id")
    the_language_proficiency.proficiency_level = params.fetch("query_proficiency_level")
    the_language_proficiency.user_id = params.fetch("query_user_id")

    if the_language_proficiency.valid?
      the_language_proficiency.save
      redirect_to("/language_proficiencies/#{the_language_proficiency.id}", { :notice => "Language proficiency updated successfully."} )
    else
      redirect_to("/language_proficiencies/#{the_language_proficiency.id}", { :alert => the_language_proficiency.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_language_proficiency = LanguageProficiency.where({ :id => the_id }).at(0)

    the_language_proficiency.destroy

    redirect_to("/language_proficiencies", { :notice => "Language proficiency deleted successfully."} )
  end
end
