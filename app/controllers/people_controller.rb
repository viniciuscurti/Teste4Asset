class PeopleController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @people = Person.all
    render json: @people
  end

  def show
    @person = Person.find(params[:id])
    render json: @person
  end

  def newß
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      render json: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  def update
    @person = Person.find_by(id: params[:id])
    if @person.update(person_params)
      render json: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @person = Person.find_by(id: params[:id])

    if @person.destroy
      render json: 'Person was successfully destroyed.'
    else
      render json: @person.errors, status: :not_found
    end
  end

  private
    def person_params
      params.require(:person).permit(:name, :email, :phone, :birthdate)
    end
end
